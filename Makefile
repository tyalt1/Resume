RESUME = "AlterioTyler_Resume_$(shell date +%b%Y).pdf"

.PHONY: all docker clean cleanall

#install pdflatex: apt-get install texlive-latex-base

all: $(RESUME)

$(RESUME): resume.tex
	pdflatex $<
	mv resume.pdf $(RESUME)

docker:
	-docker run -it --rm -v `pwd`:/code -w /code debian /bin/bash

clean:
	rm -rf *.aux *.log *.out

cleanall: clean
	rm -rf *.pdf
