unit LLVM.Imports.ErrorHandling;

interface

//based on ErrorHandling.h

uses
  LLVM.Imports;

type
  TLLVMFatalErrorHandler = procedure(const Reason: PLLVMChar); cdecl;

procedure LLVMInstallFatalErrorHandler(Handler: TLLVMFatalErrorHandler) cdecl; external CLLVMLibrary;
procedure LLVMResetFatalErrorHandler; cdecl; external CLLVMLibrary;
procedure LLVMEnablePrettyStackTrace; cdecl; external CLLVMLibrary;

implementation

end.
