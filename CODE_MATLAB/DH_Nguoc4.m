% Numerical inverse kinematics and knee stretch
% ik_stretch_LM.m
% 2013 Sept.23 s.kajita AIST

set(0,'DefaultTextInterpreter','none')

close all
clear              % claer work space
global uLINK       % allow access from external functions

MYSETUPROBOT;   % Set the biped robot of Fig.2.19 and Fig.2.20

SkipFrame = 10;

%%%%%%%%%%% target foot position and orientation %%%%%%%%%%%%
idx   = FindRoute(RLEG_J5);
SetJointAngles(idx, [0 0 -5 50 -10 0]*ToRad);
Rfoot = uLINK(RLEG_J5);

Height = norm(uLINK(RLEG_J0).p - uLINK(RLEG_J5).p);
LegLength = 0.6;
SingularPoint = sqrt(0.6^2 - Height^2);

fprintf('*** Levenberg-Marquardt ***\n');

xd_m = 0:0.005:0.4';
Nstep = length(xd_m);
q_m = zeros(Nstep,6);
analy_q_m = zeros(Nstep,6);
x_m = zeros(Nstep,1);
manip_m = zeros(Nstep,1);

figure
for n=1:Nstep
    Rfoot.p(1) = xd_m(n);  % Right foot
    
    rerr_norm = InverseKinematics_LM(RLEG_J5, Rfoot);
    
    x_m(n) = uLINK(RLEG_J5).p(1);
    q_m(n,:) = [uLINK(idx).q];
    analy_q_m(n,:) = IK_leg(uLINK(BODY),-0.1,0.3,0.3,Rfoot)';      %%% Analytical inverse kinematics solution
    
    J = CalcJacobian(idx);
    manip_m(n) = abs(det(J));
    
    if mod(n,SkipFrame) == 1
        hold on
        DrawAllJoints(1);
        
        view(141,20)
        axis equal
        xlim([-0.3 0.6])
        zlim([-0.2 1.3])
        grid on
    end
    fprintf('Error?F %8.3e \n',rerr_norm);
end
title([mfilename,' ',date])


