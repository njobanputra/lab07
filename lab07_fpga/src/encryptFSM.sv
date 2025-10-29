module encryptFSM(input logic clk, reset,
				  output logic [127:0] key, text,
				  output logic [3:0] round);
				  
		typedef enum logic [2:0] {idle, keyExpan, subBytes, shiftRows, mixcolumns, addRoundKey} statetype;
		statetype state, nextstate;
		logic [3:0] prevRound;
		
		//State Register
		always_ff @(posedge clk)
			if(reset) begin
				state <= idle;
				prevRound <= 4'd0;
				end
			else begin
				state <= nextstate;
				prevRound <= round;
				end
		
		// next state logic
		always_comb begin
			case(state)
				idle:			nextstate = keyExpan;
				keyExpan:		nextstate = subBytes;
				subBytes:		nextstate = shiftRows;
				shiftRows:		if(prevRound != 10)	nextstate = mixcolumns;
								else nextstate = addRoundKey;
				mixcolumns:		nextstate = addRoundKey;
				addRoundKey: 	if(prevRound > 10) nextstate = idle;
								else nextstate = keyExpan;
				default:		nextstate = idle;
			endcase
		end
		
		//output logic
		
		
endmodule