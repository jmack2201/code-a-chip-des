design_name=des_top
verilog_source=../verilog/src/
tb_source=../verilog/tb/
cpp_object_name=des

.DEFAULT: verilog
verilog:
	make link
	make compile
	make simulate

compile:
	make link
	iverilog -o $(design_name) -g2005 -Wall -v -c design_setting.txt  | tee $(design_name)_compile.log

simulate:
	vvp $(design_name) +test_name=user_input +user_plain_text=85E813540F0AB405 +user_cipher_key=133457799BBCDFF1 +clk_period=1 +encrypt_decrypt=1 | tee $(design_name)_execute.log
	gtkwave $(design_name).vcd --save=$(design_name)_gtkwave_setup.gtkw &

cpp:
	g++ des.cpp -o $(cpp_object_name)

clean_cpp:
	rm $(cpp_object_name)
clean:
	rm -rf *.v
	rm -rf *.vcd
	rm -rf *.log
	rm -rf $(design_name)
link:
	ln -f -s $(verilog_source)*.v .
	ln -f -s $(tb_source)*.v .