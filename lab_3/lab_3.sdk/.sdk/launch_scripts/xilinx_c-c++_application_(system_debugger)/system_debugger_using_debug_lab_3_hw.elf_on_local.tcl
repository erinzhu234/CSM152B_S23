connect -url tcp:127.0.0.1:3121
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Basys3 210183B31C2FA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Basys3 210183B31C2FA"} -index 0
dow C:/Users/Student/Documents/GitHub/CSM152B_S23/lab_3/lab_3.sdk/lab_3_hw/Debug/lab_3_hw.elf
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Basys3 210183B31C2FA"} -index 0
con
