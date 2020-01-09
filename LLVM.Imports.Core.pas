unit LLVM.Imports.Core;

interface

//based on Core.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

{$MinEnumSize 4}

const
  // versione
  LTO_API_VERSION = 24;

type

  TLLVMAttrKind = (
    // IR-Level Attributes
    LLVMNone,                            ///< No attributes have been set
    LLVMAlignment,                       //'align',
    LLVMAllocSize,                       //'allocsize',
    LLVMAlwaysInline,                    //'alwaysinline',
    LLVMArgMemOnly,                      //'argmemonly',
    LLVMBuiltin,                         //'builtin',
    LLVMByVal,                           //'byval',
    LLVMCold,                            //'cold',
    LLVMConvergent,                      //'convergent',
    LLVMDereferenceable,                 //'dereferenceable',
    LLVMDereferenceableOrNull,           //'dereferenceable_or_null',
    LLVMImmArg,                          //'immarg',
    LLVMInAlloca,                        //'inalloca',
    LLVMInReg,                           //'inreg',
    LLVMInaccessibleMemOnly,             //'inaccessiblememonly',
    LLVMInaccessibleMemOrArgMemOnly,     //'inaccessiblemem_or_argmemonly',
    LLVMInlineHint,                      //'inlinehint',
    LLVMJumpTable,                       //'jumptable',
    LLVMMinSize,                         //'minsize',
    LLVMNaked,                           //'naked',
    LLVMNest,                            //'nest',
    LLVMNoAlias,                         //'noalias',
    LLVMNoBuiltin,                       //'nobuiltin',
    LLVMNoCapture,                       //'nocapture',
    LLVMNoCfCheck,                       //'nocf_check',
    LLVMNoDuplicate,                     //'noduplicate',
    LLVMNoFree,                          //'nofree',
    LLVMNoImplicitFloat,                 //'noimplicitfloat',
    LLVMNoInline,                        //'noinline',
    LLVMNoRecurse,                       //'norecurse',
    LLVMNoRedZone,                       //'noredzone',
    LLVMNoReturn,                        //'noreturn',
    LLVMNoSync,                          //'nosync',
    LLVMNoUnwind,                        //'nounwind',
    LLVMNonLazyBind,                     //'nonlazybind',
    LLVMNonNull,                         //'nonnull',
    LLVMOptForFuzzing,                   //'optforfuzzing',
    LLVMOptimizeForSize,                 //'optsize',
    LLVMOptimizeNone,                    //'optnone',
    LLVMReadNone,                        //'readnone',
    LLVMReadOnly,                        //'readonly',
    LLVMReturned,                        //'returned',
    LLVMReturnsTwice,                    //'returns_twice',
    LLVMSignedExt,                       //'signext',
    LLVMSafeStack,                       //'safestack',
    LLVMSanitizeAddress,                 //'sanitize_address',
    LLVMSanitizeHWAddress,               //'sanitize_hwaddress',
    LLVMSanitizeMemTag,                  //'sanitize_memtag',
    LLVMSanitizeMemory,                  //'sanitize_memory',
    LLVMSanitizeThread,                  //'sanitize_thread',
    LLVMShadowCallStack,                 //'shadowcallstack',
    LLVMSpeculatable,                    //'speculatable',
    LLVMSpeculativeLoadHardening,        //'speculative_load_hardening',
    LLVMStackAlignment,                  //'alignstack',
    LLVMStackProtect,                    //'ssp',
    LLVMStackProtectReq,                 //'sspreq',
    LLVMStackProtectStrong,              //'sspstrong',
    LLVMStrictFP,                        //'strictfp',
    LLVMStructRet,                       //'sret',
    LLVMSwiftError,                      //'swifterror',
    LLVMSwiftSelf,                       //'swiftself',
    LLVMUWTable,                         //'uwtable',
    LLVMWillReturn,                      //'willreturn',
    LLVMWriteOnly,                       //'writeonly',
    LLVMZeroExt,                         //'zeroext',
    LLVMEndAttrKinds);                   ///< Sentinal value useful for loops


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
    LLVMCatchSwitch    = 65,

    {/* Standard Unary Operators */}
    LLVMFNeg           = 66,
    LLVMCallBr         = 67
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

  TLLVMUnnamedAddr = (
    LLVMNoUnnamedAddr,    {/**< Address of the GV is significant. */}
    LLVMLocalUnnamedAddr, {/**< Address of the GV is locally insignificant. */}
    LLVMGlobalUnnamedAddr {/**< Address of the GV is globally insignificant. */}
  );


  TLLVMDLLStorageClass = (
    LLVMDefaultStorageClass   = 0,
    LLVMDLLImportStorageClass = 1, //**< Function to be imported from DLL. */
    LLVMDLLExportStorageClass = 2  //**< Function to be accessible from DLL. */
  );

  TLLVMCallConv = (
    LLVMCCallConv             = 0,
    LLVMFastCallConv          = 8,
    LLVMColdCallConv          = 9,
    LLVMGHCCallConv           = 10,
    LLVMHiPECallConv          = 11,
    LLVMWebKitJSCallConv      = 12,
    LLVMAnyRegCallConv        = 13,
    LLVMPreserveMostCallConv  = 14,
    LLVMPreserveAllCallConv   = 15,
    LLVMSwiftCallConv         = 16,
    LLVMCXXFASTTLSCallConv    = 17,
    LLVMX86StdcallCallConv    = 64,
    LLVMX86FastcallCallConv   = 65,
    LLVMARMAPCSCallConv       = 66,
    LLVMARMAAPCSCallConv      = 67,
    LLVMARMAAPCSVFPCallConv   = 68,
    LLVMMSP430INTRCallConv    = 69,
    LLVMX86ThisCallCallConv   = 70,
    LLVMPTXKernelCallConv     = 71,
    LLVMPTXDeviceCallConv     = 72,
    LLVMSPIRFUNCCallConv      = 75,
    LLVMSPIRKERNELCallConv    = 76,
    LLVMIntelOCLBICallConv    = 77,
    LLVMX8664SysVCallConv     = 78,
    LLVMWin64CallConv         = 79,
    LLVMX86VectorCallCallConv = 80,
    LLVMHHVMCallConv          = 81,
    LLVMHHVMCCallConv         = 82,
    LLVMX86INTRCallConv       = 83,
    LLVMAVRINTRCallConv       = 84,
    LLVMAVRSIGNALCallConv     = 85,
    LLVMAVRBUILTINCallConv    = 86,
    LLVMAMDGPUVSCallConv      = 87,
    LLVMAMDGPUGSCallConv      = 88,
    LLVMAMDGPUPSCallConv      = 89,
    LLVMAMDGPUCSCallConv      = 90,
    LLVMAMDGPUKERNELCallConv  = 91,
    LLVMX86RegCallCallConv    = 92,
    LLVMAMDGPUHSCallConv      = 93,
    LLVMMSP430BUILTINCallConv = 94,
    LLVMAMDGPULSCallConv      = 95,
    LLVMAMDGPUESCallConv      = 96
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

  TLLVMInlineAsmDialect = (
    LLVMInlineAsmDialectATT,
    LLVMInlineAsmDialectIntel
  );

  TLLVMModuleFlagBehavior = (
    (**
     * Emits an error if two values disagree, otherwise the resulting value is
     * that of the operands.
     *
     * @see Module::ModFlagBehavior::Error
     *)
    LLVMModuleFlagBehaviorError,
    (**
     * Emits a warning if two values disagree. The result value will be the
     * operand for the flag from the first module being linked.
     *
     * @see Module::ModFlagBehavior::Warning
     *)
    LLVMModuleFlagBehaviorWarning,
    (**
     * Adds a requirement that another module flag be present and have a
     * specified value after linking is performed. The value must be a metadata
     * pair, where the first element of the pair is the ID of the module flag
     * to be restricted, and the second element of the pair is the value the
     * module flag should be restricted to. This behavior can be used to
     * restrict the allowable results (via triggering of an error) of linking
     * IDs with the **Override** behavior.
     *
     * @see Module::ModFlagBehavior::Require
     *)
    LLVMModuleFlagBehaviorRequire,
    (**
     * Uses the specified value, regardless of the behavior or value of the
     * other module. If both modules specify **Override**, but the values
     * differ, an error will be emitted.
     *
     * @see Module::ModFlagBehavior::Override
     *)
    LLVMModuleFlagBehaviorOverride,
    (**
     * Appends the two values, which are required to be metadata nodes.
     *
     * @see Module::ModFlagBehavior::Append
     *)
    LLVMModuleFlagBehaviorAppend,
    (**
     * Appends the two values, which are required to be metadata
     * nodes. However, duplicate entries in the second list are dropped
     * during the append operation.
     *
     * @see Module::ModFlagBehavior::AppendUnique
     *)
    LLVMModuleFlagBehaviorAppendUnique
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


function LLVMContextCreate: TLLVMContextRef cdecl; external CLLVMLibrary;

function LLVMGetGlobalContext: TLLVMContextRef; cdecl; external CLLVMLibrary;

procedure LLVMContextSetDiagnosticHandler(C: TLLVMContextRef; Handler: TLLVMDiagnosticHandler; DiagnosticContext: Pointer); cdecl; external CLLVMLibrary;

function LLVMContextGetDiagnosticHandler(C: TLLVMContextRef): TLLVMDiagnosticHandler; cdecl; external CLLVMLibrary;

function LLVMContextGetDiagnosticContext(C: TLLVMContextRef): Pointer; cdecl; external CLLVMLibrary;

procedure LLVMContextSetYieldCallback(C: TLLVMContextRef; Callback: TLLVMYieldCallback; OpaqueHandle: Pointer); cdecl; external CLLVMLibrary;

(**
 * Retrieve whether the given context is set to discard all value names.
 *
 * @see LLVMContext::shouldDiscardValueNames()
 *)
function LLVMContextShouldDiscardValueNames(C: TLLVMContextRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Set whether the given context discards all value names.
 *
 * If true, only the names of GlobalValue objects will be available in the IR.
 * This can be used to save memory and runtime, especially in release mode.
 *
 * @see LLVMContext::setDiscardValueNames()
 *)
procedure LLVMContextSetDiscardValueNames(C: TLLVMContextRef; Discard: TLLVMBool); cdecl; external CLLVMLibrary;


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

function LLVMIsEnumAttribute(A: TLLVMAttributeRef): LongBool; cdecl; external CLLVMLibrary;
function LLVMIsStringAttribute(A: TLLVMAttributeRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMModuleCreateWithName(const ModuleID: PLLVMChar): TLLVMModuleRef; cdecl; external CLLVMLibrary;

function LLVMModuleCreateWithNameInContext(const ModuleID: PLLVMChar; C: TLLVMContextRef): TLLVMModuleRef; cdecl; external CLLVMLibrary;

function LLVMCloneModule(M: TLLVMModuleRef): TLLVMModuleRef; cdecl; external CLLVMLibrary;

procedure LLVMDisposeModule(M: TLLVMModuleRef); cdecl; external CLLVMLibrary;

function LLVMGetModuleIdentifier(M: TLLVMModuleRef; out Len: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetModuleIdentifier(M: TLLVMModuleRef; const Ident: PLLVMChar; Len: TLLVMSizeT); cdecl; external CLLVMLibrary;

(**
 * Obtain the module's original source file name.
 *
 * @param M Module to obtain the name of
 * @param Len Out parameter which holds the length of the returned string
 * @return The original source file name of M
 * @see Module::getSourceFileName()
 *)
function LLVMGetSourceFileName(M: TLLVMModuleRef; var  Len: TLLVMSizeT):PLLVMChar;cdecl; external CLLVMLibrary;

(**
 * Set the original source file name of a module to a string Name with length
 * Len.
 *
 * @param M The module to set the source file name of
 * @param Name The string to set M's source file name to
 * @param Len Length of Name
 * @see Module::setSourceFileName()
 *)
procedure LLVMSetSourceFileName(M: TLLVMModuleRef; Name: PLLVMChar; Len: TLLVMSizeT); cdecl; external CLLVMLibrary;


function LLVMGetDataLayoutStr(M: TLLVMModuleRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetDataLayout(M: TLLVMModuleRef; const DataLayoutStr: PLLVMChar); cdecl; external CLLVMLibrary;

function LLVMGetTarget(M: TLLVMModuleRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMSetTarget(M: TLLVMModuleRef; const Triple: PLLVMChar); cdecl; external CLLVMLibrary;

(**
 * Returns the module flags as an array of flag-key-value triples.  The caller
 * is responsible for freeing this array by calling
 * \c LLVMDisposeModuleFlagsMetadata.
 *
 * @see Module::getModuleFlagsMetadata()
 *)
function LLVMCopyModuleFlagsMetadata(M: TLLVMModuleRef; var Len: TLLVMSizeT): PLLVMModuleFlagEntry;cdecl; external CLLVMLibrary;

(**
 * Destroys module flags metadata entries.
 *)
procedure LLVMDisposeModuleFlagsMetadata(Entries: PLLVMModuleFlagEntry); cdecl; external CLLVMLibrary;

(**
 * Returns the flag behavior for a module flag entry at a specific index.
 *
 * @see Module::ModuleFlagEntry::Behavior
 *)

function LLVMModuleFlagEntriesGetFlagBehavior(Entries  : PLLVMModuleFlagEntry;Index: Cardinal): TLLVMModuleFlagBehavior; cdecl; external CLLVMLibrary;

(**
 * Returns the key for a module flag entry at a specific index.
 *
 * @see Module::ModuleFlagEntry::Key
 *)
function LLVMModuleFlagEntriesGetKey(Entries: PLLVMModuleFlagEntry;Index: Cardinal; var Len:TLLVMSizeT):PLLVMChar;cdecl; external CLLVMLibrary;

(**
 * Returns the metadata for a module flag entry at a specific index.
 *
 * @see Module::ModuleFlagEntry::Val
 *)
function LLVMModuleFlagEntriesGetMetadata(Entries: PLLVMModuleFlagEntry; Index: Cardinal):TLLVMMetadataRef;cdecl; external CLLVMLibrary;

(**
 * Add a module-level flag to the module-level flags metadata if it doesn't
 * already exist.
 *
 * @see Module::getModuleFlag()
 *)
function LLVMGetModuleFlag(M: TLLVMModuleRef; Key: PLLVMChar; KeyLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Add a module-level flag to the module-level flags metadata if it doesn't
 * already exist.
 *
 * @see Module::addModuleFlag()
 *)
procedure LLVMAddModuleFlag(M: TLLVMModuleRef; Behavior : TLLVMModuleFlagBehavior; Key: PLLVMChar;KeyLen:TLLVMSizeT; Val : TLLVMMetadataRef ); cdecl; external CLLVMLibrary;

procedure LLVMDumpModule(M: TLLVMModuleRef); cdecl; external CLLVMLibrary;

function LLVMPrintModuleToFile(M: TLLVMModuleRef; const Filename: PLLVMChar; out ErrorMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMPrintModuleToString(M: TLLVMModuleRef): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Get inline assembly for a module.
 *
 * @see Module::getModuleInlineAsm()
 *)
function LLVMGetModuleInlineAsm(M: TLLVMModuleRef; var Len: TLLVMSizeT): PLLVMChar;cdecl; external CLLVMLibrary;

(**
 * Set inline assembly for a module.
 *
 * @see Module::setModuleInlineAsm()
 *)
procedure LLVMSetModuleInlineAsm2(M: TLLVMModuleRef; const InlineAsm: PLLVMChar; Len: TLLVMSizeT); cdecl; external CLLVMLibrary;

(**
 * Append inline assembly to a module.
 *
 * @see Module::appendModuleInlineAsm()
 *)
procedure LLVMAppendModuleInlineAsm(M: TLLVMModuleRef; const InlineAsm: PLLVMChar; Len: TLLVMSizeT); cdecl; external CLLVMLibrary;

(**
 * Create the specified uniqued inline asm string.
 *
 * @see InlineAsm::get()
 *)
function  LLVMGetInlineAsm(Ty              : TLLVMTypeRef;
                           AsmString       : PLLVMChar;
                           AsmStringSize   : TLLVMSizeT;
                           Constraints     : PLLVMChar;
                           ConstraintsSize : TLLVMSizeT;
                           HasSideEffects  : TLLVMBool;
                           IsAlignStack    : TLLVMBool;
                           Dialect         : TLLVMInlineAsmDialect): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetModuleContext(M: TLLVMModuleRef): TLLVMContextRef; cdecl; external CLLVMLibrary;

function LLVMGetTypeByName(M: TLLVMModuleRef; const Name: PLLVMChar): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(*
 * Obtain an iterator to the first NamedMDNode in a Module.
 *
 * @see llvm::Module::named_metadata_begin()
 *)
function LLVMGetFirstNamedMetadata(M: TLLVMModuleRef):TLLVMNamedMDNodeRef; cdecl; external CLLVMLibrary;

(**
 * Obtain an iterator to the last NamedMDNode in a Module.
 *
 * @see llvm::Module::named_metadata_end()
 *)
function LLVMGetLastNamedMetadata(M: TLLVMModuleRef):TLLVMNamedMDNodeRef ; cdecl; external CLLVMLibrary;

(**
 * Advance a NamedMDNode iterator to the next NamedMDNode.
 *
 * Returns NULL if the iterator was already at the end and there are no more
 * named metadata nodes.
 *)
function LLVMGetNextNamedMetadata(NamedMDNode: TLLVMNamedMDNodeRef): TLLVMNamedMDNodeRef;cdecl; external CLLVMLibrary;

(**
 * Decrement a NamedMDNode iterator to the previous NamedMDNode.
 *
 * Returns NULL if the iterator was already at the beginning and there are
 * no previous named metadata nodes.
 *)
function LLVMGetPreviousNamedMetadata(NamedMDNode: TLLVMNamedMDNodeRef): TLLVMNamedMDNodeRef;cdecl; external CLLVMLibrary;

(**
 * Retrieve a NamedMDNode with the given name, returning NULL if no such
 * node exists.
 *
 * @see llvm::Module::getNamedMetadata()
 *)
function LLVMGetNamedMetadata(M: TLLVMModuleRef; const Name: PLLVMChar; NameLen: TLLVMSizeT ): TLLVMNamedMDNodeRef; cdecl; external CLLVMLibrary;

(**
 * Retrieve a NamedMDNode with the given name, creating a new node if no such
 * node exists.
 *
 * @see llvm::Module::getOrInsertNamedMetadata()
 *)
function LLVMGetOrInsertNamedMetadata(M: TLLVMModuleRef;const Name: PLLVMChar; NameLen: TLLVMSizeT):TLLVMNamedMDNodeRef; cdecl; external CLLVMLibrary;

(**
 * Retrieve the name of a NamedMDNode.
 *
 * @see llvm::NamedMDNode::getName()
 *)
function LLVMGetNamedMetadataName(NamedMD: TLLVMNamedMDNodeRef; var NameLen:TLLVMSizeT): TLLVMNamedMDNodeRef; cdecl; external CLLVMLibrary;

function LLVMGetNamedMetadataNumOperands(M: TLLVMModuleRef; const Name: PLLVMChar): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetNamedMetadataOperands(M: TLLVMModuleRef; const Name: PLLVMChar; out Dest: PLLVMValueRef); cdecl; external CLLVMLibrary;

(*
 * Add an operand to named metadata.
 *
 * @see llvm::Module::getNamedMetadata()
 * @see llvm::MDNode::addOperand()
 *)
procedure LLVMAddNamedMetadataOperand(M: TLLVMModuleRef;  const Name: PLLVMChar; Val: TLLVMValueRef);cdecl; external CLLVMLibrary;

(**
 * Return the directory of the debug location for this value, which must be
 * an llvm::Instruction, llvm::GlobalVariable, or llvm::Function.
 *
 * @see llvm::Instruction::getDebugLoc()
 * @see llvm::GlobalVariable::getDebugInfo()
 * @see llvm::Function::getSubprogram()
 *)
function LLVMGetDebugLocDirectory(Val: TLLVMValueRef; var Len: Cardinal):PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Return the filename of the debug location for this value, which must be
 * an llvm::Instruction, llvm::GlobalVariable, or llvm::Function.
 *
 * @see llvm::Instruction::getDebugLoc()
 * @see llvm::GlobalVariable::getDebugInfo()
 * @see llvm::Function::getSubprogram()
 *)
function LLVMGetDebugLocFilename(Val: TLLVMValueRef; var Len: Cardinal):PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Return the line number of the debug location for this value, which must be
 * an llvm::Instruction, llvm::GlobalVariable, or llvm::Function.
 *
 * @see llvm::Instruction::getDebugLoc()
 * @see llvm::GlobalVariable::getDebugInfo()
 * @see llvm::Function::getSubprogram()
 *)
function LLVMGetDebugLocLine(Val: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Return the column number of the debug location for this value, which must be
 * an llvm::Instruction.
 *
 * @see llvm::Instruction::getDebugLoc()
 *)
function LLVMGetDebugLocColumn(Val: TLLVMValueRef):Cardinal; cdecl; external CLLVMLibrary;

function LLVMAddFunction(M: TLLVMModuleRef; const Name: PLLVMChar; FunctionTy: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain a Function value from a Module by its name.
 *
 * The returned value corresponds to a llvm::Function value.
 *
 * @see llvm::Module::getFunction()
 *)
function LLVMGetNamedFunction(M: TLLVMModuleRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetFirstFunction(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetLastFunction(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetNextFunction(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetPreviousFunction(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

{* Deprecated: Use LLVMSetModuleInlineAsm2 instead. *}
procedure LLVMSetModuleInlineAsm(M: TLLVMModuleRef; const InlineAsm: PLLVMChar); cdecl; external CLLVMLibrary;

function LLVMGetTypeKind(Ty: TLLVMTypeRef): TLLVMTypeKind; cdecl; external CLLVMLibrary;

function LLVMTypeIsSized(Ty: TLLVMTypeRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMGetTypeContext(Ty: TLLVMTypeRef): TLLVMContextRef; cdecl; external CLLVMLibrary;

procedure LLVMDumpType(Val: TLLVMTypeRef); cdecl; external CLLVMLibrary;

function LLVMPrintTypeToString(Val: TLLVMTypeRef): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * @defgroup LLVMCCoreTypeInt Integer Types
 *
 * Functions in this section operate on integer types.
 *
 * @{
 *)

(**
 * Obtain an integer type from a context with specified bit width.
 *)
function LLVMInt1TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt8TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt16TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt32TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt64TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMInt128TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external  CLLVMLibrary;
function LLVMIntTypeInContext(C: TLLVMContextRef; NumBits: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Obtain an integer type from the global context with a specified bit
 * width.
 *)
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

function LLVMFunctionType(ReturnType: TLLVMTypeRef; ParamTypes: PLLVMTypeRef; ParamCount: Cardinal; IsVarArg: LongBool): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIsFunctionVarArg(FunctionTy: TLLVMTypeRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMGetReturnType(FunctionTy: TLLVMTypeRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMCountParamTypes(FunctionTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetParamTypes(FunctionTy: TLLVMTypeRef; out Dest: PLLVMTypeRef); cdecl; external CLLVMLibrary;

function LLVMStructTypeInContext(C: TLLVMContextRef; ElementTypes: PLLVMTypeRef; ElementCount: Cardinal; IsPacked: LongBool): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMStructType(ElementTypes: PLLVMTypeRef; ElementCount: Cardinal; IsPacked: LongBool): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMStructCreateNamed(C: TLLVMContextRef; const Name: PLLVMChar): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetStructName(Ty: TLLVMTypeRef): PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMStructSetBody(StructTy: TLLVMTypeRef; ElementTypes: PLLVMTypeRef; ElementCount: Cardinal; IsPacked: LongBool); cdecl; external CLLVMLibrary;

function LLVMCountStructElementTypes(StructTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetStructElementTypes(StructTy: TLLVMTypeRef; Dest: PLLVMTypeRef); cdecl; external CLLVMLibrary;

function LLVMStructGetTypeAtIndex(StructTy: TLLVMTypeRef; i: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIsPackedStruct(StructTy: TLLVMTypeRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMIsOpaqueStruct(StructTy: TLLVMTypeRef): LongBool; cdecl; external CLLVMLibrary;

(**
 * Determine whether a structure is literal.
 *
 * @see llvm::StructType::isLiteral()
 *)
function LLVMIsLiteralStruct(StructTy: TLLVMTypeRef): TLLVMBool; cdecl; external CLLVMLibrary;

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

(**
 * Create a token type in a context.
 *)
function LLVMTokenTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Create a metadata type in a context.
 *)
function LLVMMetadataTypeInContext(C: TLLVMContextRef): TLLVMTypeRef;cdecl; external CLLVMLibrary;

function LLVMVoidType: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMLabelType: TLLVMTypeRef; cdecl; external CLLVMLibrary;
function LLVMX86MMXType: TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * @}
 */

/**
 * @}
 */

/**
 * @defgroup LLVMCCoreValues Values
 *
 * The bulk of LLVM's object model consists of values, which comprise a very
 * rich type hierarchy.
 *
 * LLVMValueRef essentially represents llvm::Value. There is a rich
 * hierarchy of classes within this type. Depending on the instance
 * obtained, not all APIs are available.
 *
 * Callers can determine the type of an LLVMValueRef by calling the
 * LLVMIsA* family of functions (e.g. LLVMIsAArgument()). These
 * functions are defined by a macro, so it isn't obvious which are
 * available by looking at the Doxygen source code. Instead, look at the
 * source definition of LLVM_FOR_EACH_VALUE_SUBCLASS and note the list
 * of value names given. These value names also correspond to classes in
 * the llvm::Value hierarchy.
 *
 * @{
 *)

 {/*--.. Conversion functions ................................................--*/}

Function LLVMIsAArgument              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsABasicBlock            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAInlineAsm             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAUser                  (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstant              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsABlockAddress          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantAggregateZero (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantArray         (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantDataSequential(Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantDataArray     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantDataVector    (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantExpr          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantFP            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantInt           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantPointerNull   (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantStruct        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantTokenNone     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAConstantVector        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAGlobalValue           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAGlobalAlias           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAGlobalIFunc           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAGlobalObject          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAFunction              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAGlobalVariable        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAUndefValue            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAInstruction           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsABinaryOperator        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsACallInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAIntrinsicInst         (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsADbgInfoIntrinsic      (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsADbgVariableIntrinsic  (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsADbgDeclareInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsADbgLabelInst          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAMemIntrinsic          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAMemCpyInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAMemMoveInst           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAMemSetInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsACmpInst               (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAFCmpInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAICmpInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAExtractElementInst    (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAGetElementPtrInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAInsertElementInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAInsertValueInst       (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsALandingPadInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAPHINode               (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsASelectInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAShuffleVectorInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAStoreInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsABranchInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAIndirectBrInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAInvokeInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAReturnInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsASwitchInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAUnreachableInst       (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAResumeInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsACleanupReturnInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsACatchReturnInst       (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAFuncletPadInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsACatchPadInst          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsACleanupPadInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAUnaryInstruction      (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAAllocaInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsACastInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAAddrSpaceCastInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsABitCastInst           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAFPExtInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAFPToSIInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAFPToUIInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAFPTruncInst           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAIntToPtrInst          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAPtrToIntInst          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsASExtInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsASIToFPInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsATruncInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAUIToFPInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAZExtInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAExtractValueInst      (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsALoadInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
Function LLVMIsAVAArgInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;

(**
 * @defgroup LLVMCCoreValueGeneral General APIs
 *
 * Functions in this section work on all LLVMValueRef instances,
 * regardless of their sub-type. They correspond to functions available
 * on llvm::Value.
 *
 * @{
 *)

(**
 * Obtain the type of a value.
 *
 * @see llvm::Value::getType()
 *)
function LLVMTypeOf(Val: TLLVMValueRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the enumerated type of a Value instance.
 *
 * @see llvm::Value::getValueID()
 *)
function LLVMGetValueKind(Val: TLLVMValueRef): TLLVMValueKind; cdecl; external CLLVMLibrary;

(**
 * Obtain the string name of a value.
 *
 * @see llvm::Value::getName()
 *)
function LLVMGetValueName(Val: TLLVMValueRef): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Obtain the string name of a value.
 *
 * @see llvm::Value::getName()
 *)
function LLVMGetValueName2(Val: TLLVMValueRef; var Len: TLLVMSizeT):PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Set the string name of a value.
 *
 * @see llvm::Value::setName()
 *)
procedure LLVMSetValueName(Val: TLLVMValueRef; const Name: PLLVMChar); cdecl; external CLLVMLibrary;

(**
 * Set the string name of a value.
 *
 * @see llvm::Value::setName()
 *)
procedure LLVMSetValueName2(Valore: TLLVMValueRef; const Name: PLLVMChar; NameLen: TLLVMSizeT); cdecl; external CLLVMLibrary;

(*
 * Dump a representation of a value to stderr.
 *
 * @see llvm::Value::dump()
 *)
procedure LLVMDumpValue(Val: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Return a string representation of the value. Use
 * LLVMDisposeMessage to free the string.
 *
 * @see llvm::Value::print()
 *)
function LLVMPrintValueToString(Val: TLLVMValueRef): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Replace all uses of a value with another one.
 *
 * @see llvm::Value::replaceAllUsesWith()
 *)
procedure LLVMReplaceAllUsesWith(OldVal: TLLVMValueRef; NewVal: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMIsConstant(Val: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMIsUndef(Val: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMIsAMDNode(Val: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMIsAMDString(Val: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * @defgroup LLVMCCoreValueUses Usage
 *
 * This module defines functions that allow you to inspect the uses of a
 * LLVMValueRef.
 *
 * It is possible to obtain an LLVMUseRef for any LLVMValueRef instance.
 * Each LLVMUseRef (which corresponds to a llvm::Use instance) holds a
 * llvm::User and llvm::Value.
 *
 * @{
 *)

(**
 * Obtain the first use of a value.
 *
 * Uses are obtained in an iterator fashion. First, call this function
 * to obtain a reference to the first use. Then, call LLVMGetNextUse()
 * on that instance and all subsequently obtained instances until
 * LLVMGetNextUse() returns NULL.
 *
 * @see llvm::Value::use_begin()
 *)
function LLVMGetFirstUse(Val: TLLVMValueRef): TLLVMUseRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the next use of a value.
 *
 * This effectively advances the iterator. It returns NULL if you are on
 * the final use and no more are available.
 *)
function LLVMGetNextUse(U: TLLVMUseRef): TLLVMUseRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the user value for a user.
 *
 * The returned value corresponds to a llvm::User type.
 *
 * @see llvm::Use::getUser()
 *)
function LLVMGetUser(U: TLLVMUseRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the value this use corresponds to.
 *
 * @see llvm::Use::get().
 *)
function LLVMGetUsedValue(U: TLLVMUseRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * @}
 *)

(**
 * @defgroup LLVMCCoreValueUser User value
 *
 * Function in this group pertain to LLVMValueRef instances that descent
 * from llvm::User. This includes constants, instructions, and
 * operators.
 *
 * @{
 *)

(**
 * Obtain an operand at a specific index in a llvm::User value.
 *
 * @see llvm::User::getOperand()
 *)
function LLVMGetOperand(Val: TLLVMValueRef; Index: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the use of an operand at a specific index in a llvm::User value.
 *
 * @see llvm::User::getOperandUse()
 *)
function LLVMGetOperandUse(Val: TLLVMValueRef; Index: Cardinal): TLLVMUseRef; cdecl; external CLLVMLibrary;

(**
 * Set an operand at a specific index in a llvm::User value.
 *
 * @see llvm::User::setOperand()
 *)
procedure LLVMSetOperand(User: TLLVMValueRef; Index: Cardinal; Val: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Obtain the number of operands in a llvm::User value.
 *
 * @see llvm::User::getNumOperands()
 *)
function LLVMGetNumOperands(Val: TLLVMValueRef): Integer; cdecl; external CLLVMLibrary;

(**
 * @}
 *)

(**
 * @defgroup LLVMCCoreValueConstant Constants
 *
 * This section contains APIs for interacting with LLVMValueRef that
 * correspond to llvm::Constant instances.
 *
 * These functions will work for any LLVMValueRef in the llvm::Constant
 * class hierarchy.
 *
 * @{
 *)

(**
 * Obtain a constant value referring to the null instance of a type.
 *
 * @see llvm::Constant::getNullValue()
 *)
function LLVMConstNull(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain a constant value referring to the instance of a type
 * consisting of all ones.
 *
 * This is only valid for integer types.
 *
 * @see llvm::Constant::getAllOnesValue()
 *)
function LLVMConstAllOnes(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain a constant value referring to an undefined value of a type.
 *
 * @see llvm::UndefValue::get()
 *)
function LLVMGetUndef(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Determine whether a value instance is null.
 *
 * @see llvm::Constant::isNullValue()
 *)
function LLVMIsNull(Val: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

(**
 * Obtain a constant that is a constant pointer pointing to NULL for a
 * specified type.
 *)
function LLVMConstPointerNull(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * @defgroup LLVMCCoreValueConstantScalar Scalar constants
 *
 * Functions in this group model LLVMValueRef instances that correspond
 * to constants referring to scalar types.
 *
 * For integer types, the LLVMTypeRef parameter should correspond to a
 * llvm::IntegerType instance and the returned LLVMValueRef will
 * correspond to a llvm::ConstantInt.
 *
 * For floating point types, the LLVMTypeRef returned corresponds to a
 * llvm::ConstantFP.
 *
 * @{
 *)

(**
 * Obtain a constant value for an integer type.
 *
 * The returned value corresponds to a llvm::ConstantInt.
 *
 * @see llvm::ConstantInt::get()
 *
 * @param IntTy Integer type to obtain value of.
 * @param N The value the returned instance should refer to.
 * @param SignExtend Whether to sign extend the produced value.
 *)
function LLVMConstInt(IntTy: TLLVMTypeRef; N: UInt64; SignExtend: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntOfArbitraryPrecision(IntTy: TLLVMTypeRef; NumWords: Cardinal; Words: PUInt64): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntOfString(IntTy: TLLVMTypeRef; const Text: PLLVMChar; Radix: Byte): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntOfStringAndSize(IntTy: TLLVMTypeRef; const Text: PLLVMChar; SLen: Cardinal; Radix: Byte): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstReal(RealTy: TLLVMTypeRef; N: Double): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstRealOfString(RealTy: TLLVMTypeRef; const Text: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstRealOfStringAndSize(RealTy: TLLVMTypeRef; const Text: PLLVMChar; SLen: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntGetZExtValue(ConstantVal: TLLVMValueRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMConstIntGetSExtValue(ConstantVal: TLLVMValueRef): Int64; cdecl; external CLLVMLibrary;

function LLVMConstRealGetDouble(ConstantVal: TLLVMValueRef; out losesInfo: LongBool): Double; cdecl; external CLLVMLibrary;

function LLVMConstStringInContext(C: TLLVMContextRef; const Str: PLLVMChar; Length: Cardinal; DontNullTerminate: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstString(const Str: PLLVMChar; Length: Cardinal; DontNullTerminate: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMIsConstantString(c: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMGetAsString(c: TLLVMValueRef; out Length: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMConstStructInContext(C: TLLVMContextRef; ConstantVals: PLLVMValueRef; Count: Cardinal; IsPacked: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstStruct(ConstantVals: PLLVMValueRef; Count: Cardinal; IsPacked: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

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
function LLVMConstIntCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef; isSigned: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstFPCast(ConstantVal: TLLVMValueRef; ToType: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstSelect(ConstantCondition: TLLVMValueRef; ConstantIfTrue: TLLVMValueRef; ConstantIfFalse: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstExtractElement(VectorConstant: TLLVMValueRef; IndexConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstInsertElement(VectorConstant: TLLVMValueRef; ElementValueConstant: TLLVMValueRef; IndexConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstShuffleVector(VectorAConstant: TLLVMValueRef; VectorBConstant: TLLVMValueRef; MaskConstant: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstExtractValue(AggConstant: TLLVMValueRef; IdxList: PCardinal; NumIdx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstInsertValue(AggConstant: TLLVMValueRef; ElementValueConstant: TLLVMValueRef; IdxList: PCardinal; NumIdx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstInlineAsm(Ty: TLLVMTypeRef; const AsmString: PLLVMChar; const Constraints: PLLVMChar; HasSideEffects: LongBool; IsAlignStack: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBlockAddress(F: TLLVMValueRef; BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetGlobalParent(Global: TLLVMValueRef): TLLVMModuleRef; cdecl; external CLLVMLibrary;
function LLVMIsDeclaration(Global: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
function LLVMGetLinkage(Global: TLLVMValueRef): TLLVMLinkage; cdecl; external CLLVMLibrary;
procedure LLVMSetLinkage(Global: TLLVMValueRef; Linkage: TLLVMLinkage); cdecl; external CLLVMLibrary;
function LLVMGetSection(Global: TLLVMValueRef): PLLVMChar; cdecl; external CLLVMLibrary;
procedure LLVMSetSection(Global: TLLVMValueRef; const Section: PLLVMChar); cdecl; external CLLVMLibrary;
function LLVMGetVisibility(Global: TLLVMValueRef): TLLVMVisibility; cdecl; external CLLVMLibrary;
procedure LLVMSetVisibility(Global: TLLVMValueRef; Viz: TLLVMVisibility); cdecl; external CLLVMLibrary;
function LLVMGetDLLStorageClass(Global: TLLVMValueRef): TLLVMDLLStorageClass; cdecl; external CLLVMLibrary;
procedure LLVMSetDLLStorageClass(Global: TLLVMValueRef; StorageClass: TLLVMDLLStorageClass); cdecl; external CLLVMLibrary;
function LLVMHasUnnamedAddr(Global: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
procedure LLVMSetUnnamedAddr(Global: TLLVMValueRef; HasUnnamedAddr: LongBool); cdecl; external CLLVMLibrary;

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
function LLVMIsThreadLocal(GlobalVar: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
procedure LLVMSetThreadLocal(GlobalVar: TLLVMValueRef; IsThreadLocal: LongBool); cdecl; external CLLVMLibrary;
function LLVMIsGlobalConstant(GlobalVar: TLLVMValueRef): LongBool; cdecl external CLLVMLibrary;
procedure LLVMSetGlobalConstant(GlobalVar: TLLVMValueRef; IsConstant: LongBool); cdecl; external CLLVMLibrary;
function LLVMGetThreadLocalMode(GlobalVar: TLLVMValueRef): TLLVMThreadLocalMode; cdecl; external CLLVMLibrary;
procedure LLVMSetThreadLocalMode(GlobalVar: TLLVMValueRef; Mode: TLLVMThreadLocalMode); cdecl; external CLLVMLibrary;
function LLVMIsExternallyInitialized(GlobalVar: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
procedure LLVMSetExternallyInitialized(GlobalVar: TLLVMValueRef; IsExtInit: LongBool); cdecl; external CLLVMLibrary;

(**
 * @}
 */

/**
 * @defgroup LLVMCoreValueConstantGlobalAlias Global Aliases
 *
 * This group contains function that operate on global alias values.
 *
 * @see llvm::GlobalAlias
 *
 * @{
 *)
function LLVMAddAlias(M: TLLVMModuleRef; Ty: TLLVMTypeRef; Aliasee: TLLVMValueRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain a GlobalAlias value from a Module by its name.
 *
 * The returned value corresponds to a llvm::GlobalAlias value.
 *
 * @see llvm::Module::getNamedAlias()
 *)
function  LLVMGetNamedGlobalAlias(M: TLLVMModuleRef;const Name: PLLVMChar; NameLen: TLLVMSizeT): TLLVMValueRef;cdecl; external CLLVMLibrary;

(**
 * Obtain an iterator to the first GlobalAlias in a Module.
 *
 * @see llvm::Module::alias_begin()
 *)
function LLVMGetFirstGlobalAlias(M: TLLVMModuleRef): TLLVMValueRef;cdecl; external CLLVMLibrary;

(**
 * Obtain an iterator to the last GlobalAlias in a Module.
 *
 * @see llvm::Module::alias_end()
 *)
function LLVMGetLastGlobalAlias(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Advance a GlobalAlias iterator to the next GlobalAlias.
 *
 * Returns NULL if the iterator was already at the end and there are no more
 * global aliases.
 *)
function LLVMGetNextGlobalAlias(GA: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Decrement a GlobalAlias iterator to the previous GlobalAlias.
 *
 * Returns NULL if the iterator was already at the beginning and there are
 * no previous global aliases.
 *)
function  LLVMGetPreviousGlobalAlias(GA: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Retrieve the target value of an alias.
 *)
function LLVMAliasGetAliasee(Alias: TLLVMValueRef): TLLVMValueRef;  cdecl; external CLLVMLibrary;

(**
 * Set the target value of an alias.
 *)
procedure LLVMAliasSetAliasee(Alias: TLLVMValueRef; Aliasee: TLLVMValueRef);cdecl; external CLLVMLibrary;

(**
 * @}
 *)

(**
 * @defgroup LLVMCCoreValueFunction Function values
 *
 * Functions in this group operate on LLVMValueRef instances that
 * correspond to llvm::Function instances.
 *
 * @see llvm::Function
 *
 * @{
 *)

(**
 * Remove a function from its containing module and deletes it.
 *
 * @see llvm::Function::eraseFromParent()
 *)
procedure LLVMDeleteFunction(Fn: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Check whether the given function has a personality function.
 *
 * @see llvm::Function::hasPersonalityFn()
 *)
function LLVMHasPersonalityFn(Fn: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

(**
 * Obtain the personality function attached to the function.
 *
 * @see llvm::Function::getPersonalityFn()
 *)
function LLVMGetPersonalityFn(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Set the personality function attached to the function.
 *
 * @see llvm::Function::setPersonalityFn()
 *)
procedure LLVMSetPersonalityFn(Fn: TLLVMValueRef; PersonalityFn: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Obtain the intrinsic ID number which matches the given function name.
 *
 * @see llvm::Function::lookupIntrinsicID()
 *)
function  LLVMLookupIntrinsicID(const Name: PLLVMChar; NameLen: TLLVMSizeT): Cardinal;cdecl; external CLLVMLibrary;

(**
 * Obtain the ID number from a function instance.
 *
 * @see llvm::Function::getIntrinsicID()
 *)
function LLVMGetIntrinsicID(Fn: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Create or insert the declaration of an intrinsic.  For overloaded intrinsics,
 * parameter types must be provided to uniquely identify an overload.
 *
 * @see llvm::Intrinsic::getDeclaration()
 *)
function LLVMGetIntrinsicDeclaration(_Mod : TLLVMModuleRef; ID: Cardinal; ParamTypes: PLLVMTypeRef; ParamCount: TLLVMSizeT): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Retrieves the type of an intrinsic.  For overloaded intrinsics, parameter
 * types must be provided to uniquely identify an overload.
 *
 * @see llvm::Intrinsic::getType()
 *)
function LLVMIntrinsicGetType(Ctx: TLLVMContextRef; ID: Cardinal; ParamTypes: PLLVMTypeRef; ParamCount: TLLVMSizeT): TLLVMTypeRef;  cdecl; external CLLVMLibrary;

(**
 * Retrieves the name of an intrinsic.
 *
 * @see llvm::Intrinsic::getName()
 *)
function LLVMIntrinsicGetName(ID: Cardinal; var NameLength: TLLVMSizeT):PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Copies the name of an overloaded intrinsic identified by a given list of
 * parameter types.
 *
 * Unlike LLVMIntrinsicGetName, the caller is responsible for freeing the
 * returned string.
 *
 * @see llvm::Intrinsic::getName()
 *)
function LLVMIntrinsicCopyOverloadedName(ID : Cardinal; ParamTypes: PLLVMTypeRef; ParamCount: TLLVMSizeT;var NameLength: TLLVMSizeT):PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Obtain if the intrinsic identified by the given ID is overloaded.
 *
 * @see llvm::Intrinsic::isOverloaded()
 *)
function LLVMIntrinsicIsOverloaded(ID: Cardinal): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Obtain the calling function of a function.
 *
 * The returned value corresponds to the LLVMCallConv enumeration.
 *
 * @see llvm::Function::getCallingConv()
 *)
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

(**
 * @}
 */

/**
 * @defgroup LLVMCCoreValueBasicBlock Basic Block
 *
 * A basic block represents a single entry single exit section of code.
 * Basic blocks contain a list of instructions which form the body of
 * the block.
 *
 * Basic blocks belong to functions. They have the type of label.
 *
 * Basic blocks are themselves values. However, the C API models them as
 * LLVMBasicBlockRef.
 *
 * @see llvm::BasicBlock
 *
 * @{
 *)

(**
 * Convert a basic block instance to a value type.
 *)
function LLVMBasicBlockAsValue(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Determine whether an LLVMValueRef is itself a basic block.
 *)
function LLVMValueIsBasicBlock(Val: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

(**
 * Convert an LLVMValueRef to an LLVMBasicBlockRef instance.
 *)
function LLVMValueAsBasicBlock(Val: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the string name of a basic block.
 *)
function LLVMGetBasicBlockName(BB: TLLVMBasicBlockRef): PLLVMChar; cdecl; external CLLVMLibrary;


(**
 * Obtain the function to which a basic block belongs.
 *
 * @see llvm::BasicBlock::getParent()
 *)
function LLVMGetBasicBlockParent(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the terminator instruction for a basic block.
 *
 * If the basic block does not have a terminator (it is not well-formed
 * if it doesn't), then NULL is returned.
 *
 * The returned LLVMValueRef corresponds to an llvm::Instruction.
 *
 * @see llvm::BasicBlock::getTerminator()
 *)
function LLVMGetBasicBlockTerminator(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the number of basic blocks in a function.
 *
 * @param Fn Function value to operate on.
 *)
function LLVMCountBasicBlocks(Fn: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Obtain all of the basic blocks in a function.
 *
 * This operates on a function value. The BasicBlocks parameter is a
 * pointer to a pre-allocated array of LLVMBasicBlockRef of at least
 * LLVMCountBasicBlocks() in length. This array is populated with
 * LLVMBasicBlockRef instances.
 *)
procedure LLVMGetBasicBlocks(Fn: TLLVMValueRef; BasicBlocks: PLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

(**
 * Obtain the first basic block in a function.
 *
 * The returned basic block can be used as an iterator. You will likely
 * eventually call into LLVMGetNextBasicBlock() with it.
 *
 * @see llvm::Function::begin()
 *)
function LLVMGetFirstBasicBlock(Fn: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the last basic block in a function.
 *
 * @see llvm::Function::end()
 *)
function LLVMGetLastBasicBlock(Fn: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Advance a basic block iterator.
 *)
function LLVMGetNextBasicBlock(BB: TLLVMBasicBlockRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Go backwards in a basic block iterator.
 *)
function LLVMGetPreviousBasicBlock(BB: TLLVMBasicBlockRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the basic block that corresponds to the entry point of a
 * function.
 *
 * @see llvm::Function::getEntryBlock()
 *)
function LLVMGetEntryBasicBlock(Fn: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Insert the given basic block after the insertion point of the given builder.
 *
 * The insertion point must be valid.
 *
 * @see llvm::Function::BasicBlockListType::insertAfter()
 *)
procedure LLVMInsertExistingBasicBlockAfterInsertBlock(Builder: TLLVMBuilderRef; BB: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

(**
 * Append the given basic block to the basic block list of the given function.
 *
 * @see llvm::Function::BasicBlockListType::push_back()
 *)
procedure LLVMAppendExistingBasicBlock(Fn: TLLVMValueRef; BB: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

(**
 * Create a new basic block without inserting it into a function.
 *
 * @see llvm::BasicBlock::Create()
 *)
function LLVMCreateBasicBlockInContext(C: TLLVMContextRef; const Name: PLLVMChar): TLLVMBasicBlockRef;  cdecl; external CLLVMLibrary;

(**
 * Append a basic block to the end of a function.
 *
 * @see llvm::BasicBlock::Create()
 *)
function LLVMAppendBasicBlockInContext(C: TLLVMContextRef; Fn: TLLVMValueRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Append a basic block to the end of a function using the global
 * context.
 *
 * @see llvm::BasicBlock::Create()
 *)
function LLVMAppendBasicBlock(Fn: TLLVMValueRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMInsertBasicBlockInContext(C: TLLVMContextRef; BB: TLLVMBasicBlockRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMInsertBasicBlock(InsertBeforeBB: TLLVMBasicBlockRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

procedure LLVMDeleteBasicBlock(BB: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMRemoveBasicBlockFromParent(BB: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMMoveBasicBlockBefore(BB: TLLVMBasicBlockRef; MovePos: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMMoveBasicBlockAfter(BB: TLLVMBasicBlockRef; MovePos: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

(**
 * Obtain the first instruction in a basic block.
 *
 * The returned LLVMValueRef corresponds to a llvm::Instruction
 * instance.
 *)
function LLVMGetFirstInstruction(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the last instruction in a basic block.
 *
 * The returned LLVMValueRef corresponds to an LLVM:Instruction.
 *)
function LLVMGetLastInstruction(BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMHasMetadata(Val: TLLVMValueRef): Integer; cdecl; external CLLVMLibrary;

function LLVMGetMetadata(Val: TLLVMValueRef; KindID: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

procedure LLVMSetMetadata(Val: TLLVMValueRef; KindID: Cardinal; Node: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Returns the metadata associated with an instruction value, but filters out
 * all the debug locations.
 *
 * @see llvm::Instruction::getAllMetadataOtherThanDebugLoc()
 *
 *)
function LLVMInstructionGetAllMetadataOtherThanDebugLoc(Instr: TLLVMValueRef; var NumEntries: TLLVMSizeT):PLLVMValueMetadataEntry;cdecl; external CLLVMLibrary;

(**
 * Obtain the basic block to which an instruction belongs.
 *
 * @see llvm::Instruction::getParent()
 *)
function LLVMGetInstructionParent(Inst: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the instruction that occurs after the one specified.
 *
 * The next instruction will be from the same basic block.
 *
 * If this is the last instruction in a basic block, NULL will be
 * returned.
 *)
function LLVMGetNextInstruction(Inst: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the instruction that occurred before this one.
 *
 * If the instruction is the first instruction in a basic block, NULL
 * will be returned.
 *)
function LLVMGetPreviousInstruction(Inst: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Remove and delete an instruction.
 *
 * The instruction specified is removed from its containing building
 * block but is kept alive.
 *
 * @see llvm::Instruction::removeFromParent()
 *)
procedure LLVMInstructionRemoveFromParent(Inst: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Remove and delete an instruction.
 *
 * The instruction specified is removed from its containing building
 * block and then deleted.
 *
 * @see llvm::Instruction::eraseFromParent()
 *)
procedure LLVMInstructionEraseFromParent(Inst: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Obtain the code opcode for an individual instruction.
 *
 * @see llvm::Instruction::getOpCode()
 *)
function LLVMGetInstructionOpcode(Inst: TLLVMValueRef): TLLVMOpcode; cdecl; external CLLVMLibrary;

(**
 * Obtain the predicate of an instruction.
 *
 * This is only valid for instructions that correspond to llvm::ICmpInst
 * or llvm::ConstantExpr whose opcode is llvm::Instruction::ICmp.
 *
 * @see llvm::ICmpInst::getPredicate()
 *)
function LLVMGetICmpPredicate(Inst: TLLVMValueRef): TLLVMIntPredicate; cdecl; external CLLVMLibrary;

(**
 * Obtain the float predicate of an instruction.
 *
 * This is only valid for instructions that correspond to llvm::FCmpInst
 * or llvm::ConstantExpr whose opcode is llvm::Instruction::FCmp.
 *
 * @see llvm::FCmpInst::getPredicate()
 *)
function LLVMGetFCmpPredicate(Inst: TLLVMValueRef): TLLVMRealPredicate; cdecl; external CLLVMLibrary;

(**
 * Create a copy of 'this' instruction that is identical in all ways
 * except the following:
 *   * The instruction has no parent
 *   * The instruction has no name
 *
 * @see llvm::Instruction::clone()
 *)
function LLVMInstructionClone(Inst: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Determine whether an instruction is a terminator. This routine is named to
 * be compatible with historical functions that did this by querying the
 * underlying C++ type.
 *
 * @see llvm::Instruction::isTerminator()
 *)
function  LLVMIsATerminatorInst(Inst: TLLVMValueRef):TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * @defgroup LLVMCCoreValueInstructionCall Call Sites and Invocations
 *
 * Functions in this group apply to instructions that refer to call
 * sites and invocations. These correspond to C++ types in the
 * llvm::CallInst class tree.
 *
 * @{
 *)

(**
 * Obtain the argument count for a call instruction.
 *
 * This expects an LLVMValueRef that corresponds to a llvm::CallInst,
 * llvm::InvokeInst, or llvm:FuncletPadInst.
 *
 * @see llvm::CallInst::getNumArgOperands()
 * @see llvm::InvokeInst::getNumArgOperands()
 * @see llvm::FuncletPadInst::getNumArgOperands()
 *)
function LLVMGetNumArgOperands(Instr: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Set the calling convention for a call instruction.
 *
 * This expects an LLVMValueRef that corresponds to a llvm::CallInst or
 * llvm::InvokeInst.
 *
 * @see llvm::CallInst::setCallingConv()
 * @see llvm::InvokeInst::setCallingConv()
 *)
procedure LLVMSetInstructionCallConv(Instr: TLLVMValueRef; CC: Cardinal); cdecl; external CLLVMLibrary;

(**
 * Obtain the calling convention for a call instruction.
 *
 * This is the opposite of LLVMSetInstructionCallConv(). Reads its
 * usage.
 *
 * @see LLVMSetInstructionCallConv()
 *)
function LLVMGetInstructionCallConv(Instr: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMSetInstrParamAlignment(Instr: TLLVMValueRef; index: Cardinal; Align: Cardinal); cdecl; external CLLVMLibrary;

procedure LLVMAddCallSiteAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; A: TLLVMAttributeRef); cdecl; external CLLVMLibrary;
function LLVMGetCallSiteAttributeCount(C: TLLVMValueRef; Idx: TLLVMAttributeIndex): Cardinal; cdecl; external CLLVMLibrary;
procedure LLVMGetCallSiteAttributes(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; Attrs: PLLVMAttributeRef); cdecl; external CLLVMLibrary;
function LLVMGetCallSiteEnumAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; KindID: Cardinal): TLLVMAttributeRef; cdecl; external CLLVMLibrary;
function LLVMGetCallSiteStringAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; const K: PLLVMChar; KLen: Cardinal): TLLVMAttributeRef; cdecl; external CLLVMLibrary;
procedure LLVMRemoveCallSiteEnumAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; KindID: Cardinal); cdecl; external CLLVMLibrary;
procedure LLVMRemoveCallSiteStringAttribute(C: TLLVMValueRef; Idx: TLLVMAttributeIndex; const K: PLLVMChar; KLen: Cardinal); cdecl; external CLLVMLibrary;

(**
 * Obtain the function type called by this instruction.
 *
 * @see llvm::CallBase::getFunctionType()
 *)
function LLVMGetCalledFunctionType(C: TLLVMValueRef): TLLVMTypeRef;cdecl; external CLLVMLibrary;

(**
 * Obtain the pointer to the function invoked by this instruction.
 *
 * This expects an LLVMValueRef that corresponds to a llvm::CallInst or
 * llvm::InvokeInst.
 *
 * @see llvm::CallInst::getCalledValue()
 * @see llvm::InvokeInst::getCalledValue()
 *)
function LLVMGetCalledValue(Instr: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMIsTailCall(CallInst: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

procedure LLVMSetTailCall(CallInst: TLLVMValueRef; IsTailCall: LongBool); cdecl; external CLLVMLibrary;

function LLVMGetNormalDest(InvokeInst: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetUnwindDest(InvokeInst: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

procedure LLVMSetNormalDest(InvokeInst: TLLVMValueRef; B: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMSetUnwindDest(InvokeInst: TLLVMValueRef; B: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

(**
 * @}
 *)

(**
 * @defgroup LLVMCCoreValueInstructionTerminator Terminators
 *
 * Functions in this group only apply to instructions for which
 * LLVMIsATerminatorInst returns true.
 *
 *
 *)

(*
 * Return the number of successors that this terminator has.
 *
 * @see llvm::Instruction::getNumSuccessors
 *)
function LLVMGetNumSuccessors(Term: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Return the specified successor.
 *
 * @see llvm::Instruction::getSuccessor
 *)
function LLVMGetSuccessor(Term: TLLVMValueRef; i: Cardinal): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Update the specified successor to point at the provided block.
 *
 * @see llvm::Instruction::setSuccessor
 *)
procedure LLVMSetSuccessor(Term: TLLVMValueRef; i: Cardinal; block: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

(**
 * Return if a branch is conditional.
 *
 * This only works on llvm::BranchInst instructions.
 *
 * @see llvm::BranchInst::isConditional
 *)
function LLVMIsConditional(Branch: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

(**
 * Return the condition of a branch instruction.
 *
 * This only works on llvm::BranchInst instructions.
 *
 * @see llvm::BranchInst::getCondition
 *)
function LLVMGetCondition(Branch: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Set the condition of a branch instruction.
 *
 * This only works on llvm::BranchInst instructions.
 *
 * @see llvm::BranchInst::setCondition
 *)
procedure LLVMSetCondition(Branch: TLLVMValueRef; Cond: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Obtain the default destination basic block of a switch instruction.
 *
 * This only works on llvm::SwitchInst instructions.
 *
 * @see llvm::SwitchInst::getDefaultDest()
 *)
function LLVMGetSwitchDefaultDest(SwitchInstr: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * @}
 *)

(**
 * @defgroup LLVMCCoreValueInstructionAlloca Allocas
 *
 * Functions in this group only apply to instructions that map to
 * llvm::AllocaInst instances.
 *
 * @{
 *)

(**
 * Obtain the type that is being allocated by the alloca instruction.
 *)
function LLVMGetAllocatedType(Alloca: TLLVMValueRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * @}
 *)

(**
 * @defgroup LLVMCCoreValueInstructionGetElementPointer GEPs
 *
 * Functions in this group only apply to instructions that map to
 * llvm::GetElementPtrInst instances.
 *
 * @{
 *)

(**
 * Check whether the given GEP instruction is inbounds.
 *)
function LLVMIsInBounds(GEP: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

(**
 * Set the given GEP instruction to be inbounds or not.
 *)
procedure LLVMSetIsInBounds(GEP: TLLVMValueRef; InBounds: LongBool); cdecl; external CLLVMLibrary;

(**
 * @}
 *)

(**
 * @defgroup LLVMCCoreValueInstructionPHINode PHI Nodes
 *
 * Functions in this group only apply to instructions that map to
 * llvm::PHINode instances.
 *
 * @{
 *)

(**
 * Add an incoming value to the end of a PHI list.
 *)
procedure LLVMAddIncoming(PhiNode: TLLVMValueRef; IncomingValues: PLLVMValueRef; IncomingBlocks: PLLVMBasicBlockRef; Count: Cardinal); cdecl; external CLLVMLibrary;

(**
 * Obtain the number of incoming basic blocks to a PHI node.
 *)
function LLVMCountIncoming(PhiNode: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Obtain an incoming value to a PHI node as an LLVMValueRef.
 *)
function LLVMGetIncomingValue(PhiNode: TLLVMValueRef; Index: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain an incoming value to a PHI node as an LLVMBasicBlockRef.
 *)
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

{/* Metadata */}

(**
 * Get location information used by debugging information.
 *
 * @see llvm::IRBuilder::getCurrentDebugLocation()
 *)
function LLVMGetCurrentDebugLocation2(Builder: TLLVMBuilderRef ):TLLVMMetadataRef;cdecl; external CLLVMLibrary;

(**
 * Set location information used by debugging information.
 *
 * To clear the location metadata of the given instruction, pass NULL to \p Loc.
 *
 * @see llvm::IRBuilder::SetCurrentDebugLocation()
 *)
procedure LLVMSetCurrentDebugLocation2(Builder: TLLVMBuilderRef; Loc: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

procedure LLVMSetCurrentDebugLocation(Builder: TLLVMBuilderRef; L: TLLVMValueRef); cdecl; external CLLVMLibrary;
function  LLVMGetCurrentDebugLocation(Builder: TLLVMBuilderRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
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
function LLVMIsCleanup(LandingPad: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
procedure LLVMSetCleanup(LandingPad: TLLVMValueRef; Val: LongBool); cdecl; external CLLVMLibrary;

{/* Add a destination to the catchswitch instruction */}
procedure LLVMAddHandler(CatchSwitch: TLLVMValueRef; Dest: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

{/* Get the number of handlers on the catchswitch instruction */}
function LLVMGetNumHandlers(CatchSwitch: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Obtain the basic blocks acting as handlers for a catchswitch instruction.
 *
 * The Handlers parameter should point to a pre-allocated array of
 * LLVMBasicBlockRefs at least LLVMGetNumHandlers() large. On return, the
 * first LLVMGetNumHandlers() entries in the array will be populated
 * with LLVMBasicBlockRef instances.
 *
 * @param CatchSwitch The catchswitch instruction to operate on.
 * @param Handlers Memory address of an array to be filled with basic blocks.
 *)
procedure LLVMGetHandlers(CatchSwitch: TLLVMValueRef; Handlers: PLLVMBasicBlockRef);cdecl; external CLLVMLibrary;

{/* Funclets */}

{/* Get the number of funcletpad arguments. */}
function LLVMGetArgOperand(Funclet: TLLVMValueRef; i: Cardinal): TLLVMValueRef;cdecl; external CLLVMLibrary;

{/* Set a funcletpad argument at the given index. */}
procedure  LLVMSetArgOperand(Funclet: TLLVMValueRef; i: Cardinal; value: TLLVMValueRef);cdecl; external CLLVMLibrary;

(**
 * Get the parent catchswitch instruction of a catchpad instruction.
 *
 * This only works on llvm::CatchPadInst instructions.
 *
 * @see llvm::CatchPadInst::getCatchSwitch()
 *)
function LLVMGetParentCatchSwitch(CatchPad: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Set the parent catchswitch instruction of a catchpad instruction.
 *
 * This only works on llvm::CatchPadInst instructions.
 *
 * @see llvm::CatchPadInst::setCatchSwitch()
 *)
procedure LLVMSetParentCatchSwitch(CatchPad: TLLVMValueRef; CatchSwitch: TLLVMValueRef);cdecl; external CLLVMLibrary;

{/* Arithmetic */}
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

{/* Memory */}
function LLVMBuildMalloc(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildArrayMalloc(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Creates and inserts a memset to the specified pointer and the
 * specified value.
 *
 * @see llvm::IRRBuilder::CreateMemSet()
 *)
function  LLVMBuildMemSet(B: TLLVMBuilderRef; Ptr: TLLVMValueRef; Val: TLLVMValueRef; Len: TLLVMValueRef; Align: Cardinal): TLLVMValueRef;cdecl; external CLLVMLibrary;
(**
 * Creates and inserts a memcpy between the specified pointers.
 *
 * @see llvm::IRRBuilder::CreateMemCpy()
 *)
function LLVMBuildMemCpy(B  : TLLVMBuilderRef;
                         Dst:  TLLVMValueRef; DstAlign: Cardinal;
                         Src:  TLLVMValueRef; SrcAlign: Cardinal;
                         Size: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
(**
 * Creates and inserts a memmove between the specified pointers.
 *
 * @see llvm::IRRBuilder::CreateMemMove()
 *)
function LLVMBuildMemMove(B: TLLVMBuilderRef; Dst: TLLVMValueRef; DstAlign: Cardinal; Src: TLLVMValueRef; SrcAlign: Cardinal; Size: TLLVMValueRef):TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMBuildAlloca     (Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef;                     Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildArrayAlloca(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFree(Arg0: TLLVMBuilderRef; PointerVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
// LLVMBuildLoad is deprecated in favor of LLVMBuildLoad2, in preparation for opaque pointer types.
function LLVMBuildLoad(Arg0: TLLVMBuilderRef; PointerVal: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildLoad2(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; PointerVal: TLLVMValueRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMBuildStore(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; Ptr: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMBuildGEP          (B: TLLVMBuilderRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef; NumIndices: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildInBoundsGEP  (B: TLLVMBuilderRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef; NumIndices: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildStructGEP    (B: TLLVMBuilderRef; Pointer: TLLVMValueRef; Idx: Cardinal;                                Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function  LLVMBuildGEP2        (B: TLLVMBuilderRef; Ty: TLLVMTypeRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef;  NumIndices: Cardinal; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function  LLVMBuildInBoundsGEP2(B: TLLVMBuilderRef; Ty: TLLVMTypeRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef;  NumIndices: Cardinal; const Name: PLLVMChar): TLLVMValueRef;  cdecl; external CLLVMLibrary;
function  LLVMBuildStructGEP2  (B: TLLVMBuilderRef; Ty: TLLVMTypeRef; Pointer: TLLVMValueRef; Idx: Cardinal;                                 const Name: PLLVMChar): TLLVMValueRef;cdecl; external CLLVMLibrary;

function LLVMBuildGlobalString(B: TLLVMBuilderRef; Str: PLLVMChar; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildGlobalStringPtr(B: TLLVMBuilderRef; Str: PLLVMChar; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetVolatile(MemoryAccessInst: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
procedure LLVMSetVolatile(MemoryAccessInst: TLLVMValueRef; IsVolatile: LongBool); cdecl; external CLLVMLibrary;
function LLVMGetOrdering(MemoryAccessInst: TLLVMValueRef): TLLVMAtomicOrdering; cdecl; external CLLVMLibrary;
procedure LLVMSetOrdering(MemoryAccessInst: TLLVMValueRef; Ordering: TLLVMAtomicOrdering); cdecl; external CLLVMLibrary;

{/* Casts */}
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

{/* Comparisons */}
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
function LLVMBuildFence(B: TLLVMBuilderRef; ordering: TLLVMAtomicOrdering; singleThread: LongBool; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAtomicRMW(B: TLLVMBuilderRef; op: TLLVMAtomicRMWBinOp; PTR: TLLVMValueRef; Val: TLLVMValueRef; ordering: TLLVMAtomicOrdering; singleThread: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAtomicCmpXchg(B: TLLVMBuilderRef; Ptr: TLLVMValueRef; Cmp: TLLVMValueRef; New: TLLVMValueRef; SuccessOrdering: TLLVMAtomicOrdering; FailureOrdering: TLLVMAtomicOrdering; SingleThread: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMIsAtomicSingleThread(AtomicInst: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
procedure LLVMSetAtomicSingleThread(AtomicInst: TLLVMValueRef; SingleThread: LongBool); cdecl; external CLLVMLibrary;
function LLVMGetCmpXchgSuccessOrdering(CmpXchgInst: TLLVMValueRef): TLLVMAtomicOrdering; cdecl; external CLLVMLibrary;
procedure LLVMSetCmpXchgSuccessOrdering(CmpXchgInst: TLLVMValueRef; Ordering: TLLVMAtomicOrdering); cdecl; external CLLVMLibrary;
function LLVMGetCmpXchgFailureOrdering(CmpXchgInst: TLLVMValueRef): TLLVMAtomicOrdering; cdecl; external CLLVMLibrary;
procedure LLVMSetCmpXchgFailureOrdering(CmpXchgInst: TLLVMValueRef; Ordering: TLLVMAtomicOrdering); cdecl; external CLLVMLibrary;

function LLVMCreateModuleProviderForExistingModule(M: TLLVMModuleRef): TLLVMModuleProviderRef; cdecl; external CLLVMLibrary;
procedure LLVMDisposeModuleProvider(M: TLLVMModuleProviderRef); cdecl; external CLLVMLibrary;
function LLVMCreateMemoryBufferWithContentsOfFile(Path: PLLVMChar; out OutMemBuf: TLLVMMemoryBufferRef; out OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMCreateMemoryBufferWithSTDIN(out OutMemBuf: TLLVMMemoryBufferRef; out OutMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;
function LLVMCreateMemoryBufferWithMemoryRange(InputData: PLLVMChar; InputDataLength: TLLVMSizeT; BufferName: PLLVMChar; RequiresNullTerminator: LongBool): TLLVMMemoryBufferRef; cdecl; external CLLVMLibrary;
function LLVMCreateMemoryBufferWithMemoryRangeCopy(InputData: PLLVMChar; InputDataLength: TLLVMSizeT; BufferName: PLLVMChar): TLLVMMemoryBufferRef; cdecl; external CLLVMLibrary;
function LLVMGetBufferStart(MemBuf: TLLVMMemoryBufferRef): PLLVMChar; cdecl; external CLLVMLibrary;
function LLVMGetBufferSize(MemBuf: TLLVMMemoryBufferRef): TLLVMSizeT; cdecl; external CLLVMLibrary;
procedure LLVMDisposeMemoryBuffer(MemBuf: TLLVMMemoryBufferRef); cdecl; external CLLVMLibrary;
function LLVMGetGlobalPassRegistry: TLLVMPassRegistryRef; cdecl; external CLLVMLibrary;

(**
 * @}
 *)

(**
 * @defgroup LLVMCCorePassManagers Pass Managers
 *
 * @{
 *)

(** Constructs a new whole-module pass pipeline. This type of pipeline is
    suitable for link-time optimization and whole-module transformations.
    @see llvm::PassManager::PassManager *)
function LLVMCreatePassManager: TLLVMPassManagerRef; cdecl; external CLLVMLibrary;

(** Constructs a new function-by-function pass pipeline over the module
    provider. It does not take ownership of the module provider. This type of
    pipeline is suitable for code generation and JIT compilation tasks.
    @see llvm::FunctionPassManager::FunctionPassManager *)
function LLVMCreateFunctionPassManagerForModule(M: TLLVMModuleRef): TLLVMPassManagerRef; cdecl; external CLLVMLibrary;

{/** Deprecated: Use LLVMCreateFunctionPassManagerForModule instead. */}
function LLVMCreateFunctionPassManager(MP: TLLVMModuleProviderRef): TLLVMPassManagerRef; cdecl; external CLLVMLibrary;

(** Initializes, executes on the provided module, and finalizes all of the
    passes scheduled in the pass manager. Returns 1 if any of the passes
    modified the module, 0 otherwise.
    @see llvm::PassManager::run(Module&) *)
function LLVMRunPassManager(PM: TLLVMPassManagerRef; M: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary;

(** Initializes all of the function passes scheduled in the function pass
    manager. Returns 1 if any of the passes modified the module, 0 otherwise.
    @see llvm::FunctionPassManager::doInitialization *)
function LLVMInitializeFunctionPassManager(FPM: TLLVMPassManagerRef): TLLVMBool; cdecl; external CLLVMLibrary;

(** Executes all of the function passes scheduled in the function pass manager
    on the provided function. Returns 1 if any of the passes modified the
    function, false otherwise.
    @see llvm::FunctionPassManager::run(Function&) *)
function LLVMRunFunctionPassManager(FPM: TLLVMPassManagerRef; F: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

(** Finalizes all of the function passes scheduled in the function pass
    manager. Returns 1 if any of the passes modified the module, 0 otherwise.
    @see llvm::FunctionPassManager::doFinalization *)
function LLVMFinalizeFunctionPassManager(FPM: TLLVMPassManagerRef): TLLVMBool; cdecl; external CLLVMLibrary;

(** Frees the memory of a pass pipeline. For function pipelines, does not free
    the module provider.
    @see llvm::PassManagerBase::~PassManagerBase. *)
procedure LLVMDisposePassManager(PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

(** Deprecated: Multi-threading can only be enabled/disabled with the compile
    time define LLVM_ENABLE_THREADS.  This function always returns
    LLVMIsMultithreaded(). *)
function LLVMStartMultithreaded: TLLVMBool;cdecl; external CLLVMLibrary;

(** Deprecated: Multi-threading can only be enabled/disabled with the compile
    time define LLVM_ENABLE_THREADS. *)
procedure LLVMStopMultithreaded; cdecl; external CLLVMLibrary;

(** Check whether LLVM is executing in thread-safe mode or not.
    @see llvm::llvm_is_multithreaded *)
function LLVMIsMultithreaded: LongBool; cdecl; external CLLVMLibrary;

// Added by Max 13/09/2019 17:22:45
(** Return the function this instruction belongs to.
 *
 * Note: it is undefined behavior to call this on an instruction not
 * currently inserted into a function.  see : const Function *llvm::getFunction()
 *)
function LLVMGetInstructionFunc(Inst: TLLVMValueRef):TLLVMValueRef;
function LLVMGetCallFromFunc(F: TLLVMValueRef ; nameCall : AnsiString): TLLVMValueRef;
function LLVMGetUsesVal(val : TLLVMValueRef): TArray<TLLVMValueRef> ;
function LLVMGetNextNonDebugInstruction(I: TLLVMValueRef): TLLVMValueRef;
function LLVMGetPrevNonDebugInstruction(I: TLLVMValueRef): TLLVMValueRef;
function LLVMDumpValueToStr(v:TLLVMValueRef) : AnsiString;
function LLVMGetgetFirstInsertionPt(block: TLLVMBasicBlockRef): TLLVMValueRef;
function LLVMGetFunctionInstructions(F: TLLVMValueRef): TArray<TLLVMValueRef>;
procedure LLVMPositionBuilderAfter(Builder: TLLVMBuilderRef; Instr: TLLVMValueRef);
procedure LLVMAddAttr(F: TLLVMValueRef; sAttr: AnsiString);
procedure LLVMRemoveAttr(F: TLLVMValueRef; sAttr: AnsiString);

implementation
    uses System.SysUtils;

function LLVMGetInstructionFunc(Inst: TLLVMValueRef):TLLVMValueRef;
begin
    Result.Value := nil;

    var bb : TLLVMBasicBlockRef := LLVMGetInstructionParent(Inst);

    Result := LLVMGetBasicBlockParent(bb) ;
end;

function LLVMGetUsesVal(val : TLLVMValueRef): TArray<TLLVMValueRef> ;
begin
    Result := [];

     var U : TLLVMUseRef := LLVMGetFirstUse(val);
     while U.IsValid do
     begin
         Result := Result + [ LLVMGetUser(U) ] ;

         U  := LLVMGetNextUse(U);
     end;
end;

function LLVMGetNextNonDebugInstruction(I: TLLVMValueRef): TLLVMValueRef;
var
  rI : TLLVMValueRef;
begin
     Result := default(TLLVMValueRef);

     rI := LLVMGetNextInstruction(I);

     while rI.IsValid do
     begin
         if LLVMIsADbgInfoIntrinsic(rI).IsValid = False then
           Exit(rI);

         rI := LLVMGetNextInstruction(I);
     end;
end;

function LLVMGetPrevNonDebugInstruction(I: TLLVMValueRef): TLLVMValueRef;
var
  rI : TLLVMValueRef;
begin
     Result := default(TLLVMValueRef);

     rI := LLVMGetPreviousInstruction(I);

     while rI.IsValid do
     begin
         if LLVMIsADbgInfoIntrinsic(rI).IsValid = False then
           Exit(rI);

         rI := LLVMGetPreviousInstruction(I);
     end;
end;

function LLVMDumpValueToStr(v:TLLVMValueRef) : AnsiString;
var
  pDump : PAnsiChar;
begin
    pDump := LLVMPrintValueToString(v);
    try
      Result := AnsiString(pDump) ;
    finally
      LLVMDisposeMessage(pDump);
    end;
end;

function LLVMGetgetFirstInsertionPt(block: TLLVMBasicBlockRef): TLLVMValueRef;
var
  I,IPhi : TLLVMValueRef;

  // Return true if the instruction is a variety of EH-block.
  function  isEHPad(Inst: TLLVMValueRef): Boolean;
  begin
      case LLVMGetInstructionOpcode(Inst) of
         LLVMCatchSwitch,
         LLVMCatchPad,
         LLVMCleanupPad,
         LLVMLandingPad : Result := True;
        else
           Result := False;
      end;
  end;

begin
    Result := default(TLLVMValueRef);

    I := LLVMGetFirstInstruction(block) ;

    while I.IsValid do
    begin
        IPhi := LLVMIsAPHINode(I);

        if (not IPhi.IsValid) and (not isEHPad(I)) then
          Exit(I);

        I := LLVMGetNextInstruction(I)
    end;
end;

function LLVMGetFunctionInstructions(F: TLLVMValueRef): TArray<TLLVMValueRef>;
begin
     Result := [];

     var BB : TLLVMBasicBlockRef := LLVMGetEntryBasicBlock(F);

     while BB.IsValid do
     begin
         var I : TLLVMValueRef := LLVMGetFirstInstruction(BB);

         while I.IsValid do
         begin
            Result := Result + [ I ];

            I := LLVMGetNextInstruction(I) ;
         end;

         BB := LLVMGetNextBasicBlock(BB)
     end;
end;

function LLVMGetCallFromFunc(F: TLLVMValueRef ; nameCall : AnsiString): TLLVMValueRef;
var
  CallI: TLLVMValueRef;
  lstI : TArray<TLLVMValueRef> ;
  i    : Integer;
begin
    Result.Value := nil;

    lstI :=  LLVMGetFunctionInstructions(F);

    for i :=0 to High(lstI) do
    begin
        CallI := LLVMIsACallInst(lstI[i]);

        if (CallI.IsValid) then
        begin
            var s : AnsiString := LLVMGetValueName(LLVMGetCalledValue(CallI));
            if s  = nameCall then
            begin
                Result :=  LLVMIsACallInst(lstI[i]);
                Break;
            end;
        end;
    end;

end;

procedure LLVMPositionBuilderAfter(Builder: TLLVMBuilderRef; Instr: TLLVMValueRef);
begin
    if not LLVMIsAInstruction(Instr).IsValid then
      raise Exception.Create('it is not a valid instruction');

    if LLVMIsATerminatorInst(Instr).IsValid then
    begin
        var bb : TLLVMBasicBlockRef := LLVMGetInstructionParent(Instr) ;
        LLVMPositionBuilderAtEnd(Builder,bb);
    end;

    var ISucc : TLLVMValueRef := LLVMGetNextInstruction(Instr);
    LLVMPositionBuilderBefore(Builder,ISucc);

end;

procedure LLVMAddAttr(F: TLLVMValueRef; sAttr: AnsiString);
var
  KindID : cardinal;
  vattr : TLLVMAttributeRef;
begin
    sAttr := LowerCase( string(sAttr));
    KindID := LLVMGetEnumAttributeKindForName( PAnsiChar(sAttr),Length(sAttr));
    vattr := LLVMCreateEnumAttribute( LLVMGetGlobalContext, KindID, 0);
    LLVMAddAttributeAtIndex(F, LLVMAttributeFunctionIndex, vattr) ;


end;

procedure LLVMRemoveAttr(F: TLLVMValueRef; sAttr: AnsiString);
var
  KindID : cardinal;
  vattr : TLLVMAttributeRef;
begin
    sAttr := LowerCase( string(sAttr));
    KindID := LLVMGetEnumAttributeKindForName( PAnsiChar(sAttr),Length(sAttr));
    LLVMRemoveEnumAttributeAtIndex(F,LLVMAttributeFunctionIndex,KindID);
end;

end.
