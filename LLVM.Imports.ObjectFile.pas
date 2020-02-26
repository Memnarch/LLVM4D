unit LLVM.Imports.ObjectFile;

interface

//based on Object.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

type
  TLLVMObjectFileRef = type TLLVMRef;
  TLLVMSectionIteratorRef = type TLLVMRef;
  TLLVMSymbolIteratorRef = type TLLVMRef;
  TLLVMRelocationIteratorRef = type TLLVMRef;

TLLVMBinaryType = (
  LLVMBinaryTypeArchive,                (* Archive file. *)
  LLVMBinaryTypeMachOUniversalBinary,   (* Mach-O Universal Binary file. *)
  LLVMBinaryTypeCOFFImportFile,         (* COFF Import file. *)
  LLVMBinaryTypeIR,                     (* LLVM IR. *)
  LLVMBinaryTypeWinRes,                 (* Windows resource (.res) file. *)
  LLVMBinaryTypeCOFF,                   (* COFF Object file. *)
  LLVMBinaryTypeELF32L,                 (* ELF 32-bit, little endian. *)
  LLVMBinaryTypeELF32B,                 (* ELF 32-bit, big endian. *)
  LLVMBinaryTypeELF64L,                 (* ELF 64-bit, little endian. *)
  LLVMBinaryTypeELF64B,                 (* ELF 64-bit, big endian. *)
  LLVMBinaryTypeMachO32L,               (* MachO 32-bit, little endian. *)
  LLVMBinaryTypeMachO32B,               (* MachO 32-bit, big endian. *)
  LLVMBinaryTypeMachO64L,               (* MachO 64-bit, little endian. *)
  LLVMBinaryTypeMachO64B,               (* MachO 64-bit, big endian. *)
  LLVMBinaryTypeWasm                    (* Web Assembly. *)
) ;

(*
 * Create a binary file from the given memory buffer.
 *
 * The exact type of the binary file will be inferred automatically, and the
 * appropriate implementation selected.  The context may be NULL except if
 * the resulting file is an LLVM IR file.
 *
 * The memory buffer is not consumed by this function.  It is the responsibilty
 * of the caller to free it with \c LLVMDisposeMemoryBuffer.
 *
 * If NULL is returned, the \p ErrorMessage parameter is populated with the
 * error's description.  It is then the caller's responsibility to free this
 * message by calling \c LLVMDisposeMessage.
 *
 * @see llvm::object::createBinary
 *)
function LLVMCreateBinary(MemBuf: TLLVMMemoryBufferRef; Context: TLLVMContextRef; ErrorMessage: PLLVMChar):TLLVMBinaryRef; cdecl; external CLLVMLibrary;

(*
 * Dispose of a binary file.
 *
 * The binary file does not own its backing buffer.  It is the responsibilty
 * of the caller to free it with \c LLVMDisposeMemoryBuffer.
 *)
procedure LLVMDisposeBinary(BR: TLLVMBinaryRef);cdecl; external CLLVMLibrary;

(*
 * Retrieves a copy of the memory buffer associated with this object file.
 *
 * The returned buffer is merely a shallow copy and does not own the actual
 * backing buffer of the binary. Nevertheless, it is the responsibility of the
 * caller to free it with \c LLVMDisposeMemoryBuffer.
 *
 * @see llvm::object::getMemoryBufferRef
 *)
function LLVMBinaryCopyMemoryBuffer(BR: TLLVMBinaryRef): TLLVMMemoryBufferRef;cdecl; external CLLVMLibrary;

(*
 * Retrieve the specific type of a binary.
 *
 * @see llvm::object::Binary::getType
 *)
function LLVMBinaryGetType(BR: TLLVMBinaryRef): TLLVMBinaryType; cdecl; external CLLVMLibrary;

(*
 * For a Mach-O universal binary file, retrieves the object file corresponding
 * to the given architecture if it is present as a slice.
 *
 * If NULL is returned, the \p ErrorMessage parameter is populated with the
 * error's description.  It is then the caller's responsibility to free this
 * message by calling \c LLVMDisposeMessage.
 *
 * It is the responsiblity of the caller to free the returned object file by
 * calling \c LLVMDisposeBinary.
 *)
function LLVMMachOUniversalBinaryCopyObjectForArch(BR          : TLLVMBinaryRef;
                                                   Arch        : PLLVMChar;
                                                   ArchLen     : TLLVMSizeT;
                                                   ErrorMessage: PLLVMChar): TLLVMBinaryRef;cdecl; external CLLVMLibrary;

(*
 * Retrieve a copy of the section iterator for this object file.
 *
 * If there are no sections, the result is NULL.
 *
 * The returned iterator is merely a shallow copy. Nevertheless, it is
 * the responsibility of the caller to free it with
 * \c LLVMDisposeSectionIterator.
 *
 * @see llvm::object::sections()
 *)
function LLVMObjectFileCopySectionIterator(BR: TLLVMBinaryRef): TLLVMSectionIteratorRef; cdecl; external CLLVMLibrary;

(*
 * Returns whether the given section iterator is at the end.
 *
 * @see llvm::object::section_end
 *)
function LLVMObjectFileIsSectionIteratorAtEnd(BR: TLLVMBinaryRef; SI: TLLVMSectionIteratorRef): TLLVMBool; cdecl; external CLLVMLibrary;

(*
 * Retrieve a copy of the symbol iterator for this object file.
 *
 * If there are no symbols, the result is NULL.
 *
 * The returned iterator is merely a shallow copy. Nevertheless, it is
 * the responsibility of the caller to free it with
 * \c LLVMDisposeSymbolIterator.
 *
 * @see llvm::object::symbols()
 *)
