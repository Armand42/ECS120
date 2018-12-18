// Graph

states =              {s,begin,load,move,add,reset,Mx,My,carry0,carry1,qR,qA}
input_alphabet =      {$,:,0,1,M,L,A,x,y}
tape_alphabet_extra = {_}
start_state =         s
accept_state =        qA
reject_state =        qR
num_tapes =           4
delta = 
        s,$___ -> begin,$$$$,RSSS;
        begin,L$$$ -> load,L$$$,RSSR;
        begin,M$$$ -> move,M$$$,RSSS;
        begin,A$$$ -> add,A$$$,RRRR;
        
        load,0$$? -> load,0$$0,RSSR;
        load,1$$? -> load,1$$1,RSSR;
        load,:$$_ -> reset,:$$_,SSSL;
        
        move,x$$$ -> Mx,x$$$,RRSR;
        move,y$$$ -> My,y$$$,RSRR;
        Mx,:?$0 -> Mx,:0$0,SRSR;
        Mx,:?$1 -> Mx,:1$1,SRSR;
        Mx,:_$_ -> reset,:_$_,SLSL;
        
        My,:$?0 -> My,:$00,SSRR;
        My,:$?1 -> My,:$11,SSRR;
        My,:$__ -> reset,:$__,SSLL;
        
        reset,:$$0 -> reset,:$$0,SSSL;
        reset,:$$1 -> reset,:$$1,SSSL;
        reset,:0$0 -> reset,:0$0,SLSL;
        reset,:1$1 -> reset,:1$1,SLSL;
        reset,:$00 -> reset,:$00,SSLL;
        reset,:$11 -> reset,:$11,SSLL;
        reset,:$$$ -> begin,:$$$,RSSS;
        add,:??? -> add,:???,SRRR;
        add,:___ -> carry0,:___,SLLL;
        carry0,:00? -> carry0,:000,SLLL;
        carry0,:10? -> carry0,:101,SLLL;
        carry0,:01? -> carry0,:011,SLLL;
        carry0,:11? -> carry1,:110,SLLL;
        carry1,:01? -> carry1,:010,SLLL;
        carry1,:10? -> carry1,:100,SLLL;
        carry1,:11? -> carry1,:111,SLLL;
        carry1,:00? -> carry0,:001,SLLL;
        
        carry1,:$$$ -> begin,:$$$,RSSS;
        carry0,:$$$ -> begin,:$$$,RSSS;
        
        begin,_$$$ -> qA,_$$$,SSSR;
