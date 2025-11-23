module binary(
    input w,
    input clk,
    input rst,
    output z,
    output [2:0] State
);

    wire [2:0] Next;

    dff zero(
        .Default(1'b0),   
        .D(Next[0]),
        .clk(clk),
        .reset(rst),
        .Q(State[0])
    );
    
    dff one(
        .Default(1'b0),  
        .D(Next[1]),
        .clk(clk),
        .reset(rst),
        .Q(State[1])
    );
    
    dff two(
        .Default(1'b0),   
        .D(Next[2]),
        .clk(clk),
        .reset(rst),
        .Q(State[2])
    );

    wire x = State[0];
    wire y = State[1];
    wire zstate = State[2];

    assign z = ( ~zstate &  y & ~x ) | ( zstate & ~y & ~x );


    assign Next[0] =
          (~w & ( (~zstate & ~y & ~x)    
                | (~zstate &  y &  x)     
                | ( zstate & ~y & ~x) ))   
        | ( w & (~zstate & ~(y & x)) );    

    assign Next[1] =
          ( w & (~zstate & ~(y & x)) )   
        | (~w & ( (~zstate & ~y & x)       
                | (~zstate &  y & ~x) ));  

    assign Next[2] =
          w & ( (~zstate & y & x)       
              | (zstate & ~y & ~x) );     

endmodule