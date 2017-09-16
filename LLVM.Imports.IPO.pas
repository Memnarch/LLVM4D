unit LLVM.Imports.IPO;

interface

//based on IPO.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

{* See llvm::createArgumentPromotionPass function. }
procedure LLVMAddArgumentPromotionPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createConstantMergePass function. }
procedure LLVMAddConstantMergePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createDeadArgEliminationPass function. }
procedure LLVMAddDeadArgEliminationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createFunctionAttrsPass function. }
procedure LLVMAddFunctionAttrsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createFunctionInliningPass function. }
procedure LLVMAddFunctionInliningPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createAlwaysInlinerPass function. }
procedure LLVMAddAlwaysInlinerPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createGlobalDCEPass function. }
procedure LLVMAddGlobalDCEPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createGlobalOptimizerPass function. }
procedure LLVMAddGlobalOptimizerPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createIPConstantPropagationPass function. }
procedure LLVMAddIPConstantPropagationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createPruneEHPass function. }
procedure LLVMAddPruneEHPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createIPSCCPPass function. }
procedure LLVMAddIPSCCPPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createInternalizePass function. }
procedure LLVMAddInternalizePass(PM: TLLVMPassManagerRef; AllButMain: Cardinal); cdecl; external CLLVMLibrary;

{* See llvm::createStripDeadPrototypesPass function. }
procedure LLVMAddStripDeadPrototypesPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createStripSymbolsPass function. }
procedure LLVMAddStripSymbolsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

implementation

end.
