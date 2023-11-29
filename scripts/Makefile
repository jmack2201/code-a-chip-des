design_name=des_top
verilog_source=../verilog/src/
tb_source=../verilog/tb/
cpp_object_name=des
plain_text=0123456789ABCDEF
cipher_key=133457799BBCDFF1
encrypt_decrypt=Encryption
debug=false

.DEFAULT: verilog
verilog:
	make verilog_compile
	make verilog_simulate

verilog_compile:
	make verilog_link
	iverilog -o $(design_name) -g2005 -Wall -Wno-timescale -c design_setting.txt 

verilog_simulate:
	vvp $(design_name) +test_name=single_input +user_plain_text=$(plain_text) +user_cipher_key=$(cipher_key) \
	+clk_period=5 +encrypt_decrypt=$(encrypt_decrypt) 
#	gtkwave $(design_name).vcd --save=$(design_name)_gtkwave_setup.gtkw &

cpp_flow:
	make cpp
	make cpp_run

cpp_run:
	./$(cpp_object_name) $(plain_text) $(cipher_key)

cpp:
    ifeq ($(debug),true)
        ifeq ($(encrypt_decrypt),Decryption)
		g++ $(cpp_object_name).cpp -DDEBUG -DDECRYPT -o $(cpp_object_name) 
        else
		g++ $(cpp_object_name).cpp -DDEBUG -o $(cpp_object_name)
        endif
    else
        ifeq ($(encrypt_decrypt),Decryption)
		g++ $(cpp_object_name).cpp -DDECRYPT -o $(cpp_object_name) 
        else
		g++ $(cpp_object_name).cpp -o $(cpp_object_name)
        endif
    endif

clean:
	rm -rf *.v
	rm -rf *.vcd
	rm -rf *.log
	rm -rf $(design_name)
	rm $(cpp_object_name)
verilog_link:
	ln -f -s $(verilog_source)*.v .
	ln -f -s $(tb_source)*.v .