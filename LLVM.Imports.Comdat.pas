unit LLVM.Imports.Comdat;

//based on Comdat.h

{$MINENUMSIZE 4}

interface
    uses LLVM.Imports ,
         LLVM.Imports.Types;

type
 TLLVMComdatSelectionKind  = (
  LLVMAnyComdatSelectionKind,          ///< The linker may choose any COMDAT.
  LLVMExactMatchComdatSelectionKind,   ///< The data referenced by the COMDAT must  be the same.
  LLVMLargestComdatSelectionKind,      ///< The linker will choose the largest  COMDAT.
  LLVMNoDuplicatesComdatSelectionKind, ///< No other Module may specify this   COMDAT.
  LLVMSameSizeComdatSelectionKind      ///< The data referenced by the COMDAT must be  the same size.
);

(**
 * Return the Comdat in the module with the specified name. It is created
 * if it didn't already exist.
 *
 * @see llvm::Module::getOrInsertComdat()
 *)
function  LLVMGetOrInsertComdat(M: TLLVMModuleRef; const Name: PLLVMChar): TLLVMComdatRef;cdecl; external CLLVMLibrary;

(**
 * Get the Comdat assigned to the given global object.
 *
 * @see llvm::GlobalObject::getComdat()
 *)
function LLVMGetComdat(V: TLLVMValueRef): TLLVMComdatRef; cdecl; external CLLVMLibrary;

(*
 * Assign the Comdat to the given global object.
 *
 * @see llvm::GlobalObject::setComdat()
 *)
procedure LLVMSetComdat(V: TLLVMValueRef; C: TLLVMComdatRef);  cdecl; external CLLVMLibrary;

(*
 * Get the conflict resolution selection kind for the Comdat.
 *
 * @see llvm::Comdat::getSelectionKind()
 *)
function LLVMGetComdatSelectionKind(C: TLLVMComdatRef): TLLVMComdatSelectionKind;  cdecl; external CLLVMLibrary;

(*
 * Set the conflict resolution selection kind for the Comdat.
 *
 * @see llvm::Comdat::setSelectionKind()
 *)
procedure LLVMSetComdatSelectionKind(C: TLLVMComdatRef; Kind: TLLVMComdatSelectionKind);cdecl; external CLLVMLibrary;

implementation

end.
