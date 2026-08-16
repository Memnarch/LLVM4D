unit LLVM.Imports.DebugInfo;

interface

uses
  LLVM.Imports,
  LLVM.Imports.Types;

(**
 * @defgroup LLVMCCoreDebugInfo Debug Information
 * @ingroup LLVMCCore
 *
 * @{
 *)

(**
 * Debug info flags.
 *)

type
  TLLVMDIFlag = (
    LLVMDIFlagPrivate = 0,
    LLVMDIFlagProtected = 1,
    LLVMDIFlagPublic = 2,
    LLVMDIFlagFwdDecl = 3,
    LLVMDIFlagAppleBlock = 4,
    LLVMDIFlagReservedBit4 = 5,
    LLVMDIFlagVirtual = 6,
    LLVMDIFlagArtificial = 7,
    LLVMDIFlagExplicit = 8,
    LLVMDIFlagPrototyped = 9,
    LLVMDIFlagObjcClassComplete = 10,
    LLVMDIFlagObjectPointer = 11,
    LLVMDIFlagVector = 12,
    LLVMDIFlagStaticMember = 13,
    LLVMDIFlagLValueReference = 14,
    LLVMDIFlagRValueReference = 15,
    LLVMDIFlagReserved = 16,
    LLVMDIFlagSingleInheritance = 17,
    LLVMDIFlagMultipleInheritance = 18,
    LLVMDIFlagIntroducedVirtual = 19,
    LLVMDIFlagBitField = 20,
    LLVMDIFlagNoReturn = 21,
    LLVMDIFlagTypePassByValue = 23,
    LLVMDIFlagTypePassByReference = 24,
    LLVMDIFlagEnumClass = 25,
    LLVMDIFlagFixedEnum = LLVMDIFlagEnumClass, // Deprecated.
    LLVMDIFlagThunk = 26,
    LLVMDIFlagNonTrivial = 27,
    LLVMDIFlagBigEndian = 28,
    LLVMDIFlagLittleEndian = 29
  );

  TLLVMDIFlags = set of TLLVMDIFlag;

const
  LLVMDIFlagZero: TLLVMDIFlags = [];
  LLVMDIFlagVirtualInheritance = [LLVMDIFlagReserved, LLVMDIFlagSingleInheritance];
  LLVMDIFlagIndirectVirtualBase = [LLVMDIFlagFwdDecl, LLVMDIFlagVirtual];
  LLVMDIFlagAccessibility = [LLVMDIFlagPrivate, LLVMDIFlagProtected, LLVMDIFlagPublic];
  LLVMDIFlagPtrToMemberRep = [LLVMDIFlagSingleInheritance, LLVMDIFlagMultipleInheritance] + LLVMDIFlagVirtualInheritance;

(**
 * Source languages known by DWARF.
 *)
type
  TLLVMDWARFSourceLanguage = (
    LLVMDWARFSourceLanguageC89,
    LLVMDWARFSourceLanguageC,
    LLVMDWARFSourceLanguageAda83,
    LLVMDWARFSourceLanguageC_plus_plus,
    LLVMDWARFSourceLanguageCobol74,
    LLVMDWARFSourceLanguageCobol85,
    LLVMDWARFSourceLanguageFortran77,
    LLVMDWARFSourceLanguageFortran90,
    LLVMDWARFSourceLanguagePascal83,
    LLVMDWARFSourceLanguageModula2,
    // New in DWARF v3:
    LLVMDWARFSourceLanguageJava,
    LLVMDWARFSourceLanguageC99,
    LLVMDWARFSourceLanguageAda95,
    LLVMDWARFSourceLanguageFortran95,
    LLVMDWARFSourceLanguagePLI,
    LLVMDWARFSourceLanguageObjC,
    LLVMDWARFSourceLanguageObjC_plus_plus,
    LLVMDWARFSourceLanguageUPC,
    LLVMDWARFSourceLanguageD,
    // New in DWARF v4:
    LLVMDWARFSourceLanguagePython,
    // New in DWARF v5:
    LLVMDWARFSourceLanguageOpenCL,
    LLVMDWARFSourceLanguageGo,
    LLVMDWARFSourceLanguageModula3,
    LLVMDWARFSourceLanguageHaskell,
    LLVMDWARFSourceLanguageC_plus_plus_03,
    LLVMDWARFSourceLanguageC_plus_plus_11,
    LLVMDWARFSourceLanguageOCaml,
    LLVMDWARFSourceLanguageRust,
    LLVMDWARFSourceLanguageC11,
    LLVMDWARFSourceLanguageSwift,
    LLVMDWARFSourceLanguageJulia,
    LLVMDWARFSourceLanguageDylan,
    LLVMDWARFSourceLanguageC_plus_plus_14,
    LLVMDWARFSourceLanguageFortran03,
    LLVMDWARFSourceLanguageFortran08,
    LLVMDWARFSourceLanguageRenderScript,
    LLVMDWARFSourceLanguageBLISS,
    LLVMDWARFSourceLanguageKotlin,
    LLVMDWARFSourceLanguageZig,
    LLVMDWARFSourceLanguageCrystal,
    LLVMDWARFSourceLanguageC_plus_plus_17,
    LLVMDWARFSourceLanguageC_plus_plus_20,
    LLVMDWARFSourceLanguageC17,
    LLVMDWARFSourceLanguageFortran18,
    LLVMDWARFSourceLanguageAda2005,
    LLVMDWARFSourceLanguageAda2012,
    LLVMDWARFSourceLanguageHIP,
    LLVMDWARFSourceLanguageAssembly,
    LLVMDWARFSourceLanguageC_sharp,
    LLVMDWARFSourceLanguageMojo,
    LLVMDWARFSourceLanguageGLSL,
    LLVMDWARFSourceLanguageGLSL_ES,
    LLVMDWARFSourceLanguageHLSL,
    LLVMDWARFSourceLanguageOpenCL_CPP,
    LLVMDWARFSourceLanguageCPP_for_OpenCL,
    LLVMDWARFSourceLanguageSYCL,
    LLVMDWARFSourceLanguageRuby,
    LLVMDWARFSourceLanguageMove,
    LLVMDWARFSourceLanguageHylo,
    LLVMDWARFSourceLanguageMetal,

    // Vendor extensions:
    LLVMDWARFSourceLanguageMips_Assembler,
    LLVMDWARFSourceLanguageGOOGLE_RenderScript,
    LLVMDWARFSourceLanguageBORLAND_Delphi
  );

(**
 * The amount of debug information to emit.
 *)
  TLLVMDWARFEmissionKind = (
    LLVMDWARFEmissionNone = 0,
    LLVMDWARFEmissionFull,
    LLVMDWARFEmissionLineTablesOnly
  );

(**
 * The kind of metadata nodes.
 *)
// NOTE: New entries should always be appended instead of matching the order
// in Metadata.def.
  TLLVMMetadataKind = (
    LLVMMDStringMetadataKind,
    LLVMConstantAsMetadataMetadataKind,
    LLVMLocalAsMetadataMetadataKind,
    LLVMDistinctMDOperandPlaceholderMetadataKind,
    LLVMMDTupleMetadataKind,
    LLVMDILocationMetadataKind,
    LLVMDIExpressionMetadataKind,
    LLVMDIGlobalVariableExpressionMetadataKind,
    LLVMGenericDINodeMetadataKind,
    LLVMDISubrangeMetadataKind,
    LLVMDIEnumeratorMetadataKind,
    LLVMDIBasicTypeMetadataKind,
    LLVMDIDerivedTypeMetadataKind,
    LLVMDICompositeTypeMetadataKind,
    LLVMDISubroutineTypeMetadataKind,
    LLVMDIFileMetadataKind,
    LLVMDICompileUnitMetadataKind,
    LLVMDISubprogramMetadataKind,
    LLVMDILexicalBlockMetadataKind,
    LLVMDILexicalBlockFileMetadataKind,
    LLVMDINamespaceMetadataKind,
    LLVMDIModuleMetadataKind,
    LLVMDITemplateTypeParameterMetadataKind,
    LLVMDITemplateValueParameterMetadataKind,
    LLVMDIGlobalVariableMetadataKind,
    LLVMDILocalVariableMetadataKind,
    LLVMDILabelMetadataKind,
    LLVMDIObjCPropertyMetadataKind,
    LLVMDIImportedEntityMetadataKind,
    LLVMDIMacroMetadataKind,
    LLVMDIMacroFileMetadataKind,
    LLVMDICommonBlockMetadataKind,
    LLVMDIStringTypeMetadataKind,
    LLVMDIGenericSubrangeMetadataKind,
    LLVMDIArgListMetadataKind,
    LLVMDIAssignIDMetadataKind,
    LLVMDISubrangeTypeMetadataKind,
    LLVMDIFixedPointTypeMetadataKind
  );

(**
 * The kind of checksum to emit.
 *)
  TLLVMChecksumKind = (
    CSK_MD5,
    CSK_SHA1,
    CSK_SHA256
  );

(**
 * An LLVM DWARF type encoding.
 *)
  TLLVMDWARFTypeEncoding = type Cardinal;

(**
 * Describes the kind of macro declaration used for LLVMDIBuilderCreateMacro.
 * @see llvm::dwarf::MacinfoRecordType
 * @note Values are from DW_MACINFO_* constants in the DWARF specification.
 *)
  TLLVMDWARFMacinfoRecordType = (
    LLVMDWARFMacinfoRecordTypeDefine = $01,
    LLVMDWARFMacinfoRecordTypeMacro = $02,
    LLVMDWARFMacinfoRecordTypeStartFile = $03,
    LLVMDWARFMacinfoRecordTypeEndFile = $04,
    LLVMDWARFMacinfoRecordTypeVendorExt = $ff
  );

(**
 * The current debug metadata version number.
 *)
function LLVMDebugMetadataVersion: Cardinal; cdecl; external CLLVMLibrary;

(**
 * The version of debug metadata that's present in the provided \c Module.
 *)
function LLVMGetModuleDebugMetadataVersion(Module: TLLVMModuleRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Strip debug info in the module if it exists.
 * To do this, we remove all calls to the debugger intrinsics and any named
 * metadata for debugging. We also remove debug locations for instructions.
 * Return true if module is modified.
 *)
function LLVMStripModuleDebugInfo(Module: TLLVMModuleRef): TLLVMBool; cdecl; external CLLVMLibrary;

(**
 * Construct a builder for a module, and do not allow for unresolved nodes
 * attached to the module.
 *)
function LLVMCreateDIBuilderDisallowUnresolved(M: TLLVMModuleRef): TLLVMDIBuilderRef; cdecl; external CLLVMLibrary;

(**
 * Construct a builder for a module and collect unresolved nodes attached
 * to the module in order to resolve cycles during a call to
 * \c LLVMDIBuilderFinalize.
 *)
function LLVMCreateDIBuilder(M: TLLVMModuleRef): TLLVMDIBuilderRef; cdecl; external CLLVMLibrary;

(**
 * Deallocates the \c DIBuilder and everything it owns.
 * @note You must call \c LLVMDIBuilderFinalize before this
 *)
procedure LLVMDisposeDIBuilder(Builder: TLLVMDIBuilderRef); cdecl; external CLLVMLibrary;

(**
 * Construct any deferred debug info descriptors.
 *)
procedure LLVMDIBuilderFinalize(Builder: TLLVMDIBuilderRef); cdecl; external CLLVMLibrary;

(**
 * Finalize a specific subprogram.
 * No new variables may be added to this subprogram afterwards.
 *)
procedure LLVMDIBuilderFinalizeSubprogram(Builder: TLLVMDIBuilderRef; Subprogram: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * A CompileUnit provides an anchor for all debugging
 * information generated during this instance of compilation.
 * \param Lang          Source programming language, eg.
 *                      \c LLVMDWARFSourceLanguageC99
 * \param FileRef       File info.
 * \param Producer      Identify the producer of debugging information
 *                      and code.  Usually this is a compiler
 *                      version string.
 * \param ProducerLen   The length of the C string passed to \c Producer.
 * \param isOptimized   A boolean flag which indicates whether optimization
 *                      is enabled or not.
 * \param Flags         This string lists command line options. This
 *                      string is directly embedded in debug info
 *                      output which may be used by a tool
 *                      analyzing generated debugging information.
 * \param FlagsLen      The length of the C string passed to \c Flags.
 * \param RuntimeVer    This indicates runtime version for languages like
 *                      Objective-C.
 * \param SplitName     The name of the file that we'll split debug info
 *                      out into.
 * \param SplitNameLen  The length of the C string passed to \c SplitName.
 * \param Kind          The kind of debug information to generate.
 * \param DWOId         The DWOId if this is a split skeleton compile unit.
 * \param SplitDebugInlining    Whether to emit inline debug info.
 * \param DebugInfoForProfiling Whether to emit extra debug info for
 *                              profile collection.
 * \param SysRoot         The Clang system root (value of -isysroot).
 * \param SysRootLen      The length of the C string passed to \c SysRoot.
 * \param SDK           The SDK. On Darwin, the last component of the sysroot.
 * \param SDKLen        The length of the C string passed to \c SDK.
 *)
function LLVMDIBuilderCreateCompileUnit(
    Builder: TLLVMDIBuilderRef;
    Lang: TLLVMDWARFSourceLanguage;
    FileRef: TLLVMMetadataRef;
    const Producer: PLLVMChar;
    ProducerLen: TLLVMSizeT;
    isOptimized: LongBool;
    const Flags: PLLVMChar;
    FlagsLen: TLLVMSizeT;
    RuntimeVer: Cardinal;
    const SplitName: PLLVMChar;
    SplitNameLen: TLLVMSizeT;
    Kind: TLLVMDWARFEmissionKind;
    DWOId: Cardinal;
    SplitDebugInlining: LongBool;
    DebugInfoForProfiling: LongBool;
    const SysRoot: PLLVMChar;
    SysRootLen: TLLVMSizeT;
    const SDK: PLLVMChar;
    SDKLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a file descriptor to hold debugging information for a file.
 * \param Builder      The \c DIBuilder.
 * \param Filename     File name.
 * \param FilenameLen  The length of the C string passed to \c Filename.
 * \param Directory    Directory.
 * \param DirectoryLen The length of the C string passed to \c Directory.
 *)
function LLVMDIBuilderCreateFile(
  Builder: TLLVMDIBuilderRef;
  const Filename: PLLVMChar;
  FilenameLen: TLLVMSizeT;
  const Directory: PLLVMChar;
  DirectoryLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a file descriptor to hold debugging information for a file.
 * \param Builder      The \c DIBuilder.
 * \param Filename     File name.
 * \param FilenameLen  The length of the C string passed to \c Filename.
 * \param Directory    Directory.
 * \param DirectoryLen The length of the C string passed to \c Directory.
 * \param ChecksumKind The kind of checksum. eg MD5, SHA256
 * \param Checksum     The checksum.
 * \param ChecksumLen  The length of the checksum.
 * \param Souce        The embedded source.
 * \param SourceLen    The length of the source.
 *)
function LLVMDIBuilderCreateFileWithChecksum(
    Builder: TLLVMDIBuilderRef;
    const Filename: PLLVMChar;
    FilenameLen: TLLVMSizeT;
    const Directory: PLLVMChar;
    DirectoryLen: TLLVMSizeT;
    ChecksumKind: TLLVMChecksumKind;
    const Checksum: PLLVMChar;
    ChecksumLen: TLLVMSizeT;
    const Source: PLLVMChar;
    SourceLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Creates a new descriptor for a module with the specified parent scope.
 * \param Builder         The \c DIBuilder.
 * \param ParentScope     The parent scope containing this module declaration.
 * \param Name            Module name.
 * \param NameLen         The length of the C string passed to \c Name.
 * \param ConfigMacros    A space-separated shell-quoted list of -D macro
                          definitions as they would appear on a command line.
 * \param ConfigMacrosLen The length of the C string passed to \c ConfigMacros.
 * \param IncludePath     The path to the module map file.
 * \param IncludePathLen  The length of the C string passed to \c IncludePath.
 * \param APINotesFile    The path to an API notes file for the module.
 * \param APINotesFileLen The length of the C string passed to \c APINotestFile.
 *)
function LLVMDIBuilderCreateModule(
    Builder: TLLVMDIBuilderRef;
    ParentScope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    const ConfigMacros: PLLVMChar;
    ConfigMacrosLen: TLLVMSizeT;
    const IncludePath: PLLVMChar;
    IncludePathLen: TLLVMSizeT;
    const APINotesFile: PLLVMChar;
    APINotesFileLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Creates a new descriptor for a namespace with the specified parent scope.
 * \param Builder          The \c DIBuilder.
 * \param ParentScope      The parent scope containing this module declaration.
 * \param Name             NameSpace name.
 * \param NameLen          The length of the C string passed to \c Name.
 * \param ExportSymbols    Whether or not the namespace exports symbols, e.g.
 *                         this is true of C++ inline namespaces.
 *)
function LLVMDIBuilderCreateNameSpace(
    Builder: TLLVMDIBuilderRef;
    ParentScope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    ExportSymbols: LongBool): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a new descriptor for the specified subprogram.
 * \param Builder         The \c DIBuilder.
 * \param Scope           Function scope.
 * \param Name            Function name.
 * \param NameLen         Length of enumeration name.
 * \param LinkageName     Mangled function name.
 * \param LinkageNameLen  Length of linkage name.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Function type.
 * \param IsLocalToUnit   True if this function is not externally visible.
 * \param IsDefinition    True if this is a function definition.
 * \param ScopeLine       Set to the beginning of the scope this starts
 * \param Flags           E.g.: \c LLVMDIFlagLValueReference. These flags are
 *                        used to emit dwarf attributes.
 * \param IsOptimized     True if optimization is ON.
 *)
