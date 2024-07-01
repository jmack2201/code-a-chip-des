from openlane.flows import Flow

Classic = Flow.factory.get("Classic")

# flow1 = Classic(
#     {
#         "PDK": "sky130A",
#         "DESIGN_NAME": "spm",
#         "VERILOG_FILES": ["/home/jmack/my_designs/pm32/spm.v","/home/jmack/my_designs/pm32/pm32.v"],
#         "CLOCK_PORT": "clk",
#         "CLOCK_PERIOD": 10,
#     },
#     design_dir="/home/jmack/my_designs/pm32",
# )

# flow1.start()

flat_flow = Classic(
    {
        "PDK": "sky130A",
        "DESIGN_NAME": "des_top",
        "VERILOG_FILES": ["/home/jmack/silicon_projects/code-a-chip-des/verilog/src/des_config.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/feistel_function.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/final_perm.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/init_perm.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/key_mux.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/key_gen.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/p_box_32_32.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/p_box_32_48.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/p_box_56_48.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/p_box_64_56.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/round_ff.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/key_ff.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/round_key_gen.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/round_stack.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/round.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/s_box_6_4.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/s_box_48_32.v",
                          "/home/jmack/silicon_projects/code-a-chip-des/verilog/src/des_top.v"],
        "CLOCK_PORT": "clk",
        "CLOCK_PERIOD": 10,
    },
    design_dir="/home/jmack/silicon_projects/code-a-chip-des/pd/flat",
)

flat_flow.start()