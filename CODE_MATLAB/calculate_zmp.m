% calculate_zmp.m
% ZMP(IZMP) calculation and display (3.4.1 Derivation of ZMP)
close all
clear
global uLINK G M
G = 9.8;  % Gravity acceleration [m/s^2]
MYSETUPROBOT;   
M = TotalMass(1);  % tong khoi luong
% Initial condition 
uLINK(BODY).p = [0.0, 0.0, 0.5]';
uLINK(BODY).R = eye(3);
uLINK(BODY).v = [0, 0, 0]';
uLINK(BODY).w = [0, 0, 0]';
% chan phai
Rfoot.p = [0, -0.02, 0.09]';
Rfoot.R = eye(3);
Rfoot.v = [0 0 0]';
Rfoot.w = [0 0 0]';
% chan trai
Lfoot.p = [-0.04, 0.02, 0.05]';
Lfoot.R = eye(3);
Lfoot.v = [0 0 0]';
Lfoot.w = [0 0 0]';

InverseKinematicsAll(RLEG_J5, Rfoot);
InverseKinematicsAll(LLEG_J5, Lfoot);
ForwardVelocity(1);

com = calcCoM;     % Center of mass
Zc  = com(3);      % Height of the linear inverted pendulum (LIPM)
Tc  = sqrt(Zc/G);  % Time constant of LIPM
cx0 = com(1);
cy0 = com(2);
% tinh toan momen dong luong tinh tien và quay
P1 = calcP(1);
L1 = calcL(1);

global Dtime 

Dtime = 0.01;
EndTime = 0.5;   % thoi gian dat
time = 0:Dtime:EndTime;
tsize = length(time);
com_m = zeros(tsize,3);
zmp_m = zeros(tsize,2);

figure
k = 1;
zmpz = 0.0;
for k = 1:tsize
    [px,vx] = LIPM(time(k),Lfoot.p(1),cx0,Tc);
    [py,vy] = LIPM(time(k),Lfoot.p(2),cy0,Tc);
    uLINK(BODY).p = [px, py, 0.7]';
    uLINK(BODY).v = [vx, vy, 0.0]';
    
    InverseKinematicsAll(LLEG_J5, Lfoot); % Keep support foot on the ground
    ForwardVelocity(1);    
    
    % Calculate ZMP
    com = calcCoM;    % Center of mass
    P   = calcP(1);   % Linear momentum
    L   = calcL(1);   % Angular momentum
    
    dP = (P-P1)/Dtime;
    dL = (L-L1)/Dtime;
    [zmpx,zmpy] = calcZMP(com,dP,dL,zmpz);
    P1 = P;
    L1 = L;
   
    com_m(k,:) = com';
    zmp_m(k,:) = [zmpx, zmpy];
    
    hold off
    newplot
    DrawAllJoints(1);
    h(1) = DrawMarker([zmpx,zmpy,zmpz]','r');
    h(2) = DrawMarker([com(1),com(2),0]','b');
    legend(h,'IZMP','CoM');
    axis equal
    set(gca,...
        'CameraPositionMode','manual',...
        'CameraPosition',[4,4,1],...
        'CameraViewAngleMode','manual',....
        'CameraViewAngle',15,...
        'Projection','perspective',... 
        'XLimMode','manual',...
        'XLim',[-1 1],...
        'YLimMode','manual',...
        'YLim',[-1 0.75],...
        'ZLimMode','manual',...
        'ZLim',[0 1.5])
    grid on
    text(0.5, -0.4, 1.4, ['time=',num2str(time(k),'%5.3f')])
    drawnow;
end        