function LLVMDIBuilderCreateFunction(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    const LinkageName: PLLVMChar;
    LinkageNameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    Ty: TLLVMMetadataRef;
    IsLocalToUnit: LongBool;
    IsDefinition: LongBool;
    ScopeLine: Cardinal;
    Flags: TLLVMDIFlags;
    IsOptimized: LongBool): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a descriptor for a lexical block with the specified parent context.
 * \param Builder      The \c DIBuilder.
 * \param Scope        Parent lexical block.
 * \param File         Source file.
 * \param Line         The line in the source file.
 * \param Column       The column in the source file.
 *)
function LLVMDIBuilderCreateLexicalBlock(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    AFile: TLLVMMetadataRef;
    Line: Cardinal;
    Column: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a descriptor for a lexical block with a new file attached.
 * \param Builder        The \c DIBuilder.
 * \param Scope          Lexical block.
 * \param File           Source file.
 * \param Discriminator  DWARF path discriminator value.
 *)
function LLVMDIBuilderCreateLexicalBlockFile(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    AFile: TLLVMMetadataRef;
    Discriminator: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a descriptor for an imported namespace. Suitable for e.g. C++
 * using declarations.
 * \param Builder    The \c DIBuilder.
 * \param Scope      The scope this module is imported into
 * \param File       File where the declaration is located.
 * \param Line       Line number of the declaration.
 *)
