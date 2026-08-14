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
    LLVMPtrToAddr      = 69,
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
    LLVMFreeze         = 68,

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
    LLVMVoidTypeKind            = 0,  //**< type with no size */
    LLVMHalfTypeKind            = 1,  //**< 16 bit floating point type */
    LLVMFloatTypeKind           = 2,  //**< 32 bit floating point type */
    LLVMDoubleTypeKind          = 3,  //**< 64 bit floating point type */
    LLVMX86_FP80TypeKind        = 4,  //**< 80 bit floating point type (X87) */
    LLVMFP128TypeKind           = 5,  //**< 128 bit floating point type (112-bit mantissa)*/
    LLVMPPC_FP128TypeKind       = 6,  //**< 128 bit floating point type (two 64-bits) */
    LLVMLabelTypeKind           = 7,  //**< Labels */
    LLVMIntegerTypeKind         = 8,  //**< Arbitrary bit width integers */
    LLVMFunctionTypeKind        = 9,  //**< Functions */
    LLVMStructTypeKind          = 10, //**< Structures */
    LLVMArrayTypeKind           = 11, //**< Arrays */
    LLVMPointerTypeKind         = 12, //**< Pointers */
    LLVMVectorTypeKind          = 13, //**< SIMD 'packed' format, or other vector type */
    LLVMMetadataTypeKind        = 14, //**< Metadata */
    {LLVMX86_MMXTypeKind        = 15,}//**<15 previously used by LLVMX86_MMXTypeKind */
    LLVMTokenTypeKind           = 16, //**< Tokens */
    LLVMScalableVectorTypeKind  = 17, //**< Scalable SIMD vector type */
    LLVMBFloatTypeKind          = 18, //**< 16 bit brain floating point type */
    LLVMX86_AMXTypeKind         = 19, //**< X86 AMX */
    LLVMTargetExtTypeKind       = 20  //**< Target extension type */
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

    LLVMInstructionValueKind,
    LLVMPoisonValueValueKind,
    LLVMConstantTargetNoneValueKind,
    LLVMConstantPtrAuthValueKind
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
    LLVMAtomicRMWBinOpAdd,  //**< Add a value and return the old one */
    LLVMAtomicRMWBinOpSub,  //**< Subtract a value and return the old one */
    LLVMAtomicRMWBinOpAnd,  //**< And a value and return the old one */
    LLVMAtomicRMWBinOpNand, //**< Not-And a value and return the old one */
    LLVMAtomicRMWBinOpOr,   //**< OR a value and return the old one */
    LLVMAtomicRMWBinOpXor,  //**< Xor a value and return the old one */
    LLVMAtomicRMWBinOpMax,  //**< Sets the value if it's greater than the original using a signed comparison and return the old one */
    LLVMAtomicRMWBinOpMin,  //**< Sets the value if it's Smaller than the original using a signed comparison and return the old one */
    LLVMAtomicRMWBinOpUMax, //**< Sets the value if it's greater than the original using an unsigned comparison and return the old one */
    LLVMAtomicRMWBinOpUMin, //**< Sets the value if it's greater than the original using an unsigned comparison  and return the old one */
    LLVMAtomicRMWBinOpFAdd, //**< Add a floating point value and return the old one */
    LLVMAtomicRMWBinOpFSub,  //**< Subtract a floating point value and return the old one */
    LLVMAtomicRMWBinOpFMax, (**< Sets the value if it's greater than the
                             original using an floating point comparison and
                             return the old one *)
    LLVMAtomicRMWBinOpFMin, (**< Sets the value if it's smaller than the
                             original using an floating point comparison and
                             return the old one *)
    LLVMAtomicRMWBinOpUIncWrap, (**< Increments the value, wrapping back to zero
                                 when incremented above input value *)
    LLVMAtomicRMWBinOpUDecWrap, (**< Decrements the value, wrapping back to
                                 the input value when decremented below zero *)
    LLVMAtomicRMWBinOpUSubCond, (**<Subtracts the value only if no unsigned
                                   overflow *)
    LLVMAtomicRMWBinOpUSubSat,  (**<Subtracts the value, clamping to zero *)
    LLVMAtomicRMWBinOpFMaximum, (**< Sets the value if it's greater than the
                                original using an floating point comparison and
                                return the old one *)
    LLVMAtomicRMWBinOpFMinimum  (**< Sets the value if it's smaller than the
                                original using an floating point comparison and
                                return the old one *)
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

 (* Tail call kind for LLVMSetTailCallKind and LLVMGetTailCallKind.
  *
  * Note that 'musttail' implies 'tail'.
  *
  * @see CallInst::TailCallKind
  *)
  TLLVMTailCallKind = (
    LLVMTailCallKindNone = 0,
    LLVMTailCallKindTail = 1,
    LLVMTailCallKindMustTail = 2,
    LLVMTailCallKindNoTail = 3
  );

(**
 * Flags to indicate what fast-math-style optimizations are allowed
 * on operations.
 *
 * See https://llvm.org/docs/LangRef.html#fast-math-flags
 *)
  TLLVMFastMathFlag = (
    LLVMFastMathAllowReassoc,
    LLVMFastMathNoNaNs,
    LLVMFastMathNoInfs,
    LLVMFastMathNoSignedZeros,
    LLVMFastMathAllowReciprocal,
    LLVMFastMathAllowContract,
    LLVMFastMathApproxFunc
  );

  TLLVMFastMathFlags = set of TLLVMFastMathFlag;

const
  LLVMFastMathNone: TLLVMFastMathFlags = [];
  LLVMFastMathAll: TLLVMFastMathFlags = [
                      LLVMFastMathAllowReassoc,
                      LLVMFastMathNoNaNs,
                      LLVMFastMathNoInfs,
                      LLVMFastMathNoSignedZeros,
                      LLVMFastMathAllowReciprocal,
                      LLVMFastMathAllowContract,
                      LLVMFastMathApproxFunc
                    ];


(**
 * Flags that constrain the allowed wrap semantics of a getelementptr
 * instruction.
 *
 * See https://llvm.org/docs/LangRef.html#getelementptr-instruction
 *)

type
  TLLVMGEPNoWrapFlag = (
    LLVMGEPFlagInBounds,
    LLVMGEPFlagNUSW,
    LLVMGEPFlagNUW
  );

  TLLVMGEPNoWrapFlags = set of TLLVMGEPNoWrapFlag;

  TLLVMDbgRecordKind = (
    LLVMDbgRecordLabel,
    LLVMDbgRecordDeclare,
    LLVMDbgRecordValue,
    LLVMDbgRecordAssign
  );

procedure LLVMShutdown; cdecl; external CLLVMLibrary;

(*===-- Version query -----------------------------------------------------===*)

(**
 * Return the major, minor, and patch version of LLVM
 *
 * The version components are returned via the function's three output
 * parameters or skipped if a NULL pointer was supplied.
 *)
procedure LLVMGetVersion(out Major, Minor, Patch: Cardinal); cdecl; external CLLVMLibrary;

(*===-- Error handling ----------------------------------------------------===*)

function LLVMCreateMessage(const Message: PLLVMChar): PLLVMChar; cdecl; external CLLVMLibrary;
procedure LLVMDisposeMessage(Message: PLLVMChar); cdecl; external CLLVMLibrary;

type
  TLLVMDiagnosticHandler = procedure(DiagnosticInfo: TLLVMDiagnosticInfoRef; UserContext: Pointer); cdecl;
  TLLVMYieldCallback = procedure(Context: TLLVMContextRef; UserContext: Pointer); cdecl;


function LLVMContextCreate: TLLVMContextRef cdecl; external CLLVMLibrary;

