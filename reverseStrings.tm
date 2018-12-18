// This TM returns reverse strings

states =              {s,s1,s2,s3,qA,qR}
input_alphabet =      {0,1,$}
tape_alphabet_extra = {_}
start_state =         s
accept_state =        qA
reject_state =        qR
num_tapes =           2
delta = 
        s,$_ -> s1,$$,RR;
        s1,0_ -> s1,0_,RS;
        s1,1_ -> s1,1_,RS;
        s1,__ -> s2,__,LS;
        s2,0_ -> s2,00,LR;
        s2,1_ -> s2,11,LR;
        s2,$_ -> s3,$_,SL;
        s3,$0 -> s3,$0,SL;
        s3,$1 -> s3,$1,SL;
        s3,$$ -> qA,$$,SR;
