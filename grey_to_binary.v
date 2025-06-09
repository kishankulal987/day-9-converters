`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 20:48:49
// Design Name: 
// Module Name: grey_to_binary
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


module grey_to_binary #(parameter N=4)(input [N-1:0]in,output [N-1:0]out);
assign out[N-1]=in[N-1];
genvar i;
generate
for(i=N-2;i>=0;i=i-1)
begin : xorln
xor x1(out[i],out[i+1],in[i]);
end
endgenerate
endmodule

module testbench();
localparam N=4;
reg [N-1:0]in;
wire [N-1:0]out;
grey_to_binary m1(in ,out);
initial begin
for(integer i=0;i<2**N;i=i+1)
begin
in=i;
#10;
$display("input=%b output =%b",in,out);
end
$finish;
end
endmodule