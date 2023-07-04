#include "ExitPass.h"
#include "FilePass.h"
#include "GlobalPass.h"
#include "HeapPass.h"
#include "RenameMain.h"
#include "StubPass.h"

using OptimizationLevel = llvm::PassBuilder::OptimizationLevel;

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "closure", "v1.0", [](PassBuilder& PB) {
                PB.registerOptimizerLastEPCallback([](ModulePassManager& MPM, OptimizationLevel OL) {
                    MPM.addPass(RenameMainPass());
                    MPM.addPass(HeapResetPass());
                    MPM.addPass(ExitHookPass());
                    MPM.addPass(CloneGlobalsPass());
                    MPM.addPass(FileHookPass());
                });
            }};
}