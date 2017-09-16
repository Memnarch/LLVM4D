unit LLVM.Imports.IRReader;

interface

//based on IRReader.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

function LLVMParseIRInContext(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; out OutM: TLLVMModuleRef; out OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

implementation

end.
