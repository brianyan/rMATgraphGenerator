include parallelDefs

COMMON = dataGen.h utils.h IO.h parseCommandLine.h graph.h graphIO.h graphUtils.h parallel.h sequence.h blockRadixSort.h deterministicHash.h transpose.h quickSort.h
GENERATORS = rMatGraph

.PHONY: all clean
all: $(GENERATORS)

$(COMMON) :
	ln -s ../../common/$@ .

%.o : %.C $(COMMON)
	$(PCC) $(PCFLAGS) -c $< -o $@

rMatGraph : rMatGraph.o
	$(PCC) $(PLFLAGS) -o $@ rMatGraph.o

clean :
	rm -f *.o $(GENERATORS)
#causes error
#   	cd maxFlowGens; make clean
#	make clean -s -C data

cleansrc :
	make -s clean
	rm -f $(COMMON)
