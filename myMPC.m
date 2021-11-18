systeminSS = ss(-0.0028,[0.0068 0], 1,0);
systeminSS = setmpcsignals(systeminSS,'MV',1, 'MD',2);

%% Design MPC Controller with Continuous and Discrete Control Actions
% Create a linear MPC controller with a sample time of one second, 
% default prediction and control horizons, and default cost function
% weights.
Ts = 1;
tankMPCobj = mpc(systeminSS,Ts);
%%
% Set the nominal values for the controller to match the steady-state
% operating point.
tankMPCobj.Model.Nominal.U = 0;
tankMPCobj.Model.Nominal.Y = 0;
tankMPCobj.Model.Nominal.X = 0;
tankMPCobj.Model.Nominal.DX = 0;

% Specify safety bounds on the continuous input and output signals.
%   tankMPCobj.OV.Min = 0;
%  tankMPCobj.OV.Max = 1.5;
 tankMPCobj.MV(1).Min = 0;
    tankMPCobj.MV(1).Max = 1.5;
%  MPCobj.MV(1).RateMin = 0;
%  MPCobj.MV(1).RateMax = 100;