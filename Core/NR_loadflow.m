function [Vm, Va, iter] = NR_loadflow(busdata, Ybus)

tol = 1e-6;        
maxiter = 20;      

nbus = size(busdata,1);

Vm = busdata(:,3);
Va = deg2rad(busdata(:,4));

type = busdata(:,2);
pv = find(type == 2);
pq = find(type == 3);
A = [pv; pq];

iter = 0;

while iter < maxiter
    [Pcalc, Qcalc] = powercalc(Vm, Va, Ybus);
    mis = mismatch(busdata, Pcalc, Qcalc);
    if max(abs(mis)) < tol
        break;
    end
    J = jacobian(Vm, Va, Ybus, busdata);
    dx = J \ mis;

    np = length(A);
    nq = length(pq);

    dVa = dx(1:np);
    dVm = dx(np+1 : np+nq);

    for k = 1:np
        i = A(k);
        Va(i) = Va(i) + dVa(k);
    end

    for k = 1:nq
        i = pq(k);
        Vm(i) = Vm(i) + dVm(k);
    end

    iter = iter + 1;
end

Va = rad2deg(Va);   
end
