#pragma once

#include <llvm/Pass.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/DebugLoc.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>

#define STUB_FILE_NAME_PREFIX "stubMain"
#define TARGET_MAIN_FUNC "start_main"
#define ENTRYPOINT_NAME "main"
#define CLOSURE_GLOBAL_RESTORE_FILE "/tmp/CLOSURE_GLOBAL_RESTORE_FILE"

using namespace llvm;

/**
 * @brief Checks if the module being compiled is the closure stub
 *
 * @param moduleName
 * @return true
 * @return false
 */
bool isClosureStubModule(StringRef);

std::string generateRandomString(int len);