function LLVMObjectFileCopySymbolIterator(BR: TLLVMBinaryRef): TLLVMSymbolIteratorRef; cdecl; external CLLVMLibrary;

(*
 * Returns whether the given symbol iterator is at the end.
 *
 * @see llvm::object::symbol_end
 *)
function LLVMObjectFileIsSymbolIteratorAtEnd(BR: TLLVMBinaryRef; SI: TLLVMSymbolIteratorRef): TLLVMBool; cdecl; external CLLVMLibrary;

// ObjectFile Section iterators
procedure LLVMDisposeSectionIterator(SI: TLLVMSectionIteratorRef); cdecl; external CLLVMLibrary;
procedure LLVMMoveToNextSection(SI: TLLVMSectionIteratorRef); cdecl; external CLLVMLibrary;
procedure LLVMMoveToContainingSection(Sect: TLLVMSectionIteratorRef; Sym: TLLVMSymbolIteratorRef); cdecl; external CLLVMLibrary;

// ObjectFile Symbol iterators
procedure LLVMDisposeSymbolIterator(SI: TLLVMSymbolIteratorRef); cdecl; external CLLVMLibrary;
procedure LLVMMoveToNextSymbol(SI: TLLVMSymbolIteratorRef); cdecl; external CLLVMLibrary;

// SectionRef accessors
function LLVMGetSectionName(SI: TLLVMSectionIteratorRef): PLLVMChar; cdecl; external CLLVMLibrary;
function LLVMGetSectionSize(SI: TLLVMSectionIteratorRef): UInt64; cdecl; external CLLVMLibrary;
function LLVMGetSectionContents(SI: TLLVMSectionIteratorRef): PLLVMChar; cdecl; external CLLVMLibrary;
function LLVMGetSectionAddress(SI: TLLVMSectionIteratorRef): UInt64; cdecl; external CLLVMLibrary;
function LLVMGetSectionContainsSymbol(SI: TLLVMSectionIteratorRef; Sym: TLLVMSymbolIteratorRef): TLLVMBool; cdecl; external CLLVMLibrary;

// Section Relocation iterators
function LLVMGetRelocations(Section: TLLVMSectionIteratorRef): TLLVMRelocationIteratorRef; cdecl; external CLLVMLibrary;
procedure LLVMDisposeRelocationIterator(RI: TLLVMRelocationIteratorRef); cdecl; external CLLVMLibrary;
function LLVMIsRelocationIteratorAtEnd(Section: TLLVMSectionIteratorRef; RI: TLLVMRelocationIteratorRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMMoveToNextRelocation(RI: TLLVMRelocationIteratorRef); cdecl; external CLLVMLibrary;


// SymbolRef accessors
function LLVMGetSymbolName(SI: TLLVMSymbolIteratorRef): PLLVMChar; cdecl; external CLLVMLibrary;
function LLVMGetSymbolAddress(SI: TLLVMSymbolIteratorRef): UInt64; cdecl; external CLLVMLibrary;
function LLVMGetSymbolSize(SI: TLLVMSymbolIteratorRef): UInt64; cdecl; external CLLVMLibrary;

// RelocationRef accessors
function LLVMGetRelocationOffset(RI: TLLVMRelocationIteratorRef): UInt64; cdecl; external CLLVMLibrary;
function LLVMGetRelocationSymbol(RI: TLLVMRelocationIteratorRef): TLLVMSymbolIteratorRef; cdecl; external CLLVMLibrary;
function LLVMGetRelocationType(RI: TLLVMRelocationIteratorRef): UInt64; cdecl; external CLLVMLibrary;
// NOTE: Caller takes ownership of returned string of the two
// following functions.
function LLVMGetRelocationTypeName(RI: TLLVMRelocationIteratorRef): PLLVMChar; cdecl; external CLLVMLibrary;
function LLVMGetRelocationValueString(RI: TLLVMRelocationIteratorRef): PLLVMChar; cdecl; external CLLVMLibrary;

{/** Deprecated: Use LLVMCreateBinary instead. */}
function LLVMCreateObjectFile(MemBuf: TLLVMMemoryBufferRef): TLLVMObjectFileRef; cdecl; external CLLVMLibrary;
{/** Deprecated: Use LLVMDisposeBinary instead. */}
procedure LLVMDisposeObjectFile(ObjectFile: TLLVMObjectFileRef); cdecl; external CLLVMLibrary;
{/** Deprecated: Use LLVMObjectFileCopySectionIterator instead. */}
function LLVMGetSections(ObjectFile: TLLVMObjectFileRef): TLLVMSectionIteratorRef; cdecl; external CLLVMLibrary;
{/** Deprecated: Use LLVMObjectFileIsSectionIteratorAtEnd instead. */}
function LLVMIsSectionIteratorAtEnd(ObjectFile: TLLVMObjectFileRef; SI: TLLVMSectionIteratorRef): TLLVMBool; cdecl; external CLLVMLibrary;
{/** Deprecated: Use LLVMObjectFileCopySymbolIterator instead. */}
function LLVMGetSymbols(ObjectFile: TLLVMObjectFileRef): TLLVMSymbolIteratorRef; cdecl; external CLLVMLibrary;
{/** Deprecated: Use LLVMObjectFileIsSymbolIteratorAtEnd instead. */}
function LLVMIsSymbolIteratorAtEnd(ObjectFile: TLLVMObjectFileRef; SI: TLLVMSymbolIteratorRef): TLLVMBool; cdecl; external CLLVMLibrary;

implementation

end.
