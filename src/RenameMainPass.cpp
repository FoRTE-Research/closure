/**
 * This pass is for renaming the main function of the desired piece of code.
 */
#include "RenameMain.h"

/**
 * RUN FUNCTION TO PERFORM PASS ON THE INPUT FUNCTION
 */
bool RenameMainPass::runOnModule(Module &M)
{

  if (M.getName().contains("stubMain") == true)
  {
    errs() << "Found the stub, skipping it " << M.getName() << "\n";
    return false;
  }
  for (auto &F : M)
  {
    auto funcName = F.getName();
    if (funcName == ENTRYPOINT_NAME)
    {
      errs() << "Changing " << F.getName() << " to start_main"
             << "\n";
      F.setName("start_main");
    }
  }
  return true;
}

char RenameMainPass::ID = 2;
