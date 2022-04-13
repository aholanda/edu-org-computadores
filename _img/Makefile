LATEX := pdflatex
pdfs = $(patsubst %.tex, %.pdf, $(wildcard *.tex))

pipeline%.pdf: pipeline%.svg
	inkscape -A $@ $< 

%.pdf: %.tex
	$(LATEX) $^

clean:
	-make -f ../latex.mk cleantex
	-$(RM) $(pdfs)

.PHONY: clean
