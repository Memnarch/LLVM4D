unit LLVM.Imports.Target;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF} 

interface

//based on Target.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

{$MINENUMSIZE 4}

type
  TLLVMByteOrdering = (LLVMBigEndian, LLVMLittleEndian);

  TLLVMTargetDataRef = type TLLVMRef;

  TLLVMTargetLibraryInfoRef = type TLLVMRef;


//LLVM supports macros to generate the functions to import
//we'll simply do it at runtime by providing parameterized functions
//which allows to initialize other new targets in the future even if they're not listed here

const
  //Targets
  CLLVMTARGET_AArch64 = 'AArch64';
  CLLVMTARGET_AMDGPU = 'AMDGPU';
  CLLVMTARGET_ARM = 'ARM';
  CLLVMTARGET_BPF = 'BPF';
  CLLVMTARGET_Hexagon = 'Hexagon';
  CLLVMTARGET_Lanai = 'Lanai';
  CLLVMTARGET_Mips = 'Mips';
  CLLVMTARGET_MSP430 = 'MSP430';
  CLLVMTARGET_NVPTX = 'NVPTX';
  CLLVMTARGET_PowerPC = 'PowerPC';
  CLLVMTARGET_Sparc = 'Sparc';
  CLLVMTARGET_SystemZ = 'SystemZ';
  CLLVMTARGET_X86 = 'X86';
  CLLVMTARGET_XCore = 'XCore';

  //AsmPrinters
  CLLVMASMPRINTER_AArch64 = 'AArch64';
  CLLVMASMPRINTER_AMDGPU = 'AMDGPU';
  CLLVMASMPRINTER_ARM = 'ARM';
  CLLVMASMPRINTER_BPF = 'BPF';
  CLLVMASMPRINTER_Hexagon = 'Hexagon';
  CLLVMASMPRINTER_Lanai = 'Lanai';
  CLLVMASMPRINTER_Mips = 'Mips';
  CLLVMASMPRINTER_MSP430 = 'MSP430';
  CLLVMASMPRINTER_NVPTX = 'NVPTX';
  CLLVMASMPRINTER_PowerPC = 'PowerPC';
  CLLVMASMPRINTER_Sparc = 'Sparc';
  CLLVMASMPRINTER_SystemZ = 'SystemZ';
  CLLVMASMPRINTER_X86 = 'X86';
  CLLVMASMPRINTER_XCore = 'XCore';

  //AsmParser
  CLLVMASMPARSER_AArch64 = 'AArch64';
  CLLVMASMPARSER_AMDGPU = 'AMDGPU';
  CLLVMASMPARSER_ARM = 'ARM';
  CLLVMASMPARSER_Hexagon = 'Hexagon';
  CLLVMASMPARSER_Lanai = 'Lanai';
  CLLVMASMPARSER_Mips = 'Mips';
  CLLVMASMPARSER_PowerPC = 'PowerPC';
  CLLVMASMPARSER_Sparc = 'Sparc';
  CLLVMASMPARSER_SystemZ = 'SystemZ';
  CLLVMASMPARSER_X86 = 'X86';

  //Disassembler
  CLLVMDISASSEMBLER_AArch64 = 'AArch64';
  CLLVMDISASSEMBLER_AMDGPU = 'AMDGPU';
  CLLVMDISASSEMBLER_ARM = 'ARM';
  CLLVMDISASSEMBLER_BPF = 'BPF';
  CLLVMDISASSEMBLER_Hexagon = 'Hexagon';
  CLLVMDISASSEMBLER_Lanai = 'Lanai';
  CLLVMDISASSEMBLER_Mips = 'Mips';
  CLLVMDISASSEMBLER_PowerPC = 'PowerPC';
  CLLVMDISASSEMBLER_Sparc = 'Sparc';
  CLLVMDISASSEMBLER_SystemZ = 'SystemZ';
  CLLVMDISASSEMBLER_X86 = 'x86';
  CLLVMDISASSEMBLER_XCore = 'XCore';


//routines to dynamic call a specific function by name
function LLVMInitializeTargetInfo(const TargetName: string): Boolean;
function LLVMInitializeTarget(const TargetName: string): Boolean;
function LLVMInitializeTargetMC(const TargetName: string): Boolean;
function LLVMInitializeAsmPrinter(const AsmPrinterName: string): Boolean;
function LLVMInitializeAsmParser(const AsmParserName: string): Boolean;
function LLVMInitializeDisassembler(const DisassemblerName: string): Boolean;


function LLVMGetModuleDataLayout(M: TLLVMModuleRef): TLLVMTargetDataRef; cdecl; external CLLVMLibrary;

