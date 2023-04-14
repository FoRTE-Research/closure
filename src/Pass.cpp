#include "RenameMain.h"
#include "HeapPass.h"
#include "ExitPass.h"
#include "GlobalPass.h"
#include "StubPass.h"

void addClosurePass(const PassManagerBuilder & /* unused */,
                    legacy::PassManagerBase &PM)
{
    PM.add(new RenameMainPass());
    PM.add(new HeapResetPass());
    PM.add(new ExitHookPass());
    PM.add(new CloneGlobalsPass());
    PM.add(new ModifyStubPass());
}

// Register the pass so `opt -mempass` runs it.
static RegisterPass<ModifyStubPass> A("closure", "Modify Stub to insert global clear calls");
// Tell frontends to run the pass automatically.
static RegisterStandardPasses B(PassManagerBuilder::EP_VectorizerStart,
                                addClosurePass);
static RegisterStandardPasses
    C(PassManagerBuilder::EP_EnabledOnOptLevel0, addClosurePass);
