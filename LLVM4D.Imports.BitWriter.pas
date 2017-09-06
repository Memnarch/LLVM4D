unit LLVM4D.Imports.BitWriter;

interface

//based on BitWriter.h

uses
  Types,
  LLVM4D.Imports,
  LLVM4D.Imports.Types;

function LLVMWriteBitcodeToFile(M: TLLVMModuleRef; const Path: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMWriteBitcodeToFD(M: TLLVMModuleRef; FD: THandle; ShouldClose: LongBool; Unbuffered: LongBool): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMWriteBitcodeToMemoryBuffer(M: TLLVMModuleRef): TLLVMMemoryBufferRef; cdecl; external CLLVMLibrary;


implementation

end.
