module subBytes(input logic clk,
				input logic [127:0] plaintext,
				output logic [127:0] subtext);
				
		sbox_sync sb[15:0] (plaintext, clk, subtext);
		
endmodule