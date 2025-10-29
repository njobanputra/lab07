module shiftRows(input logic [127:0] subtext,
				output logic [127:0] rowstext);
				
		logic [31:0] col1, col2, col3, col4;
		
		assign col1 = {subtext[127:120], subtext[87:80], subtext[47:40], subtext[7:0]};
		assign col2 = {subtext[95:88], subtext[55:48], subtext[15:8], subtext[103:96]};
		assign col3 = {subtext[63:56], subtext[23:16], subtext[111:104], subtext[71:64]};
		assign col4 = {subtext[31:24], subtext[119:112], subtext[79:72], subtext[39:32]};
		assign rowstext = {col1, col2, col3, col4};
	
endmodule