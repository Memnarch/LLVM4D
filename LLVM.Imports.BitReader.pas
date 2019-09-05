unit LLVM.Imports.BitReader;

interface

//based on BitReader.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

//LLVMParseBitcode is deprecated, therefore we implement only LLVMParseBitcode2, but as LLVMParseBitcode
function LLVMParseBitcode(MemBuf: TLLVMMemoryBufferRef; out OutModule: TLLVMModuleRef; var OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary name 'LLVMParseBitcode2';
//* Builds a module from the bitcode in the specified memory buffer, returning a  reference to the module via the OutModule parameter. Returns 0 on success. */
function LLVMParseBitcode2(MemBuf: TLLVMMemoryBufferRef; out OutModule: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary name 'LLVMParseBitcode2';

//LLVMParseBitcodeInContext is deprecated, therefore we implement only LLVMParseBitcodeInContext2, but as LLVMParseBitcodeInContext
function LLVMParseBitcodeInContext(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; out OutModule: TLLVMModuleRef;OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary name 'LLVMParseBitcodeInContext2';
// but as LLVMParseBitcodeInContext
function LLVMParseBitcodeInContext2(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; out OutModule: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary name 'LLVMParseBitcodeInContext2';

//same as with the other functions above, deprecated stuff etc
function LLVMGetBitcodeModuleInContext(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; out OutM: TLLVMModuleRef;var OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary name 'LLVMGetBitcodeModuleInContext2';
//** Reads a module from the specified path, returning via the OutMP parameter a module provider which performs lazy deserialization. Returns 0 on success. */
function LLVMGetBitcodeModuleInContext2(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; out OutM: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary name 'LLVMGetBitcodeModuleInContext2';

//yada yada deprecated
function LLVMGetBitcodeModule(MemBuf: TLLVMMemoryBufferRef; out OutM: TLLVMModuleRef; var OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary name 'LLVMGetBitcodeModule2';

function LLVMGetBitcodeModule2(MemBuf: TLLVMMemoryBufferRef; out OutM: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary name 'LLVMGetBitcodeModule2';


implementation

end.
