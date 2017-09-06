unit LLVM4D.Imports.Analysis;

interface

//based on Analysis.h

uses
  LLVM4D.Imports,
  LLVM4D.Imports.Types;

{$MINENUMSIZE 4}

type
  TLLVMVerifierFailureAction = (LLVMAbortProcessAction, LLVMPrintMessageAction, LLVMReturnStatusAction);

function LLVMVerifyModule(M: TLLVMModuleRef; Action: TLLVMVerifierFailureAction; var OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMVerifyFunction(Fn: TLLVMValueRef; Action: TLLVMVerifierFailureAction): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMViewFunctionCFG(Fn: TLLVMValueRef); cdecl; external CLLVMLibrary;
procedure LLVMViewFunctionCFGOnly(Fn: TLLVMValueRef); cdecl; external CLLVMLibrary;

implementation

end.
