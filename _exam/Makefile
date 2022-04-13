LATEX := xelatex
trash := `ls main.* |grep -v tex`
trash += `ls prova.* |grep -v tex`

main.pdf: main.tex bool.tex gates.tex combinational-circuit.tex \
		flip-flop.tex counter.tex\
		arith.tex radix.tex \
		pipeline.tex \
		cache.tex
	$(LATEX) $<


clean:
	$(RM) *~ $(trash)