function LLVMDIBuilderCreateImportedModuleFromNamespace(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    NS: TLLVMMetadataRef;
    AFile: TLLVMMetadataRef;
    Line: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a descriptor for an imported module that aliases another
 * imported entity descriptor.
 * \param Builder        The \c DIBuilder.
 * \param Scope          The scope this module is imported into
 * \param ImportedEntity Previous imported entity to alias.
 * \param File           File where the declaration is located.
 * \param Line           Line number of the declaration.
 * \param Elements       Renamed elements.
 * \param NumElements    Number of renamed elements.
 *)
function LLVMDIBuilderCreateImportedModuleFromAlias(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    ImportedEntity: TLLVMMetadataRef;
    AFile: TLLVMMetadataRef;
    Line: Cardinal;
    Elements: PLLVMMetadataRef;
    NumElements: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a descriptor for an imported module.
 * \param Builder        The \c DIBuilder.
 * \param Scope          The scope this module is imported into
 * \param M              The module being imported here
 * \param File           File where the declaration is located.
 * \param Line           Line number of the declaration.
 * \param Elements       Renamed elements.
 * \param NumElements    Number of renamed elements.
 *)
function LLVMDIBuilderCreateImportedModuleFromModule(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    M: TLLVMMetadataRef;
    AFile: TLLVMMetadataRef;
    Line: Cardinal;
    Elements: PLLVMMetadataRef;
    NumElements: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a descriptor for an imported function, type, or variable.  Suitable
 * for e.g. FORTRAN-style USE declarations.
 * \param Builder        The DIBuilder.
 * \param Scope          The scope this module is imported into.
 * \param Decl           The declaration (or definition) of a function, type,
                         or variable.
 * \param File           File where the declaration is located.
 * \param Line           Line number of the declaration.
 * \param Name           A name that uniquely identifies this imported
 declaration.
 * \param NameLen        The length of the C string passed to \c Name.
 * \param Elements       Renamed elements.
 * \param NumElements    Number of renamed elements.
 *)
function LLVMDIBuilderCreateImportedDeclaration(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    Decl: TLLVMMetadataRef;
    AFile: TLLVMMetadataRef;
    Line: Cardinal;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    Elements: PLLVMMetadataRef;
    NumElements: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Creates a new DebugLocation that describes a source location.
 * \param Line The line in the source file.
 * \param Column The column in the source file.
 * \param Scope The scope in which the location resides.
 * \param InlinedAt The scope where this location was inlined, if at all.
 *                  (optional).
 * \note If the item to which this location is attached cannot be
 *       attributed to a source line, pass 0 for the line and column.
 *)
function LLVMDIBuilderCreateDebugLocation(
    Ctx: TLLVMContextRef;
    Line: Cardinal;
    Column: Cardinal;
    Scope: TLLVMMetadataRef;
    InlinedAt: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the line number of this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getLine()
 *)
function LLVMDILocationGetLine(Location: TLLVMMetadataRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Get the column number of this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getColumn()
 *)
