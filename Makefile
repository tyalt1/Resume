RESUME = "AlterioTyler_Resume_$(shell date +%b%Y).pdf"
IMAGE = resume-build

.PHONY: all docker dev clean cleanall

all: $(RESUME)

$(RESUME): resume.tex
	pdflatex $<
	mv resume.pdf $(RESUME)

$(IMAGE):
	docker build -t $(IMAGE) .

docker: $(IMAGE)
	-docker run -it --rm -v `pwd`:/code -w /code $(IMAGE) make

dev: $(IMAGE)
	-docker run -it --rm -v `pwd`:/code -w /code $(IMAGE) bash

clean:
	rm -rf *.aux *.log *.out

cleanall: clean
	-docker rmi resume-build
