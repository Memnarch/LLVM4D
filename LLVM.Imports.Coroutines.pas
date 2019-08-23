unit LLVM.Imports.Coroutines;

//based on Coroutines.h

interface
    uses LLVM.Imports ,
         LLVM.Imports.Types;

{/** See llvm::createCoroEarlyPass function. */}
procedure LLVMAddCoroEarlyPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{/** See llvm::createCoroSplitPass function. */}
procedure LLVMAddCoroSplitPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{/** See llvm::createCoroElidePass function. */}
procedure LLVMAddCoroElidePass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

{/** See llvm::createCoroCleanupPass function. */}
procedure LLVMAddCoroCleanupPass(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;


implementation

end.