function LLVMDILocationGetColumn(Location: TLLVMMetadataRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Get the local scope associated with this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getScope()
 *)
function LLVMDILocationGetScope(Location: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the "inline at" location associated with this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getInlinedAt()
 *)
function LLVMDILocationGetInlinedAt(Location: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the metadata of the file associated with a given scope.
 * \param Scope     The scope object.
 *
 * @see DIScope::getFile()
 *)
function LLVMDIScopeGetFile(Scope: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the directory of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getDirectory()
 *)
function LLVMDIFileGetDirectory(AFile: TLLVMMetadataRef; out Len: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Get the name of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getFilename()
 *)
function LLVMDIFileGetFilename(AFile: TLLVMMetadataRef; out Len: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Get the source of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getSource()
 *)
function LLVMDIFileGetSource(AFile: TLLVMMetadataRef; out Len: Cardinal): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Create a type array.
 * \param Builder        The DIBuilder.
 * \param Data           The type elements.
 * \param NumElements    Number of type elements.
 *)
function LLVMDIBuilderGetOrCreateTypeArray(Builder: TLLVMDIBuilderRef; Data: PLLVMMetadataRef; NumElements: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create subroutine type.
 * \param Builder        The DIBuilder.
 * \param File            The file in which the subroutine resides.
 * \param ParameterTypes  An array of subroutine parameter types. This
 *                        includes return type at 0th index.
 * \param NumParameterTypes The number of parameter types in \c ParameterTypes
 * \param Flags           E.g.: \c LLVMDIFlagLValueReference.
 *                        These flags are used to emit dwarf attributes.
 *)
function LLVMDIBuilderCreateSubroutineType(
    Builder: TLLVMDIBuilderRef;
    AFile: TLLVMMetadataRef;
    ParameterTypes: PLLVMMetadataRef;
    NumParameterTypes: Cardinal;
    Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a macro.
 * @param Builder         The DIBuilder.
 * @param ParentMacroFile Macro parent (could be NULL).
 * @param Line            Source line number where the macro is defined.
 * @param RecordType      DW_MACINFO_define or DW_MACINFO_undef.
 * @param Name            Macro name.
 * @param NameLen         Macro name length.
 * @param Value           Macro value.
 * @param ValueLen        Macro value length.
 *)
function LLVMDIBuilderCreateMacro(
    Builder: TLLVMDIBuilderRef;
    ParentMacroFile: TLLVMMetadataRef;
    Line: Cardinal;
    RecordType: TLLVMDWARFMacinfoRecordType;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    const Value: PLLVMChar;
    ValueLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information temporary entry for a macro file.
 * List of macro node direct children will be calculated by DIBuilder,
 * using the \p ParentMacroFile relationship.
 * @param Builder         The DIBuilder.
 * @param ParentMacroFile Macro parent (could be NULL).
 * @param Line            Source line number where the macro file is included.
 * @param File            File descriptor containing the name of the macro file.
 *)
function LLVMDIBuilderCreateTempMacroFile(
    Builder: TLLVMDIBuilderRef;
    ParentMacroFile: TLLVMMetadataRef;
    Line: Cardinal;
    AFile: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for an enumerator.
 * @param Builder        The DIBuilder.
 * @param Name           Enumerator name.
 * @param NameLen        Length of enumerator name.
 * @param Value          Enumerator value.
 * @param IsUnsigned     True if the value is unsigned.
 *)
function LLVMDIBuilderCreateEnumerator(
    Builder: TLLVMDIBuilderRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    Value: Int64;
    IsUnsigned: LongBool): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for an enumerator of arbitrary precision.
 * @param Builder        The DIBuilder.
 * @param Name           Enumerator name.
 * @param NameLen        Length of enumerator name.
 * @param SizeInBits     Number of bits of the value.
 * @param Words          The words that make up the value.
 * @param IsUnsigned     True if the value is unsigned.
 *)
function LLVMDIBuilderCreateEnumeratorOfArbitraryPrecision(
    Builder: TLLVMDIBuilderRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    SizeInBits: UInt64;
    const Words: PUInt64;
    IsUnsigned: LongBool): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for an enumeration.
 * \param Builder        The DIBuilder.
 * \param Scope          Scope in which this enumeration is defined.
 * \param Name           Enumeration name.
 * \param NameLen        Length of enumeration name.
 * \param File           File where this member is defined.
 * \param LineNumber     Line number.
 * \param SizeInBits     Member size.
 * \param AlignInBits    Member alignment.
 * \param Elements       Enumeration elements.
 * \param NumElements    Number of enumeration elements.
 * \param ClassTy        Underlying type of a C++11/ObjC fixed enum.
 *)
function LLVMDIBuilderCreateEnumerationType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNumber: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    Elements: PLLVMMetadataRef;
    NumElements: Cardinal;
    ClassTy: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a union.
 * \param Builder      The DIBuilder.
 * \param Scope        Scope in which this union is defined.
 * \param Name         Union name.
 * \param NameLen      Length of union name.
 * \param File         File where this member is defined.
 * \param LineNumber   Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Elements     Union elements.
 * \param NumElements  Number of union elements.
 * \param RunTimeLang  Optional parameter, Objective-C runtime version.
 * \param UniqueId     A unique identifier for the union.
 * \param UniqueIdLen  Length of unique identifier.
 *)
function LLVMDIBuilderCreateUnionType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNumber: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    Flags: TLLVMDIFlags;
    Elements: PLLVMMetadataRef;
    NumElements: Cardinal;
    RunTimeLang: Cardinal;
    const UniqueId: PLLVMChar;
    UniqueIdLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for an array.
 * \param Builder      The DIBuilder.
 * \param Size         Array size.
 * \param AlignInBits  Alignment.
 * \param Ty           Element type.
 * \param Subscripts   Subscripts.
 * \param NumSubscripts Number of subscripts.
 *)
function LLVMDIBuilderCreateArrayType(
    Builder: TLLVMDIBuilderRef;
    Size: UInt64;
    AlignInBits: UInt32;
    Ty: TLLVMMetadataRef;
    Subscripts: PLLVMMetadataRef;
    NumSubscripts: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a set.
 * \param Builder        The DIBuilder.
 * \param Scope          The scope in which the set is defined.
 * \param Name           A name that uniquely identifies this set.
 * \param NameLen        The length of the C string passed to \c Name.
 * \param File           File where the set is located.
 * \param Line           Line number of the declaration.
 * \param SizeInBits     Set size.
 * \param AlignInBits    Set alignment.
 * \param BaseTy         The base type of the set.
 *)
function LLVMDIBuilderCreateSetType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNumber: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    BaseTy: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a descriptor for a subrange with dynamic bounds.
 * \param Builder    The DIBuilder.
 * \param Scope      The scope in which the subrange is defined.
 * \param Name       A name that uniquely identifies this subrange.
 * \param NameLen    The length of the C string passed to \c Name.
 * \param LineNo     Line number.
 * \param File       File where the subrange is located.
 * \param SizeInBits Member size.
 * \param AlignInBits Member alignment.
 * \param Flags      Flags.
 * \param BaseTy     The base type of the subrange. eg integer or enumeration
 * \param LowerBound Lower bound of the subrange.
 * \param UpperBound Upper bound of the subrange.
 * \param Stride     Stride of the subrange.
 * \param Bias       Bias of the subrange.
 *)
