cleanfiles :=
langs := ruby io prolog scala erlang clojure haskell

.PHONY: all
all: $(langs)

.PHONY: .FORCE
.FORCE:

.PHONY: clean
clean:
	-for lang in $(langs); do \
		$(MAKE) -C $$lang clean ; \
	done
	-rm -rf $(cleanfiles)

$(langs): .FORCE
	$(MAKE) -C $@
