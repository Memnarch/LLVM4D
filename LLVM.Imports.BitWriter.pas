unit LLVM.Imports.BitWriter;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF} 

interface

//based on BitWriter.h

uses
  Types,
  LLVM.Imports,
  LLVM.Imports.Types;

function LLVMWriteBitcodeToFile(M: TLLVMModuleRef; const Path: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMWriteBitcodeToFD(M: TLLVMModuleRef; FD: THandle; ShouldClose: LongBool; Unbuffered: LongBool): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMWriteBitcodeToMemoryBuffer(M: TLLVMModuleRef): TLLVMMemoryBufferRef; cdecl; external CLLVMLibrary;


implementation

end.