function LLVMDIBuilderCreateSubrangeType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    LineNo: Cardinal;
    AFile: TLLVMMetadataRef;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    Flags: TLLVMDIFlags;
    BaseTy: TLLVMMetadataRef;
    LowerBound: TLLVMMetadataRef;
    UpperBound: TLLVMMetadataRef;
    Stride: TLLVMMetadataRef;
    Bias: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a dynamic array.
 * \param Builder      The DIBuilder.
 * \param Size         Array size.
 * \param AlignInBits  Alignment.
 * \param Ty           Element type.
 * \param Subscripts   Subscripts.
 * \param NumSubscripts Number of subscripts.
 * \param DataLocation DataLocation. (DIVariable, DIExpression or NULL)
 * \param Associated   Associated. (DIVariable, DIExpression or NULL)
 * \param Allocated    Allocated. (DIVariable, DIExpression or NULL)
 * \param Rank         Rank. (DIVariable, DIExpression or NULL)
 * \param BitStride    BitStride.
 *)
function LLVMDIBuilderCreateDynamicArrayType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    LineNo: Cardinal;
    AFile: TLLVMMetadataRef;
    Size: UInt64;
    AlignInBits: UInt32;
    Ty: TLLVMMetadataRef;
    Subscripts: PLLVMMetadataRef;
    NumSubscripts: Cardinal;
    DataLocation: TLLVMMetadataRef;
    Associated: TLLVMMetadataRef;
    Allocated: TLLVMMetadataRef;
    Rank: TLLVMMetadataRef;
    BitStride: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Replace arrays.
 *
 * @see DIBuilder::replaceArrays()
 *)
procedure LLVMReplaceArrays(
  Builder: TLLVMDIBuilderRef;
  T: PLLVMMetadataRef;
  Elements: PLLVMMetadataRef;
  NumElements: Cardinal); cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a vector type.
 * \param Builder      The DIBuilder.
 * \param Size         Vector size.
 * \param AlignInBits  Alignment.
 * \param Ty           Element type.
 * \param Subscripts   Subscripts.
 * \param NumSubscripts Number of subscripts.
 *)
function LLVMDIBuilderCreateVectorType(
    Builder: TLLVMDIBuilderRef;
    Size: UInt64;
    AlignInBits: UInt32;
    Ty: TLLVMMetadataRef;
    Subscripts: PLLVMMetadataRef;
    NumSubscripts: Cardinal): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a DWARF unspecified type.
 * \param Builder   The DIBuilder.
 * \param Name      The unspecified type's name.
 * \param NameLen   Length of type name.
 *)
function LLVMDIBuilderCreateUnspecifiedType(Builder: TLLVMDIBuilderRef; const Name: PLLVMChar; NameLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a basic
 * type.
 * \param Builder     The DIBuilder.
 * \param Name        Type name.
 * \param NameLen     Length of type name.
 * \param SizeInBits  Size of the type.
 * \param Encoding    DWARF encoding code, e.g. \c LLVMDWARFTypeEncoding_float.
 * \param Flags       Flags to encode optional attribute like endianity
 *)
function LLVMDIBuilderCreateBasicType(
    Builder: TLLVMDIBuilderRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    SizeInBits: UInt64;
    Encoding: TLLVMDWARFTypeEncoding;
    Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a pointer.
 * \param Builder     The DIBuilder.
 * \param PointeeTy         Type pointed by this pointer.
 * \param SizeInBits        Size.
 * \param AlignInBits       Alignment. (optional, pass 0 to ignore)
 * \param AddressSpace      DWARF address space. (optional, pass 0 to ignore)
 * \param Name              Pointer type name. (optional)
 * \param NameLen           Length of pointer type name. (optional)
 *)
function LLVMDIBuilderCreatePointerType(
    Builder: TLLVMDIBuilderRef;
    PointeeTy: TLLVMMetadataRef;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    AddressSpace: Cardinal;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a struct.
 * \param Builder     The DIBuilder.
 * \param Scope        Scope in which this struct is defined.
 * \param Name         Struct name.
 * \param NameLen      Struct name length.
 * \param File         File where this member is defined.
 * \param LineNumber   Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Elements     Struct elements.
 * \param NumElements  Number of struct elements.
 * \param RunTimeLang  Optional parameter, Objective-C runtime version.
 * \param VTableHolder The object containing the vtable for the struct.
 * \param UniqueId     A unique identifier for the struct.
 * \param UniqueIdLen  Length of the unique identifier for the struct.
 *)
function LLVMDIBuilderCreateStructType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNumber: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    Flags: TLLVMDIFlags;
    DerivedFrom: TLLVMMetadataRef;
    Elements: PLLVMMetadataRef;
    NumElements: Cardinal;
    RunTimeLang: Cardinal;
    VTableHolder: TLLVMMetadataRef;
    const UniqueId: PLLVMChar;
    UniqueIdLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a member.
 * \param Builder      The DIBuilder.
 * \param Scope        Member scope.
 * \param Name         Member name.
 * \param NameLen      Length of member name.
 * \param File         File where this member is defined.
 * \param LineNo       Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param OffsetInBits Member offset.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Ty           Parent type.
 *)
function LLVMDIBuilderCreateMemberType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    OffsetInBits: UInt64;
    Flags: TLLVMDIFlags;
    Ty: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a
 * C++ static data member.
 * \param Builder      The DIBuilder.
 * \param Scope        Member scope.
 * \param Name         Member name.
 * \param NameLen      Length of member name.
 * \param File         File where this member is declared.
 * \param LineNumber   Line number.
 * \param Type         Type of the static member.
 * \param Flags        Flags to encode member attribute, e.g. private.
 * \param ConstantVal  Const initializer of the member.
 * \param AlignInBits  Member alignment.
 *)
function LLVMDIBuilderCreateStaticMemberType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNumber: Cardinal;
    AType: TLLVMMetadataRef;
    Flags: TLLVMDIFlags;
    ConstantVal: TLLVMValueRef;
    AlignInBits: UInt32): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a pointer to member.
 * \param Builder      The DIBuilder.
 * \param PointeeType  Type pointed to by this pointer.
 * \param ClassType    Type for which this pointer points to members of.
 * \param SizeInBits   Size.
 * \param AlignInBits  Alignment.
 * \param Flags        Flags.
 *)
function LLVMDIBuilderCreateMemberPointerType(
    Builder: TLLVMDIBuilderRef;
    PointeeType: TLLVMMetadataRef;
    ClassType: TLLVMMetadataRef;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for Objective-C instance variable.
 * \param Builder      The DIBuilder.
 * \param Name         Member name.
 * \param NameLen      The length of the C string passed to \c Name.
 * \param File         File where this member is defined.
 * \param LineNo       Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param OffsetInBits Member offset.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Ty           Parent type.
 * \param PropertyNode Property associated with this ivar.
 *)
function LLVMDIBuilderCreateObjCIVar(
    Builder: TLLVMDIBuilderRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    OffsetInBits: UInt64;
    Flags: TLLVMDIFlags;
    Ty: TLLVMMetadataRef;
    PropertyNode: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for Objective-C property.
 * \param Builder            The DIBuilder.
 * \param Name               Property name.
 * \param NameLen            The length of the C string passed to \c Name.
 * \param File               File where this property is defined.
 * \param LineNo             Line number.
 * \param GetterName         Name of the Objective C property getter selector.
 * \param GetterNameLen      The length of the C string passed to \c GetterName.
 * \param SetterName         Name of the Objective C property setter selector.
 * \param SetterNameLen      The length of the C string passed to \c SetterName.
 * \param PropertyAttributes Objective C property attributes.
 * \param Ty                 Type.
 *)
