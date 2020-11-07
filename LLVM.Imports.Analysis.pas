unit LLVM.Imports.Analysis;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF} 

interface

//based on Analysis.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

{$MINENUMSIZE 4}

type
  TLLVMVerifierFailureAction = (LLVMAbortProcessAction, LLVMPrintMessageAction, LLVMReturnStatusAction);

function LLVMVerifyModule(M: TLLVMModuleRef; Action: TLLVMVerifierFailureAction; out OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMVerifyFunction(Fn: TLLVMValueRef; Action: TLLVMVerifierFailureAction): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMViewFunctionCFG(Fn: TLLVMValueRef); cdecl; external CLLVMLibrary;
procedure LLVMViewFunctionCFGOnly(Fn: TLLVMValueRef); cdecl; external CLLVMLibrary;

implementation

end.
