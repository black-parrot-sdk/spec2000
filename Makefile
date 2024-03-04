include Makefile.frag

RUNS = $(patsubst %,%.riscv,$(BENCHMARKS))
INPUTS = $(foreach BENCH,$(BENCHMARKS),inputs/$(BENCH))

all:
	$(MAKE) $(RUNS)

inputs:
	$(MAKE) $(INPUTS)

spec2000:
	-git clone git@github.com:black-parrot-sdk/spec2000-private spec2000
#	-git clone https://github.com/black-parrot-sdk/spec2000-private.git spec2000

%.riscv: spec2000
	$(MAKE) -f Makefile.$* $@
	$(MAKE) -f Makefile.$* clean

inputs/%: spec2000
	$(MAKE) -f Makefile.$* $@
	$(MAKE) -f Makefile.$* clean

clean:
	for benchmark in $(BENCHMARKS) ; do \
	rm -rf $$benchmark.riscv; \
	$(MAKE) -f Makefile.$$benchmark clean; \
	done;
