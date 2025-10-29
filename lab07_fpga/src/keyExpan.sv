module keyExpan(input logic clk,
				input logic [127:0] key,
				input logic round,
				output logic [127:0] expanKey);
				
		/*logic [127:0] keybefore;
		
		always_ff @(posedge clk) begin
			keybefore <= key;
		end */
		
		logic [31:0] temp, afterSub, rcon, word1, word2, word3, word4, col1, col2, col3, col4;
		assign temp = {key[23:16], key[15:8], key[7:0], key[31:24]};
		sbox_sync sb[3:0] (temp, clk, afterSub);
		
		assign col1 = key[127:96];
		assign col2 = key[95:64];
		assign col3 = key[63:32];
		assign col4 = key[31:0];
		
		always_comb begin
		case(round)
				4'd0: expanKey = key;
				   
				4'd1: begin
					 rcon = afterSub^32'h01000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd2: begin
					 rcon = afterSub^32'h02000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd3: begin
					 rcon = afterSub^32'h04000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd4: begin
					 rcon = afterSub^32'h08000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd5: begin
					 rcon = afterSub^32'h10000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd6: begin
					 rcon = afterSub^32'h20000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd7: begin
					 rcon = afterSub^32'h40000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd8: begin
					 rcon = afterSub^32'h80000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd9: begin
					 rcon = afterSub^32'h1b000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end
			   
				4'd10: begin
					 rcon = afterSub^32'h36000000;
					 word1 = rcon^col1;
					 word2 = col2^word1;
					 word3= col3^word2;
					 word4= col4^word3;
					 expanKey = {word1, word2, word3, word4};
				   end	
				default: expanKey = 32'h00000000;
			endcase
		end 
endmodule