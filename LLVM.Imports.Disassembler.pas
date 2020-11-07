unit LLVM.Imports.Disassembler;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF} 

interface

//based on Disassembler.h

uses
  LLVM.Imports,
  LLVM.Imports.Types,
  LLVM.Imports.DisassemblerTypes;


(*
 * Create a disassembler for the TripleName.  Symbolic disassembly is supported
 * by passing a block of information in the DisInfo parameter and specifying the
 * TagType and callback functions as described above.  These can all be passed
 * as NULL.  If successful, this returns a disassembler context.  If not, it
 * returns NULL. This function is equivalent to calling
 * LLVMCreateDisasmCPUFeatures() with an empty CPU name and feature set.
 *)
function LLVMCreateDisasm(TripleName: PLLVMChar; DisInfo: Pointer; TagType: Integer; GetOpInfo: TLLVMOpInfoCallback; SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external CLLVMLibrary;

(*
 * Create a disassembler for the TripleName and a specific CPU.  Symbolic
 * disassembly is supported by passing a block of information in the DisInfo
 * parameter and specifying the TagType and callback functions as described
 * above.  These can all be passed * as NULL.  If successful, this returns a
 * disassembler context.  If not, it returns NULL. This function is equivalent
 * to calling LLVMCreateDisasmCPUFeatures() with an empty feature set.
 *)
function LLVMCreateDisasmCPU(Triple: PLLVMChar; CPU: PLLVMChar; DisInfo: Pointer; TagType: Integer; GetOpInfo: TLLVMOpInfoCallback; SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external CLLVMLibrary;

(*
 * Create a disassembler for the TripleName, a specific CPU and specific feature
 * string.  Symbolic disassembly is supported by passing a block of information
 * in the DisInfo parameter and specifying the TagType and callback functions as
 * described above.  These can all be passed * as NULL.  If successful, this
 * returns a disassembler context.  If not, it returns NULL.
 *)
function LLVMCreateDisasmCPUFeatures(Triple: PLLVMChar; CPU: PLLVMChar; Features: PLLVMChar; DisInfo: Pointer; TagType: Integer; GetOpInfo: TLLVMOpInfoCallback; SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external CLLVMLibrary;

(*
 * Set the disassembler's options.  Returns 1 if it can set the Options and 0
 * otherwise.
 *)
function LLVMSetDisasmOptions(DC: TLLVMDisasmContextRef; Options: UInt64): LongBool; cdecl; external CLLVMLibrary;

const
  {The option to produce marked up assembly.}
  LLVMDisassembler_Option_UseMarkup         = 1;
  {The option to print immediates as hex.}
  LLVMDisassembler_Option_PrintImmHex       = 2;
  {The option use the other assembler printer variant}
  LLVMDisassembler_Option_AsmPrinterVariant = 4;
  {The option to set comment on instructions}
  LLVMDisassembler_Option_SetInstrComments  = 8;
  {The option to print latency information alongside instructions}
  LLVMDisassembler_Option_PrintLatency      = 16;

procedure LLVMDisasmDispose(DC: TLLVMDisasmContextRef); cdecl; external CLLVMLibrary;

(*
 * Disassemble a single instruction using the disassembler context specified in
 * the parameter DC.  The bytes of the instruction are specified in the
 * parameter Bytes, and contains at least BytesSize number of bytes.  The
 * instruction is at the address specified by the PC parameter.  If a valid
 * instruction can be disassembled, its string is returned indirectly in
 * OutString whose size is specified in the parameter OutStringSize.  This
 * function returns the number of bytes in the instruction or zero if there was
 * no valid instruction.
 *)
function LLVMDisasmInstruction(DC: TLLVMDisasmContextRef; Bytes: PByte; BytesSize: UInt64; PC: UInt64; OutString: PLLVMChar; OutStringSize: TLLVMSizeT): TLLVMSizeT; cdecl; external CLLVMLibrary;

implementation

end.
