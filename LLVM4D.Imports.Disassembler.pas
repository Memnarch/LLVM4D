unit LLVM4D.Imports.Disassembler;

interface

//based on Disassembler.h

uses
  LLVM4D.Imports,
  LLVM4D.Imports.Types;

{$Hints off}
type
  TLLVMDisasmContextRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMOpInfoCallback = function(DisInfo: Pointer; PC: UInt64; Offset: UInt64; Size: UInt64; TagType: Integer; TagBuf: Pointer): LongBool; cdecl;

  TLLVMOpInfoSymbol1 = packed record
    Present: UInt64;  // 1 if this symbol is present
    Name: PLLVMChar;  // symbol name if not NULL
    Value: UInt64;    // symbol value if name is NULL
  end;

  TLLVMOpInfo1 = packed record
    AddSymbol: TLLVMOpInfoSymbol1;
    SubtractSymbol: TLLVMOpInfoSymbol1;
    Value: UInt64;
    VariantKind: UInt64;
  end;

const
  LLVMDisassembler_VariantKind_None = 0;

  LLVMDisassembler_VariantKind_ARM_HI16 = 1;
  LLVMDisassembler_VariantKind_ARM_LO16 = 2;

  LLVMDisassembler_VariantKind_ARM64_PAGE = 1;
  LLVMDisassembler_VariantKind_ARM64_PAGEOFF = 2;
  LLVMDisassembler_VariantKind_ARM64_GOTPAGE = 3;
  LLVMDisassembler_VariantKind_ARM64_GOTPAGEOFF = 4;
  LLVMDisassembler_VariantKind_ARM64_TLVP = 5;
  LLVMDisassembler_VariantKind_ARM64_TLVOFF = 6;

type
  TLLVMSymbolLookupCallback = function(DisInfo: Pointer; ReferenceValue: UInt64; ReferenceType: UInt64; ReferencePC: UInt64; var ReferenceName: PLLVMChar): PLLVMChar; cdecl;

const
  LLVMDisassembler_ReferenceType_InOut_None = 0;

  LLVMDisassembler_ReferenceType_In_Branch = 1;
  LLVMDisassembler_ReferenceType_In_PCrel_Load = 2;

  LLVMDisassembler_ReferenceType_In_ARM64_ADRP = $100000001;
  LLVMDisassembler_ReferenceType_In_ARM64_ADDXri = $100000002;
  LLVMDisassembler_ReferenceType_In_ARM64_LDRXui = $100000003;
  LLVMDisassembler_ReferenceType_In_ARM64_LDRXl = $100000004;
  LLVMDisassembler_ReferenceType_In_ARM64_ADR = $100000005;

  LLVMDisassembler_ReferenceType_Out_SymbolStub = 1;
  LLVMDisassembler_ReferenceType_Out_LitPool_SymAddr = 2;
  LLVMDisassembler_ReferenceType_Out_LitPool_CstrAddr = 3;

  LLVMDisassembler_ReferenceType_Out_Objc_CFString_Ref = 4;
  LLVMDisassembler_ReferenceType_Out_Objc_Message = 5;
  LLVMDisassembler_ReferenceType_Out_Objc_Message_Ref = 6;
  LLVMDisassembler_ReferenceType_Out_Objc_Selector_Ref = 7;
  LLVMDisassembler_ReferenceType_Out_Objc_Class_Ref = 8;

  LLVMDisassembler_ReferenceType_DeMangled_Name = 9;

function LLVMCreateDisasm(TripleName: PLLVMChar; DisInfo: Pointer; TagType: Integer; GetOpInfo: TLLVMOpInfoCallback; SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external CLLVMLibrary;

function LLVMCreateDisasmCPU(Triple: PLLVMChar; CPU: PLLVMChar; DisInfo: Pointer; TagType: Integer; GetOpInfo: TLLVMOpInfoCallback; SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external CLLVMLibrary;

function LLVMCreateDisasmCPUFeatures(Triple: PLLVMChar; CPU: PLLVMChar; Features: PLLVMChar; DisInfo: Pointer; TagType: Integer; GetOpInfo: TLLVMOpInfoCallback; SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external CLLVMLibrary;

function LLVMSetDisasmOptions(DC: TLLVMDisasmContextRef; Options: UInt64): LongBool; cdecl; external CLLVMLibrary;

const
  LLVMDisassembler_Option_UseMarkup = 1;
  LLVMDisassembler_Option_PrintImmHex = 2;
  LLVMDisassembler_Option_AsmPrinterVariant = 4;
  LLVMDisassembler_Option_SetInstrComments = 8;
  LLVMDisassembler_Option_PrintLatency = 16;

procedure LLVMDisasmDispose(DC: TLLVMDisasmContextRef); cdecl; external CLLVMLibrary;

function LLVMDisasmInstruction(DC: TLLVMDisasmContextRef; Bytes: PByte; BytesSize: UInt64; PC: UInt64; OutString: PLLVMChar; OutStringSize: TLLVMSizeT): TLLVMSizeT; cdecl; external CLLVMLibrary;

implementation

end.
