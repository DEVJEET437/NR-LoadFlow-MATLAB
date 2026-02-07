\# Newton–Raphson Load Flow Analysis (MATLAB)



\## Overview

This project implements the \*\*Newton–Raphson (NR) load flow algorithm\*\* for a \*\*5-bus power system\*\* using MATLAB.  

The solver is developed \*\*from first principles\*\*, without relying on built-in power system toolboxes, and follows a \*\*modular, function-based design\*\*.



The implementation computes steady-state \*\*bus voltage magnitudes and phase angles\*\* by solving the nonlinear power flow equations using analytical Jacobian formulation.



---



\## Key Features

\- Y-bus matrix formation 

\- Proper handling of \*\*Slack, PV, and PQ buses\*\*  

\- Analytical formulation of the \*\*Jacobian matrix (J₁–J₄)\*\*  

\- Newton–Raphson iterative solution with quadratic convergence  

\- Clean, modular MATLAB code suitable for extension and GUI integration  



---



\## System Details

\- Number of buses: \*\*5\*\*

\- Base MVA: \*\*100\*\*

\- Load flow method: \*\*Newton–Raphson\*\*

\- Convergence tolerance: \*\*1 × 10⁻⁶\*\*

\- Convergence achieved in \*\*3 iterations\*\*



---



\## Project Structure

NR\_5Bus\_LoadFlow/

│

├── data/

│ ├── busdata.m % Bus data (function)

│ └── linedata.m % Line data (function)

│

├── core/

│ ├── ybus.m % Y-bus formation

│ ├── powercalc.m % P \& Q calculation

│ ├── mismatch.m % Power mismatch vector

│ ├── jacobian.m % Jacobian matrix

│ └── NR\_loadflow.m % NR iteration loop

│

├── main.m % Entry point

│

├── app/

│ └── LoadFlowApp.mlapp

└── README.md

\## How to Run (Script Version)

1\. Open MATLAB  

2\. Set the current folder to the project directory  

3\. Run:

&nbsp;  	main.m

How to Run (App Version)

1. Open MATLAB.

2\. Navigate to the app folder.

3\. Open:

&nbsp;	LoadFlowApp.mlapp

4\. Click Run and execute the load flow from the app interface.



