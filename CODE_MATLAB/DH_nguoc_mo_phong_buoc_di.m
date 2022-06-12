close all
clear

%% q leg for forward kinematics
pR=[0 0 0]; % Các góc khớp
pL=[0 0 0];
R_R=[0 0 0];
R_L=[0 0 0];
%% Setup 
MYSETUPROBOT2;
%% 1

for i=1:10
    pR(3) = pR(3)+0.02;
    pL(3) = pL(3)+0.02;
    R_R(3)=R_R(3)+0.25*i*i/8;
    R_L(3)=R_L(3)+0.25*i*i/8;
    Rfoot.p = [pR(3), -0.15,-0.995]';
    Rfoot.R = rpy2rot(0, -R_R(3)*ToRad, 0);
        
    Lfoot.p = [-pL(3), 0.15,-0.995]';
    Lfoot.R = rpy2rot(0, -R_L(3)*ToRad, 0);
  
    
    InverseKinematics(RLEG_J4, Rfoot);
    InverseKinematics(LLEG_J4, Lfoot);
    ForwardVelocity(1);
    
    hold off
    newplot
    DrawRobot;
    drawnow;

    end
%%2
for i=1:10
    pR(3) = pR(3)-0.02;
    pL(3) = pL(3)-0.02;
    R_R(3)=R_R(3)-0.25*i*i/8;
    R_L(3)=R_L(3)-0.25*i*i/8;
    Rfoot.p = [pR(3), -0.135,-0.995]';
    Rfoot.R = rpy2rot(0, -R_R(3)*ToRad, 0);
        
    Lfoot.p = [-pL(3), 0.135,-0.995]';
    Lfoot.R = rpy2rot(0, -R_L(3)*ToRad, 0);
  
    
    InverseKinematics(RLEG_J4, Rfoot);
    InverseKinematics(LLEG_J4, Lfoot);
    ForwardVelocity(1);
    
    hold off
    newplot
    DrawRobot;
    drawnow;

end
pause(3)
%%3
for i=1:6
    pR(3) = pR(3)+0.02;
    pL(3) = pL(3)+0.02;
    R_R(3)=R_R(3)+4.5;
    R_L(3)=R_L(3)+4.5;
    Rfoot.p = [0, -0.135,-0.995+pR(3)]';
    Rfoot.R = rpy2rot(0, -R_R(3)*ToRad, 0);
        
    Lfoot.p = [0, 0.135,-0.995 + pL(3)]';
    Lfoot.R = rpy2rot(0, -R_L(3)*ToRad, 0);
  
    
    InverseKinematics(RLEG_J4, Rfoot);
    InverseKinematics(LLEG_J4, Lfoot);
    ForwardVelocity(1);
    
    hold off
    newplot
    DrawRobot;
    drawnow;

end

%%4
for i=1:6
    pR(3) = pR(3)-0.02;
    pL(3) = pL(3)-0.02;
    R_R(3)=R_R(3)-4.5;
    R_L(3)=R_L(3)-4.5;
    Rfoot.p = [0, -0.135,-0.995+pR(3)]';
    Rfoot.R = rpy2rot(0, -R_R(3)*ToRad, 0);
        
    Lfoot.p = [0, 0.135,-0.995+pL(3)]';
    Lfoot.R = rpy2rot(0, -R_L(3)*ToRad, 0);
  
    
    InverseKinematics(RLEG_J4, Rfoot);
    InverseKinematics(LLEG_J4, Lfoot);
    ForwardVelocity(1);
    
    hold off
    newplot
    DrawRobot;
    drawnow;

end

