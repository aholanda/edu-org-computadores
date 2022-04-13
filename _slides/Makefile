IMGDIR := ../_img

main.pdf: main.tex
	xelatex $< && xelatex $<

main.tex: proc.tex cpu.tex

proc.tex cpu.tex: proc-decoder.png proc-mux_example.png proc-clock_cycle1.png proc-clock_cycle2.png\
	proc-mips_subset.png \
	instr_mem_load_mips.png  instr_mem_load.png  instr_mem_store_mips.png  instr_mem_store.png

%.png: $(IMGDIR)/%.svg
	inkscape --export-png=$@ $< 
trash += *.png

clean:
	$(RM) $(trash) *.aux *.log *.out main.pdf
