function [Vm, Va, iter] = NR_loadflow(busdata, Ybus)
% NR_LOADFLOW  Newton–Raphson load flow solver

tol = 1e-6;        % convergence tolerance
maxiter = 20;      % safety limit

nbus = size(busdata,1);

% Initial voltages
Vm = busdata(:,3);
Va = deg2rad(busdata(:,4));

type = busdata(:,2);
pv = find(type == 2);
pq = find(type == 3);
pvpq = [pv; pq];

iter = 0;

while iter < maxiter

    % Step 2: Calculate power
    [Pcalc, Qcalc] = powercalc(Vm, Va, Ybus);

    % Step 3: Mismatch
    mis = mismatch(busdata, Pcalc, Qcalc);

    % Convergence check
    if max(abs(mis)) < tol
        break;
    end

    % Step 4: Jacobian
    J = jacobian(Vm, Va, Ybus, busdata);

    % Step 5: Solve corrections
    dx = J \ mis;

    np = length(pvpq);
    nq = length(pq);

    dVa = dx(1:np);
    dVm = dx(np+1 : np+nq);

    % Update angles (PV + PQ)
    for k = 1:np
        i = pvpq(k);
        Va(i) = Va(i) + dVa(k);
    end

    % Update magnitudes (PQ only)
    for k = 1:nq
        i = pq(k);
        Vm(i) = Vm(i) + dVm(k);
    end

    iter = iter + 1;
end

Va = rad2deg(Va);   % convert back to degrees
end
