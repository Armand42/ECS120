states= {q0,q1,q2,q3,q4,qA,qR}
input_alphabet= {0,1,2}
tape_alphabet_extra= {_,x,y,z}
start_state= q0
accept_state= qA
reject_state= qR
num_tapes= 1

delta= 
    q0,0 -> q1,x,R;
    q0,y -> q4,y,R;
    
    q1,0 -> q1,0,R;
    q1,1 -> q2,y,R;
    q1,y -> q1,y,R;
    
    q2,1 -> q2,1,R;
    q2,z -> q2,z,R;
    q2,2 -> q3,z,L;
    
    q3,0 -> q3,0,L;
    q3,1 -> q3,1,L;
    q3,y -> q3,y,L;
    q3,z -> q3,z,L;
    q3,x -> q0,x,R;
    
    q4,y -> q4,y,R;
    q4,z -> q4,z,R;
    q4,_ -> qA,_,S;
    
    q0,x -> qA,x,R;
    
