unit LLVM.Imports.ExecutionEngine;

interface

//based on ExecutionEngine.h

uses
  LLVM.Imports,
  LLVM.Imports.Types,
  LLVM.Imports.Target,
  LLVM.Imports.TargetMachine;

procedure LLVMLinkInMCJIT; cdecl; external CLLVMLibrary;
procedure LLVMLinkInInterpreter; cdecl; external CLLVMLibrary;

type
  TLLVMGenericValueRef = type TLLVMRef;
  PLLVMGenericValueRef = ^TLLVMGenericValueRef;

  TLLVMExecutionEngineRef = type TLLVMRef;

  TLLVMMCJITMemoryManagerRef = type TLLVMRef;

  TLLVMMCJITCompilerOptions = packed record
    OptLevel: Cardinal;
    CodeModel: TLLVMCodeModel;
    NoFramePointerElim: TLLVMBool;
    EnableFastISel: TLLVMBool;
    MCJMM: TLLVMMCJITMemoryManagerRef;
  end;

function LLVMCreateGenericValueOfInt(Ty: TLLVMTypeRef; N: UInt64; IsSigned: TLLVMBool): TLLVMGenericValueRef; cdecl; external CLLVMLibrary;

function LLVMCreateGenericValueOfPointer(P: Pointer): TLLVMGenericValueRef; cdecl; external CLLVMLibrary;

function LLVMCreateGenericValueOfFloat(Ty: TLLVMTypeRef; N: Double): TLLVMGenericValueRef; cdecl; external CLLVMLibrary;

