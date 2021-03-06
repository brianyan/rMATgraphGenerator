#include "IO.h"
#include "parseCommandLine.h"
#include "graph.h"
#include "graphIO.h"
#include "graphUtils.h"
#include "parallel.h"
using namespace benchIO;
using namespace std;

int parallel_main(int argc, char* argv[]) {
  commandLine P(argc,argv,"-o <outFile> inFile permutation");
  char* iFile = P.getArgument(0);
  char* oFile = P.getOptionValue("-o");

  graph<uintT> G = readGraphFromFile<uintT>(iFile);
  graph<uintT> GG = graphReorder(G,(uintT*)NULL);
  writeGraphToFile<uintT>(GG,oFile);
  GG.del();
}
