unit LLVM.Imports.Support;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF} 

interface

//based on Support.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;


{**
 * This function permanently loads the dynamic library at the given path.
 * It is safe to call this function multiple times for the same library.
 *
 * @see sys::DynamicLibrary::LoadLibraryPermanently()
  *}
function LLVMLoadLibraryPermanently(const Filename: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

{**
 * This function parses the given arguments using the LLVM command line parser.
 * Note that the only stable thing about this function is its signature; you
 * cannot rely on any particular set of command line arguments being interpreted
 * the same way across LLVM versions.
 *
 * @see llvm::cl::ParseCommandLineOptions()
 *}
procedure LLVMParseCommandLineOptions(argc: Integer; const argv: PLLVMChar; const Overview: PLLVMChar); cdecl; external CLLVMLibrary;

{**
 * This function will search through all previously loaded dynamic
 * libraries for the symbol \p symbolName. If it is found, the address of
 * that symbol is returned. If not, null is returned.
 *
 * @see sys::DynamicLibrary::SearchForAddressOfSymbol()
 *}
function LLVMSearchForAddressOfSymbol(const symbolName: PLLVMChar): Pointer; cdecl; external CLLVMLibrary;

{**
 * This functions permanently adds the symbol \p symbolName with the
 * value \p symbolValue.  These symbols are searched before any
 * libraries.
 *
 * @see sys::DynamicLibrary::AddSymbol()
 *}
procedure LLVMAddSymbol(const symbolName: PLLVMChar; symbolValue: Pointer); cdecl; external CLLVMLibrary;


implementation

end.
