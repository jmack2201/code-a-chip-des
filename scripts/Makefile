design_name=des_top
verilog_source=../verilog/src/
tb_source=../verilog/tb/
cpp_object_name=des
plain_text=85E813540F0AB405
cipher_key=133457799BBCDFF1
encrypt_decrypt=Decryption
debug=true

.DEFAULT: verilog
verilog:
	make verilog_link
	make verilog_compile
	make verilog_simulate

verilog_compile:
	iverilog -o $(design_name) -g2005 -Wall -Wno-timescale -c design_setting.txt 

verilog_simulate:
	vvp $(design_name) +test_name=user_input +user_plain_text=$(plain_text) +user_cipher_key=$(cipher_key) \
	+clk_period=5 +encrypt_decrypt=$(encrypt_decrypt)
#	gtkwave $(design_name).vcd --save=$(design_name)_gtkwave_setup.gtkw &

cpp_flow:
	make cpp
	make cpp_run

cpp_run:
	./$(cpp_object_name) $(plain_text) $(cipher_key)

cpp:
    ifeq ($(debug),false)
        ifeq ($(encrypt_decrypt),Decryption)
		g++ $(cpp_object_name).cpp -o -DDEBUG -DDECRYPT $(cpp_object_name) 
        else
		g++ $(cpp_object_name).cpp -o -DDEBUG $(cpp_object_name)
        endif
    else
        ifeq ($(encrypt_decrypt),Decryption)
		g++ $(cpp_object_name).cpp -o -DDECRYPT $(cpp_object_name) 
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