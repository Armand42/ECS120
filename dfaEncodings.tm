// Graph

states =              {s,f0, f1,f2,q1,q2,q3,q4,q5,q6,q7,c0,c1,c2,r0,r1,r2,0a,0b,1a,1a1,1a2,1a3,1a4,1b,1b1,1b2,1b3,1b4,1b5,1b6,2a,2a1,2a2,2a3,2a4,2a5,2a6,2a7,2a8,2b,2b1,2b2,2b3,2b4,2b5,2b6,2b7,2b8,2b9,2b10,0b1,0b2,qA,qR}
input_alphabet =      {$,:,#,&,0,1,2,a,b}
tape_alphabet_extra = {_}
start_state =         s
accept_state =        qA
reject_state =        qR
num_tapes =           4
delta = 
        s,$___ -> q1,$$$$,RRRR;
        q1,0___ -> q1,00__,RRSS;
        q1,1___ -> q1,11__,RRSS;
        q1,2___ -> q1,22__,RRSS;
        q1,&___ -> q1,&&__,RRSS;
        q1,:___ -> q2,:___,RSSS;
        
        q2,?___ -> q3,?___,RSSS;
        q3,:___ -> q4,:___,RSSS;
        
        q4,0___ -> q4,0_0_,RSRS;
        q4,1___ -> q4,1_1_,RSRS;
        q4,2___ -> q4,2_2_,RSRS;
        q4,&___ -> q4,&_&_,RSRS;
        q4,#___ -> q5,#___,RSSS;
        
        q5,a___ -> q5,a__a,RSSR;
        q5,b___ -> q5,b__b,RSSR;
        q5,____ -> q6,____,LSSS;
        
        q6,?___ -> q6,?___,LSSS;
        q6,:___ -> q6,:___,SLSS;
        q6,:?__ -> q6,:?__,SLSS;
        q6,:$__ -> q6,:$__,SSLS;
        q6,:$?_ -> q6,:$?_,SSLS;
        q6,:$$_ -> q6,:$$_,SSSL;
        q6,:$$? -> q6,:$$?,SSSL;
        q6,:$$$ -> q7,:$$$,LSSS;
       
        q7,0$$$ -> r0,0$$$,SSSS;
        q7,1$$$ -> r1,1$$$,SSSS; 
        q7,2$$$ -> r2,2$$$,SSSS;
        
        r0,?0$? -> r0,?0$?,SLSS;
        r0,?1$? -> r0,?1$?,SLSS;
        r0,?2$? -> r0,?2$?,SLSS;
        r0,?&$? -> r0,?&$?,SLSS;
        r0,?$$? -> c0,?$$?,SSSR;
        
        r1,?0$? -> r1,?0$?,SLSS;
        r1,?1$? -> r1,?1$?,SLSS;
        r1,?2$? -> r1,?2$?,SLSS;
        r1,?&$? -> r1,?&$?,SLSS;
        r1,?$$? -> c1,?$$?,SSSR;
        
        r2,?0$? -> r2,?0$?,SLSS;
        r2,?1$? -> r2,?1$?,SLSS;
        r2,?2$? -> r2,?2$?,SLSS;
        r2,?&$? -> r2,?&$?,SLSS;
        r2,?$$? -> c2,?$$?,SSSR;
        
        c0,?$$a -> 0a,?$$a,SRSS;
        c0,?$$b -> 0b,?$$b,SRSS;
        
        0a,?0$a -> r0,?0$a,SLSS;
        0a,?1$a -> r1,?1$a,SLSS;
        0a,?2$a -> r2,?2$a,SLSS;
        
        0b,??$b -> 0b1,??$b,SRSS;
        0b1,?&$b -> 0b2,?&$b,SRSS;
        0b2,?0$b -> r0,?0$b,SLSS;
        0b2,?1$b -> r1,?1$b,SLSS;
        0b2,?2$b -> r2,?2$b,SLSS;
        
        c1,?$$a -> 1a,?$$a,SRSS;
        c1,?$$b -> 1b,?$$b,SRSS;
        
        1a,??$a -> 1a1,??$a,SRSS;
        1a1,?&$a -> 1a2,?&$a,SRSS;
        1a2,??$a -> 1a3,??$a,SRSS;
        1a3,?&$a -> 1a4,?&$a,SRSS;
        1a4,?0$a -> r0,?0$a,SLSS;
        1a4,?1$a -> r1,?1$a,SLSS;
        1a4,?2$a -> r2,?2$a,SLSS;
        
        1b,??$b -> 1b1,??$b,SRSS;
        1b1,?&$b -> 1b2,?&$b,SRSS;
        1b2,??$b -> 1b3,??$b,SRSS;
        1b3,?&$b -> 1b4,?&$b,SRSS;
        1b4,??$b -> 1b5,??$b,SRSS;
        1b5,?&$b -> 1b6,?&$b,SRSS;
        1b6,?0$b -> r0,?0$b,SLSS;
        1b6,?1$b -> r1,?1$b,SLSS;
        1b6,?2$b -> r2,?2$b,SLSS;
        
        c2,?$$a -> 2a,?$$a,SRSS;
        c2,?$$b -> 2b,?$$b,SRSS;
        
        2a,??$a -> 2a1,??$a,SRSS;
        2a1,?&$a -> 2a2,?&$a,SRSS;
        2a2,??$a -> 2a3,??$a,SRSS;
        2a3,?&$a -> 2a4,?&$a,SRSS;
        2a4,??$a -> 2a5,??$a,SRSS;
        2a5,?&$a -> 2a6,?&$a,SRSS;
        2a6,??$a -> 2a7,??$a,SRSS;
        2a7,?&$a -> 2a8,?&$a,SRSS;
        2a8,?0$a -> r0,?0$a,SLSS;
        2a8,?1$a -> r1,?1$a,SLSS;
        2a8,?2$a -> r2,?2$a,SLSS;
        
        2b,??$b -> 2b1,??$b,SRSS;
        2b1,?&$b -> 2b2,?&$b,SRSS;
        2b2,??$b -> 2b3,??$b,SRSS;
        2b3,?&$b -> 2b4,?&$b,SRSS;
        2b4,??$b -> 2b5,??$b,SRSS;
        2b5,?&$b -> 2b6,?&$b,SRSS;
        2b6,??$b -> 2b7,??$b,SRSS;
        2b7,?&$b -> 2b8,?&$b,SRSS;
        2b8,??$b -> 2b9,??$b,SRSS;
        2b9,?&$b -> 2b10,?&$b,SRSS;
        2b10,?0$b -> r0,?0$b,SLSS;
        2b10,?1$b -> r1,?1$b,SLSS;
        2b10,?2$b -> r2,?2$b,SLSS;
        
        c0,?$$_ -> f0,?$$_,SSRS;
        f0,?$1_ -> f0,?$1_,SSRS;
        f0,?$2_ -> f0,?$2_,SSRS;
        f0,?$&_ -> f0,?$&_,SSRS;
        f0,?$0_ -> qA,?$0_,SSSS;
        
        c1,?$$_ -> f1,?$$_,SSRS;
        f1,?$0_ -> f1,?$0_,SSRS;
        f1,?$2_ -> f1,?$2_,SSRS;
        f1,?$&_ -> f1,?$&_,SSRS;
        f1,?$1_ -> qA,?$1_,SSSS;
        
        c2,?$$_ -> f2,?$$_,SSRS;
        f2,?$0_ -> f2,?$0_,SSRS;
        f2,?$1_ -> f2,?$1_,SSRS;
        f2,?$&_ -> f2,?$&_,SSRS;
        f2,?$2_ -> qA,?$2_,SSSS;