function LLVMDIBuilderCreateObjCProperty(
    Builder: TLLVMDIBuilderRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    const GetterName: PLLVMChar;
    GetterNameLen: TLLVMSizeT;
    const SetterName: PLLVMChar;
    SetterNameLen: TLLVMSizeT;
    PropertyAttributes: Cardinal;
    Ty: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a uniqued DIType* clone with FlagObjectPointer. If \c Implicit
 * is true, then also set FlagArtificial.
 * \param Builder   The DIBuilder.
 * \param Type      The underlying type to which this pointer points.
 * \param Implicit  Indicates whether this pointer was implicitly generated
 *                  (i.e., not spelled out in source).
 *)
function LLVMDIBuilderCreateObjectPointerType(Builder: TLLVMDIBuilderRef; AType: TLLVMMetadataRef; Implicit: LongBool): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a qualified
 * type, e.g. 'const int'.
 * \param Builder     The DIBuilder.
 * \param Tag         Tag identifying type,
 *                    e.g. LLVMDWARFTypeQualifier_volatile_type
 * \param Type        Base Type.
 *)
function LLVMDIBuilderCreateQualifiedType(Builder: TLLVMDIBuilderRef; Tag: Cardinal; AType: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a c++
 * style reference or rvalue reference type.
 * \param Builder   The DIBuilder.
 * \param Tag       Tag identifying type,
 * \param Type      Base Type.
 *)
function LLVMDIBuilderCreateReferenceType(Builder: TLLVMDIBuilderRef; Tag: Cardinal; AType: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create C++11 nullptr type.
 * \param Builder   The DIBuilder.
 *)
function LLVMDIBuilderCreateNullPtrType(Builder: TLLVMDIBuilderRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a typedef.
 * \param Builder    The DIBuilder.
 * \param Type       Original type.
 * \param Name       Typedef name.
 * \param File       File where this type is defined.
 * \param LineNo     Line number.
 * \param Scope      The surrounding context for the typedef.
 *)
function LLVMDIBuilderCreateTypedef(
    Builder: TLLVMDIBuilderRef;
    AType: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    Scope: TLLVMMetadataRef;
    AlignInBits: UInt32): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry to establish inheritance relationship
 * between two types.
 * \param Builder       The DIBuilder.
 * \param Ty            Original type.
 * \param BaseTy        Base type. Ty is inherits from base.
 * \param BaseOffset    Base offset.
 * \param VBPtrOffset  Virtual base pointer offset.
 * \param Flags         Flags to describe inheritance attribute, e.g. private
 *)
function LLVMDIBuilderCreateInheritance(
    Builder: TLLVMDIBuilderRef;
    Ty: TLLVMMetadataRef;
    BaseTy: TLLVMMetadataRef;
    BaseOffset: UInt64;
    VBPtrOffset: UInt32;
    Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a permanent forward-declared type.
 * \param Builder             The DIBuilder.
 * \param Tag                 A unique tag for this type.
 * \param Name                Type name.
 * \param NameLen             Length of type name.
 * \param Scope               Type scope.
 * \param File                File where this type is defined.
 * \param Line                Line number where this type is defined.
 * \param RuntimeLang         Indicates runtime version for languages like
 *                            Objective-C.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
 *)
function LLVMDIBuilderCreateForwardDecl(
    Builder: TLLVMDIBuilderRef;
    Tag: Cardinal;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    Scope: TLLVMMetadataRef;
    AFile: TLLVMMetadataRef;
    Line: Cardinal;
    RuntimeLang: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    const UniqueIdentifier: PLLVMChar;
    UniqueIdentifierLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a temporary forward-declared type.
 * \param Builder             The DIBuilder.
 * \param Tag                 A unique tag for this type.
 * \param Name                Type name.
 * \param NameLen             Length of type name.
 * \param Scope               Type scope.
 * \param File                File where this type is defined.
 * \param Line                Line number where this type is defined.
 * \param RuntimeLang         Indicates runtime version for languages like
 *                            Objective-C.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param Flags               Flags.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
 *)
function LLVMDIBuilderCreateReplaceableCompositeType(
    Builder: TLLVMDIBuilderRef;
    Tag: Cardinal;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    Scope: TLLVMMetadataRef;
    AFile: TLLVMMetadataRef;
    Line: Cardinal;
    RuntimeLang: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    Flags: TLLVMDIFlags;
    const UniqueIdentifier: PLLVMChar;
    UniqueIdentifierLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a bit field member.
 * \param Builder             The DIBuilder.
 * \param Scope               Member scope.
 * \param Name                Member name.
 * \param NameLen             Length of member name.
 * \param File                File where this member is defined.
 * \param LineNumber          Line number.
 * \param SizeInBits          Member size.
 * \param OffsetInBits        Member offset.
 * \param StorageOffsetInBits Member storage offset.
 * \param Flags               Flags to encode member attribute.
 * \param Type                Parent type.
 *)
function LLVMDIBuilderCreateBitFieldMemberType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNumber: Cardinal;
    SizeInBits: UInt64;
    OffsetInBits: UInt64;
    StorageOffsetInBits: UInt64;
    Flags: TLLVMDIFlags;
    AType: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create debugging information entry for a class.
 * \param Scope               Scope in which this class is defined.
 * \param Name                Class name.
 * \param NameLen             The length of the C string passed to \c Name.
 * \param File                File where this member is defined.
 * \param LineNumber          Line number.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param OffsetInBits        Member offset.
 * \param Flags               Flags to encode member attribute, e.g. private.
 * \param DerivedFrom         Debug info of the base class of this type.
 * \param Elements            Class members.
 * \param NumElements         Number of class elements.
 * \param VTableHolder        Debug info of the base class that contains vtable
 *                            for this type. This is used in
 *                            DW_AT_containing_type. See DWARF documentation
 *                            for more info.
 * \param TemplateParamsNode  Template type parameters.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
 *)
function LLVMDIBuilderCreateClassType(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNumber: Cardinal;
    SizeInBits: UInt64;
    AlignInBits: UInt32;
    OffsetInBits: UInt64;
    Flags: TLLVMDIFlags;
    DerivedFrom: TLLVMMetadataRef;
    Elements: PLLVMMetadataRef;
    NumElements: Cardinal;
    VTableHolder: TLLVMMetadataRef;
    TemplateParamsNode: TLLVMMetadataRef;
    const UniqueIdentifier: PLLVMChar;
    UniqueIdentifierLen: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a uniqued DIType* clone with FlagArtificial set.
 * \param Builder     The DIBuilder.
 * \param Type        The underlying type.
 *)
function LLVMDIBuilderCreateArtificialType(Builder: TLLVMDIBuilderRef; AType: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the name of this DIType.
 * \param DType     The DIType.
 * \param Length    The length of the returned string.
 *
 * @see DIType::getName()
 *)
function LLVMDITypeGetName(DType: TLLVMMetadataRef; out Length: TLLVMSizeT): PLLVMChar; cdecl; external CLLVMLibrary;

(**
 * Get the size of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getSizeInBits()
 *)
function LLVMDITypeGetSizeInBits(DType: TLLVMMetadataRef): UInt64; cdecl; external CLLVMLibrary;

(**
 * Get the offset of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getOffsetInBits()
 *)
function LLVMDITypeGetOffsetInBits(DType: TLLVMMetadataRef): UInt64; cdecl; external CLLVMLibrary;

