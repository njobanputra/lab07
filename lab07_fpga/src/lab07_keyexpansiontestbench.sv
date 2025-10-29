
/////////////////////////////////////////////
// keyexpansiontestbench
// Tests the keyExpan module of AES with cases 
// from FIPS-197 appendix
// Tests keyExpan module apart from the SPI load
// Added 10/28/25 by Nina Jobanputra
// njobanputra@hmc.edu
/////////////////////////////////////////////

module testbench_keyExpan();
    logic clk, load, done, round;
    logic [127:0] key, plaintext, cyphertext, expected;
	
	// device under test
    keyExpan dut(clk, plaintext, 1'd1, cyphertext);
	
	// test case
    initial begin 
	 // Test case from FIPS-197 Appendix A.1, B
    plaintext <= 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
    expected  <= 128'ha0_fa_fe_17_88_54_2c_b1_23_a3_39_39_2a_6c_76_05;
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