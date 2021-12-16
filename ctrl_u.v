module ctrl_u (
  input clk, rst_b, bgn,
  input [15:0] itr,
  output fin, ld, init
  );
  reg [2:0] st;
  wire [2:0] st_nxt;
  
assign st_nxt[0] = st[2] | (st[0] & (~bgn));
assign st_nxt[1] =(st[0] & bgn) | (st[1] & (itr !=4'd15));
assign st_nxt[2] = st[1] & itr ==4'd15;

assign ld = (st[0] & bgn) | st[1];
assign init = st[0] & bgn;
assign fin = st[2];

initial st <= 3'b001;
always @ (posedge clk, negedge rst_b) begin
  if (!rst_b)
    st <= 3'b001;
  else
  st <= st_nxt;
end 
endmodule 