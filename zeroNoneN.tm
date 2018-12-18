states= {q0,q1,q2,q3,qA,qR}
input_alphabet= {0,1}
tape_alphabet_extra= {_,x}
start_state= q0
accept_state= qA
reject_state= qR
num_tapes= 1

delta= 
    q0,0 -> q1,x,R;
    q1,0 -> q1,0,R;
    q1,1 -> q1,1,R;
    q1,_ -> q2,_,L;
    q1,x -> q2,x,L;
    q2,1 -> q3,x,L;
    q3,0 -> q3,0,L;
    q3,1 -> q3,1,L;
    q3,x -> q0,x,R;
    q0,x -> qA,x,R;
