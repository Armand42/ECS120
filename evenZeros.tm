states= {s,q,qA,qR}
input_alphabet= {0}
tape_alphabet_extra= {_}
start_state= s
accept_state= qA
reject_state= qR
num_tapes= 1

delta= 
    s,0 -> q,0,R;
    q,0 -> s,0,R;
    s,_ -> qA,_,S;
