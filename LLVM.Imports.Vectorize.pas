unit LLVM.Imports.Vectorize;

interface

uses
  LLVM.Imports,
  LLVM.Imports.Types;

{/** See llvm::createLoopVectorizePass function. */}
procedure LLVMAddLoopVectorizePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{/** See llvm::createSLPVectorizerPass function. */}
procedure LLVMAddSLPVectorizePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

implementation

end.
