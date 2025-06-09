module binary_to_gray #(parameter N = 4)(
    input  [N-1:0] in,
    output [N-1:0] out);
buf(out[N-1],in[N-1]);
    genvar i;
    generate for (i = 0; i < N-1; i = i + 1) begin : xor_loop
            xor x1(out[i],in[i],in[i+1]);
        end
    endgenerate
endmodule

module testbench();
parameter N=4;
reg [N-1:0] in;
wire [N-1:0] out;
binary_to_gray m1(in,out);
initial begin
for(integer i=0;i<2**N;i=i+1)
begin
in=i;
#10;
$display("input=%b output = %b",in,out);
end
$finish;
end
endmodule
