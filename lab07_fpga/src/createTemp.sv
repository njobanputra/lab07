module createTemp(input logic [127:0] key,
				  output logic [127:0] expanKey);
				  
		logic [32:0] temp, col1, col2, col3;
		assign temp = {key[23:16], key[15:8], key[7:0], key[31:24]};
		assign col1 = {key[127:120], key[119:112], key[111:104], key[103:96]};
		assign col2 = {key[95:88], key[87:80], key[79:72], key[103:96]};
		assign col3 = {key[63:56], key[55:48], key[47:40], key[71:64]};
		assign expanKey = {col1, col2, col3, temp};
		
endmodule