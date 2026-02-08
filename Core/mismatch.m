function mis = mismatch(busdata, Pc, Qc)
% MISMATCH  Forms mismatch vector [ΔP; ΔQ]

nbus = size(busdata,1);

type  = busdata(:,2);
Ps = busdata(:,5);
Qs = busdata(:,6);

dP = [];
dQ = [];

% Active power mismatch (exclude slack)
for i = 1:nbus
    if type(i) ~= 1
        dP = [dP; Ps(i) - Pc(i)];
    end
end

% Reactive power mismatch (PQ buses only)
for i = 1:nbus
    if type(i) == 3
        dQ = [dQ; Qs(i) - Qc(i)];
    end
end

mis = [dP; dQ];

end
