unit LLVM.Imports.InstCombine;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF} 

interface
//based on InstCombine.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

(**
 * @defgroup LLVMCTransformsInstCombine Instruction Combining transformations
 * @ingroup LLVMCTransforms
 *
 * @{
 *)

(** See llvm::createInstructionCombiningPass function. *)
procedure LLVMAddInstructionCombiningPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

implementation

end.
