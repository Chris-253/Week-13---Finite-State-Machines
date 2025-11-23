module onehot(
    input w,
    input clk,
    input rst,
    output z,
    output Astate,
    output Bstate,
    output Cstate,
    output Dstate,
    output Estate
);

    wire Anext, Bnext, Cnext, Dnext, Enext;

    dff A_dff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .reset(rst),
        .Q(Astate)
    );

    dff B_dff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .reset(rst),
        .Q(Bstate)
    );

    dff C_dff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .reset(rst),
        .Q(Cstate)
    );

    dff D_dff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .reset(rst),
        .Q(Dstate)
    );

    dff E_dff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .reset(rst),
        .Q(Estate)
    );

    assign z = Cstate | Estate;

    assign Anext = 1'b0;
    assign Bnext = ~w & (Astate | Dstate | Estate);
    assign Cnext = ~w & (Bstate | Cstate);
    assign Dnext =  w & (Astate | Bstate | Cstate);
    assign Enext =  w & (Dstate | Estate);

endmodule
