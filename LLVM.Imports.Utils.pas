unit LLVM.Imports.Utils;

Interface
 //based on Utils.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;


{* See llvm::createLowerSwitchPass function. }
procedure LLVMAddLowerSwitchPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{* See llvm::createPromoteMemoryToRegisterPass function. }
procedure LLVMAddPromoteMemoryToRegisterPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{ See llvm::createAddDiscriminatorsPass function. }
procedure LLVMAddAddDiscriminatorsPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;


implementation

end.
