design_name=des_top
verilog_source=../verilog/

.DEFAULT: verilog
verilog:
	make link
	iverilog -o $(design_name) -g2005 -Wall -v -c design_setting.txt  | tee compile.log
	vvp $(design_name) +test_name=user_input +user_plain_text=0123456789ABCDEF +user_cipher_key=00000000 +clk_period=1 | tee execute.log
	gtkwave $(design_name).vcd &
clean:
	rm -rf *.v
	rm -rf *.vcd
	rm -rf *.log
	rm -rf $(design_name)
link:
	ln -f -s $(verilog_source)*.v .