#include "ExitPass.h"
#include "GlobalPass.h"
#include "HeapPass.h"
#include "RenameMain.h"
#include "StubPass.h"

void addClosurePass(const PassManagerBuilder & /* unused */,
                    legacy::PassManagerBase &PM) {
  PM.add(new RenameMainPass());
  PM.add(new HeapResetPass());
  PM.add(new ExitHookPass());
  PM.add(new CloneGlobalsPass());
}

// Register the pass so `opt -mempass` runs it.
static RegisterPass<CloneGlobalsPass>
    A("closure", "Modify Stub to insert global clear calls");
// Tell frontends to run the pass automatically.
static RegisterStandardPasses B(PassManagerBuilder::EP_VectorizerStart,
                                addClosurePass);
static RegisterStandardPasses C(PassManagerBuilder::EP_EnabledOnOptLevel0,
                                addClosurePass);
