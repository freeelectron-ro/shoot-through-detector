
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2022 03:12:26 PM
// Design Name: 
// Module Name: test_fpga
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_fpga(
    input  sys_clock,
    input  BTN,
    output LD0,
    output LD1,
    output LD2,
    output LD3,

    input  i0a,
    input  i0b,
    input  i1a,
    input  i1b,
    input  i2a,
    input  i2b,
    input  i3a,
    input  i3b,

    output o0,
    output o1,
    output o2,
    output o3    
);

detection_block dt0(
    .a(i0a),
    .b(i0b),
    .ld(LD0),
    .o(o0),
    .clr(BTN),
    .clk(sys_clock)
);
detection_block dt1(
    .a(i1a),
    .b(i1b),
    .ld(LD1),
    .o(o1),
    .clr(BTN),
    .clk(sys_clock)
);
detection_block dt2(
    .a(i2a),
    .b(i2b),
    .ld(LD2),
    .o(o2),
    .clr(BTN),
    .clk(sys_clock)
);
detection_block dt3(
    .a(i3a),
    .b(i3b),
    .ld(LD3),
    .o(o3),
    .clr(BTN),
    .clk(sys_clock)
);

endmodule

module detection_block(
    input a,
    input b,
    output ld,
    output o,
    input clr,
    input clk
);

    wire ina, inb, inc;

    synchronizer syncA(
        .clk(clk),
        .din(a),
        .dout(ina)
    );
    synchronizer syncB(
        .clk(clk),
        .din(b),
        .dout(inb)
    );
    synchronizer syncC(
        .clk(clk),
        .din(clr),
        .dout(inc)
    );
    detector det(
        .clk(clk),
        .a(ina),
        .b(inb),
        .out(o)
    );
    flag flg(
        .clk(clk),
        .in(o),
        .out(ld),
        .clr(inc)
    );
    
endmodule
