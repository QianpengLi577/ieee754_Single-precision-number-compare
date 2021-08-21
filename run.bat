iverilog -o "tb.vvp" tb.v compare.v

vvp -n "tb.vvp"

gtkwave tb.vcd

python count_lossmax.py

pause