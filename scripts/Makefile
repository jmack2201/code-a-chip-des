design_name=des_top
verilog_source=../verilog/src/
tb_source=../verilog/tb/
cpp_object_name=des
plain_text=85e813540f0ab405
cipher_key=133457799BBCDFF1

.DEFAULT: verilog
verilog:
	make link
	make compile
	make simulate

compile:
	make link
	iverilog -o $(design_name) -g2005 -Wall -v -c design_setting.txt  | tee $(design_name)_compile.log

simulate:
	vvp $(design_name) +test_name=user_input +user_plain_text=$(plain_text) +user_cipher_key=$(cipher_key) +clk_period=5 +encrypt_decrypt=1 | tee $(design_name)_execute.log
	gtkwave $(design_name).vcd --save=$(design_name)_gtkwave_setup.gtkw &

cpp_test:
	./$(cpp_object_name) $(cipher_key) $(plain_text)

cpp:
	g++ des.cpp -o $(cpp_object_name)

cpp_debug:
	g++ des.cpp -o -DDEBUG $(cpp_object_name)

cpp_decrypt:
	g++ des.cpp -o $(cpp_object_name) -DDECRYPT

cpp_decrypt_debug:
	g++ des.cpp -o $(cpp_object_name) -DDEBUG -DDECRYPT

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