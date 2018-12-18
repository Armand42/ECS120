// Graph

states =              {s,v,v1,v11,v12,v2,v21,v22,v3,v31,v32,qA,qR}
input_alphabet =      {$,:,&,1,2,3,4}
tape_alphabet_extra = {_}
start_state =         s
accept_state =        qA
reject_state =        qR
num_tapes =           4
delta = 
       s,$___ -> v,$$$$,RRRR;
       v,1?__ -> v1,1?__,RSSS;
       v,2??_ -> v2,2??_,RSSS;
       v,3??_ -> v3,3??_,RSSS;
       
       v1,&?__ -> v11,&?__,RSSS;
       v11,2___ -> v12,22__,RSSS;
       v11,3___ -> v12,33__,RSSS;
       v11,4___ -> v12,44__,RSSS;
       v11,32__ -> v12,33__,RSSS;
       v11,43__ -> v12,44__,RSSS;
       v11,42__ -> v12,44__,RSSS;
       
        v2,&??_ -> v21,&??_,RSSS;
       v21,3?__ -> v22,343_,RSSS;
       v21,4?__ -> v22,444_,RSSS;
       v21,4?3_ -> v22,444_,RSSS;
       
        v3,&??_ -> v31,&??_,RSSS;
       v31,4??_ -> v32,4444,RSSS;
      
        v12,:??? -> v,:???,RSSS;
        v22,:??? -> v,:???,RSSS;
        v32,:??? -> v,:???,RSSS;
        
        v12,_??? -> qA,_???,SSSS;
        v22,_??? -> qA,_???,SSSS;
        v32,_??? -> qA,_???,SSSS;
        v,____ -> qA,____,SSSS;
