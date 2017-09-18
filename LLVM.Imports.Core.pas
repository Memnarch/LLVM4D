unit LLVM.Imports.Core;

interface

//based on Core.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

{$MinEnumSize 4}

type
  TLLVMOpcode = (
    //* Terminator Instructions */
    LLVMRet            = 1,
    LLVMBr             = 2,
    LLVMSwitch         = 3,
    LLVMIndirectBr     = 4,
    LLVMInvoke         = 5,
    //* removed 6 due to API changes */
    LLVMUnreachable    = 7,

    //* Standard Binary Operators */
    LLVMAdd            = 8,
    LLVMFAdd           = 9,
    LLVMSub            = 10,
    LLVMFSub           = 11,
    LLVMMul            = 12,
    LLVMFMul           = 13,
    LLVMUDiv           = 14,
    LLVMSDiv           = 15,
    LLVMFDiv           = 16,
    LLVMURem           = 17,
    LLVMSRem           = 18,
    LLVMFRem           = 19,

    //* Logical Operators */
    LLVMShl            = 20,
    LLVMLShr           = 21,
    LLVMAShr           = 22,
    LLVMAnd            = 23,
    LLVMOr             = 24,
    LLVMXor            = 25,

    //* Memory Operators */
    LLVMAlloca         = 26,
    LLVMLoad           = 27,
    LLVMStore          = 28,
    LLVMGetElementPtr  = 29,

    //* Cast Operators */
    LLVMTrunc          = 30,
    LLVMZExt           = 31,
    LLVMSExt           = 32,
    LLVMFPToUI         = 33,
    LLVMFPToSI         = 34,
    LLVMUIToFP         = 35,
    LLVMSIToFP         = 36,
    LLVMFPTrunc        = 37,
    LLVMFPExt          = 38,
    LLVMPtrToInt       = 39,
    LLVMIntToPtr       = 40,
    LLVMBitCast        = 41,
    LLVMAddrSpaceCast  = 60,

    //* Other Operators */
    LLVMICmp           = 42,
    LLVMFCmp           = 43,
    LLVMPHI            = 44,
    LLVMCall           = 45,
    LLVMSelect         = 46,
    LLVMUserOp1        = 47,
    LLVMUserOp2        = 48,
    LLVMVAArg          = 49,
    LLVMExtractElement = 50,
    LLVMInsertElement  = 51,
    LLVMShuffleVector  = 52,
    LLVMExtractValue   = 53,
    LLVMInsertValue    = 54,

    //* Atomic operators */
    LLVMFence          = 55,
    LLVMAtomicCmpXchg  = 56,
    LLVMAtomicRMW      = 57,

    //* Exception Handling Operators */
    LLVMResume         = 58,
    LLVMLandingPad     = 59,
    LLVMCleanupRet     = 61,
    LLVMCatchRet       = 62,
    LLVMCatchPad       = 63,
    LLVMCleanupPad     = 64,
    LLVMCatchSwitch    = 65
  );

  TLLVMTypeKind = (
    LLVMVoidTypeKind,        //**< type with no size */
    LLVMHalfTypeKind,        //**< 16 bit floating point type */
    LLVMFloatTypeKind,       //**< 32 bit floating point type */
    LLVMDoubleTypeKind,      //**< 64 bit floating point type */
    LLVMX86_FP80TypeKind,    //**< 80 bit floating point type (X87) */
    LLVMFP128TypeKind,       //**< 128 bit floating point type (112-bit mantissa)*/
    LLVMPPC_FP128TypeKind,   //**< 128 bit floating point type (two 64-bits) */
    LLVMLabelTypeKind,       //**< Labels */
    LLVMIntegerTypeKind,     //**< Arbitrary bit width integers */
    LLVMFunctionTypeKind,    //**< Functions */
    LLVMStructTypeKind,      //**< Structures */
    LLVMArrayTypeKind,       //**< Arrays */
    LLVMPointerTypeKind,     //**< Pointers */
    LLVMVectorTypeKind,      //**< SIMD 'packed' format, or other vector type */
    LLVMMetadataTypeKind,    //**< Metadata */
    LLVMX86_MMXTypeKind,     //**< X86 MMX */
    LLVMTokenTypeKind        //**< Tokens */
  );

  TLLVMLinkage = (
    LLVMExternalLinkage,    //**< Externally visible function */
    LLVMAvailableExternallyLinkage,
    LLVMLinkOnceAnyLinkage, //**< Keep one copy of function when linking (inline)*/
    LLVMLinkOnceODRLinkage, //**< Same, but only replaced by something equivalent. */
    LLVMLinkOnceODRAutoHideLinkage, //**< Obsolete */
    LLVMWeakAnyLinkage,     //**< Keep one copy of function when linking (weak) */
    LLVMWeakODRLinkage,     //**< Same, but only replaced by something equivalent. */
    LLVMAppendingLinkage,   //**< Special purpose, only applies to global arrays */
    LLVMInternalLinkage,    //**< Rename collisions when linking (static functions) */
    LLVMPrivateLinkage,     //**< Like Internal, but omit from symbol table */
    LLVMDLLImportLinkage,   //**< Obsolete */
    LLVMDLLExportLinkage,   //**< Obsolete */
    LLVMExternalWeakLinkage,//**< ExternalWeak linkage description */
    LLVMGhostLinkage,       //**< Obsolete */
    LLVMCommonLinkage,      //**< Tentative definitions */
    LLVMLinkerPrivateLinkage, //**< Like Private, but linker removes. */
    LLVMLinkerPrivateWeakLinkage //**< Like LinkerPrivate, but is weak. */
  );

  TLLVMVisibility = (
    LLVMDefaultVisibility,  //**< The GV is visible */
    LLVMHiddenVisibility,   //**< The GV is hidden */
    LLVMProtectedVisibility //**< The GV is protected */
  );

  TLLVMDLLStorageClass = (
    LLVMDefaultStorageClass   = 0,
    LLVMDLLImportStorageClass = 1, //**< Function to be imported from DLL. */
    LLVMDLLExportStorageClass = 2  //**< Function to be accessible from DLL. */
  );

  TLLVMCallConv = (
    LLVMCCallConv           = 0,
    LLVMFastCallConv        = 8,
    LLVMColdCallConv        = 9,
    LLVMWebKitJSCallConv    = 12,
    LLVMAnyRegCallConv      = 13,
    LLVMX86StdcallCallConv  = 64,
    LLVMX86FastcallCallConv = 65
  );

  TLLVMValueKind = (
    LLVMArgumentValueKind,
    LLVMBasicBlockValueKind,
    LLVMMemoryUseValueKind,
    LLVMMemoryDefValueKind,
    LLVMMemoryPhiValueKind,

    LLVMFunctionValueKind,
    LLVMGlobalAliasValueKind,
    LLVMGlobalIFuncValueKind,
    LLVMGlobalVariableValueKind,
    LLVMBlockAddressValueKind,
    LLVMConstantExprValueKind,
    LLVMConstantArrayValueKind,
    LLVMConstantStructValueKind,
    LLVMConstantVectorValueKind,

    LLVMUndefValueValueKind,
    LLVMConstantAggregateZeroValueKind,
    LLVMConstantDataArrayValueKind,
    LLVMConstantDataVectorValueKind,
    LLVMConstantIntValueKind,
    LLVMConstantFPValueKind,
    LLVMConstantPointerNullValueKind,
    LLVMConstantTokenNoneValueKind,

    LLVMMetadataAsValueValueKind,
    LLVMInlineAsmValueKind,

    LLVMInstructionValueKind
  );

  TLLVMIntPredicate = (
    LLVMIntEQ = 32, //**< equal */
    LLVMIntNE,      //**< not equal */
    LLVMIntUGT,     //**< unsigned greater than */
    LLVMIntUGE,     //**< unsigned greater or equal */
    LLVMIntULT,     //**< unsigned less than */
    LLVMIntULE,     //**< unsigned less or equal */
    LLVMIntSGT,     //**< signed greater than */
    LLVMIntSGE,     //**< signed greater or equal */
    LLVMIntSLT,     //**< signed less than */
    LLVMIntSLE      //**< signed less or equal */
  );

  TLLVMRealPredicate = (
    LLVMRealPredicateFalse, //**< Always false (always folded) */
    LLVMRealOEQ,            //**< True if ordered and equal */
    LLVMRealOGT,            //**< True if ordered and greater than */
    LLVMRealOGE,            //**< True if ordered and greater than or equal */
    LLVMRealOLT,            //**< True if ordered and less than */
    LLVMRealOLE,            //**< True if ordered and less than or equal */
    LLVMRealONE,            //**< True if ordered and operands are unequal */
    LLVMRealORD,            //**< True if ordered (no nans) */
    LLVMRealUNO,            //**< True if unordered: isnan(X) | isnan(Y) */
    LLVMRealUEQ,            //**< True if unordered or equal */
    LLVMRealUGT,            //**< True if unordered or greater than */
    LLVMRealUGE,            //**< True if unordered, greater than, or equal */
    LLVMRealULT,            //**< True if unordered or less than */
    LLVMRealULE,            //**< True if unordered, less than, or equal */
    LLVMRealUNE,            //**< True if unordered or not equal */
    LLVMRealPredicateTrue   //**< Always true (always folded) */
  );

  TLLVMLandingPadClauseTy = (
    LLVMLandingPadCatch,    //**< A catch clause   */
    LLVMLandingPadFilter    //**< A filter clause  */
  );

  TLLVMThreadLocalMode = (
    LLVMNotThreadLocal = 0,
    LLVMGeneralDynamicTLSModel,
    LLVMLocalDynamicTLSModel,
    LLVMInitialExecTLSModel,
    LLVMLocalExecTLSModel
  );

  TLLVMAtomicOrdering = (
    LLVMAtomicOrderingNotAtomic = 0, //**< A load or store which is not atomic */
    LLVMAtomicOrderingUnordered = 1, //**< Lowest level of atomicity, guarantees somewhat sane results, lock free. */
    LLVMAtomicOrderingMonotonic = 2, //**< guarantees that if you take all the operations affecting a specific address, a consistent ordering exists */
    LLVMAtomicOrderingAcquire = 4, //**< Acquire provides a barrier of the sort necessary to acquire a lock to access other memory with normal loads and stores. */
    LLVMAtomicOrderingRelease = 5, //**< Release is similar to Acquire, but with a barrier of the sort necessary to release a lock. */
    LLVMAtomicOrderingAcquireRelease = 6, //**< provides both an Acquire and a Release barrier (for fences and operations which both read and write memory). */
    LLVMAtomicOrderingSequentiallyConsistent = 7 //**< provides Acquire semantics for loads and Release semantics for stores. Additionally, it guarantees that a total ordering exists between all SequentiallyConsistent operations. */
  );

  TLLVMAtomicRMWBinOp = (
    LLVMAtomicRMWBinOpXchg, //**< Set the new value and return the one old */
    LLVMAtomicRMWBinOpAdd, //**< Add a value and return the old one */
    LLVMAtomicRMWBinOpSub, //**< Subtract a value and return the old one */
    LLVMAtomicRMWBinOpAnd, //**< And a value and return the old one */
    LLVMAtomicRMWBinOpNand, //**< Not-And a value and return the old one */
    LLVMAtomicRMWBinOpOr, //**< OR a value and return the old one */
    LLVMAtomicRMWBinOpXor, //**< Xor a value and return the old one */
    LLVMAtomicRMWBinOpMax, //**< Sets the value if it's greater than the original using a signed comparison and return the old one */
    LLVMAtomicRMWBinOpMin, //**< Sets the value if it's Smaller than the original using a signed comparison and return the old one */
    LLVMAtomicRMWBinOpUMax, //**< Sets the value if it's greater than the original using an unsigned comparison and return the old one */
    LLVMAtomicRMWBinOpUMin //**< Sets the value if it's greater than the original using an unsigned comparison  and return the old one */
  );

  TLLVMDiagnosticSeverity = (
    LLVMDSError,
    LLVMDSWarning,
    LLVMDSRemark,
    LLVMDSNote
  );

