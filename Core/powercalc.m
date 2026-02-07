function [P, Q] = powercalc(Vm, Va, Ybus)
% POWERCALC  Calculates bus active and reactive power

nbus = length(Vm);

P = zeros(nbus,1);
Q = zeros(nbus,1);

G = real(Ybus);
B = imag(Ybus);

for i = 1:nbus
    for j = 1:nbus

        P(i) = P(i) + Vm(i)*Vm(j)* ...
            ( G(i,j)*cos(Va(i)-Va(j)) + B(i,j)*sin(Va(i)-Va(j)) );

        Q(i) = Q(i) + Vm(i)*Vm(j)* ...
            ( G(i,j)*sin(Va(i)-Va(j)) - B(i,j)*cos(Va(i)-Va(j)) );

    end
end

end
