unit LLVM.Imports.DisassemblerTypes;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF} 

interface

//based on DisassemblerTypes.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

type
  TLLVMDisasmContextRef = type TLLVMRef;
 (**
 * The type for the operand information call back function.  This is called to
 * get the symbolic information for an operand of an instruction.  Typically
 * this is from the relocation information, symbol table, etc.  That block of
 * information is saved when the disassembler context is created and passed to
 * the call back in the DisInfo parameter.  The instruction containing operand
 * is at the PC parameter.  For some instruction sets, there can be more than
 * one operand with symbolic information.  To determine the symbolic operand
 * information for each operand, the bytes for the specific operand in the
 * instruction are specified by the Offset parameter and its byte widith is the
 * size parameter.  For instructions sets with fixed widths and one symbolic
 * operand per instruction, the Offset parameter will be zero and Size parameter
 * will be the instruction width.  The information is returned in TagBuf and is
 * Triple specific with its specific information defined by the value of
 * TagType for that Triple.  If symbolic information is returned the function
 * returns 1, otherwise it returns 0.
 *)
  TLLVMOpInfoCallback = function(DisInfo: Pointer; PC: UInt64; Offset: UInt64; Size: UInt64; TagType: Integer; TagBuf: Pointer): LongBool; cdecl;

  (**
 * The initial support in LLVM MC for the most general form of a relocatable
 * expression is "AddSymbol - SubtractSymbol + Offset".  For some Darwin targets
 * this full form is encoded in the relocation information so that AddSymbol and
 * SubtractSymbol can be link edited independent of each other.  Many other
 * platforms only allow a relocatable expression of the form AddSymbol + Offset
 * to be encoded.
 *
 * The LLVMOpInfoCallback() for the TagType value of 1 uses the struct
 * LLVMOpInfo1.  The value of the relocatable expression for the operand,
 * including any PC adjustment, is passed in to the call back in the Value
 * field.  The symbolic information about the operand is returned using all
 * the fields of the structure with the Offset of the relocatable expression
 * returned in the Value field.  It is possible that some symbols in the
 * relocatable expression were assembly temporary symbols, for example
 * "Ldata - LpicBase + constant", and only the Values of the symbols without
 * symbol names are present in the relocation information.  The VariantKind
 * type is one of the Target specific #defines below and is used to print
 * operands like "_foo@GOT", ":lower16:_foo", etc.
 *)
  TLLVMOpInfoSymbol1 = packed record
    Present: UInt64;  // 1 if this symbol is present
    Name   : PLLVMChar;  // symbol name if not NULL
    Value  : UInt64;    // symbol value if name is NULL
  end;

  TLLVMOpInfo1 = packed record
    AddSymbol      : TLLVMOpInfoSymbol1;
    SubtractSymbol : TLLVMOpInfoSymbol1;
    Value          : UInt64;
    VariantKind    : UInt64;
  end;

const
  (**
  * The operand VariantKinds for symbolic disassembly.
  *)
  LLVMDisassembler_VariantKind_None = 0;     {/* all targets */}
  (**
  * The ARM target VariantKinds.
  *)
  LLVMDisassembler_VariantKind_ARM_HI16 = 1;  {/* :upper16: */}
  LLVMDisassembler_VariantKind_ARM_LO16 = 2;  {/* :lower16: */}

  LLVMDisassembler_VariantKind_ARM64_PAGE       = 1;   {/* @page */}
  LLVMDisassembler_VariantKind_ARM64_PAGEOFF    = 2;   {/* @pageoff */}
  LLVMDisassembler_VariantKind_ARM64_GOTPAGE    = 3;   {/* @gotpage */}
  LLVMDisassembler_VariantKind_ARM64_GOTPAGEOFF = 4;   {/* @gotpageoff */}
  LLVMDisassembler_VariantKind_ARM64_TLVP       = 5;   {/* @tvlppage */}
  LLVMDisassembler_VariantKind_ARM64_TLVOFF     = 6;   {/* @tvlppageoff */}

type
 (**
 * The type for the symbol lookup function.  This may be called by the
 * disassembler for things like adding a comment for a PC plus a constant
 * offset load instruction to use a symbol name instead of a load address value.
 * It is passed the block information is saved when the disassembler context is
 * created and the ReferenceValue to look up as a symbol.  If no symbol is found
 * for the ReferenceValue NULL is returned.  The ReferenceType of the
 * instruction is passed indirectly as is the PC of the instruction in
 * ReferencePC.  If the output reference can be determined its type is returned
 * indirectly in ReferenceType along with ReferenceName if any, or that is set
 * to NULL.
 *)
  TLLVMSymbolLookupCallback = function(DisInfo: Pointer; ReferenceValue: UInt64; ReferenceType: UInt64; ReferencePC: UInt64; var ReferenceName: PLLVMChar): PLLVMChar; cdecl;

const
  (**
  * The reference types on input and output.
  *)
  {No input reference type or no output reference type.}
  LLVMDisassembler_ReferenceType_InOut_None = 0;

  {The input reference is from a branch instruction.}
  LLVMDisassembler_ReferenceType_In_Branch     = 1;
  {The input reference is from a PC relative load instruction.}
  LLVMDisassembler_ReferenceType_In_PCrel_Load = 2;

  {The input reference is from an ARM64::ADRP instruction.}
  LLVMDisassembler_ReferenceType_In_ARM64_ADRP   = $100000001;
  {The input reference is from an ARM64::ADDXri instruction.}
  LLVMDisassembler_ReferenceType_In_ARM64_ADDXri = $100000002;
  {The input reference is from an ARM64::LDRXui instruction.}
  LLVMDisassembler_ReferenceType_In_ARM64_LDRXui = $100000003;
  {The input reference is from an ARM64::LDRXl instruction.}
  LLVMDisassembler_ReferenceType_In_ARM64_LDRXl  = $100000004;
  {The input reference is from an ARM64::ADR instruction.}
  LLVMDisassembler_ReferenceType_In_ARM64_ADR    = $100000005;

  {The output reference is to as symbol stub.}
  LLVMDisassembler_ReferenceType_Out_SymbolStub       = 1;
  {The output reference is to a symbol address in a literal pool.}
  LLVMDisassembler_ReferenceType_Out_LitPool_SymAddr  = 2;
  {The output reference is to a cstring address in a literal pool.}
  LLVMDisassembler_ReferenceType_Out_LitPool_CstrAddr = 3;

  {The output reference is to a Objective-C CoreFoundation string.}
  LLVMDisassembler_ReferenceType_Out_Objc_CFString_Ref = 4;
  {The output reference is to a Objective-C message.}
  LLVMDisassembler_ReferenceType_Out_Objc_Message      = 5;
  {The output reference is to a Objective-C message ref.}
  LLVMDisassembler_ReferenceType_Out_Objc_Message_Ref  = 6;
  {The output reference is to a Objective-C selector ref.}
  LLVMDisassembler_ReferenceType_Out_Objc_Selector_Ref = 7;
  {The output reference is to a Objective-C class ref.}
  LLVMDisassembler_ReferenceType_Out_Objc_Class_Ref    = 8;

  {The output reference is to a C++ symbol name.}
  LLVMDisassembler_ReferenceType_DeMangled_Name        = 9;

implementation

end.
