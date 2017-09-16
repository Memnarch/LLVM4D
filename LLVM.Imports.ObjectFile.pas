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

// ObjectFile creation
function LLVMCreateObjectFile(MemBuf: TLLVMMemoryBufferRef): TLLVMObjectFileRef; cdecl; external CLLVMLibrary;
procedure LLVMDisposeObjectFile(ObjectFile: TLLVMObjectFileRef); cdecl; external CLLVMLibrary;

// ObjectFile Section iterators
function LLVMGetSections(ObjectFile: TLLVMObjectFileRef): TLLVMSectionIteratorRef; cdecl; external CLLVMLibrary;
procedure LLVMDisposeSectionIterator(SI: TLLVMSectionIteratorRef); cdecl; external CLLVMLibrary;
function LLVMIsSectionIteratorAtEnd(ObjectFile: TLLVMObjectFileRef; SI: TLLVMSectionIteratorRef): TLLVMBool; cdecl; external CLLVMLibrary;
procedure LLVMMoveToNextSection(SI: TLLVMSectionIteratorRef); cdecl; external CLLVMLibrary;
procedure LLVMMoveToContainingSection(Sect: TLLVMSectionIteratorRef; Sym: TLLVMSymbolIteratorRef); cdecl; external CLLVMLibrary;

// ObjectFile Symbol iterators
function LLVMGetSymbols(ObjectFile: TLLVMObjectFileRef): TLLVMSymbolIteratorRef; cdecl; external CLLVMLibrary;
procedure LLVMDisposeSymbolIterator(SI: TLLVMSymbolIteratorRef); cdecl; external CLLVMLibrary;
function LLVMIsSymbolIteratorAtEnd(ObjectFile: TLLVMObjectFileRef; SI: TLLVMSymbolIteratorRef): TLLVMBool; cdecl; external CLLVMLibrary;
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

implementation

end.
