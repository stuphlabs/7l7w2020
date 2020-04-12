DOCKER = docker
DOCKER_IMAGE_TAG = 7l7w2020
EXPECT = expect

cleanfiles :=
distcleanfiles :=
langs := ruby io prolog scala erlang clojure haskell
images := $(foreach lang,$(langs),$(lang):$(DOCKER_IMAGE_TAG))
image_targets := $(foreach lang,$(langs),docker_image/$(lang))

.PHONY: all
all: docker_images $(langs)

.PHONY: .FORCE
.FORCE:

.PHONY: clean
clean:
	-for lang in $(langs); do \
		$(MAKE) -C $${lang} clean ; \
	done
	-rm -rf $(cleanfiles)

.PHONY: distclean
distclean:
	-for image in $(images); do \
		$(DOCKER) rmi $${image} ; \
	done
	-rm -rf $(distcleanfiles)

.PHONY: $(image_targets)
$(image_targets): docker_image/%: docker/Dockerfile.%
	$(DOCKER) build -t $*:$(DOCKER_IMAGE_TAG) -f docker/Dockerfile.$* .

.PHONY: docker_images
docker_images: $(image_targets)

$(langs): %: .FORCE docker_image/%
	@echo 'No language specific target yet for $*'

ruby: docker_image/ruby ruby/ruby-peek.exp
	$(EXPECT) ruby/ruby-peek.exp
