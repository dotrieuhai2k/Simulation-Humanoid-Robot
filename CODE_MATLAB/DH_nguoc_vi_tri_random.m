close all
clear             
global uLINK      

MYSETUPROBOT;   

uLINK(RLEG_J2).q = -5.0*ToRad;
uLINK(RLEG_J3).q = 10.0*ToRad;
uLINK(RLEG_J4).q = -5.0*ToRad;
uLINK(LLEG_J2).q = -5.0*ToRad;
uLINK(LLEG_J3).q = 10.0*ToRad;
uLINK(LLEG_J4).q = -5.0*ToRad;
uLINK(BODY).p = [0.0, 0.0, 0.7]';
uLINK(BODY).R = eye(3);

rand('state',0);  

figure
while 1

    uLINK(BODY).p = [0.0, 0.0, 0.5]';
    uLINK(BODY).R = eye(3);
    
    Rfoot.p =[0, -0.1,0]' + 0.2*(rand(3,1)-0.5);
    Rfoot.R = RPY2R(1/2*pi*(rand(3,1)-0.5));
    rerr_norm = InverseKinematics(RLEG_J5, Rfoot);
    
    Lfoot.p =[0, 0.1,0]' + 0.1*(rand(3,1)-0.5);
    Lfoot.R = RPY2R(1/2*pi*(rand(3,1)-0.5));
    rerr_norm = InverseKinematics(LLEG_J5, Lfoot);
    
    clf
    DrawAllJoints(1);
    view(38,10)
    axis equal
    zlim([-0.2 1.2])
    grid on
    
    fprintf('Type any key for another pose, Ctrl-C to abort\n');
    pause
end
