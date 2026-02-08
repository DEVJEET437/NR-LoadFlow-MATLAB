clear; clc;

addpath('data');
addpath('core');
% Load data
busdata = bus_data();
linedata = line_data();

% Number of buses
nbus = size(busdata,1);


% Initial voltages
Vm = busdata(:,3);
Va = deg2rad(busdata(:,4));

% Y-bus formation
Ybus = ybus(linedata, nbus);

[Vm, Va, iter] = NR_loadflow(busdata, Ybus);

disp('Y-Bus Matrix')
disp(Ybus)

disp('Final Bus Voltages (p.u.)')
disp(Vm)

disp('Final Bus Angles (deg)')
disp(Va)

disp(['Converged in ', num2str(iter), ' iterations'])