function LLVMGetGlobalContext: TLLVMContextRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, create one using LLVMContextCreate instead';

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
function LLVMGetMDKindID(const Name: PLLVMChar; SLen: Cardinal): Cardinal; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMGetMDKindIDInContext instead';
function LLVMGetSyncScopeID(C: TLLVMContextRef; const Name: PLLVMChar; SLen: TLLVMSizeT): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGetEnumAttributeKindForName(const Name: PLLVMChar; SLen: TLLVMSizeT): Cardinal; cdecl; external CLLVMLibrary;
function  LLVMGetLastEnumAttributeKind: Cardinal; cdecl; external CLLVMLibrary;

function LLVMCreateEnumAttribute(C: TLLVMContextRef; KindID: Cardinal; Val: UInt64): TLLVMAttributeRef; cdecl; external CLLVMLibrary;

function LLVMGetEnumAttributeKind(A: TLLVMAttributeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMGetEnumAttributeValue(A: TLLVMAttributeRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMCreateTypeAttribute(C: TLLVMContextRef; KindID: Cardinal; type_ref: TLLVMTypeRef): TLLVMAttributeRef; cdecl; external CLLVMLibrary;

function LLVMGetTypeAttributeValue(A: TLLVMAttributeRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

///<remarks>
///good lord what a function...
///NumBits divided by 64 (ceiled) specifies the number of elements in Lower/Upper words array
///unsigned NumWords = divideCeil(NumBits, 64);
///https://github.com/llvm/llvm-project/pull/90505/changes
///</remarks>
function LLVMCreateConstantRangeAttribute(C: TLLVMContextRef; KindID: Cardinal; NumBits: Cardinal; const LowerWords: PUInt64; const UpperWords: PUInt64): TLLVMAttributeRef; cdecl; external CLLVMLibrary;

function LLVMCreateStringAttribute(C: TLLVMContextRef; const K: PLLVMChar; KLength: Cardinal; const V: PLLVMChar; VLength: Cardinal): TLLVMAttributeRef; cdecl; external CLLVMLibrary;

function LLVMGetStringAttributeKind(A: TLLVMAttributeRef; out Length: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetStringAttributeValue(A: TLLVMAttributeRef; out Length: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMIsEnumAttribute(A: TLLVMAttributeRef): LongBool; cdecl; external CLLVMLibrary;
function LLVMIsStringAttribute(A: TLLVMAttributeRef): LongBool; cdecl; external CLLVMLibrary;
function LLVMIsTypeAttribute(A: TLLVMAttributeRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetTypeByName2(C: TLLVMContextRef; const Name: PLLVMChar): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMModuleCreateWithName(const ModuleID: PLLVMChar): TLLVMModuleRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMModuleCreateWithNameInContext instead';

function LLVMModuleCreateWithNameInContext(const ModuleID: PLLVMChar; C: TLLVMContextRef): TLLVMModuleRef; cdecl; external CLLVMLibrary;

function LLVMCloneModule(M: TLLVMModuleRef): TLLVMModuleRef; cdecl; external CLLVMLibrary;

procedure LLVMDisposeModule(M: TLLVMModuleRef); cdecl; external CLLVMLibrary;

(**
 * Soon to be deprecated.
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * Returns true if the module is in the new debug info mode which uses
 * non-instruction debug records instead of debug intrinsics for variable
 * location tracking.
 *)
function LLVMIsNewDbgInfoFormat(M: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Soon to be deprecated.
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * Convert module into desired debug info format.
 *)
procedure LLVMSetIsNewDbgInfoFormat(M: TLLVMModuleRef; UseNewFormat: TLLVMBool); cdecl; external CLLVMLibrary;

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

function LLVMGetInlineAsmAsmString(InlineAsmVal: TLLVMValueRef; out Len: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetInlineAsmConstraintString(InlineAsmVal: TLLVMValueRef; out Len: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetInlineAsmDialect(InlineAsmVal: TLLVMValueRef): TLLVMInlineAsmDialect; cdecl; external CLLVMLibrary;

function LLVMGetInlineAsmFunctionType(InlineAsmVal: TLLVMValueRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetInlineAsmHasSideEffects(InlineAsmVal: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetInlineAsmNeedsAlignedStack(InlineAsmVal: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetInlineAsmCanUnwind(InlineAsmVal: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

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

function LLVMGetOrInsertFunction(M: TLLVMModuleRef; const Name: PLLVMChar; NameLen: TLLVMSizeT; FunctionTy: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain a Function value from a Module by its name.
 *
 * The returned value corresponds to a llvm::Function value.
 *
 * @see llvm::Module::getFunction()
 *)
function LLVMGetNamedFunction(M: TLLVMModuleRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetNamedFunctionWithLength(M: TLLVMModuleRef; const Name: PLLVMChar; Length: TLLVMSizeT): TLLVMValueRef; cdecl; external CLLVMLibrary;

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
function LLVMInt1Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMInt1TypeInContext instead';
function LLVMInt8Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMInt8TypeInContext instead';
function LLVMInt16Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMIn161TypeInContext instead';
function LLVMInt32Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMInt32TypeInContext instead';
function LLVMInt64Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMInt64TypeInContext instead';
function LLVMInt128Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMInt128TypeInContext instead';
function LLVMIntType(NumBits: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMInt1TypeInContext instead';
function LLVMGetIntTypeWidth(IntegerTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMHalfTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Obtain a 16-bit brain floating point type from a context.
 *)
function LLVMBFloatTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMFloatTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMDoubleTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMX86FP80TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMFP128TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMPPCFP128TypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMHalfType: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMHalfTypeInContext instead';
function LLVMFloatType: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMFloatTypeInContext instead';
function LLVMDoubleType: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMDoubleTypeInContext instead';
function LLVMX86FP80Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMX86FP80TypeInContext instead';
function LLVMFP128Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMFP128TypeInContext instead';
function LLVMPPCFP128Type: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMPPCFP128TypeInContext instead';

function LLVMFunctionType(ReturnType: TLLVMTypeRef; ParamTypes: PLLVMTypeRef; ParamCount: Cardinal; IsVarArg: LongBool): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMIsFunctionVarArg(FunctionTy: TLLVMTypeRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMGetReturnType(FunctionTy: TLLVMTypeRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMCountParamTypes(FunctionTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetParamTypes(FunctionTy: TLLVMTypeRef; out Dest: PLLVMTypeRef); cdecl; external CLLVMLibrary;

function LLVMStructTypeInContext(C: TLLVMContextRef; ElementTypes: PLLVMTypeRef; ElementCount: Cardinal; IsPacked: LongBool): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMStructType(ElementTypes: PLLVMTypeRef; ElementCount: Cardinal; IsPacked: LongBool): TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated '"Use of the global context is deprecated, use LLVMStructTypeInContext instead';

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

function LLVMArrayType(ElementType: TLLVMTypeRef; ElementCount: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'use LLVMArrayType2';
function LLVMArrayType2(ElementType: TLLVMTypeRef; ElementCount: UInt64): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetArrayLength(ArrayTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary; deprecated 'use LLVMGetArrayLength2';
function LLVMGetArrayLength2(ArrayTy: TLLVMTypeRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMPointerType(ElementType: TLLVMTypeRef; AddressSpace: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMPointerTypeIsOpaque(Ty: TLLVMTypeRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMPointerTypeInContext(C: TLLVMContextRef; AddressSpace: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetPointerAddressSpace(PointerTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

function LLVMVectorType(ElementType: TLLVMTypeRef; ElementCount: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMScalableVectorType(ElementType: TLLVMTypeRef; ElementCount: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetVectorSize(VectorTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Get the pointer value for the associated ConstantPtrAuth constant.
 *
 * @see llvm::ConstantPtrAuth::getPointer
 *)
function LLVMGetConstantPtrAuthPointer(PtrAuth: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Get the key value for the associated ConstantPtrAuth constant.
 *
 * @see llvm::ConstantPtrAuth::getKey
 *)
function LLVMGetConstantPtrAuthKey(PtrAuth: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Get the discriminator value for the associated ConstantPtrAuth constant.
 *
 * @see llvm::ConstantPtrAuth::getDiscriminator
 *)
function LLVMGetConstantPtrAuthDiscriminator(PtrAuth: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Get the address discriminator value for the associated ConstantPtrAuth
 * constant.
 *
 * @see llvm::ConstantPtrAuth::getAddrDiscriminator
 *)
function LLVMGetConstantPtrAuthAddrDiscriminator(PtrAuth: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMVoidTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMLabelTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMX86AMXTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Create a token type in a context.
 *)
function LLVMTokenTypeInContext(C: TLLVMContextRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Create a metadata type in a context.
 *)
function LLVMMetadataTypeInContext(C: TLLVMContextRef): TLLVMTypeRef;cdecl; external CLLVMLibrary;

function LLVMVoidType: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMVoidTypeInContext instead';
function LLVMLabelType: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMLabelTypeInContext instead';
function LLVMX86AMXType: TLLVMTypeRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMX86AMXTypeInContext instead';

(**
 * Create a target extension type in LLVM context.
 *)
function LLVMTargetExtTypeInContext(
    C: TLLVMContextRef;
    const Name: PLLVMChar;
    TypeParams: PLLVMTypeRef;
    TypeParamCount: Cardinal;
    IntParams: PCardinal;
    IntParamCount: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the name for this target extension type.
 *
 * @see llvm::TargetExtType::getName()
 *)
function LLVMGetTargetExtTypeName(TargetExtTy: TLLVMTypeRef): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Obtain the number of type parameters for this target extension type.
 *
 * @see llvm::TargetExtType::getNumTypeParameters()
 *)
function LLVMGetTargetExtTypeNumTypeParams(TargetExtTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Get the type parameter at the given index for the target extension type.
 *
 * @see llvm::TargetExtType::getTypeParameter()
 *)
function LLVMGetTargetExtTypeTypeParam(TargetExtTy: TLLVMTypeRef; Idx: Cardinal): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the number of int parameters for this target extension type.
 *
 * @see llvm::TargetExtType::getNumIntParameters()
 *)
function LLVMGetTargetExtTypeNumIntParams(TargetExtTy: TLLVMTypeRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Get the int parameter at the given index for the target extension type.
 *
 * @see llvm::TargetExtType::getIntParameter()
 *)
function LLVMGetTargetExtTypeIntParam(TargetExtTy: TLLVMTypeRef; Idx: Cardinal): Cardinal; cdecl; external CLLVMLibrary;

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

function LLVMIsAArgument              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsABasicBlock            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAInlineAsm             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAUser                  (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstant              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsABlockAddress          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantAggregateZero (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantArray         (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantDataSequential(Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantDataArray     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantDataVector    (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantExpr          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantFP            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantInt           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantPointerNull   (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantStruct        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantTokenNone     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAConstantVector        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAGlobalValue           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAGlobalAlias           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAGlobalIFunc           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAGlobalObject          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAfunction              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAGlobalVariable        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAUndefValue            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAInstruction           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAUnaryOperator         (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsABinaryOperator        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACallInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAIntrinsicInst         (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsADbgInfoIntrinsic      (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsADbgVariableIntrinsic  (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsADbgDeclareInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsADbgLabelInst          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAMemIntrinsic          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAMemCpyInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAMemMoveInst           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAMemSetInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACmpInst               (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAFCmpInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAICmpInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAExtractElementInst    (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAGetElementPtrInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAInsertElementInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAInsertValueInst       (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsALandingPadInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAPHINode               (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsASelectInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAShuffleVectorInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAStoreInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsABranchInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAIndirectBrInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAInvokeInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAReturnInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsASwitchInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAUnreachableInst       (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAResumeInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACleanupReturnInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACatchReturnInst       (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACatchSwitchInst       (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACallBrInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAFuncletPadInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACatchPadInst          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACleanupPadInst        (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAUnaryInstruction      (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAAllocaInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsACastInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAAddrSpaceCastInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsABitCastInst           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAFPExtInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAFPToSIInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAFPToUIInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAFPTruncInst           (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAIntToPtrInst          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAPtrToIntInst          (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsASExtInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsASIToFPInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsATruncInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAUIToFPInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAZExtInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAExtractValueInst      (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsALoadInst              (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAVAArgInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAFreezeInst            (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAAtomicCmpXchgInst     (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAAtomicRMWInst         (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;
function LLVMIsAFenceInst             (Val: TLLVMValueRef ): TLLVMValueRef ; cdecl; external CLLVMLibrary;

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
 * Obtain the context to which this value is associated.
 *
 * @see llvm::Value::getContext()
 *)
function LLVMGetValueContext(Val: TLLVMValueRef): TLLVMContextRef; cdecl; external CLLVMLibrary;

(**
 * Return a string representation of the DbgRecord. Use
 * LLVMDisposeMessage to free the string.
 *
 * @see llvm::DbgRecord::print()
 *)
function LLVMPrintDbgRecordToString(ARecord: TLLVMDbgRecordRef): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Replace all uses of a value with another one.
 *
 * @see llvm::Value::replaceAllUsesWith()
 *)
procedure LLVMReplaceAllUsesWith(OldVal: TLLVMValueRef; NewVal: TLLVMValueRef); cdecl; external CLLVMLibrary;

function LLVMIsConstant(Val: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMIsUndef(Val: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

(**
 * Determine whether a value instance is poisonous.
 *)
function LLVMIsPoison(Val: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMIsAMDNode(Val: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMIsAValueAsMetadata(Val: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
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
 * function in this group pertain to LLVMValueRef instances that descent
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
 * Obtain a constant value referring to a poison value of a type.
 *
 * @see llvm::PoisonValue::get()
 *)
function LLVMGetPoison(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

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

(**
 * Obtain a constant for a floating point value from array of 64 bit values.
 * The length of the array N must be ceildiv(bits, 64), where bits is the
 * scalar size in bits of the floating-point type.
 *)

function LLVMConstFPFromBits(Ty: TLLVMTypeRef; const N: PUInt64): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstIntGetZExtValue(ConstantVal: TLLVMValueRef): UInt64; cdecl; external CLLVMLibrary;

function LLVMConstIntGetSExtValue(ConstantVal: TLLVMValueRef): Int64; cdecl; external CLLVMLibrary;

function LLVMConstRealGetDouble(ConstantVal: TLLVMValueRef; out losesInfo: LongBool): Double; cdecl; external CLLVMLibrary;

function LLVMConstStringInContext(C: TLLVMContextRef; const Str: PLLVMChar; Length: Cardinal; DontNullTerminate: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'use LLVMConstStringInContext2';

function LLVMConstStringInContext2(C: TLLVMContextRef; const Str: PLLVMChar; Length: TLLVMSizeT; DontNullTerminate: TLLVMBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstString(const Str: PLLVMChar; Length: Cardinal; DontNullTerminate: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMConstStringInContext2 instead';

function LLVMIsConstantString(c: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMGetAsString(c: TLLVMValueRef; out Length: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Get the raw, underlying bytes of the given constant data sequential.
 *
 * This is the same as LLVMGetAsString except it works for all constant data
 * sequentials, not just i8 arrays.
 *
 * @see ConstantDataSequential::getRawDataValues()
 *)
function LLVMGetRawDataValues(c: TLLVMValueRef; out SizeInBytes: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMConstStructInContext(C: TLLVMContextRef; ConstantVals: PLLVMValueRef; Count: Cardinal; IsPacked: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstStruct(ConstantVals: PLLVMValueRef; Count: Cardinal; IsPacked: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMConstStructInContext instead';

function LLVMConstArray(ElementTy: TLLVMTypeRef; ConstantVals: PLLVMValueRef; Length: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'use LLVMConstArray2';

function LLVMConstArray2(ElementTy: TLLVMTypeRef; ConstantVals: PLLVMValueRef; Length: UInt64): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Create a ConstantDataArray from raw values.
 *
 * ElementTy must be one of i8, i16, i32, i64, half, bfloat, float, or double.
 * Data points to a contiguous buffer of raw values in the host endianness. The
 * element count is inferred from the element type and the data size in bytes.
 *
 * @see llvm::ConstantDataArray::getRaw()
 *)
function LLVMConstDataArray(ElementTy: TLLVMTypeRef; const Data: PByte; SizeInBytes: TLLVMSizeT): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMConstNamedStruct(StructTy: TLLVMTypeRef; ConstantVals: PLLVMValueRef; Count: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Get element of a constant aggregate (struct, array or vector) at the
 * specified index. Returns null if the index is out of range, or it's not
 * possible to determine the element (e.g., because the constant is a
 * constant expression.)
 *
 * @see llvm::Constant::getAggregateElement()
 *)
function LLVMGetAggregateElement(C: TLLVMValueRef; Idx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetElementAsConstant(C: TLLVMValueRef; idx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'Use LLVMGetAggregateElement instead';

function LLVMConstVector(ScalarConstantVals: PLLVMValueRef; Size: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Create a ConstantPtrAuth constant with the given values.
 *
 * @see llvm::ConstantPtrAuth::get()
 *)
function LLVMConstantPtrAuth(Ptr: TLLVMValueRef; Key: TLLVMValueRef; Disc: TLLVMValueRef; AddrDisc: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;


function LLVMGetConstOpcode(ConstantVal: TLLVMValueRef): TLLVMOpcode; cdecl; external CLLVMLibrary;
function LLVMAlignOf(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMSizeOf(Ty: TLLVMTypeRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNeg(ConstantVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNSWNeg(ConstantVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstNUWNeg(ConstantVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'Use LLVMConstNull instead.';
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
function LLVMConstGEP2(Ty: TLLVMTypeRef; ConstantVal: TLLVMValueRef;  ConstantIndices: PLLVMValueRef; NumIndices: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMConstInBoundsGEP2(Ty: TLLVMTypeRef; ConstantVal: TLLVMValueRef; ConstantIndices: PLLVMValueRef; NumIndices: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
(**
 * Creates a constant GetElementPtr expression. Similar to LLVMConstGEP2, but
 * allows specifying the no-wrap flags.
 *
 * @see llvm::ConstantExpr::getGetElementPtr()
 *)
function LLVMConstGEPWithNoWrapFlags(
  Ty: TLLVMTypeRef;
  ConstantVal: TLLVMValueRef;
  ConstantIndices: PLLVMValueRef;
  NumIndices: Cardinal;
  NoWrapFlags: TLLVMGEPNoWrapFlags): TLLVMValueRef; cdecl; external CLLVMLibrary;

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
(**
 * Gets the function associated with a given BlockAddress constant value.
 *)
function LLVMGetBlockAddressFunction(BlockAddr: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Gets the basic block associated with a given BlockAddress constant value.
 *)
function LLVMGetBlockAddressBasicBlock(BlockAddr: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;


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
function LLVMGetUnnamedAddress(Global: TLLVMValueRef): TLLVMUnnamedAddr; cdecl; external CLLVMLibrary;
procedure LLVMSetUnnamedAddress(Global: TLLVMValueRef; UnnamedAddr: TLLVMUnnamedAddr); cdecl; external CLLVMLibrary;
function LLVMGlobalGetValueType(Global: TLLVMValueRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

function LLVMGetAlignment(V: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;
procedure LLVMSetAlignment(V: TLLVMValueRef; Bytes: Cardinal); cdecl; external CLLVMLibrary;

procedure LLVMGlobalSetMetadata(Global: TLLVMValueRef; Kind: Cardinal; MD: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

procedure LLVMGlobalAddMetadata(Global: TLLVMValueRef; Kind: Cardinal; MD: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

procedure LLVMGlobalEraseMetadata(Global: TLLVMValueRef; Kind: Cardinal); cdecl; external CLLVMLibrary;

procedure LLVMGlobalClearMetadata(Global: TLLVMValueRef); cdecl; external CLLVMLibrary;

procedure LLVMGlobalAddDebugInfo(Global: TLLVMValueRef; GVE: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * Retrieves an array of metadata entries representing the metadata attached to
 * this value. The caller is responsible for freeing this array by calling
 * \c LLVMDisposeValueMetadataEntries.
 *
 * @see llvm::GlobalObject::getAllMetadata()
 *)
function LLVMGlobalCopyAllMetadata(Value: TLLVMValueRef; out NumEntries: TLLVMSizeT): PLLVMValueMetadataEntry; cdecl; external CLLVMLibrary;

(**
 * Destroys value metadata entries.
 *)
procedure LLVMDisposeValueMetadataEntries(Entries: PLLVMValueMetadataEntry); cdecl; external CLLVMLibrary;

(**
 * Returns the kind of a value metadata entry at a specific index.
 *)
function LLVMValueMetadataEntriesGetKind(Entries: PLLVMValueMetadataEntry; Index: Cardinal): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Returns the underlying metadata node of a value metadata entry at a
 * specific index.
 *)

function LLVMValueMetadataEntriesGetMetadata(Entries: PLLVMValueMetadataEntry; Index: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

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
function LLVMAddAlias2(
  M: TLLVMModuleRef;
  ValueTy: TLLVMTypeRef;
  AddrSpace: Cardinal;
  Aliasee: TLLVMValueRef;
  const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

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
 * @defgroup LLVMCCoreValuefunction function values
 *
 * Functions in this group operate on LLVMValueRef instances that
 * correspond to llvm::function instances.
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
function LLVMIntrinsicCopyOverloadedName(ID : Cardinal; ParamTypes: PLLVMTypeRef; ParamCount: TLLVMSizeT;var NameLength: TLLVMSizeT):PLLVMChar; cdecl; external CLLVMLibrary; deprecated 'Use LLVMIntrinsicCopyOverloadedName2 instead';

(**
 * Copies the name of an overloaded intrinsic identified by a given list of
 * parameter types.
 *
 * Unlike LLVMIntrinsicGetName, the caller is responsible for freeing the
 * returned string.
 *
 * This version also supports unnamed types.
 *
 * @see llvm::Intrinsic::getName()
 *)

function LLVMIntrinsicCopyOverloadedName2(
  AMod: TLLVMModuleRef;
  ID: Cardinal;
  ParamTypes: PLLVMTypeRef;
  ParamCount: TLLVMSizeT;
  out NameLength: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

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

(**
 * Gets the prefix data associated with a function. Only valid on functions, and
 * only if LLVMHasPrefixData returns true.
 * See https://llvm.org/docs/LangRef.html#prefix-data
 *)
function LLVMGetPrefixData(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Check if a given function has prefix data. Only valid on functions.
 * See https://llvm.org/docs/LangRef.html#prefix-data
 *)
function LLVMHasPrefixData(Fn: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Sets the prefix data for the function. Only valid on functions.
 * See https://llvm.org/docs/LangRef.html#prefix-data
 *)
procedure LLVMSetPrefixData(Fn: TLLVMValueRef; prefixData: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Gets the prologue data associated with a function. Only valid on functions,
 * and only if LLVMHasPrologueData returns true.
 * See https://llvm.org/docs/LangRef.html#prologue-data
 *)
function LLVMGetPrologueData(Fn: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Check if a given function has prologue data. Only valid on functions.
 * See https://llvm.org/docs/LangRef.html#prologue-data
 *)
function LLVMHasPrologueData(Fn: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Sets the prologue data for the function. Only valid on functions.
 * See https://llvm.org/docs/LangRef.html#prologue-data
 *)
procedure LLVMSetPrologueData(Fn: TLLVMValueRef; prologueData: TLLVMValueRef); cdecl; external CLLVMLibrary;

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

(**
 * @defgroup LLVMCCoreValueGlobalIFunc IFuncs
 *
 * Functions in this group relate to indirect functions.
 *
 * Functions in this group expect LLVMValueRef instances that correspond
 * to llvm::GlobalIFunc instances.
 *
 * @{
 *)

(**
 * Add a global indirect function to a module under a specified name.
 *
 * @see llvm::GlobalIFunc::create()
 *)
function LLVMAddGlobalIFunc(M: TLLVMModuleRef; const Name: PLLVMChar;
                                           NameLen: TLLVMSizeT; Ty: TLLVMTypeRef;
                                           AddrSpace: Cardinal;
                                           Resolver: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain a GlobalIFunc value from a Module by its name.
 *
 * The returned value corresponds to a llvm::GlobalIFunc value.
 *
 * @see llvm::Module::getNamedIFunc()
 *)
function LLVMGetNamedGlobalIFunc(M: TLLVMModuleRef;
                                                const Name: PLLVMChar;
                                                NameLen: TLLVMSizeT): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain an iterator to the first GlobalIFunc in a Module.
 *
 * @see llvm::Module::ifunc_begin()
 *)
function LLVMGetFirstGlobalIFunc(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Obtain an iterator to the last GlobalIFunc in a Module.
 *
 * @see llvm::Module::ifunc_end()
 *)
function LLVMGetLastGlobalIFunc(M: TLLVMModuleRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Advance a GlobalIFunc iterator to the next GlobalIFunc.
 *
 * Returns NULL if the iterator was already at the end and there are no more
 * global aliases.
 *)
function LLVMGetNextGlobalIFunc(IFunc: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Decrement a GlobalIFunc iterator to the previous GlobalIFunc.
 *
 * Returns NULL if the iterator was already at the beginning and there are
 * no previous global aliases.
 *)
function LLVMGetPreviousGlobalIFunc(IFunc: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Retrieves the resolver function associated with this indirect function, or
 * NULL if it doesn't not exist.
 *
 * @see llvm::GlobalIFunc::getResolver()
 *)
function LLVMGetGlobalIFuncResolver(IFunc: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Sets the resolver function associated with this indirect function.
 *
 * @see llvm::GlobalIFunc::setResolver()
 *)
procedure LLVMSetGlobalIFuncResolver(IFunc: TLLVMValueRef; Resolver: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Remove a global indirect function from its parent module and delete it.
 *
 * @see llvm::GlobalIFunc::eraseFromParent()
 *)
procedure LLVMEraseGlobalIFunc(IFunc: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Remove a global indirect function from its parent module.
 *
 * This unlinks the global indirect function from its containing module but
 * keeps it alive.
 *
 * @see llvm::GlobalIFunc::removeFromParent()
 *)
procedure LLVMRemoveGlobalIFunc(IFunc: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * @defgroup LLVMCCoreValueMetadata Metadata
 *
 * @{
 *)

function LLVMMDStringInContext(C: TLLVMContextRef; const Str: PLLVMChar; SLen: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'use LLVMMDStringInContext2 instead';

function LLVMMDString(const Str: PLLVMChar; SLen: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'use LLVMMDStringInContext2 instead';

function LLVMMDNodeInContext(C: TLLVMContextRef; Vals: PLLVMValueRef; Count: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'use LLVMMDNodeInContext2 instead';

function LLVMMDNode(Vals: PLLVMValueRef; Count: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'use LLVMMDNodeInContext2 instead';

function LLVMMetadataAsValue(C: TLLVMContextRef; MD: TLLVMMetadataRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMValueAsMetadata(Val: TLLVMValueRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

function LLVMGetMDString(V: TLLVMValueRef; out Length: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetMDNodeNumOperands(V: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

procedure LLVMGetMDNodeOperands(V: TLLVMValueRef; Dest: PLLVMValueRef); cdecl; external CLLVMLibrary;

procedure LLVMReplaceMDNodeOperandWith(V: TLLVMValueRef; Index: Cardinal; Replacement: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * @defgroup LLVMCCoreOperandBundle Operand Bundles
 *
 * Functions in this group operate on LLVMOperandBundleRef instances that
 * correspond to llvm::OperandBundleDef instances.
 *
 * @see llvm::OperandBundleDef
 *
 * @{
 *)

(**
 * Create a new operand bundle.
 *
 * Every invocation should be paired with LLVMDisposeOperandBundle() or memory
 * will be leaked.
 *
 * @param Tag Tag name of the operand bundle
 * @param TagLen Length of Tag
 * @param Args Memory address of an array of bundle operands
 * @param NumArgs Length of Args
 *)
function LLVMCreateOperandBundle(
  const Tag: PLLVMChar;
  TagLen: TLLVMSizeT;
  Args: PLLVMValueRef;
  NumArgs: Cardinal): TLLVMOperandBundleRef; cdecl; external CLLVMLibrary;

(**
 * Destroy an operand bundle.
 *
 * This must be called for every created operand bundle or memory will be
 * leaked.
 *)
procedure LLVMDisposeOperandBundle(Bundle: TLLVMOperandBundleRef); cdecl; external CLLVMLibrary;

(**
 * Obtain the tag of an operand bundle as a string.
 *
 * @param Bundle Operand bundle to obtain tag of.
 * @param Len Out parameter which holds the length of the returned string.
 * @return The tag name of Bundle.
 * @see OperandBundleDef::getTag()
 *)
function LLVMGetOperandBundleTag(Bundle: TLLVMOperandBundleRef; out Len: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Obtain the number of operands for an operand bundle.
 *
 * @param Bundle Operand bundle to obtain operand count of.
 * @return The number of operands.
 * @see OperandBundleDef::input_size()
 *)
function LLVMGetNumOperandBundleArgs(Bundle: TLLVMOperandBundleRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Obtain the operand for an operand bundle at the given index.
 *
 * @param Bundle Operand bundle to obtain operand of.
 * @param Index An operand index, must be less than
 * LLVMGetNumOperandBundleArgs().
 * @return The operand.
 *)
function LLVMGetOperandBundleArgAtIndex(Bundle: TLLVMOperandBundleRef; Index: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

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
 * @param Fn function value to operate on.
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
function LLVMAppendBasicBlock(Fn: TLLVMValueRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMAppendBasicBlockInContext instead';

function LLVMInsertBasicBlockInContext(C: TLLVMContextRef; BB: TLLVMBasicBlockRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMInsertBasicBlock(InsertBeforeBB: TLLVMBasicBlockRef; const Name: PLLVMChar): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMInsertBasicBlockInContext instead';

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
 * Delete an instruction.
 *
 * The instruction specified is deleted. It must have previously been
 * removed from its containing building block.
 *
 * @see llvm::Value::deleteValue()
 *)
procedure LLVMDeleteInstruction(Inst: TLLVMValueRef); cdecl; external CLLVMLibrary;

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
 * Get whether or not an icmp instruction has the samesign flag.
 *
 * This is only valid for instructions that correspond to llvm::ICmpInst.
 *
 * @see llvm::ICmpInst::hasSameSign()
 *)
function LLVMGetICmpSameSign(Inst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Set the samesign flag on an icmp instruction.
 *
 * This is only valid for instructions that correspond to llvm::ICmpInst.
 *
 * @see llvm::ICmpInst::setSameSign()
 *)
procedure LLVMSetICmpSameSign(Inst: TLLVMValueRef; SameSign: TLLVMBool); cdecl; external CLLVMLibrary;

(**
 * Obtain the float predicate of an instruction.
 *
 * This is only valid for instructions that correspond to llvm::FCmpInst.
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
 * Obtain the first debug record attached to an instruction.
 *
 * Use LLVMGetNextDbgRecord() and LLVMGetPreviousDbgRecord() to traverse the
 * sequence of DbgRecords.
 *
 * Return the first DbgRecord attached to Inst or NULL if there are none.
 *
 * @see llvm::Instruction::getDbgRecordRange()
 *)
function LLVMGetFirstDbgRecord(Inst: TLLVMValueRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the last debug record attached to an instruction.
 *
 * Return the last DbgRecord attached to Inst or NULL if there are none.
 *
 * @see llvm::Instruction::getDbgRecordRange()
 *)
function LLVMGetLastDbgRecord(Inst: TLLVMValueRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the next DbgRecord in the sequence or NULL if there are no more.
 *
 * @see llvm::Instruction::getDbgRecordRange()
 *)
function LLVMGetNextDbgRecord(DbgRecord: TLLVMDbgRecordRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the previous DbgRecord in the sequence or NULL if there are no more.
 *
 * @see llvm::Instruction::getDbgRecordRange()
 *)
function LLVMGetPreviousDbgRecord(DbgRecord: TLLVMDbgRecordRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Get the debug location attached to the debug record.
 *
 * @see llvm::DbgRecord::getDebugLoc()
 *)
function LLVMDbgRecordGetDebugLoc(Rec: TLLVMDbgRecordRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

function LLVMDbgRecordGetKind(Rec: TLLVMDbgRecordRef): TLLVMDbgRecordKind; cdecl; external CLLVMLibrary;

(**
 * Get the value of the DbgVariableRecord.
 *
 * @see llvm::DbgVariableRecord::getValue()
 *)
function LLVMDbgVariableRecordGetValue(Rec: TLLVMDbgRecordRef; OpIdx: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Get the debug info variable of the DbgVariableRecord.
 *
 * @see llvm::DbgVariableRecord::getVariable()
 *)
function LLVMDbgVariableRecordGetVariable(Rec: TLLVMDbgRecordRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the debug info expression of the DbgVariableRecord.
 *
 * @see llvm::DbgVariableRecord::getExpression()
 *)
function LLVMDbgVariableRecordGetExpression(Rec: TLLVMDbgRecordRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

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

(**
 * Obtain the number of operand bundles attached to this instruction.
 *
 * This only works on llvm::CallInst and llvm::InvokeInst instructions.
 *
 * @see llvm::CallBase::getNumOperandBundles()
 *)
function LLVMGetNumOperandBundles(C: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Obtain the operand bundle attached to this instruction at the given index.
 * Use LLVMDisposeOperandBundle to free the operand bundle.
 *
 * This only works on llvm::CallInst and llvm::InvokeInst instructions.
 *)
function LLVMGetOperandBundleAtIndex(C: TLLVMValueRef; Index: Cardinal): TLLVMOperandBundleRef; cdecl; external CLLVMLibrary;

function LLVMIsTailCall(CallInst: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;

procedure LLVMSetTailCall(CallInst: TLLVMValueRef; IsTailCall: LongBool); cdecl; external CLLVMLibrary;

(**
 * Obtain a tail call kind of the call instruction.
 *
 * @see llvm::CallInst::setTailCallKind()
 *)
function LLVMGetTailCallKind(CallInst: TLLVMValueRef): TLLVMTailCallKind; cdecl; external CLLVMLibrary;

(**
 * Set the call kind of the call instruction.
 *
 * @see llvm::CallInst::getTailCallKind()
 *)
procedure LLVMSetTailCallKind(CallInst: TLLVMValueRef; kind: TLLVMTailCallKind); cdecl; external CLLVMLibrary;

function LLVMGetNormalDest(InvokeInst: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

function LLVMGetUnwindDest(InvokeInst: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

procedure LLVMSetNormalDest(InvokeInst: TLLVMValueRef; B: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

procedure LLVMSetUnwindDest(InvokeInst: TLLVMValueRef; B: TLLVMBasicBlockRef); cdecl; external CLLVMLibrary;

(**
 * Get the default destination of a CallBr instruction.
 *
 * @see llvm::CallBrInst::getDefaultDest()
 *)
function LLVMGetCallBrDefaultDest(CallBr: TLLVMValueRef): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

(**
 * Get the number of indirect destinations of a CallBr instruction.
 *
 * @see llvm::CallBrInst::getNumIndirectDests()

 *)
function LLVMGetCallBrNumIndirectDests(CallBr: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Get the indirect destination of a CallBr instruction at the given index.
 *
 * @see llvm::CallBrInst::getIndirectDest()
 *)
function LLVMGetCallBrIndirectDest(CallBr: TLLVMValueRef; Idx: Cardinal): TLLVMBasicBlockRef; cdecl; external CLLVMLibrary;

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
 * Obtain the case value for a successor of a switch instruction. i corresponds
 * to the successor index. The first successor is the default destination, so i
 * must be greater than zero.
 *
 * This only works on llvm::SwitchInst instructions.
 *
 * @see llvm::SwitchInst::CaseHandle::getCaseValue()
 *)
function LLVMGetSwitchCaseValue(SwitchInstr: TLLVMValueRef;  i: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;

(**
 * Set the case value for a successor of a switch instruction. i corresponds to
 * the successor index. The first successor is the default destination, so i
 * must be greater than zero.
 *
 * This only works on llvm::SwitchInst instructions.
 *
 * @see llvm::SwitchInst::CaseHandle::setValue()
 *)
procedure LLVMSetSwitchCaseValue(SwitchInstr: TLLVMValueRef; i: Cardinal; CaseValue: TLLVMValueRef); cdecl; external CLLVMLibrary;

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
 * Get the source element type of the given GEP operator.
 *)
function LLVMGetGEPSourceElementType(GEP: TLLVMValueRef): TLLVMTypeRef; cdecl; external CLLVMLibrary;

(**
 * Get the no-wrap related flags for the given GEP instruction.
 *
 * @see llvm::GetElementPtrInst::getNoWrapFlags
 *)
function LLVMGEPGetNoWrapFlags(GEP: TLLVMValueRef): TLLVMGEPNoWrapFlags; cdecl; external CLLVMLibrary;

(**
 * Set the no-wrap related flags for the given GEP instruction.
 *
 * @see llvm::GetElementPtrInst::setNoWrapFlags
 *)
procedure LLVMGEPSetNoWrapFlags(GEP: TLLVMValueRef; NoWrapFlags: TLLVMGEPNoWrapFlags); cdecl; external CLLVMLibrary;

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
function LLVMCreateBuilder: TLLVMBuilderRef; cdecl; external CLLVMLibrary; deprecated 'Use of the global context is deprecated, use LLVMCreateBuilderInContext instead';
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

(**
 * Adds the metadata registered with the given builder to the given instruction.
 *
 * @see llvm::IRBuilder::AddMetadataToInst()
 *)
procedure LLVMAddMetadataToInst(Builder: TLLVMBuilderRef; Inst: TLLVMValueRef); cdecl; external CLLVMLibrary;

(**
 * Get the dafult floating-point math metadata for a given builder.
 *
 * @see llvm::IRBuilder::getDefaultFPMathTag()
 *)
function LLVMBuilderGetDefaultFPMathTag(Builder: TLLVMBuilderRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Set the default floating-point math metadata for the given builder.
 *
 * To clear the metadata, pass NULL to \p FPMathTag.
 *
 * @see llvm::IRBuilder::setDefaultFPMathTag()
 *)
procedure LLVMBuilderSetDefaultFPMathTag(Builder: TLLVMBuilderRef; FPMathTag: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * Obtain the context to which this builder is associated.
 *
 * @see llvm::IRBuilder::getContext()
 *)
function LLVMGetBuilderContext(Builder: TLLVMBuilderRef): TLLVMContextRef; cdecl; external CLLVMLibrary;


function LLVMBuildRetVoid(Arg0: TLLVMBuilderRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildRet(Arg0: TLLVMBuilderRef; V: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAggregateRet(Arg0: TLLVMBuilderRef; RetVals: PLLVMValueRef; N: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildBr(Arg0: TLLVMBuilderRef; Dest: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCondBr(Arg0: TLLVMBuilderRef; IfValue: TLLVMValueRef; ThenValue: TLLVMBasicBlockRef; ElseValue: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildSwitch(Arg0: TLLVMBuilderRef; V: TLLVMValueRef; ElseValue: TLLVMBasicBlockRef; NumCases: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildIndirectBr(B: TLLVMBuilderRef; Addr: TLLVMValueRef; NumDests: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildInvoke(Arg0: TLLVMBuilderRef; Fn: TLLVMValueRef; Args: PLLVMValueRef; NumArgs: Cardinal; ThenValue: TLLVMBasicBlockRef; Catch: TLLVMBasicBlockRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCallBr(
    B: TLLVMBuilderRef;
    Ty: TLLVMTypeRef;
    Fn: TLLVMValueRef;
    DefaultDest: TLLVMBasicBlockRef;
    IndirectDests: PLLVMBasicBlockRef;
    NumIndirectDests: Cardinal;
    Args: PLLVMValueRef;
    NumArgs: Cardinal;
    Bundles: PLLVMOperandBundleRef;
    NumBundles: Cardinal;
    const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMBuildInvoke2(
    B: TLLVMBuilderRef;
    Ty: TLLVMTypeRef;
    Fn: TLLVMValueRef;
    Args: PLLVMValueRef;
    NumArgs: Cardinal;
    AThen: TLLVMBasicBlockRef;
    Catch: TLLVMBasicBlockRef;
    const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMBuildInvokeWithOperandBundles(
    B: TLLVMBuilderRef;
    Ty: TLLVMTypeRef;
    Fn: TLLVMValueRef;
    Args: PLLVMValueRef;
    NumArgs: Cardinal;
    AThen: TLLVMBasicBlockRef;
    Catch: TLLVMBasicBlockRef;
    Bundles: PLLVMOperandBundleRef;
    NumBundles: Cardinal;
    const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

(* Exception Handling *)
function LLVMBuildCleanupRet(B: TLLVMBuilderRef; CatchPad: TLLVMValueRef; BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCatchRet(B: TLLVMBuilderRef; CatchPad: TLLVMValueRef; BB: TLLVMBasicBlockRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCatchPad(B: TLLVMBuilderRef; ParentPad: TLLVMValueRef;  Args: PLLVMValueRef; NumArgs: Cardinal; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCleanupPad(B: TLLVMBuilderRef; ParentPad: TLLVMValueRef; Args: PLLVMValueRef; NumArgs: Cardinal; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCatchSwitch(B: TLLVMBuilderRef; ParentPad: TLLVMValueRef; UnwindBB: TLLVMBasicBlockRef; NumHandlers: Cardinal; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
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
function LLVMBuildNUWNeg(B: TLLVMBuilderRef; V: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary; deprecated 'Use LLVMBuildNeg + LLVMSetNUW instead.';
function LLVMBuildFNeg(Arg0: TLLVMBuilderRef; V: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildNot(Arg0: TLLVMBuilderRef; V: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMGetNUW(ArithInst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetNUW(ArithInst: TLLVMValueRef; HasNUW: TLLVMBool); cdecl; external CLLVMLibrary;
function LLVMGetNSW(ArithInst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetNSW(ArithInst: TLLVMValueRef; HasNSW: TLLVMBool); cdecl; external CLLVMLibrary;
function LLVMGetExact(DivOrShrInst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetExact(DivOrShrInst: TLLVMValueRef; IsExact: TLLVMBool); cdecl; external CLLVMLibrary;

(**
 * Gets if the instruction has the non-negative flag set.
 * Only valid for zext instructions.
 *)
function LLVMGetNNeg(NonNegInst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Sets the non-negative flag for the instruction.
 * Only valid for zext instructions.
 *)
procedure LLVMSetNNeg(NonNegInst: TLLVMValueRef; IsNonNeg: TLLVMBool); cdecl; external CLLVMLibrary;

(**
 * Get the flags for which fast-math-style optimizations are allowed for this
 * value.
 *
 * Only valid on floating point instructions.
 * @see LLVMCanValueUseFastMathFlags
 *)
function LLVMGetFastMathFlags(FPMathInst: TLLVMValueRef): TLLVMFastMathFlags; cdecl; external CLLVMLibrary;

(**
 * Sets the flags for which fast-math-style optimizations are allowed for this
 * value.
 *
 * Only valid on floating point instructions.
 * @see LLVMCanValueUseFastMathFlags
 *)
procedure LLVMSetFastMathFlags(FPMathInst: TLLVMValueRef; FMF: TLLVMFastMathFlags); cdecl; external CLLVMLibrary;

(**
 * Check if a given value can potentially have fast math flags.
 *
 * Will return true for floating point arithmetic instructions, and for select,
 * phi, and call instructions whose type is a floating point type, or a vector
 * or array thereof. See https://llvm.org/docs/LangRef.html#fast-math-flags
 *)
function LLVMCanValueUseFastMathFlags(Inst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Gets whether the instruction has the disjoint flag set.
 * Only valid for or instructions.
 *)
function LLVMGetIsDisjoint(Inst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Sets the disjoint flag for the instruction.
 * Only valid for or instructions.
 *)
procedure LLVMSetIsDisjoint(Inst: TLLVMValueRef; IsDisjoint: TLLVMBool); cdecl; external CLLVMLibrary;

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

function LLVMBuildAlloca(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef;                     Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildArrayAlloca(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFree(Arg0: TLLVMBuilderRef; PointerVal: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildLoad2(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; PointerVal: TLLVMValueRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMBuildStore(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; Ptr: TLLVMValueRef): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMBuildInBoundsGEP  (B: TLLVMBuilderRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef; NumIndices: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildStructGEP    (B: TLLVMBuilderRef; Pointer: TLLVMValueRef; Idx: Cardinal;                                Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function  LLVMBuildGEP2        (B: TLLVMBuilderRef; Ty: TLLVMTypeRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef;  NumIndices: Cardinal; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function  LLVMBuildInBoundsGEP2(B: TLLVMBuilderRef; Ty: TLLVMTypeRef; Pointer: TLLVMValueRef; Indices: PLLVMValueRef;  NumIndices: Cardinal; const Name: PLLVMChar): TLLVMValueRef;  cdecl; external CLLVMLibrary;
(**
 * Creates a GetElementPtr instruction. Similar to LLVMBuildGEP2, but allows
 * specifying the no-wrap flags.
 *
 * @see llvm::IRBuilder::CreateGEP()
 *)
function LLVMBuildGEPWithNoWrapFlags(
    B: TLLVMBuilderRef;
    Ty: TLLVMTypeRef;
    Pointer: TLLVMValueRef;
    Indices: PLLVMValueRef;
    NumIndices: Cardinal;
    const Name: PLLVMChar;
    NoWrapFlags: TLLVMGEPNoWrapFlags): TLLVMValueRef; cdecl; external CLLVMLibrary;

function  LLVMBuildStructGEP2  (B: TLLVMBuilderRef; Ty: TLLVMTypeRef; Pointer: TLLVMValueRef; Idx: Cardinal; const Name: PLLVMChar): TLLVMValueRef;cdecl; external CLLVMLibrary;

function LLVMBuildGlobalString(B: TLLVMBuilderRef; Str: PLLVMChar; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildGlobalStringPtr(B: TLLVMBuilderRef; Str: PLLVMChar; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetVolatile(MemoryAccessInst: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
procedure LLVMSetVolatile(MemoryAccessInst: TLLVMValueRef; IsVolatile: LongBool); cdecl; external CLLVMLibrary;
function LLVMGetWeak(CmpXchgInst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMSetWeak(CmpXchgInst: TLLVMValueRef; IsWeak: TLLVMBool); cdecl; external CLLVMLibrary;
function LLVMGetOrdering(MemoryAccessInst: TLLVMValueRef): TLLVMAtomicOrdering; cdecl; external CLLVMLibrary;
procedure LLVMSetOrdering(MemoryAccessInst: TLLVMValueRef; Ordering: TLLVMAtomicOrdering); cdecl; external CLLVMLibrary;
function LLVMGetAtomicRMWBinOp(AtomicRMWInst: TLLVMValueRef): TLLVMAtomicRMWBinOp; cdecl; external CLLVMLibrary;
procedure LLVMSetAtomicRMWBinOp(AtomicRMWInst: TLLVMValueRef; BinOp: TLLVMAtomicRMWBinOp); cdecl; external CLLVMLibrary;

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
function LLVMBuildIntCast2(B: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; IsSigned: TLLVMBool; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFPCast(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; DestTy: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMGetCastOpcode(Src: TLLVMValueRef; SrcIsSigned: TLLVMBool; DestTy: TLLVMTypeRef; DestIsSigned: TLLVMBool): TLLVMOpcode; cdecl; external CLLVMLibrary;

{/* Comparisons */}
function LLVMBuildICmp(Arg0: TLLVMBuilderRef; Op: TLLVMIntPredicate; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFCmp(Arg0: TLLVMBuilderRef; Op: TLLVMRealPredicate; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildPhi(Arg0: TLLVMBuilderRef; Ty: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCall2(B: TLLVMBuilderRef; Ty: TLLVMTypeRef; Fn: TLLVMValueRef; Args: PLLVMValueRef; NumArgs: Cardinal; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildCallWithOperandBundles(
    B: TLLVMBuilderRef;
    Ty: TLLVMTypeRef;
    Fn: TLLVMValueRef;
    Args: PLLVMValueRef;
    NumArgs: Cardinal;
    Bundles: PLLVMOperandBundleRef;
    NumBundles: Cardinal;
    const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;

function LLVMBuildSelect(Arg0: TLLVMBuilderRef; IfValue: TLLVMValueRef; ThenValue: TLLVMValueRef; ElseValue: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildVAArg(Arg0: TLLVMBuilderRef; List: TLLVMValueRef; Ty: TLLVMTypeRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildExtractElement(Arg0: TLLVMBuilderRef; VecVal: TLLVMValueRef; Index: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildInsertElement(Arg0: TLLVMBuilderRef; VecVal: TLLVMValueRef; EltVal: TLLVMValueRef; Index: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildShuffleVector(Arg0: TLLVMBuilderRef; V1: TLLVMValueRef; V2: TLLVMValueRef; Mask: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildExtractValue(Arg0: TLLVMBuilderRef; AggVal: TLLVMValueRef; Index: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildInsertValue(Arg0: TLLVMBuilderRef; AggVal: TLLVMValueRef; EltVal: TLLVMValueRef; Index: Cardinal; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFreeze(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildIsNull(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildIsNotNull(Arg0: TLLVMBuilderRef; Val: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildPtrDiff(Arg0: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildPtrDiff2(B: TLLVMBuilderRef; ElemTy: TLLVMTypeRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFence(B: TLLVMBuilderRef; ordering: TLLVMAtomicOrdering; singleThread: LongBool; Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildFenceSyncScope(B: TLLVMBuilderRef; ordering: TLLVMAtomicOrdering; SSID: Cardinal; const Name: PLLVMChar): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAtomicRMW(B: TLLVMBuilderRef; op: TLLVMAtomicRMWBinOp; PTR: TLLVMValueRef; Val: TLLVMValueRef; ordering: TLLVMAtomicOrdering; singleThread: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAtomicRMWSyncScope(
    B: TLLVMBuilderRef;
    op: TLLVMAtomicRMWBinOp;
    PTR: TLLVMValueRef;
    Val: TLLVMValueRef;
    ordering: TLLVMAtomicOrdering;
    SSID: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAtomicCmpXchg(B: TLLVMBuilderRef; Ptr: TLLVMValueRef; Cmp: TLLVMValueRef; New: TLLVMValueRef; SuccessOrdering: TLLVMAtomicOrdering; FailureOrdering: TLLVMAtomicOrdering; SingleThread: LongBool): TLLVMValueRef; cdecl; external CLLVMLibrary;
function LLVMBuildAtomicCmpXchgSyncScope(
    B: TLLVMBuilderRef;
    Ptr: TLLVMValueRef;
    Cmp: TLLVMValueRef;
    New: TLLVMValueRef;
    SuccessOrdering: TLLVMAtomicOrdering;
    FailureOrdering: TLLVMAtomicOrdering;
    SSID: Cardinal): TLLVMValueRef; cdecl; external CLLVMLibrary;
(**
 * Get the number of elements in the mask of a ShuffleVector instruction.
 *)
function LLVMGetNumMaskElements(ShuffleVectorInst: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * \returns a constant that specifies that the result of a \c ShuffleVectorInst
 * is undefined.
 *)
function LLVMGetUndefMaskElem: Integer; cdecl; external CLLVMLibrary;

(**
 * Get the mask value at position Elt in the mask of a ShuffleVector
 * instruction.
 *
 * \Returns the result of \c LLVMGetUndefMaskElem() if the mask value is
 * poison at that position.
 *)
function LLVMGetMaskValue(ShuffleVectorInst: TLLVMValueRef; Elt: Cardinal): Integer; cdecl; external CLLVMLibrary;


function LLVMIsAtomicSingleThread(AtomicInst: TLLVMValueRef): LongBool; cdecl; external CLLVMLibrary;
procedure LLVMSetAtomicSingleThread(AtomicInst: TLLVMValueRef; SingleThread: LongBool); cdecl; external CLLVMLibrary;
(**
 * Returns whether an instruction is an atomic instruction, e.g., atomicrmw,
 * cmpxchg, fence, or loads and stores with atomic ordering.
 *)
function LLVMIsAtomic(Inst: TLLVMValueRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Returns the synchronization scope ID of an atomic instruction.
 *)
function LLVMGetAtomicSyncScopeID(AtomicInst: TLLVMValueRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Sets the synchronization scope ID of an atomic instruction.
 *)
procedure LLVMSetAtomicSyncScopeID(AtomicInst: TLLVMValueRef; SSID: Cardinal); cdecl; external CLLVMLibrary;

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

implementation

end.
