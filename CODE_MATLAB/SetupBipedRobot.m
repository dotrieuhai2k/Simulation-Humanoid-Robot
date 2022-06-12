%%% SetupBipedRobot.m
%%% Set biped robot structure of Figure 2.19, 2.20
%%% Field definition: Table 2.1 Link Parameters

global uLINK

ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

uLINK = struct('name','BODY', 'm', 8, 'sister', 0 , 'child', 2, 'b',[0    0    0]','a',UZ,'q',0);

uLINK(2) = struct('name','CHEST'  , 'm',  2, 'sister', 5 , 'child', 3, 'b',[0  0   0.3]' ,'a',UZ,'q',0);
uLINK(3) = struct('name','NECK1' , 'm',  1, 'sister', 0, 'child', 4 , 'b',[0  0   0]' ,'a',UX,'q',0);
uLINK(4) = struct('name','NECK2' , 'm',  1, 'sister', 0, 'child', 0 , 'b',[0  0   0]' ,'a',UY,'q',0);

uLINK(5) = struct('name','RARM_J0' , 'm',  2, 'sister', 11, 'child', 6, 'b',[0  -0.130   0.2]' ,'a',UY,'q',0);
uLINK(6) = struct('name','RARM_J1' , 'm',  1, 'sister', 0, 'child', 7 , 'b',[0  0   0]' ,'a',UX,'q',0);
uLINK(7) = struct('name','RARM_J2' , 'm',  2, 'sister', 0, 'child', 8, 'b',[0  0   0]' ,'a',UZ,'q',0);
uLINK(8) = struct('name','RARM_J3' , 'm',  2, 'sister', 0 , 'child', 9, 'b',[0  0   -0.107]' ,'a',UY,'q',0);
uLINK(9) = struct('name','RARM_J4' , 'm',  1, 'sister', 0 , 'child', 10 , 'b',[0  0   -0.107]' ,'a',UZ,'q',0);
uLINK(10) = struct('name','RARM_J5' , 'm',  1, 'sister', 0 , 'child', 0 , 'b',[0  0   0]' ,'a',UY,'q',0);

uLINK(11) = struct('name','LARM_J0' , 'm',  2, 'sister', 17, 'child', 12, 'b',[0  0.130   0.2]' ,'a',UY,'q',0);
uLINK(12) = struct('name','LARM_J1' , 'm',  2, 'sister', 0 , 'child', 13, 'b',[0   0     0 ]' ,'a',UX,'q',0);
uLINK(13) = struct('name','LARM_J2' , 'm',  1, 'sister', 0 , 'child', 14 , 'b',[0  0   0]' ,'a',UZ,'q',0);
uLINK(14) = struct('name','LARM_J3' , 'm',  1, 'sister', 0 , 'child', 15 , 'b',[0  0   -0.107]' ,'a',UY,'q',0);
uLINK(15) = struct('name','LARM_J4' , 'm',  1, 'sister', 0 , 'child', 16 , 'b',[0  0   -0.107]' ,'a',UZ,'q',0);
uLINK(16) = struct('name','LARM_J5' , 'm',  1, 'sister', 0 , 'child', 0 , 'b',[0  0   0]' ,'a',UY,'q',0);


uLINK(17) = struct('name','RLEG_J0' , 'm',  4, 'sister', 23, 'child', 18, 'b',[0 -0.066 -0.066]'   ,'a',UZ,'q',0);
uLINK(18) = struct('name','RLEG_J1' , 'm',  1, 'sister', 0 , 'child', 19, 'b',[0  0   0]'   ,'a',UY,'q',0);
uLINK(19) = struct('name','RLEG_J2' , 'm',  4, 'sister', 0 , 'child', 20, 'b',[0  0   0]'   ,'a',UX,'q',0);
uLINK(20) = struct('name','RLEG_J3' , 'm',  1, 'sister', 0 , 'child', 21, 'b',[0  0   -0.123]' ,'a',UY,'q',0);
uLINK(21) = struct('name','RLEG_J4' , 'm',  4, 'sister', 0 , 'child', 22, 'b',[0  0  -0.123]' ,'a',UY,'q',0);
uLINK(22) = struct('name','RLEG_J5' , 'm',  2, 'sister', 0 , 'child', 0, 'b',[0  0   0]' ,'a',UX,'q',0);

uLINK(23) = struct('name','LLEG_J0' , 'm',  1, 'sister', 0 , 'child', 24, 'b',[0 0.066 -0.066]' ,'a',UZ,'q',0);
uLINK(24) = struct('name','LLEG_J1' , 'm',  4, 'sister', 0, 'child', 25, 'b',[0  0 0]'   ,'a',UY,'q',0);
uLINK(25) = struct('name','LLEG_J2' , 'm',  1, 'sister', 0, 'child', 26, 'b',[0  0 0]'   ,'a',UX,'q',0);
uLINK(26) = struct('name','LLEG_J3' , 'm',  4, 'sister', 0, 'child', 27, 'b',[0  0 -0.123]'   ,'a',UY,'q',0);
uLINK(27) = struct('name','LLEG_J4' , 'm',  1, 'sister', 0, 'child', 28, 'b',[0  0 -0.123]' ,'a',UY,'q',0);
uLINK(28) = struct('name','LLEG_J5' , 'm',  4, 'sister', 0, 'child', 0, 'b',[0  0 0]' ,'a',UX,'q',0);

[uLINK(1).vertex,uLINK(1).face]   = MakeBox([0.08 0.2 0.24] ,[0.05 0.1 0]); % body
[uLINK(3).vertex,uLINK(3).face]   = MakeBox([0.08 0.08 0.08] ,[0.04 0.04 -0.02]);     %head
[uLINK(9).vertex,uLINK(9).face]   = MakeBox([0.02 0.06 0.06] ,[0.01  0.03 0.08]);     %hand
[uLINK(15).vertex,uLINK(15).face]   = MakeBox([0.02 0.06 0.06] ,[0.01  0.03 0.08]);     %hand
[uLINK(22).vertex,uLINK(22).face]   = MakeBox([0.1 0.06 0.02] ,[0.04  0.03 0.04]);     % Foot
[uLINK(28).vertex,uLINK(28).face] = MakeBox([0.1 0.06 0.02] ,[0.04  0.03 0.04]);     % Foot


FindMother(1);   % Find mother link from sister and child data

%%% Substitute the ID to the link name variables. For example, BODY=1.
for n=1:length(uLINK)
    eval([uLINK(n).name,'=',num2str(n),';']);
end

uLINK(BODY).p = [0.0, 0.0, 0.65]';
uLINK(BODY).R = eye(3);
ForwardKinematics(1);

uLINK(BODY).v = [0 0 0]';
uLINK(BODY).w = [0 0 0]';
for n=1:length(uLINK)
    uLINK(n).dq     = 0;            % joitn speed   [rad/s]
end
