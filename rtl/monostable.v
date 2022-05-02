module monostable(input in, input clk, output out);
	parameter SIZE = 4;
	parameter TIMEOUT = 10;
  
  reg [SIZE-1:0] counter;
  
  // fake reg
  reg [SIZE-1:0] pre_counter;
  
  assign out = (counter <= TIMEOUT) ? 1 : 0;
  
  always @(*)
    begin
      if (out)
        pre_counter = counter + 1;
      else
        pre_counter = counter;
    end
  
  
  always @(posedge clk or posedge in)
    begin
      if (in==1)
        counter <= 0;
      else
        counter <= pre_counter;
    end
  
endmodule
