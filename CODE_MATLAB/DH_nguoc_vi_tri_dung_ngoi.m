% ??運動学のデモ?@ランダムな姿?ｨを表示
% fk_random.m
% 2004 Dec.17 s.kajita AIST

close all
clear              % ??業領域の??モリを?炎?化
global uLINK       % グ???[バル変?狽ﾆして?C外部関?狽ｩらの参?ﾆを可能にする

MYSETUPROBOT;   % ?}2.19?C?}2.20の2足歩?s??ボットのデ?[タを?ﾝ定

uLINK(RLEG_J2).q = -5.0*ToRad;
uLINK(RLEG_J3).q = 10.0*ToRad;
uLINK(RLEG_J4).q = -5.0*ToRad;
uLINK(LLEG_J2).q = -5.0*ToRad;
uLINK(LLEG_J3).q = 10.0*ToRad;
uLINK(LLEG_J4).q = -5.0*ToRad;
uLINK(BODY).p = [0.0, 0.0, 0.7]';
uLINK(BODY).R = eye(3);


%%%%%%%%%%% ランダムな姿?ｨ?@%%%%%%%%%%%%

rand('state',0);  

figure
while 1

    uLINK(BODY).p = [0.0, 0.0, 0.4]';
    uLINK(BODY).R = eye(3);
    
    Rfoot.p =[0, 0.1, -0.15]' ;
    Rfoot.R = RPY2R([0,0,0]);
    rerr_norm = InverseKinematics(RLEG_J5, Rfoot);
    
    Lfoot.p =[0.2, -0.1, -0.15]' ;
    Lfoot.R = RPY2R([0,0,0]');
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
