design_name=des_design
verilog_source=../verilog/

.DEFAULT: verilog
verilog:
	make link
	iverilog -o $(design_name) -gxtypes -Wall -v -c design_setting.txt  > compile.log
	vvp $(design_name) > execute.log
clean:
	rm -rf *.v
	rm -rf *.vcd
	rm -rf *.log
	rm -rf $(design_name)
link:
	ln -f -s $(verilog_source)*.v .