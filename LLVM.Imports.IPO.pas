unit LLVM.Imports.IPO;

interface

//based on IPO.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

type
  TcallbackPass = function (par: TLLVMValueRef): TLLVMBool; cdecl;

{* See llvm::createArgumentPromotionPass function. }
procedure LLVMAddArgumentPromotionPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createConstantMergePass function. }
procedure LLVMAddConstantMergePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

//** See llvm::createMergeFunctionsPass function. */
procedure LLVMAddMergeFunctionsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{ See llvm::createCalledValuePropagationPass function. }
procedure LLVMAddCalledValuePropagationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

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

(**
 * Create and add the internalize pass to the given pass manager with the
 * provided preservation callback.
 *
 * The context parameter is forwarded to the callback on each invocation.
 * As such, it is the responsibility of the caller to extend its lifetime
 * until execution of this pass has finished.
 *
 * @see llvm::createInternalizePass function.
 *)
procedure LLVMAddInternalizePassWithMustPreservePredicate(PM          : TLLVMPassManagerRef;
                                                          Context     : TLLVMContextRef;
                                                          MustPreserve: TcallbackPass = nil); cdecl; external CLLVMLibrary;

{* See llvm::createStripDeadPrototypesPass function. }
procedure LLVMAddStripDeadPrototypesPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createStripSymbolsPass function. }
procedure LLVMAddStripSymbolsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

implementation

end.
