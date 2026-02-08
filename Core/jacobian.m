function J = jacobian(Vm, Va, Ybus, busdata)
% JACOBIAN Forms the Newton–Raphson Jacobian matrix

nbus = length(Vm);

G = real(Ybus);
B = imag(Ybus);

type = busdata(:,2);

% Identify buses
pv = find(type == 2);
pq = find(type == 3);
A = [pv; pq];

np = length(A);
nq = length(pq);

J1 = zeros(np, np);
J2 = zeros(np, nq);
J3 = zeros(nq, np);
J4 = zeros(nq, nq);

[P, Q] = powercalc(Vm, Va, Ybus);

%% J1 = dP/dδ
for a = 1:np
    i = A(a);
    for b = 1:np
        j = A(b);

        if i == j
            J1(a,b) = -Q(i) - B(i,i)*Vm(i)^2;
        else
            J1(a,b) = Vm(i)*Vm(j)* ...
                ( G(i,j)*sin(Va(i)-Va(j)) - B(i,j)*cos(Va(i)-Va(j)) );
        end
    end
end

%% J2 = dP/dV
for a = 1:np
    i = A(a);
    for b = 1:nq
        j = pq(b);

        if i == j
            J2(a,b) = P(i)/Vm(i) + G(i,i)*Vm(i);
        else
            J2(a,b) = Vm(i)* ...
                ( G(i,j)*cos(Va(i)-Va(j)) + B(i,j)*sin(Va(i)-Va(j)) );
        end
    end
end

%% J3 = dQ/dδ
for a = 1:nq
    i = pq(a);
    for b = 1:np
        j = A(b);

        if i == j
            J3(a,b) = P(i) - G(i,i)*Vm(i)^2;
        else
            J3(a,b) = -Vm(i)*Vm(j)* ...
                ( G(i,j)*cos(Va(i)-Va(j)) + B(i,j)*sin(Va(i)-Va(j)) );
        end
    end
end

%% J4 = dQ/dV
for a = 1:nq
    i = pq(a);
    for b = 1:nq
        j = pq(b);

        if i == j
            J4(a,b) = Q(i)/Vm(i) - B(i,i)*Vm(i);
        else
            J4(a,b) = Vm(i)* ...
                ( G(i,j)*sin(Va(i)-Va(j)) - B(i,j)*cos(Va(i)-Va(j)) );
        end
    end
end

J = [J1 J2; J3 J4];
end
