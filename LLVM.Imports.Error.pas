unit LLVM.Imports.Error;

//based on Error.h

interface
    uses LLVM.Imports ,
         LLVM.Imports.Types;

type
 (**
 * Opaque reference to an error instance. Null serves as the 'success' value.
 *)
TLLVMErrorRef = type TLLVMRef;

(**
 * Error type identifier.
 *)
TLLVMErrorTypeId = Pointer;

(**
 * Returns the type id for the given error instance, which must be a failure
 * value (i.e. non-null).
 *)
function LLVMGetErrorTypeId(Err: TLLVMErrorRef): TLLVMErrorTypeId; cdecl; external CLLVMLibrary;

(*
 * Dispose of the given error without handling it. This operation consumes the
 * error, and the given LLVMErrorRef value is not usable once this call returns.
 * Note: This method *only* needs to be called if the error is not being passed
 * to some other consuming operation, e.g. LLVMGetErrorMessage.
 *)
procedure LLVMConsumeError(Err: TLLVMErrorRef); cdecl; external CLLVMLibrary;

(*
 * Returns the given string's error message. This operation consumes the error,
 * and the given LLVMErrorRef value is not usable once this call returns.
 * The caller is responsible for disposing of the string by calling
 * LLVMDisposeErrorMessage.
 *)
function LLVMGetErrorMessage( Err: TLLVMErrorRef):PLLVMChar;cdecl; external CLLVMLibrary;

(*
 * Dispose of the given error message.
 *)
procedure LLVMDisposeErrorMessage(ErrMsg: PLLVMChar); cdecl; external CLLVMLibrary;

(*
 * Returns the type id for llvm StringError.
 *)
function  LLVMGetStringErrorTypeId: TLLVMErrorTypeId;  cdecl; external CLLVMLibrary;

implementation

end.
