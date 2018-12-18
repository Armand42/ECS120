// This TM returns 2x the amount of zeros

states =              {s,s1,s2,s3,qA,qR}
input_alphabet =      {0,$}
tape_alphabet_extra = {_}
start_state =         s
accept_state =        qA
reject_state =        qR
num_tapes =           2
delta = 
       s,$_ -> s1,$$,RR;
       s1,0_ -> s2,00,SR;
       s2,0_ -> s1,00,RR;
       s1,__ -> s3,__,SL;
       s3,_0 -> s3,_0,SL;
       s3,_$ -> qA,_$,SR;
        
