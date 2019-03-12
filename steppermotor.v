`timescale 1ns / 1ps
module st(start,clock,dout);
input clock;
wire clock;
reg [19:0]count;
reg clock1;
always@(posedge clock) begin //Dividing the clock frequency
count<=count+1;
if(count==1000000) begin
count<=0;
clock1<=!clock1;
end
end
output[3:0]dout;
reg[3:0]dout;
input start;
wire start;
reg [1:0]m;
initial m=0;
always@(posedge (clock1)) begin
if(start)
m<=m+1;
end
always@(m) begin
case(m)
0:dout=8;
1:dout=4;
2:dout=2;
default:dout=1;
endcase
end
endmodule
