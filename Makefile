RESUME = "AlterioTyler_Resume_$(shell date +%b%Y).pdf"
IMAGE = resume-build

.PHONY: all docker-build docker-env clean cleanall

all: $(RESUME)

$(RESUME): resume.tex
	pdflatex $<
	mv resume.pdf $(RESUME)

$(IMAGE):
	docker build -t $(IMAGE) .

# Perform build inside of docker container
docker-build: $(IMAGE)
	-docker run -it --rm -v `pwd`:/code -w /code $(IMAGE) make

# Create dev enviroment inside docker container
docker-env: $(IMAGE)
	-docker run -it --rm -v `pwd`:/code -w /code $(IMAGE) bash

clean:
	rm -rf *.aux *.log *.out

cleanall: clean
	-docker rmi resume-build
