DOCKER = docker

cleanfiles :=
imagename := ruby:7l7w2020

.PHONY: all
all: image

.PHONY: clean
clean:
	-$(DOCKER) image rm $(imagename)
	-rm -rf $(cleanfiles)

.PHONY: image
image: Dockerfile
	$(DOCKER) build -t $(imagename) -f $< .
