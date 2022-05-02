module detector(input a, input b, input clk, output out);
  
    wire ma, mb;
  
    monostable mA(.in(a), .out(ma), .clk(clk));
    monostable mB(.in(b), .out(mb), .clk(clk));

    monostable #(.SIZE(7), .TIMEOUT(100)) mO (.in(ma & mb), .out(out), .clk(clk));

endmodule 