{//**
 * Attribute index are either LLVMAttributeReturnIndex,
 * LLVMAttributeFunctionIndex or a parameter number from 1 to N.
 */}
  TLLVMAttributeIndex = (
    LLVMAttributeReturnIndex = 0,
    // ISO C restricts enumerator values to range of 'int'
    // (4294967295 is too large)
    // LLVMAttributeFunctionIndex = ~0U,
    LLVMAttributeFunctionIndex = -1
  );


procedure LLVMInitializeCore(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;

procedure LLVMShutdown; cdecl; external CLLVMLibrary;

function LLVMCreateMessage(const Message: PLLVMChar): PLLVMChar; cdecl; external CLLVMLibrary;
procedure LLVMDisposeMessage(Message: PLLVMChar); cdecl; external CLLVMLibrary;

type
  TLLVMDiagnosticHandler = procedure(DiagnosticInfo: TLLVMDiagnosticInfoRef; UserContext: Pointer); cdecl;
  TLLVMYieldCallback = procedure(Context: TLLVMContextRef; UserContext: Pointer); cdecl;

function LLVMContextCreate: TLLVMContextRef; cdecl; external CLLVMLibrary;

function LLVMGetGlobalContext: TLLVMContextRef; cdecl; external CLLVMLibrary;

procedure LLVMContextSetDiagnosticHandler(C: TLLVMContextRef; Handler: TLLVMDiagnosticHandler; DiagnosticContext: Pointer); cdecl; external CLLVMLibrary;

function LLVMContextGetDiagnosticHandler(C: TLLVMContextRef): TLLVMDiagnosticHandler; cdecl; external CLLVMLibrary;

function LLVMContextGetDiagnosticContext(C: TLLVMContextRef): Pointer; cdecl; external CLLVMLibrary;

procedure LLVMContextSetYieldCallback(C: TLLVMContextRef; Callback: TLLVMYieldCallback; OpaqueHandle: Pointer); cdecl; external CLLVMLibrary;

procedure LLVMContextDispose(C: TLLVMContextRef); cdecl; external CLLVMLibrary;

function LLVMGetDiagInfoDescription(DI: TLLVMDiagnosticInfoRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetDiagInfoSeverity(DI: TLLVMDiagnosticInfoRef): TLLVMDiagnosticSeverity; cdecl; external CLLVMLibrary;

function LLVMGetMDKindIDInContext(C: TLLVMContextRef; const Name: PLLVMChar; SLen: Cardinal): Cardinal; cdecl; external CLLVMLibrary;
function LLVMGetMDKindID(const Name: PLLVMChar; SLen: Cardinal): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGetEnumAttributeKindForName(const Name: PLLVMChar; SLen: TLLVMSizeT): Cardinal; cdecl; external CLLVMLibrary;
function  LLVMGetLastEnumAttributeKind: Cardinal; cdecl; external CLLVMLibrary;

function LLVMCreateEnumAttribute(C: TLLVMContextRef; KindID: Cardinal; Val: UInt64): TLLVMAttributeRef; cdecl; external CLLVMLibrary;

function LLVMGetEnumAttributeKind(A: TLLVMAttributeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGetEnumAttributeValue(A: TLLVMAttributeRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMCreateStringAttribute(C: TLLVMContextRef; const K: PLLVMChar; KLength: Cardinal; const V: PLLVMChar; VLength: Cardinal): TLLVMAttributeRef; cdecl; external CLLVMLibrary;

function LLVMGetStringAttributeKind(A: TLLVMAttributeRef; out Length: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetStringAttributeValue(A: TLLVMAttributeRef; out Length: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMIsEnumAttribute(A: TLLVMAttributeRef): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMIsStringAttribute(A: TLLVMAttributeRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMModuleCreateWithName(const ModuleID: PLLVMChar): TLLVMModuleRef; cdecl; external CLLVMLibrary;

function LLVMModuleCreateWithNameInContext(const ModuleID: PLLVMChar; C: TLLVMContextRef): TLLVMModuleRef; cdecl; external CLLVMLibrary;

function LLVMCloneModule(M: TLLVMModuleRef): TLLVMModuleRef; cdecl; external CLLVMLibrary;

procedure LLVMDisposeModule(M: TLLVMModuleRef); cdecl; external CLLVMLibrary;

function LLVMGetModuleIdentifier(M: TLLVMModuleRef; out Len: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetModuleIdentifier(M: TLLVMModuleRef; const Ident: PLLVMChar; Len: TLLVMSizeT); cdecl; external CLLVMLibrary;

function LLVMGetDataLayoutStr(M: TLLVMModuleRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetDataLayout(M: TLLVMModuleRef; const DataLayoutStr: PLLVMChar); cdecl; external CLLVMLibrary;

function LLVMGetTarget(M: TLLVMModuleRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetTarget(M: TLLVMModuleRef; const Triple: PLLVMChar); cdecl; external CLLVMLibrary;

procedure LLVMDumpModule(M: TLLVMModuleRef); cdecl; external CLLVMLibrary;

function LLVMPrintModuleToFile(M: TLLVMModuleRef; const Filename: PLLVMChar; out ErrorMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMPrintModuleToString(M: TLLVMModuleRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetModuleInlineAsm(M: TLLVMModuleRef; const InlineAsm: PLLVMChar); cdecl; external CLLVMLibrary;

function LLVMGetModuleContext(M: TLLVMModuleRef): TLLVMContextRef; cdecl; external CLLVMLibrary;

function LLVMGetTypeByName(M: TLLVMModuleRef; const Name: PLLVMChar): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetNamedMetadataNumOperands(M: TLLVMModuleRef; const Name: PLLVMChar): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetNamedMetadataOperands(M: TLLVMModuleRef; const Name: PLLVMChar; out Dest: PLLVMValueRef); cdecl; external CLLVMLibrary;

procedure LLVMAddNamedMetadataOperand(M: TLLVMModuleRef; const Name: PLLVMChar; Val: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMAddFunction(M: TLLVMModuleRef; const Name: PLLVMChar;FunctionTy: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetNamedFunction(M: TLLVMModuleRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetFirstFunction(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetLastFunction(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetNextFunction(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetPreviousFunction(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetTypeKind(Ty: TLLVMTypeRef): TLLVMTypeKind; cdecl; external CLLVMLibrary;

function LLVMTypeIsSized(Ty: TLLVMTypeRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetTypeContext(Ty: TLLVMTypeRef): TLLVMContextRef; cdecl; external CLLVMLibrary;

procedure LLVMDumpType(Val: TLLVMTypeRef); cdecl; external CLLVMLibrary;

function LLVMPrintTypeToString(Val: TLLVMTypeRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMInt1TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt8TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt16TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt32TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt64TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt128TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external  CLLVMLibrary;
function LLVMIntTypeInContext(C: TLLVMContextRef; NumBits: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMInt1Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt8Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt16Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt32Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt64Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt128Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMIntType(NumBits: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMGetIntTypeWidth(IntegerTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMHalfTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMFloatTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMDoubleTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMX86FP80TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMFP128TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMPPCFP128TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMHalfType: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMFloatType: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMDoubleType: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMX86FP80Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMFP128Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMPPCFP128Type: TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMFunctionType(ReturnType: TLLVMTypeRef; ParamTypes: PLLVMTypeRef; ParamCount: Cardinal; IsVarArg: TLLVMBool): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIsFunctionVarArg(FunctionTy: TLLVMTypeRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetReturnType(FunctionTy: TLLVMTypeRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMCountParamTypes(FunctionTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetParamTypes(FunctionTy: TLLVMTypeRef; out Dest: PLLVMTypeRef); cdecl; external CLLVMLibrary;

function LLVMStructTypeInContext(C: TLLVMContextRef; ElementTypes: PLLVMTypeRef; ElementCount: Cardinal; IsPacked: TLLVMBool): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMStructType(ElementTypes: PLLVMTypeRef; ElementCount: Cardinal; IsPacked: TLLVMBool): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMStructCreateNamed(C: TLLVMContextRef; const Name: PLLVMChar): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetStructName(Ty: TLLVMTypeRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMStructSetBody(StructTy: TLLVMTypeRef; ElementTypes: PLLVMTypeRef; ElementCount: Cardinal; IsPacked: TLLVMBool); cdecl; external CLLVMLibrary;

function LLVMCountStructElementTypes(StructTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetStructElementTypes(StructTy: TLLVMTypeRef; Dest: PLLVMTypeRef); cdecl; external CLLVMLibrary;

function LLVMStructGetTypeAtIndex(StructTy: TLLVMTypeRef; i: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIsPackedStruct(StructTy: TLLVMTypeRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMIsOpaqueStruct(StructTy: TLLVMTypeRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetElementType(Ty: TLLVMTypeRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

procedure LLVMGetSubtypes(Tp: TLLVMTypeRef; out Arr: PLLVMTypeRef); cdecl; external CLLVMLibrary;

function LLVMGetNumContainedTypes(Tp: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMArrayType(ElementType: TLLVMTypeRef; ElementCount: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetArrayLength(ArrayTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMPointerType(ElementType: TLLVMTypeRef; AddressSpace: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetPointerAddressSpace(PointerTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMVectorType(ElementType: TLLVMTypeRef; ElementCount: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetVectorSize(VectorTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMVoidTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMLabelTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMX86MMXTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMVoidType: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMLabelType: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMX86MMXType: TLLVMTypeRef; cdecl; external CLLVMLibrary;

//functions working on all valuetypes

function LLVMTypeOf(Val: TLLVMValueRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetValueKind(Val: TLLVMValueRef): TLLVMValueKind; cdecl; external CLLVMLibrary;

function LLVMGetValueName(Val: TLLVMValueRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetValueName(Val: TLLVMValueRef; const Name: PLLVMChar); cdecl; external CLLVMLibrary;

procedure LLVMDumpValue(Val: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMPrintValueToString(Val: TLLVMValueRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMReplaceAllUsesWith(OldVal: TLLVMValueRef; NewVal: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMIsConstant(Val: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMIsUndef(Val: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMIsAMDNode(Val: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMIsAMDString(Val: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetFirstUse(Val: TLLVMValueRef): TLLVMUseRef; cdecl; external CLLVMLibrary;

function LLVMGetNextUse(U: TLLVMUseRef): TLLVMUseRef; cdecl; external CLLVMLibrary;

function LLVMGetUser(U: TLLVMUseRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetUsedValue(U: TLLVMUseRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

//functions for Users

function LLVMGetOperand(Val: TLLVMValueRef; Index: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetOperandUse(Val: TLLVMValueRef; Index: Cardinal): TLLVMUseRef; cdecl; external CLLVMLibrary;

procedure LLVMSetOperand(User: TLLVMValueRef; Index: Cardinal; Val: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMGetNumOperands(Val: TLLVMValueRef): Integer; cdecl; external CLLVMLibrary;

//constants

function LLVMConstNull(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstAllOnes(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetUndef(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMIsNull(Val: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMConstPointerNull(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstInt(IntTy: TLLVMTypeRef; N: UInt64; SignExtend: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntOfArbitraryPrecision(IntTy: TLLVMTypeRef; NumWords: Cardinal; Words: PUInt64): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntOfString(IntTy: TLLVMTypeRef; const Text: PLLVMChar; Radix: Byte): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntOfStringAndSize(IntTy: TLLVMTypeRef; const Text: PLLVMChar; SLen: Cardinal; Radix: Byte): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstReal(RealTy: TLLVMTypeRef; N: Double): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstRealOfString(RealTy: TLLVMTypeRef; const Text: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstRealOfStringAndSize(RealTy: TLLVMTypeRef; const Text: PLLVMChar; SLen: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntGetZExtValue(ConstantVal: TLLVMValueRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMConstIntGetSExtValue(ConstantVal: TLLVMValueRef): Int64; cdecl; external CLLVMLibrary;

function LLVMConstRealGetDouble(ConstantVal: TLLVMValueRef; out losesInfo: TLLVMBool): Double; cdecl; external CLLVMLibrary;

function LLVMConstStringInContext(C: TLLVMContextRef; const Str: PLLVMChar; Length: Cardinal; DontNullTerminate: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstString(const Str: PLLVMChar; Length: Cardinal; DontNullTerminate: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMIsConstantString(c: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetAsString(c: TLLVMValueRef; out Length: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMConstStructInContext(C: TLLVMContextRef; ConstantVals: PLLVMValueRef; Count: Cardinal; IsPacked: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstStruct(ConstantVals: PLLVMValueRef; Count: Cardinal; IsPacked: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstArray(ElementTy: TLLVMTypeRef; ConstantVals: PLLVMValueRef; Length: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstNamedStruct(StructTy: TLLVMTypeRef; ConstantVals: PLLVMValueRef; Count: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetElementAsConstant(C: TLLVMValueRef; idx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstVector(ScalarConstantVals: PLLVMValueRef; Size: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;


function LLVMGetConstOpcode(ConstantVal: TLLVMValueRef): TLLVMOpcode; cdecl; external CLLVMLibrary;
function LLVMAlignOf(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMSizeOf(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNeg(ConstantVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNSWNeg(ConstantVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNUWNeg(ConstantVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFNeg(ConstantVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNot(ConstantVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstAdd(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNSWAdd(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNUWAdd(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFAdd(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstSub(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNSWSub(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNUWSub(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFSub(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstMul(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNSWMul(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNUWMul(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFMul(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstUDiv(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstExactUDiv(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstSDiv(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstExactSDiv(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFDiv(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstURem(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstSRem(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFRem(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstAnd(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstOr(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstXor(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstICmp(Predicate: TLLVMIntPredicate; LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFCmp(Predicate: TLLVMRealPredicate; LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstShl(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstLShr(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstAShr(LHSConstant: TLLVMValueRef; RHSConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstGEP(ConstantVal: TLLVMValueRef; ConstantIndices: PLLVMValueRef; NumIndices: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstInBoundsGEP(ConstantVal: TLLVMValueRef; ConstantIndices: PLLVMValueRef; NumIndices: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstTrunc(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstSExt(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstZExt(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFPTrunc(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFPExt(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstUIToFP(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstSIToFP(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFPToUI(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFPToSI(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstPtrToInt(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstIntToPtr(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstBitCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstAddrSpaceCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstZExtOrBitCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstSExtOrBitCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstTruncOrBitCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstPointerCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstIntCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef; isSigned: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFPCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstSelect(ConstantCondition: TLLVMValueRef; ConstantIfTrue: TLLVMValueRef; ConstantIfFalse: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstExtractElement(VectorConstant: TLLVMValueRef; IndexConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstInsertElement(VectorConstant: TLLVMValueRef; ElementValueConstant: TLLVMValueRef; IndexConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstShuffleVector(VectorAConstant: TLLVMValueRef; VectorBConstant: TLLVMValueRef; MaskConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstExtractValue(AggConstant: TLLVMValueRef; IdxList: PCardinal; NumIdx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstInsertValue(AggConstant: TLLVMValueRef; ElementValueConstant: TLLVMValueRef; IdxList: PCardinal; NumIdx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstInlineAsm(Ty: TLLVMTypeRef; const AsmString: PLLVMChar; const Constraints: PLLVMChar; HasSideEffects: TLLVMBool; IsAlignStack: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBlockAddress(F: TLLVMValueRef; BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetGlobalParent(Global: TLLVMValueRef): TLLVMModuleRef; cdecl; external CLLVMLibrary;
function LLVMIsDeclaration(Global: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMGetLinkage(Global: TLLVMValueRef): TLLVMLinkage; cdecl; external CLLVMLibrary;
procedure LLVMSetLinkage(Global: TLLVMValueRef; Linkage: TLLVMLinkage); cdecl; external CLLVMLibrary;
function LLVMGetSection(Global: TLLVMValueRef): PLLVMChar; cdecl; external CLLVMLibrary;
procedure LLVMSetSection(Global: TLLVMValueRef; const Section: PLLVMChar); cdecl; external CLLVMLibrary;
function LLVMGetVisibility(Global: TLLVMValueRef): TLLVMVisibility; cdecl; external CLLVMLibrary;
procedure LLVMSetVisibility(Global: TLLVMValueRef; Viz: TLLVMVisibility); cdecl; external CLLVMLibrary;
function LLVMGetDLLStorageClass(Global: TLLVMValueRef): TLLVMDLLStorageClass; cdecl; external CLLVMLibrary;
procedure LLVMSetDLLStorageClass(Global: TLLVMValueRef; StorageClass: TLLVMDLLStorageClass); cdecl; external CLLVMLibrary;
function LLVMHasUnnamedAddr(Global: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetUnnamedAddr(Global: TLLVMValueRef; HasUnnamedAddr: TLLVMBool); cdecl; external CLLVMLibrary;

function LLVMGetAlignment(V: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMSetAlignment(V: TLLVMValueRef; Bytes: Cardinal); cdecl; external CLLVMLibrary;

function LLVMAddGlobal(M: TLLVMModuleRef; Ty: TLLVMTypeRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMAddGlobalInAddressSpace(M: TLLVMModuleRef; Ty: TLLVMTypeRef; const Name: PLLVMChar; AddressSpace: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetNamedGlobal(M: TLLVMModuleRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetFirstGlobal(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetLastGlobal(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetNextGlobal(GlobalVar: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetPreviousGlobal(GlobalVar: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
procedure LLVMDeleteGlobal(GlobalVar: TLLVMValueRef); cdecl; external CLLVMLibrary;
function LLVMGetInitializer(GlobalVar: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
procedure LLVMSetInitializer(GlobalVar: TLLVMValueRef; ConstantVal: TLLVMValueRef); cdecl; external CLLVMLibrary;
function LLVMIsThreadLocal(GlobalVar: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetThreadLocal(GlobalVar: TLLVMValueRef; IsThreadLocal: TLLVMBool); cdecl; external CLLVMLibrary;
function LLVMIsGlobalConstant(GlobalVar: TLLVMValueRef): TLLVMBool; cdecl external CLLVMLibrary;
procedure LLVMSetGlobalConstant(GlobalVar: TLLVMValueRef; IsConstant: TLLVMBool); cdecl; external CLLVMLibrary;
function LLVMGetThreadLocalMode(GlobalVar: TLLVMValueRef): TLLVMThreadLocalMode; cdecl; external CLLVMLibrary;
procedure LLVMSetThreadLocalMode(GlobalVar: TLLVMValueRef; Mode: TLLVMThreadLocalMode); cdecl; external CLLVMLibrary;
function LLVMIsExternallyInitialized(GlobalVar: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetExternallyInitialized(GlobalVar: TLLVMValueRef; IsExtInit: TLLVMBool); cdecl; external CLLVMLibrary;

function LLVMAddAlias(M: TLLVMModuleRef; Ty: TLLVMTypeRef; Aliasee: TLLVMValueRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

procedure LLVMDeleteFunction(Fn: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMHasPersonalityFn(Fn: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetPersonalityFn(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

procedure LLVMSetPersonalityFn(Fn: TLLVMValueRef; PersonalityFn: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMGetIntrinsicID(Fn: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGetFunctionCallConv(Fn: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMSetFunctionCallConv(Fn: TLLVMValueRef; CC: Cardinal); cdecl; external CLLVMLibrary;

function LLVMGetGC(Fn: TLLVMValueRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetGC(Fn: TLLVMValueRef; const Name: PLLVMChar); cdecl; external CLLVMLibrary;

procedure LLVMAddAttributeAtIndex(F: TLLVMValueRef; Idx: TLLVMAttributeIndex; A: TLLVMAttributeRef); cdecl; external CLLVMLibrary;
function LLVMGetAttributeCountAtIndex(F: TLLVMValueRef; Idx: TLLVMAttributeIndex): Cardinal; cdecl; external CLLVMLibrary;
procedure LLVMGetAttributesAtIndex(F: TLLVMValueRef; Idx: TLLVMAttributeIndex; out Attrs: PLLVMAttributeRef); cdecl; external CLLVMLibrary;
function LLVMGetEnumAttributeAtIndex(F: TLLVMValueRef; Idx: TLLVMAttributeIndex; KindID: Cardinal): TLLVMAttributeRef; cdecl; external CLLVMLibrary;
function LLVMGetStringAttributeAtIndex(F: TLLVMValueRef; Idx: TLLVMAttributeIndex; const K: PLLVMChar; KLen: Cardinal): TLLVMAttributeRef; cdecl; external CLLVMLibrary;
procedure LLVMRemoveEnumAttributeAtIndex(F: TLLVMValueRef; Idx: TLLVMAttributeIndex; KindID: Cardinal); cdecl; external CLLVMLibrary;
procedure LLVMRemoveStringAttributeAtIndex(F: TLLVMValueRef; Idx: TLLVMAttributeIndex; const K: PLLVMChar; KLen: Cardinal); cdecl; external CLLVMLibrary;

procedure LLVMAddTargetDependentFunctionAttr(Fn: TLLVMValueRef; const A: PLLVMChar; const V: PLLVMChar); cdecl; external CLLVMLibrary;

function LLVMCountParams(Fn: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetParams(Fn: TLLVMValueRef; Params: PLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMGetParam(Fn: TLLVMValueRef; Index: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetParamParent(Inst: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetFirstParam(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetLastParam(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetNextParam(Arg: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetPreviousParam(Arg: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

procedure LLVMSetParamAlignment(Arg: TLLVMValueRef; Align: Cardinal); cdecl; external CLLVMLibrary;

function LLVMMDStringInContext(C: TLLVMContextRef; const Str: PLLVMChar; SLen: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMMDString(const Str: PLLVMChar; SLen: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMMDNodeInContext(C: TLLVMContextRef; Vals: PLLVMValueRef; Count: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMMDNode(Vals: PLLVMValueRef; Count: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMMetadataAsValue(C: TLLVMContextRef; MD: TLLVMMetadataRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMValueAsMetadata(Val: TLLVMValueRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

function LLVMGetMDString(V: TLLVMValueRef; out Length: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetMDNodeNumOperands(V: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetMDNodeOperands(V: TLLVMValueRef; Dest: PLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMBasicBlockAsValue(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMValueIsBasicBlock(Val: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMValueAsBasicBlock(Val: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetBasicBlockName(BB: TLLVMBasicBlockRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetBasicBlockParent(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetBasicBlockTerminator(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMCountBasicBlocks(Fn: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetBasicBlocks(Fn: TLLVMValueRef; BasicBlocks: PLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

function LLVMGetFirstBasicBlock(Fn: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetLastBasicBlock(Fn: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetNextBasicBlock(BB: TLLVMBasicBlockRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetPreviousBasicBlock(BB: TLLVMBasicBlockRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetEntryBasicBlock(Fn: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMAppendBasicBlockInContext(C: TLLVMContextRef; Fn: TLLVMValueRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMAppendBasicBlock(Fn: TLLVMValueRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMInsertBasicBlockInContext(C: TLLVMContextRef; BB: TLLVMBasicBlockRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMInsertBasicBlock(InsertBeforeBB: TLLVMBasicBlockRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

procedure LLVMDeleteBasicBlock(BB: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMRemoveBasicBlockFromParent(BB: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMMoveBasicBlockBefore(BB: TLLVMBasicBlockRef; MovePos: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMMoveBasicBlockAfter(BB: TLLVMBasicBlockRef; MovePos: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

function LLVMGetFirstInstruction(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetLastInstruction(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMHasMetadata(Val: TLLVMValueRef): Integer; cdecl; external CLLVMLibrary;

function LLVMGetMetadata(Val: TLLVMValueRef; KindID: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

procedure LLVMSetMetadata(Val: TLLVMValueRef; KindID: Cardinal; Node: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMGetInstructionParent(Inst: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetNextInstruction(Inst: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetPreviousInstruction(Inst: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

procedure LLVMInstructionRemoveFromParent(Inst: TLLVMValueRef); cdecl; external CLLVMLibrary;

procedure LLVMInstructionEraseFromParent(Inst: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMGetInstructionOpcode(Inst: TLLVMValueRef): TLLVMOpcode; cdecl; external CLLVMLibrary;

function LLVMGetICmpPredicate(Inst: TLLVMValueRef): TLLVMIntPredicate; cdecl; external CLLVMLibrary;

function LLVMGetFCmpPredicate(Inst: TLLVMValueRef): TLLVMRealPredicate; cdecl; external CLLVMLibrary;

function LLVMInstructionClone(Inst: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetNumArgOperands(Instr: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMSetInstructionCallConv(Instr: TLLVMValueRef; CC: Cardinal); cdecl; external CLLVMLibrary;

function LLVMGetInstructionCallConv(Instr: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMSetInstrParamAlignment(Instr: TLLVMValueRef; index: Cardinal; Align: Cardinal); cdecl; external CLLVMLibrary;

procedure LLVMAddCallSiteAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; A: TLLVMAttributeRef); cdecl; external CLLVMLibrary;
function LLVMGetCallSiteAttributeCount(C: TLLVMValueRef; Idx: TLLVMAttributeIndex): Cardinal; cdecl; external CLLVMLibrary;
procedure LLVMGetCallSiteAttributes(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; Attrs: PLLVMAttributeRef); cdecl; external CLLVMLibrary;
function LLVMGetCallSiteEnumAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; KindID: Cardinal): TLLVMAttributeRef; cdecl; external CLLVMLibrary;
function LLVMGetCallSiteStringAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; const K: PLLVMChar; KLen: Cardinal): TLLVMAttributeRef; cdecl; external CLLVMLibrary;
procedure LLVMRemoveCallSiteEnumAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; KindID: Cardinal); cdecl; external CLLVMLibrary;
procedure LLVMRemoveCallSiteStringAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; const K: PLLVMChar; KLen: Cardinal); cdecl; external CLLVMLibrary;

function LLVMGetCalledValue(Instr: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMIsTailCall(CallInst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

procedure LLVMSetTailCall(CallInst: TLLVMValueRef; IsTailCall: TLLVMBool); cdecl; external CLLVMLibrary;

function LLVMGetNormalDest(InvokeInst: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetUnwindDest(InvokeInst: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

procedure LLVMSetNormalDest(InvokeInst: TLLVMValueRef; B: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMSetUnwindDest(InvokeInst: TLLVMValueRef; B: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

function LLVMGetNumSuccessors(Term: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGetSuccessor(Term: TLLVMValueRef; i: Cardinal): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

procedure LLVMSetSuccessor(Term: TLLVMValueRef; i: Cardinal; block: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

function LLVMIsConditional(Branch: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetCondition(Branch: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

procedure LLVMSetCondition(Branch: TLLVMValueRef; Cond: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMGetSwitchDefaultDest(SwitchInstr: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetAllocatedType(Alloca: TLLVMValueRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIsInBounds(GEP: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

procedure LLVMSetIsInBounds(GEP: TLLVMValueRef; InBounds: TLLVMBool); cdecl; external CLLVMLibrary;

procedure LLVMAddIncoming(PhiNode: TLLVMValueRef; IncomingValues: PLLVMValueRef; IncomingBlocks: PLLVMBasicBlockRef; Count: Cardinal); cdecl; external CLLVMLibrary;

function LLVMCountIncoming(PhiNode: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGetIncomingValue(PhiNode: TLLVMValueRef; Index: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetIncomingBlock(PhiNode: TLLVMValueRef; Index: Cardinal): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetNumIndices(Inst: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGetIndices(Inst: TLLVMValueRef): PCardinal; cdecl; external CLLVMLibrary;

function LLVMCreateBuilderInContext(C: TLLVMContextRef): TLLVMBuilderRef; cdecl; external CLLVMLibrary;
function LLVMCreateBuilder: TLLVMBuilderRef; cdecl; external CLLVMLibrary;
procedure LLVMPositionBuilder(Builder: TLLVMBuilderRef; Block: TLLVMBasicBlockRef; Instr: TLLVMValueRef); cdecl; external CLLVMLibrary;

procedure LLVMPositionBuilderBefore(Builder: TLLVMBuilderRef; Instr: TLLVMValueRef); cdecl; external CLLVMLibrary;
procedure LLVMPositionBuilderAtEnd(Builder: TLLVMBuilderRef; Block: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;
function LLVMGetInsertBlock(Builder: TLLVMBuilderRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;
procedure LLVMClearInsertionPosition(Builder: TLLVMBuilderRef); cdecl; external CLLVMLibrary;
procedure LLVMInsertIntoBuilder(Builder: TLLVMBuilderRef; Instr: TLLVMValueRef); cdecl; external CLLVMLibrary;
procedure LLVMInsertIntoBuilderWithName(Builder: TLLVMBuilderRef; Instr: TLLVMValueRef; Name: PLLVMChar); cdecl; external CLLVMLibrary;
procedure LLVMDisposeBuilder(Builder: TLLVMBuilderRef); cdecl; external CLLVMLibrary;
procedure LLVMSetCurrentDebugLocation(Builder: TLLVMBuilderRef; L: TLLVMValueRef); cdecl; external CLLVMLibrary;
function LLVMGetCurrentDebugLocation(Builder: TLLVMBuilderRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
procedure LLVMSetInstDebugLocation(Builder: TLLVMBuilderRef; Inst: TLLVMValueRef); cdecl; external CLLVMLibrary;
function LLVMBuildRetVoid(Arg0: TLLVMBuilderRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildRet(Arg0: TLLVMBuilderRef; V: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAggregateRet(Arg0: TLLVMBuilderRef; RetVals: PLLVMValueRef; N: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildBr(Arg0: TLLVMBuilderRef; Dest: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCondBr(Arg0: TLLVMBuilderRef; IfValue: TLLVMValueRef; ThenValue: TLLVMBasicBlockRef; ElseValue: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSwitch(Arg0: TLLVMBuilderRef; V: TLLVMValueRef; ElseValue: TLLVMBasicBlockRef; NumCases: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildIndirectBr(B: TLLVMBuilderRef; Addr: TLLVMValueRef; NumDests: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildInvoke(Arg0: TLLVMBuilderRef; Fn: TLLVMValueRef; Args: PLLVMValueRef; NumArgs: Cardinal; ThenValue: TLLVMBasicBlockRef; Catch: TLLVMBasicBlockRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildLandingPad(B: TLLVMBuilderRef; Ty: TLLVMTypeRef; PersFn: TLLVMValueRef; NumClauses: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildResume(B: TLLVMBuilderRef; Exn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildUnreachable(Arg0: TLLVMBuilderRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
procedure LLVMAddCase(Switch: TLLVMValueRef; OnVal: TLLVMValueRef; Dest: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;
procedure LLVMAddDestination(IndirectBr: TLLVMValueRef; Dest: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;
function LLVMGetNumClauses(LandingPad: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;
function LLVMGetClause(LandingPad: TLLVMValueRef; Idx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
procedure LLVMAddClause(LandingPad: TLLVMValueRef; ClauseVal: TLLVMValueRef); cdecl; external CLLVMLibrary;
function LLVMIsCleanup(LandingPad: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetCleanup(LandingPad: TLLVMValueRef; Val: TLLVMBool); cdecl; external CLLVMLibrary;
function LLVMBuildAdd(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNSWAdd(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNUWAdd(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFAdd(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSub(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNSWSub(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNUWSub(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFSub(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildMul(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNSWMul(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNUWMul(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFMul(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildUDiv(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildExactUDiv(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSDiv(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildExactSDiv(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFDiv(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildURem(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSRem(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFRem(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildShl(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildLShr(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAShr(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAnd(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildOr(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildXor(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildBinOp(B: TLLVMBuilderRef; Op: TLLVMOpcode; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNeg(Arg0: TLLVMBuilderRef; V: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNSWNeg(B: TLLVMBuilderRef; V: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNUWNeg(B: TLLVMBuilderRef; V: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFNeg(Arg0: TLLVMBuilderRef; V: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNot(Arg0: TLLVMBuilderRef; V: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildMalloc(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildArrayMalloc(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAlloca(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildArrayAlloca(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFree(Arg0: TLLVMBuilderRef; PointerVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildLoad(Arg0: TLLVMBuilderRef; PointerVal: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildStore(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; Ptr: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildGEP(B: TLLVMBuilderRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef; NumIndices: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildInBoundsGEP(B: TLLVMBuilderRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef; NumIndices: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildStructGEP(B: TLLVMBuilderRef; Pointer: TLLVMValueRef; Idx: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildGlobalString(B: TLLVMBuilderRef; Str: PLLVMChar; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildGlobalStringPtr(B: TLLVMBuilderRef; Str: PLLVMChar; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetVolatile(MemoryAccessInst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetVolatile(MemoryAccessInst: TLLVMValueRef; IsVolatile: TLLVMBool); cdecl; external CLLVMLibrary;
function LLVMGetOrdering(MemoryAccessInst: TLLVMValueRef): TLLVMAtomicOrdering; cdecl; external CLLVMLibrary;
procedure LLVMSetOrdering(MemoryAccessInst: TLLVMValueRef; Ordering: TLLVMAtomicOrdering); cdecl; external CLLVMLibrary;
function LLVMBuildTrunc(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildZExt(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSExt(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFPToUI(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFPToSI(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildUIToFP(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSIToFP(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFPTrunc(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFPExt(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildPtrToInt(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildIntToPtr(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildBitCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAddrSpaceCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildZExtOrBitCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSExtOrBitCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildTruncOrBitCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCast(B: TLLVMBuilderRef; Op: TLLVMOpcode; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildPointerCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildIntCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFPCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildICmp(Arg0: TLLVMBuilderRef; Op: TLLVMIntPredicate; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFCmp(Arg0: TLLVMBuilderRef; Op: TLLVMRealPredicate; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildPhi(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCall(Arg0: TLLVMBuilderRef; Fn: TLLVMValueRef; Args: PLLVMValueRef; NumArgs: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSelect(Arg0: TLLVMBuilderRef; IfValue: TLLVMValueRef; ThenValue: TLLVMValueRef; ElseValue: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildVAArg(Arg0: TLLVMBuilderRef; List: TLLVMValueRef; Ty: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildExtractElement(Arg0: TLLVMBuilderRef; VecVal: TLLVMValueRef; Index: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildInsertElement(Arg0: TLLVMBuilderRef; VecVal: TLLVMValueRef; EltVal: TLLVMValueRef; Index: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildShuffleVector(Arg0: TLLVMBuilderRef; V1: TLLVMValueRef; V2: TLLVMValueRef; Mask: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildExtractValue(Arg0: TLLVMBuilderRef; AggVal: TLLVMValueRef; Index: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildInsertValue(Arg0: TLLVMBuilderRef; AggVal: TLLVMValueRef; EltVal: TLLVMValueRef; Index: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildIsNull(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildIsNotNull(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildPtrDiff(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFence(B: TLLVMBuilderRef; ordering: TLLVMAtomicOrdering; singleThread: TLLVMBool; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAtomicRMW(B: TLLVMBuilderRef; op: TLLVMAtomicRMWBinOp; PTR: TLLVMValueRef; Val: TLLVMValueRef; ordering: TLLVMAtomicOrdering; singleThread: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAtomicCmpXchg(B: TLLVMBuilderRef; Ptr: TLLVMValueRef; Cmp: TLLVMValueRef; New: TLLVMValueRef; SuccessOrdering: TLLVMAtomicOrdering; FailureOrdering: TLLVMAtomicOrdering; SingleThread: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMIsAtomicSingleThread(AtomicInst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetAtomicSingleThread(AtomicInst: TLLVMValueRef; SingleThread: TLLVMBool); cdecl; external CLLVMLibrary;
function LLVMGetCmpXchgSuccessOrdering(CmpXchgInst: TLLVMValueRef): TLLVMAtomicOrdering; cdecl; external CLLVMLibrary;
procedure LLVMSetCmpXchgSuccessOrdering(CmpXchgInst: TLLVMValueRef; Ordering: TLLVMAtomicOrdering); cdecl; external CLLVMLibrary;
function LLVMGetCmpXchgFailureOrdering(CmpXchgInst: TLLVMValueRef): TLLVMAtomicOrdering; cdecl; external CLLVMLibrary;
procedure LLVMSetCmpXchgFailureOrdering(CmpXchgInst: TLLVMValueRef; Ordering: TLLVMAtomicOrdering); cdecl; external CLLVMLibrary;

function LLVMCreateModuleProviderForExistingModule(M: TLLVMModuleRef): TLLVMModuleProviderRef; cdecl; external CLLVMLibrary;
procedure LLVMDisposeModuleProvider(M: TLLVMModuleProviderRef); cdecl; external CLLVMLibrary;
function LLVMCreateMemoryBufferWithContentsOfFile(Path: PLLVMChar; out OutMemBuf: TLLVMMemoryBufferRef; out OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMCreateMemoryBufferWithSTDIN(out OutMemBuf: TLLVMMemoryBufferRef; out OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMCreateMemoryBufferWithMemoryRange(InputData: PLLVMChar; InputDataLength: TLLVMSizeT; BufferName: PLLVMChar; RequiresNullTerminator: TLLVMBool): TLLVMMemoryBufferRef; cdecl; external CLLVMLibrary;
function LLVMCreateMemoryBufferWithMemoryRangeCopy(InputData: PLLVMChar; InputDataLength: TLLVMSizeT; BufferName: PLLVMChar): TLLVMMemoryBufferRef; cdecl; external CLLVMLibrary;
function LLVMGetBufferStart(MemBuf: TLLVMMemoryBufferRef): PLLVMChar; cdecl; external CLLVMLibrary;
function LLVMGetBufferSize(MemBuf: TLLVMMemoryBufferRef): TLLVMSizeT; cdecl; external CLLVMLibrary;
procedure LLVMDisposeMemoryBuffer(MemBuf: TLLVMMemoryBufferRef); cdecl; external CLLVMLibrary;
function LLVMGetGlobalPassRegistry: TLLVMPassRegistryRef; cdecl; external CLLVMLibrary;
function LLVMCreatePassManager: TLLVMPassManagerRef; cdecl; external CLLVMLibrary;
function LLVMCreateFunctionPassManagerForModule(M: TLLVMModuleRef): TLLVMPassManagerRef; cdecl; external CLLVMLibrary;
function LLVMCreateFunctionPassManager(MP: TLLVMModuleProviderRef): TLLVMPassManagerRef; cdecl; external CLLVMLibrary;
function LLVMRunPassManager(PM: TLLVMPassManagerRef; M: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMInitializeFunctionPassManager(FPM: TLLVMPassManagerRef): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMRunFunctionPassManager(FPM: TLLVMPassManagerRef; F: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMFinalizeFunctionPassManager(FPM: TLLVMPassManagerRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMDisposePassManager(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;
function LLVMIsMultithreaded: TLLVMBool; cdecl; external CLLVMLibrary;

implementation

end.
