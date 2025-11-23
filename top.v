module top(
    input sw,          // w
    output [9:0] led,  // see IO table
    input btnC,        // clk
    input btnU         // reset
);

    wire oh_z; // onehot z
    wire Astate, Bstate, Cstate, Dstate, Estate;

    wire bin_z;
    wire [2:0] bin_state;

    onehot oh(
        .w(sw),
        .clk(btnC),
        .rst(btnU),
        .z(oh_z),
        .Astate(Astate),
        .Bstate(Bstate),
        .Cstate(Cstate),
        .Dstate(Dstate),
        .Estate(Estate)
    );

    binary bin(
        .w(sw),
        .clk(btnC),
        .rst(btnU),
        .z(bin_z),
        .State(bin_state)
    );

    assign led[0] = oh_z;

    assign led[1] = bin_z;
    assign led[2] = Astate;
    assign led[3] = Bstate;
    assign led[4] = Cstate;
    assign led[5] = Dstate;
    assign led[6] = Estate;
    assign led[9:7] = bin_state;

endmodule