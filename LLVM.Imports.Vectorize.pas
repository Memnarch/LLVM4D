unit LLVM.Imports.Vectorize;

interface

uses
  LLVM.Imports,
  LLVM.Imports.Types;

procedure LLVMAddLoopVectorizePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

procedure LLVMAddSLPVectorizePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

implementation

end.
