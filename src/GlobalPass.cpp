/**
 * This pass is for renaming the main function of the desired piece of code.
 */
#include "GlobalPass.h"
using namespace llvm;

/**
 * @brief  * This method inserts instructions to restore the global variable after every execution (using Load and Store)
 * It uses the copy of every global variable made in the cloneGlobals method.
 * Since globals can be present and used in any compilation unit, we insert a new function in each module
 * to restore globals
 *
 * @param M
 * @param original
 * @param clone
 */
void CloneGlobalsPass::restoreGlobalVariables(Module &M, GlobalVariable &original, GlobalVariable &clone)
{
  auto funcType = FunctionType::get(Type::getVoidTy(M.getContext()), false);
  auto funcName = "restore_globals_test_global"; // M.getName().slice(2, M.getName().size() - 3);
  auto restoreGlobal = dyn_cast<Function>(M.getOrInsertFunction(funcName, funcType).getCallee());
  BasicBlock *entryBlock = nullptr;

  if (restoreGlobal->getInstructionCount() == 0)
  {
    // Function has just been created, insert a basic block into it
    entryBlock = BasicBlock::Create(M.getContext(), "entry", restoreGlobal);
    ReturnInst::Create(M.getContext(), entryBlock);
  }
  else
  {
    entryBlock = &(restoreGlobal->getEntryBlock());
  }

  IRBuilder<> builder(M.getContext());
  builder.SetInsertPoint(entryBlock->getTerminator());

  // Let's create terminator for the function before inserting anything else

  Value *v = dyn_cast<Value>(&clone);
  Value *v2 = dyn_cast<Value>(&original);
  LoadInst *Load = builder.CreateLoad(v);
  StoreInst *Store = builder.CreateStore(Load, v2);
}

/**
 * @brief Method for adding a copy of each global variable, and calls
 * restoreGlobalVariables which adds a load and store inst to initialize the
 * variables from their shadow backups
 *
 * @param M
 */
void CloneGlobalsPass::cloneGlobals(Module &M)
{

  auto &list = M.getGlobalList();

  for (auto &Global : list)
  {
    if (Global.getName().contains("_copy") == false)
    {
      if (Global.getName().contains('.') == false)
      {
        GlobalVariable *new_var = new GlobalVariable(
            M,
            (Global.getType()->isPointerTy() ? Global.getType()->getPointerElementType() : Global.getType()),
            Global.isConstant(),
            Global.getLinkage(),
            Global.getInitializer(),
            Global.getName() + "_copy");
        new_var->setAlignment(MaybeAlign(Global.getAlignment()));

        restoreGlobalVariables(M, Global, *new_var);
      }
    }
  }
}

/**
 * @brief runOnModule method for Module Pass
 *
 * @param M
 * @return true
 * @return false
 */
bool CloneGlobalsPass::runOnModule(Module &M)
{
  errs() << "Running global variable clone pass\n";
  errs() << M.getName() << "\n\n";
  if (isClosureStubModule(M.getName()))
  {
    return false;
  }

  cloneGlobals(M);
  return true;
}

char CloneGlobalsPass::ID = 0;
