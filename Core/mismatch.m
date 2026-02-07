function mis = mismatch(busdata, Pcalc, Qcalc)
% MISMATCH  Forms mismatch vector [ΔP; ΔQ]

nbus = size(busdata,1);

type  = busdata(:,2);
Pspec = busdata(:,5);
Qspec = busdata(:,6);

dP = [];
dQ = [];

% Active power mismatch (exclude slack)
for i = 1:nbus
    if type(i) ~= 1
        dP = [dP; Pspec(i) - Pcalc(i)];
    end
end

% Reactive power mismatch (PQ buses only)
for i = 1:nbus
    if type(i) == 3
        dQ = [dQ; Qspec(i) - Qcalc(i)];
    end
end

mis = [dP; dQ];

end
