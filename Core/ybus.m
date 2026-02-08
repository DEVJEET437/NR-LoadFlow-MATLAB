function Ybus = ybus(linedata, nbus)
% YBUS   Forms the bus admittance matrix

Ybus = zeros(nbus, nbus);

for k = 1:size(linedata,1)

    i = linedata(k,1);
    j = linedata(k,2);
    R = linedata(k,3);
    X = linedata(k,4);
    B = linedata(k,5);  

    Z = complex(R, X);
    Y = 1/Z;

    % Off-diagonal elements
    Ybus(i,j) = Ybus(i,j) - Y;
    Ybus(j,i) = Ybus(i,j);

    % Diagonal elements
    Ybus(i,i) = Ybus(i,i) + Y + 1i*B;
    Ybus(j,j) = Ybus(j,j) + Y + 1i*B;
end

end