(**
 * Get the alignment of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getAlignInBits()
 *)
function LLVMDITypeGetAlignInBits(DType: TLLVMMetadataRef): UInt32; cdecl; external CLLVMLibrary;

(**
 * Get the source line where this DIType is declared.
 * \param DType     The DIType.
 *
 * @see DIType::getLine()
 *)
function LLVMDITypeGetLine(DType: TLLVMMetadataRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Get the flags associated with this DIType.
 * \param DType     The DIType.
 *
 * @see DIType::getFlags()
 *)
function LLVMDITypeGetFlags(DType: TLLVMMetadataRef): TLLVMDIFlags; cdecl; external CLLVMLibrary;

(**
 * Create a descriptor for a value range.
 * \param Builder    The DIBuilder.
 * \param LowerBound Lower bound of the subrange, e.g. 0 for C, 1 for Fortran.
 * \param Count      Count of elements in the subrange.
 *)
function LLVMDIBuilderGetOrCreateSubrange(Builder: TLLVMDIBuilderRef; LowerBound: Int64; Count: Int64): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create an array of DI Nodes.
 * \param Builder        The DIBuilder.
 * \param Data           The DI Node elements.
 * \param NumElements    Number of DI Node elements.
 *)
function LLVMDIBuilderGetOrCreateArray(Builder: TLLVMDIBuilderRef; Data: PLLVMMetadataRef; NumElements: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a new descriptor for the specified variable which has a complex
 * address expression for its address.
 * \param Builder     The DIBuilder.
 * \param Addr        An array of complex address operations.
 * \param Length      Length of the address operation array.
 *)
function LLVMDIBuilderCreateExpression(Builder: TLLVMDIBuilderRef; Addr: PUInt64; Length: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a new descriptor for the specified variable that does not have an
 * address, but does have a constant value.
 * \param Builder     The DIBuilder.
 * \param Value       The constant value.
 *)
function LLVMDIBuilderCreateConstantValueExpression(Builder: TLLVMDIBuilderRef; Value: UInt64): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a new descriptor for the specified variable.
 * \param Scope       Variable scope.
 * \param Name        Name of the variable.
 * \param NameLen     The length of the C string passed to \c Name.
 * \param Linkage     Mangled  name of the variable.
 * \param LinkLen     The length of the C string passed to \c Linkage.
 * \param File        File where this variable is defined.
 * \param LineNo      Line number.
 * \param Ty          Variable Type.
 * \param LocalToUnit Boolean flag indicate whether this variable is
 *                    externally visible or not.
 * \param Expr        The location of the global relative to the attached
 *                    GlobalVariable.
 * \param Decl        Reference to the corresponding declaration.
 *                    variables.
 * \param AlignInBits Variable alignment(or 0 if no alignment attr was
 *                    specified)
 *)
function LLVMDIBuilderCreateGlobalVariableExpression(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    const Linkage: PLLVMChar;
    LinkLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    Ty: TLLVMMetadataRef;
    LocalToUnit: LongBool;
    Expr: TLLVMMetadataRef;
    Decl: TLLVMMetadataRef;
    AlignInBits: UInt32): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the dwarf::Tag of a DINode
 *)
function LLVMGetDINodeTag(MD: TLLVMMetadataRef): UInt16; cdecl; external CLLVMLibrary;

(**
 * Retrieves the \c DIVariable associated with this global variable expression.
 * \param GVE    The global variable expression.
 *
 * @see llvm::DIGlobalVariableExpression::getVariable()
 *)
function LLVMDIGlobalVariableExpressionGetVariable(GVE: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Retrieves the \c DIExpression associated with this global variable expression.
 * \param GVE    The global variable expression.
 *
 * @see llvm::DIGlobalVariableExpression::getExpression()
 *)
function LLVMDIGlobalVariableExpressionGetExpression(GVE: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the metadata of the file associated with a given variable.
 * \param Var     The variable object.
 *
 * @see DIVariable::getFile()
 *)
function LLVMDIVariableGetFile(AVar: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the metadata of the scope associated with a given variable.
 * \param Var     The variable object.
 *
 * @see DIVariable::getScope()
 *)
function LLVMDIVariableGetScope(AVar: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the source line where this \c DIVariable is declared.
 * \param Var     The DIVariable.
 *
 * @see DIVariable::getLine()
 *)
function LLVMDIVariableGetLine(AVar: TLLVMMetadataRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Create a new temporary \c MDNode.  Suitable for use in constructing cyclic
 * \c MDNode structures. A temporary \c MDNode is not uniqued, may be RAUW'd,
 * and must be manually deleted with \c LLVMDisposeTemporaryMDNode.
 * \param Ctx            The context in which to construct the temporary node.
 * \param Data           The metadata elements.
 * \param NumElements    Number of metadata elements.
 *)
function LLVMTemporaryMDNode(Ctx: TLLVMContextRef; Data: PLLVMMetadataRef; NumElements: TLLVMSizeT): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Deallocate a temporary node.
 *
 * Calls \c replaceAllUsesWith(nullptr) before deleting, so any remaining
 * references will be reset.
 * \param TempNode    The temporary metadata node.
 *)
procedure LLVMDisposeTemporaryMDNode(TempNode: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * Replace all uses of temporary metadata.
 * \param TempTargetMetadata    The temporary metadata node.
 * \param Replacement           The replacement metadata node.
 *)
procedure LLVMMetadataReplaceAllUsesWith(TempTargetMetadata: TLLVMMetadataRef; Replacement: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * Create a new descriptor for the specified global variable that is temporary
 * and meant to be RAUWed.
 * \param Scope       Variable scope.
 * \param Name        Name of the variable.
 * \param NameLen     The length of the C string passed to \c Name.
 * \param Linkage     Mangled  name of the variable.
 * \param LnkLen      The length of the C string passed to \c Linkage.
 * \param File        File where this variable is defined.
 * \param LineNo      Line number.
 * \param Ty          Variable Type.
 * \param LocalToUnit Boolean flag indicate whether this variable is
 *                    externally visible or not.
 * \param Decl        Reference to the corresponding declaration.
 * \param AlignInBits Variable alignment(or 0 if no alignment attr was
 *                    specified)
 *)
function LLVMDIBuilderCreateTempGlobalVariableFwdDecl(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    const Linkage: PLLVMChar;
    LnkLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    Ty: TLLVMMetadataRef;
    LocalToUnit: LongBool;
    Decl: TLLVMMetadataRef;
    AlignInBits: UInt32): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Only use in "new debug format" (LLVMIsNewDbgInfoFormat() is true).
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * The debug format can be switched later after inserting the records using
 * LLVMSetIsNewDbgInfoFormat, if needed for legacy or transitionary reasons.
 *
 * Insert a Declare DbgRecord before the given instruction.
 * \param Builder     The DIBuilder.
 * \param Storage     The storage of the variable to declare.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Instr       Instruction acting as a location for the new record.
 *)
function LLVMDIBuilderInsertDeclareRecordBefore(
    Builder: TLLVMDIBuilderRef;
    Storage: TLLVMValueRef;
    VarInfo: TLLVMMetadataRef;
    Expr: TLLVMMetadataRef;
    DebugLoc: TLLVMMetadataRef;
    Instr: TLLVMValueRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Only use in "new debug format" (LLVMIsNewDbgInfoFormat() is true).
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * The debug format can be switched later after inserting the records using
 * LLVMSetIsNewDbgInfoFormat, if needed for legacy or transitionary reasons.
 *
 * Insert a Declare DbgRecord at the end of the given basic block. If the basic
 * block has a terminator instruction, the record is inserted before that
 * terminator instruction.
 * \param Builder     The DIBuilder.
 * \param Storage     The storage of the variable to declare.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Block       Basic block acting as a location for the new record.
 *)
