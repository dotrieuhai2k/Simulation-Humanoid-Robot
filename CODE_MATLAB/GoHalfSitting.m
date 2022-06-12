% GoHalfSitting.m
%%%%%%%%%%% Move to non singular pose %%%%%%%%%%%%
uLINK(RLEG_J0).q = 30*ToRad;
uLINK(RLEG_J1).q = 60*ToRad;
uLINK(RLEG_J2).q = 60*ToRad;
uLINK(RLEG_J3).q =0*ToRad;
uLINK(RLEG_J4).q = 0*ToRad;
uLINK(RLEG_J5).q = 0*ToRad;

uLINK(LLEG_J0).q = 60*ToRad;
uLINK(LLEG_J1).q = 30*ToRad;
uLINK(LLEG_J2).q = 30*ToRad;
uLINK(LLEG_J3).q = 0*ToRad;
uLINK(LLEG_J4).q = 0*ToRad;
uLINK(LLEG_J5).q = 0*ToRad;

uLINK(BODY).p = [0.0, 0.0, 0.7]';
uLINK(BODY).R = eye(3);


