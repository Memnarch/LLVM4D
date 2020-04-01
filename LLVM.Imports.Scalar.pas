unit LLVM.Imports.Scalar;

interface

//based on Scalar.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

{* See llvm::createAggressiveDCEPass function. }
procedure LLVMAddAggressiveDCEPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

//** See llvm::createDeadCodeEliminationPass function. */
procedure LLVMAddDCEPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createBitTrackingDCEPass function. }
procedure LLVMAddBitTrackingDCEPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createAlignmentFromAssumptionsPass function. }
procedure LLVMAddAlignmentFromAssumptionsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createCFGSimplificationPass function. }
procedure LLVMAddCFGSimplificationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLateCFGSimplificationPass function. }
procedure LLVMAddLateCFGSimplificationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createDeadStoreEliminationPass function. }
procedure LLVMAddDeadStoreEliminationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createScalarizerPass function. }
procedure LLVMAddScalarizerPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createMergedLoadStoreMotionPass function. }
procedure LLVMAddMergedLoadStoreMotionPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createGVNPass function. }
procedure LLVMAddGVNPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createGVNPass function. }
procedure LLVMAddNewGVNPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createIndVarSimplifyPass function. }
procedure LLVMAddIndVarSimplifyPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createInstructionCombiningPass function. }
procedure LLVMAddInstructionCombiningPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createJumpThreadingPass function. }
procedure LLVMAddJumpThreadingPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLICMPass function. }
procedure LLVMAddLICMPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLoopDeletionPass function. }
procedure LLVMAddLoopDeletionPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLoopIdiomPass function }
procedure LLVMAddLoopIdiomPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLoopRotatePass function. }
procedure LLVMAddLoopRotatePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLoopRerollPass function. }
procedure LLVMAddLoopRerollPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

(** See llvm::createLoopInstSimplifyPass function - Modified by Pigreco *)
procedure LLVMAddLoopInstSimplifyPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLoopUnrollPass function. }
procedure LLVMAddLoopUnrollPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{ See llvm::createLoopUnrollAndJamPass function. }
procedure LLVMAddLoopUnrollAndJamPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLoopUnswitchPass function. }
procedure LLVMAddLoopUnswitchPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{ See llvm::createLowerAtomicPass function. }
procedure LLVMAddLowerAtomicPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createMemCpyOptPass function. }
procedure LLVMAddMemCpyOptPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createPartiallyInlineLibCallsPass function. }
procedure LLVMAddPartiallyInlineLibCallsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createReassociatePass function. }
procedure LLVMAddReassociatePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createSCCPPass function. }
procedure LLVMAddSCCPPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createSROAPass function. }
procedure LLVMAddScalarReplAggregatesPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createSROAPass function. }
procedure LLVMAddScalarReplAggregatesPassSSA(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createSROAPass function. }
procedure LLVMAddScalarReplAggregatesPassWithThreshold(PM: TLLVMPassManagerRef; Threshold: Integer); cdecl; external CLLVMLibrary;

{* See llvm::createSimplifyLibCallsPass function. }
procedure LLVMAddSimplifyLibCallsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createTailCallEliminationPass function. }
procedure LLVMAddTailCallEliminationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createConstantPropagationPass function. }
procedure LLVMAddConstantPropagationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::demotePromoteMemoryToRegisterPass function. }
procedure LLVMAddDemoteMemoryToRegisterPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createVerifierPass function. }
procedure LLVMAddVerifierPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createCorrelatedValuePropagationPass function }
procedure LLVMAddCorrelatedValuePropagationPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createEarlyCSEPass function }
procedure LLVMAddEarlyCSEPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createEarlyCSEPass function }
procedure LLVMAddEarlyCSEMemSSAPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createLowerExpectIntrinsicPass function }
procedure LLVMAddLowerExpectIntrinsicPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

//** See llvm::createLowerConstantIntrinsicsPass function */
procedure LLVMAddLowerConstantIntrinsicsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createTypeBasedAliasAnalysisPass function }
procedure LLVMAddTypeBasedAliasAnalysisPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createScopedNoAliasAAPass function }
procedure LLVMAddScopedNoAliasAAPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createBasicAliasAnalysisPass function }
procedure LLVMAddBasicAliasAnalysisPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{ See llvm::createUnifyFunctionExitNodesPass function }
procedure LLVMAddUnifyFunctionExitNodesPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

implementation

end.
