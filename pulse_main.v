module clk_divide_R(out,clk,reset);
output reg out;
input clk,reset;
initial
out=0;
always @ (posedge clk)
begin
if(reset==1)
out=1'b0;
else
out=~out;
end
endmodule


module clk_divide_F(out,clk,reset);
output reg out;
input clk,reset;
initial
out=0;
always @ (negedge clk)
begin
if(reset==1)
out=0;
else
out=~out;
end
endmodule 

module pulse_main(out,clk,reset);
output out;
input clk,reset;
wire w1,w2,w3,w4,w5;
clk_divide_R d1(w1,clk,reset);
clk_divide_R d2(w2,w1,reset);
clk_divide_F d3(w3,clk,reset);
clk_divide_F d4(w4,w3,reset);

assign #5 out=~(w4^w2);

endmodule
