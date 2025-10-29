/////////////////////////////////////////////
// shiftRowstestbench
// Tests the shiftRows module of AES with cases 
// from FIPS-197 appendix
// Tests shiftRows module apart from the SPI load
// Added 10/26/25 by Nina Jobanputra
// njobanputra@hmc.edu
/////////////////////////////////////////////

module testbench_shiftRows();
    logic clk, load, done;
    logic [127:0] key, plaintext, cyphertext, expected;
	
	// device under test
    shiftRows dut(plaintext, cyphertext);
	
	// test case
    initial begin 
	 // Test case from FIPS-197 Appendix A.1, B
    plaintext <= 128'hd4_27_11_ae_e0_bf_98_f1_b8_b4_5d_e5_1e_41_52_30;
    expected  <= 128'hd4_bf_5d_30_e0_b4_52_ae_b8_41_11_f1_1e_27_98_e5;
    end
    
    // generate clock and load signals
    always begin
			clk = 1'b0; #5;
			clk = 1'b1; #5;
		end
        
    initial begin
      load = 1'b1; #22; load = 1'b0; //Pulse load to start conversion
    end

    // wait until done and then check the result
    always @(posedge clk) begin
      if (done) begin
        if (cyphertext == expected)
            $display("Testbench ran successfully");
        else $display("Error: cyphertext = %h, expected %h",
            cyphertext, expected);
        $stop();
      end
    end
	
endmodule