unit LLVM.Imports.Linker;

interface

//based on Linker.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

function LLVMLinkModules2(Dest: TLLVMModuleRef; Src: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary;

implementation

end.
