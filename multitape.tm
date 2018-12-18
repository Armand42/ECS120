states= {q0,q1,q2,q3,q4,qA,qR}
input_alphabet= {0,1,2}
tape_alphabet_extra= {$,_}
start_state= q0
accept_state= qA
reject_state= qR
num_tapes= 4

delta= 
    q0, 0___ -> q1,0$$$,SRRR;
    q1, 0___ -> q1,00__,RRSS;
    q1, 1___ -> q2,1_1_,RSRS;
    q2, 1___ -> q2,1_1_,RSRS;
    q2, 2___ -> q3,2__2,RSSR;
    q3, 2___ -> q3,2__2,RSSR;
    q3, ____ -> q4,____,SLLL;
    q4, _012 -> q4,_012,SLLL;
    q4, _$$$ -> qA,_$$$,SSSS;