procedure LLVMSetModuleDataLayout(M: TLLVMModuleRef; DL: TLLVMTargetDataRef); cdecl; external CLLVMLibrary;

function LLVMCreateTargetData(const StringRep: PLLVMChar): TLLVMTargetDataRef; cdecl; external CLLVMLibrary;

procedure LLVMDisposeTargetData(TD: TLLVMTargetDataRef); cdecl; external CLLVMLibrary;

procedure LLVMAddTargetLibraryInfo(TLI: TLLVMTargetLibraryInfoRef; PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

function LLVMCopyStringRepOfTargetData(TD: TLLVMTargetDataRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMByteOrder(TD: TLLVMTargetDataRef): TLLVMByteOrdering; cdecl; external CLLVMLibrary;

function LLVMPointerSize(TD: TLLVMTargetDataRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMPointerSizeForAS(TD: TLLVMTargetDataRef; AdressSpace: Cardinal): Cardinal; cdecl; external CLLVMLibrary;

function LLVMIntPtrType(TD: TLLVMTargetDataRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIntPtrTypeForAS(TD: TLLVMTargetDataRef; AddressSpace: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIntPtrTypeInContext(C: TLLVMContextRef; TD: TLLVMTargetDataRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIntPtrTypeForASInContext(C: TLLVMContextRef; TD: TLLVMTargetDataRef; AddressSpace: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMSizeOfTypeInBits(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMStoreSizeOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMABISizeOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMABIAlignmentOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMCallFrameAlignmentOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMPreferredAlignmentOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMPreferredAlignmentOfGlobal(TD: TLLVMTargetDataRef; GlobalVar: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMElementAtOffset(TD: TLLVMTargetDataRef; StructTy: TLLVMTypeRef; Offset: UInt64): Cardinal; cdecl; external CLLVMLibrary;

function LLVMOffsetOfElement(TD: TLLVMTargetDataRef; StructTy: TLLVMTypeRef; Element: Cardinal): UInt64; cdecl; external CLLVMLibrary;

implementation

uses
{$IFDEF FPC}
  Interfaces, LCLIntf, LCLType, LCLProc,
  DynLibs, SysUtils;
{$ELSE}
  Windows,
  SysUtils;
{$ENDIF}

const
  CTargetInfoProc = 'LLVMInitialize%sTargetInfo';
  CTargetProc = 'LLVMInitialize%sTarget';
  CTargetMCProc = 'LLVMInitialize%sTargetMC';
  CAsmPrinterProc = 'LLVMInitialize%sAsmPrinter';
  CAsmParserProc = 'LLVMInitialize%sAsmParser';
  CDisassemblerProc = 'LLVMInitialize%sDisassembler';

type
  TInitProc = procedure; cdecl;

function TryDynCallProc(const AName: string): Boolean;
var
{$IFDEF FPC}
  LLib: TLibHandle;
{$ELSE}
  LLib: THandle;
{$ENDIF} 
  LDynProc: TInitProc;
begin
  if AName = '' then
    Exit(False);
{$IFDEF FPC}
  LLib := LoadLibrary(CLLVMLibrary);
{$ELSE}
  LLib := GetModuleHandle(CLLVMLibrary);
{$ENDIF} 
  if LLib <> 0 then
  begin
{$IFDEF FPC}
    LDynProc := TInitProc(GetProcedureAddress(LLib, PWideChar(AName)));
{$ELSE}
    @LDynProc := GetProcAddress(LLib, PWideChar(AName));
{$ENDIF} 
    if Assigned(LDynProc) then
    begin
      LDynProc();
      Exit(True);
    end;
  end;
  Result := False;
end;

function LLVMInitializeTargetInfo(const TargetName: string): Boolean;
begin
  Result := TryDynCallProc(Format(CTargetInfoProc, [TargetName]));
end;

function LLVMInitializeTarget(const TargetName: string): Boolean;
begin
  Result := TryDynCallProc(Format(CTargetProc, [TargetName]));
end;

function LLVMInitializeTargetMC(const TargetName: string): Boolean;
begin
  Result := TryDynCallProc(Format(CTargetMCProc, [TargetName]));
end;

function LLVMInitializeAsmPrinter(const AsmPrinterName: string): Boolean;
begin
  Result := TryDynCallProc(Format(CAsmPrinterProc, [AsmPrinterName]));
end;

function LLVMInitializeAsmParser(const AsmParserName: string): Boolean;
begin
  Result := TryDynCallProc(Format(CAsmParserProc, [AsmParserName]));
end;

function LLVMInitializeDisassembler(const DisassemblerName: string): Boolean;
begin
  Result := TryDynCallProc(Format(CDisassemblerProc, [DisassemblerName]));
end;

end.
