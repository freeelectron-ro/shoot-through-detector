`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2022 06:56:48 PM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(
    input  clk,
    input  din,
    output dout
    );
    
    reg qi, qo;
    
    assign dout = qo;
    
    always @(posedge clk)
    begin
        qi <= din;
        qo <= qi;
    end
    
endmodule
