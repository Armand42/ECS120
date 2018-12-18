// This TM recognizes  w$w | w in {0,1}*

states =              {s,s1,s2,s3,qA,qR}
input_alphabet =      {0,1,$}
tape_alphabet_extra = {_}
start_state =         s
accept_state =        qA
reject_state =        qR
num_tapes =           2
delta = 
        s,?_ -> s1,?$,SR;
        s1,0_ -> s1,00,RR;
        s1,1_ -> s1,11,RR;
        s1,$_ -> s2,$_,SL;
        s2,$0 -> s2,$0,SL;
        s2,$1 -> s2,$1,SL;
        s2,$$ -> s3,$$,RR;
        s3,00 -> s3,00,RR;
        s3,11 -> s3,11,RR;
        s3,__ -> qA,__,SS;