function LLVMGenericValueIntWidth(GenValRef: TLLVMGenericValueRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGenericValueToInt(GenVal: TLLVMGenericValueRef; IsSigned: TLLVMBool): UInt64; cdecl; external CLLVMLibrary;

function LLVMGenericValueToPointer(GenVal: TLLVMGenericValueRef): Pointer; cdecl; external CLLVMLibrary;

function LLVMGenericValueToFloat(TyRef: TLLVMTypeRef; GenVal: TLLVMGenericValueRef): Double; cdecl; external CLLVMLibrary;

procedure LLVMDisposeGenericValue(GenVal: TLLVMGenericValueRef); cdecl; external CLLVMLibrary;

function LLVMCreateExecutionEngineForModule(out OutEE: TLLVMExecutionEngineRef; M: TLLVMModuleRef; out OutError: TLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMCreateInterpreterForModule(out OutInterp: TLLVMExecutionEngineRef; M: TLLVMModuleRef; out OutError: TLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMCreateJITCompilerForModule(out OutJIT: TLLVMExecutionEngineRef; M: TLLVMModuleRef; OptLevel: Cardinal; out OutError: TLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

procedure LLVMInitializeMCJITCompilerOptions(var Options: TLLVMMCJITCompilerOptions; SizeOfOptions: TLLVMSizeT = SizeOf(TLLVMMCJITCompilerOptions)); cdecl; external CLLVMLibrary;

function LLVMCreateMCJITCompilerForModule(out OutJIT: TLLVMExecutionEngineRef; M: TLLVMModuleRef; var Options: TLLVMMCJITCompilerOptions; SizeOfOptions: TLLVMSizeT; out OutError: TLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

procedure LLVMDisposeExecutionEngine(EE: TLLVMExecutionEngineRef); cdecl; external CLLVMLibrary;

procedure LLVMRunStaticConstructors(EE: TLLVMExecutionEngineRef); cdecl; external CLLVMLibrary;

procedure LLVMRunStaticDestructors(EE: TLLVMExecutionEngineRef); cdecl; external CLLVMLibrary;

function LLVMRunFunctionAsMain(EE: TLLVMExecutionEngineRef; F:  TLLVMValueRef; ArgC: Cardinal; ArgV: Pointer; EnvP: Pointer): Integer; cdecl; external CLLVMLibrary;

function LLVMRunFunction(EE: TLLVMExecutionEngineRef; F: TLLVMValueRef; NumArgs: Cardinal; Args: PLLVMGenericValueRef): TLLVMGenericValueRef; cdecl; external CLLVMLibrary;

procedure LLVMFreeMachineCodeForFunction(EE: TLLVMExecutionEngineRef; F: TLLVMValueRef); cdecl; external CLLVMLibrary;

procedure LLVMAddModule(EE: TLLVMExecutionEngineRef; M: TLLVMModuleRef); cdecl; external CLLVMLibrary;

function LLVMRemoveModule(EE: TLLVMExecutionEngineRef; M: TLLVMModuleRef; out OutMod: TLLVMModuleRef; out OutError: TLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMFindFunction(EE: TLLVMExecutionEngineRef; const Name: PLLVMChar; out OutFn: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMRecompileAndRelinkFunction(EE: TLLVMExecutionEngineRef; Fn:  TLLVMValueRef): Pointer; cdecl; external CLLVMLibrary;

function LLVMGetExecutionEngineTargetData(EE: TLLVMExecutionEngineRef): TLLVMTargetDataRef; cdecl; external CLLVMLibrary;

function LLVMGetExecutionEngineTargetMachine(EE: TLLVMExecutionEngineRef): TLLVMTargetMachineRef; cdecl; external CLLVMLibrary;

procedure LLVMAddGlobalMapping(EE: TLLVMExecutionEngineRef; Global: TLLVMValueRef; Addr: Pointer); cdecl; external CLLVMLibrary;

function LLVMGetPointerToGlobal(EE: TLLVMExecutionEngineRef; Global: TLLVMValueRef): Pointer; cdecl; external CLLVMLibrary;

function LLVMGetGlobalValueAddress(EE: TLLVMExecutionEngineRef; const Name: PLLVMChar): UInt64; cdecl; external CLLVMLibrary;

function LLVMGetFunctionAddress(EE: TLLVMExecutionEngineRef; const Name: PLLVMChar): UInt64; cdecl; external CLLVMLibrary;

type
  TLLVMMemoryManagerAllocateCodeSectionCallback = function(Opaque: Pointer; Size: NativeUInt; Alignment: Cardinal; SectionID: Cardinal; const SectionName: PLLVMChar): Pointer; cdecl;
  TLLVMMemoryManagerAllocateDataSectionCallback = function(Opaque: Pointer; SIze: NativeUInt; Alignment: Cardinal; SectionID: Cardinal; const SectionName: PLLVMChar; IsReadOnly: TLLVMBool): Pointer; cdecl;
  TLLVMMemoryManagerFinalizeMemoryCallback = function(Opaque: Pointer; out ErrMsg: PLLVMChar): TLLVMBool; cdecl;
  TLLVMMemoryManagerDestroyCallback = procedure(Opaque: Pointer); cdecl;


{**
 * Create a simple custom MCJIT memory manager. This memory manager can
 * intercept allocations in a module-oblivious way. This will return NULL
 * if any of the passed functions are NULL.
 *
 * @param Opaque An opaque client object to pass back to the callbacks.
 * @param AllocateCodeSection Allocate a block of memory for executable code.
 * @param AllocateDataSection Allocate a block of memory for data.
 * @param FinalizeMemory Set page permissions and flush cache. Return 0 on
 *   success, 1 on error.
 *}
function LLVMCreateSimpleMCJITMemoryManager(
  Opaque: Pointer;
  AllocateCodeSection: TLLVMMemoryManagerAllocateCodeSectionCallback;
  AllocateDataSection: TLLVMMemoryManagerAllocateDataSectionCallback;
  FinalizeMemory: TLLVMMemoryManagerFinalizeMemoryCallback;
  Destroy: TLLVMMemoryManagerDestroyCallback): TLLVMMCJITMemoryManagerRef; cdecl; external CLLVMLibrary;

procedure LLVMDisposeMCJITMemoryManager(MM: TLLVMMCJITMemoryManagerRef); cdecl; external CLLVMLibrary;

implementation

end.
