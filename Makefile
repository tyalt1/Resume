.PHONY: build view clean clean-all

build: resume.tex
	pdflatex $<
	mv resume.pdf "AlterioTyler_Resume_$(shell date +%b%Y).pdf"

view: build
	gnome-open "AlterioTyler_Resume_$(shell date +%b%Y).pdf"

clean:
	rm -rf *.aux *.log *.out

clean-all: clean
	rm -rf *.pdf
