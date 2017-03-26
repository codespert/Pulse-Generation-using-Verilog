`timescale 1ns / 1ps

module TB_Pulse();
wire out;
reg clk,reset;
pulse_main p1(.out(out),.clk(clk),.reset(reset));

initial
begin
clk=1'b0;
reset=1'b1;
end

always
#5 clk=~clk;

initial
begin
#5 reset=1'b0;
//#1000 $finish;
end
endmodule
