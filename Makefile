.PHONY: all view clean cleanall

all: resume.tex
	pdflatex $<
	mv resume.pdf "AlterioTyler_Resume_$(shell date +%b%Y).pdf"

view: all
	gnome-open "AlterioTyler_Resume_$(shell date +%b%Y).pdf"

clean:
	rm -rf *.aux *.log *.out

cleanall: clean
	rm -rf *.pdf