function LLVMDIBuilderInsertDeclareRecordAtEnd(
    Builder: TLLVMDIBuilderRef;
    Storage: TLLVMValueRef;
    VarInfo: TLLVMMetadataRef;
    Expr: TLLVMMetadataRef;
    DebugLoc: TLLVMMetadataRef;
    Block: TLLVMBasicBlockRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Only use in "new debug format" (LLVMIsNewDbgInfoFormat() is true).
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * The debug format can be switched later after inserting the records using
 * LLVMSetIsNewDbgInfoFormat, if needed for legacy or transitionary reasons.
 *
 * Insert a new debug record before the given instruction.
 * \param Builder     The DIBuilder.
 * \param Val         The value of the variable.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Instr       Instruction acting as a location for the new record.
 *)
function LLVMDIBuilderInsertDbgValueRecordBefore(
    Builder: TLLVMDIBuilderRef;
    Val: TLLVMValueRef;
    VarInfo: TLLVMMetadataRef;
    Expr: TLLVMMetadataRef;
    DebugLoc: TLLVMMetadataRef;
    Instr: TLLVMValueRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Only use in "new debug format" (LLVMIsNewDbgInfoFormat() is true).
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * The debug format can be switched later after inserting the records using
 * LLVMSetIsNewDbgInfoFormat, if needed for legacy or transitionary reasons.
 *
 * Insert a new debug record at the end of the given basic block. If the
 * basic block has a terminator instruction, the record is inserted before
 * that terminator instruction.
 * \param Builder     The DIBuilder.
 * \param Val         The value of the variable.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Block       Basic block acting as a location for the new record.
 *)
function LLVMDIBuilderInsertDbgValueRecordAtEnd(
    Builder: TLLVMDIBuilderRef;
    Val: TLLVMValueRef;
    VarInfo: TLLVMMetadataRef;
    Expr: TLLVMMetadataRef;
    DebugLoc: TLLVMMetadataRef;
    Block: TLLVMBasicBlockRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Create a new descriptor for a local auto variable.
 * \param Builder         The DIBuilder.
 * \param Scope           The local scope the variable is declared in.
 * \param Name            Variable name.
 * \param NameLen         Length of variable name.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Metadata describing the type of the variable.
 * \param AlwaysPreserve  If true, this descriptor will survive optimizations.
 * \param Flags           Flags.
 * \param AlignInBits     Variable alignment.
 *)
function LLVMDIBuilderCreateAutoVariable(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    Ty: TLLVMMetadataRef;
    AlwaysPreserve: LongBool;
    Flags: TLLVMDIFlags;
    AlignInBits: UInt32): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Create a new descriptor for a function parameter variable.
 * \param Builder         The DIBuilder.
 * \param Scope           The local scope the variable is declared in.
 * \param Name            Variable name.
 * \param NameLen         Length of variable name.
 * \param ArgNo           Unique argument number for this variable; starts at 1.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Metadata describing the type of the variable.
 * \param AlwaysPreserve  If true, this descriptor will survive optimizations.
 * \param Flags           Flags.
 *)
function LLVMDIBuilderCreateParameterVariable(
    Builder: TLLVMDIBuilderRef;
    Scope: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    ArgNo: Cardinal;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    Ty: TLLVMMetadataRef;
    AlwaysPreserve: LongBool;
    Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Get the metadata of the subprogram attached to a function.
 *
 * @see llvm::Function::getSubprogram()
 *)
function LLVMGetSubprogram(Func: TLLVMValueRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Set the subprogram attached to a function.
 *
 * @see llvm::Function::setSubprogram()
 *)
procedure LLVMSetSubprogram(Func: TLLVMValueRef; SP: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * Get the line associated with a given subprogram.
 * \param Subprogram     The subprogram object.
 *
 * @see DISubprogram::getLine()
 *)
function LLVMDISubprogramGetLine(Subprogram: TLLVMMetadataRef): Cardinal; cdecl; external CLLVMLibrary;

(**
 * Replace the subprogram subroutine type.
 * \param Subprogram        The subprogram object.
 * \param SubroutineType    The new subroutine type.
 *
 * @see DISubprogram::replaceType()
 *)
procedure LLVMDISubprogramReplaceType(Subprogram: TLLVMMetadataRef; SubroutineType: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * Get the debug location for the given instruction.
 *
 * @see llvm::Instruction::getDebugLoc()
 *)
function LLVMInstructionGetDebugLoc(Inst: TLLVMValueRef): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Set the debug location for the given instruction.
 *
 * To clear the location metadata of the given instruction, pass NULL to \p Loc.
 *
 * @see llvm::Instruction::setDebugLoc()
 *)
procedure LLVMInstructionSetDebugLoc(Inst: TLLVMValueRef; Loc: TLLVMMetadataRef); cdecl; external CLLVMLibrary;

(**
 * Create a new descriptor for a label
 *
 * \param Builder         The DIBuilder.
 * \param Scope           The scope to create the label in.
 * \param Name            Variable name.
 * \param NameLen         Length of variable name.
 * \param File            The file to create the label in.
 * \param LineNo          Line Number.
 * \param AlwaysPreserve  Preserve the label regardless of optimization.
 *
 * @see llvm::DIBuilder::createLabel()
 *)
function LLVMDIBuilderCreateLabel(
    Builder: TLLVMDIBuilderRef;
    Context: TLLVMMetadataRef;
    const Name: PLLVMChar;
    NameLen: TLLVMSizeT;
    AFile: TLLVMMetadataRef;
    LineNo: Cardinal;
    AlwaysPreserve: LongBool): TLLVMMetadataRef; cdecl; external CLLVMLibrary;

(**
 * Insert a new llvm.dbg.label intrinsic call
 *
 * \param Builder         The DIBuilder.
 * \param LabelInfo       The Label's debug info descriptor
 * \param Location        The debug info location
 * \param InsertBefore    Location for the new intrinsic.
 *
 * @see llvm::DIBuilder::insertLabel()
 *)
function LLVMDIBuilderInsertLabelBefore(
    Builder: TLLVMDIBuilderRef;
    LabelInfo: TLLVMMetadataRef;
    Location: TLLVMMetadataRef;
    InsertBefore: TLLVMValueRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Insert a new llvm.dbg.label intrinsic call
 *
 * \param Builder         The DIBuilder.
 * \param LabelInfo       The Label's debug info descriptor
 * \param Location        The debug info location
 * \param InsertAtEnd     Location for the new intrinsic.
 *
 * @see llvm::DIBuilder::insertLabel()
 *)
function LLVMDIBuilderInsertLabelAtEnd(
    Builder: TLLVMDIBuilderRef;
    LabelInfo: TLLVMMetadataRef;
    Location: TLLVMMetadataRef;
    InsertAtEnd: TLLVMBasicBlockRef): TLLVMDbgRecordRef; cdecl; external CLLVMLibrary;

(**
 * Obtain the enumerated type of a Metadata instance.
 *
 * @see llvm::Metadata::getMetadataID()
 *)
function LLVMGetMetadataKind(Metadata: TLLVMMetadataRef): TLLVMMetadataKind; cdecl; external CLLVMLibrary;

implementation

end.
