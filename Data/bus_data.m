% Bus data for 5-bus system
% Bus  Type  Vm(p.u.)  Va(deg)   P(p.u.)    Q(p.u.)
% Type: 1 = Slack, 2 = PV, 3 = PQ
function busdata= bus_data();
busdata = [
    1   1   1.06    0     0        0
    2   2   1.04    0     0.4      0
    3   3   1.00    0    -0.6     -0.25
    4   3   1.00    0    -0.4     -0.15
    5   3   1.00    0    -0.5     -0.20
];
