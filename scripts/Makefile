design_name=des_design

.DEFAULT: verilog
verilog:
	make link
	iverilog -o $(design_name) -gxtypes -Wall -g2012 -v -c design_setting.txt  > compile.log
	vvp $(design_name) > execute.log
clean:
	rm -rf *.sv
	rm -rf *.vcd
	rm -rf *.log
	rm -rf $(design_name)
link:
	ln -f -s ../../verilog_source/*.sv .