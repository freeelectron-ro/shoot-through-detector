module flag (
        input clk,
        input in,
        output reg out,
        input clr
    );

    wire pre_out;
    assign pre_out = (out == 1) ? 1 : in;
 
always@(posedge clk or posedge clr)
    begin
        if(clr == 1)
            begin
                out <= 0;
            end
        else
            begin
                out <= pre_out;
            end    
    end

endmodule