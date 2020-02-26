unit LLVM.Imports.OrcBindings;

interface

//based on OrcBindings.h

uses
  LLVM.Imports,
  LLVM.Imports.Types,
  LLVM.Imports.TargetMachine,
  LLVM.Imports.Error;

type
  TLLVMSharedModuleRef = type TLLVMRef;
  TLLVMSharedObjectBufferRef = type TLLVMRef;
  TLLVMOrcJITStackRef = type TLLVMRef;
  TLLVMOrcModuleHandle = type UInt64;
  TLLVMOrcTargetAddress = type UInt64;
  TLLVMOrcSymbolResolverFn = function(const Name: PLLVMChar; LookupCtx: Pointer): UInt64; cdecl;
  TLLVMOrcLazyCompileCallbackFn = function(JITStack: TLLVMOrcJITStackRef; CallbackCtx: Pointer): UInt64; cdecl;

{$MINENUMSIZE 4}
  
{**
 * Create an ORC JIT stack.
 *
 * The client owns the resulting stack, and must call OrcDisposeInstance(...)
 * to destroy it and free its memory. The JIT stack will take ownership of the
 * TargetMachine, which will be destroyed when the stack is destroyed. The
 * client should not attempt to dispose of the Target Machine, or it will result
 * in a double-free.
 *}
function LLVMOrcCreateInstance(TM: TLLVMTargetMachineRef): TLLVMOrcJITStackRef; cdecl; external CLLVMLibrary;

{**
 * Get the error message for the most recent error (if any).
 *
 * This message is owned by the ORC JIT Stack and will be freed when the stack
 * is disposed of by LLVMOrcDisposeInstance.
 *}
function LLVMOrcGetErrorMsg(JITStack: TLLVMOrcJITStackRef): PLLVMChar; cdecl; external CLLVMLibrary;

{**
 * Mangle the given symbol.
 * Memory will be allocated for MangledSymbol to hold the result. The client
 *}
procedure LLVMOrcGetMangledSymbol(JITStack: TLLVMOrcJITStackRef; out MangledSymbol: PLLVMChar; const Symbol: PLLVMChar); cdecl; external CLLVMLibrary;

{**
 * Dispose of a mangled symbol.
 *}
procedure LLVMOrcDisposeMangledSymbol(MangledSymbol: PLLVMChar); cdecl; external CLLVMLibrary;

{**
 * Create a lazy compile callback.
 *}

function LLVMOrcCreateLazyCompileCallback(JITStack: TLLVMOrcJITStackRef; var RetAddr: TLLVMOrcTargetAddress; Callback: TLLVMOrcLazyCompileCallbackFn; CallbackCtx: Pointer): TLLVMErrorRef; cdecl; external CLLVMLibrary;

{**
 * Create a named indirect call stub.
 *}
function LLVMOrcCreateIndirectStub(JITStack: TLLVMOrcJITStackRef; const StubName: PLLVMChar; InitAddr: TLLVMOrcTargetAddress): TLLVMErrorRef; cdecl; external CLLVMLibrary;

{**
 * Set the pointer for the given indirect stub.
 *}
function LLVMOrcSetIndirectStubPointer(JITStack: TLLVMOrcJITStackRef; const StubName: PLLVMChar; NewAddr: TLLVMOrcTargetAddress): TLLVMErrorRef; cdecl; external CLLVMLibrary;

{**
 * Add module to be eagerly compiled.
 *}

function LLVMOrcAddEagerlyCompiledIR(JITStack: TLLVMOrcJITStackRef; out RetHandle: TLLVMOrcModuleHandle; Module: TLLVMSharedModuleRef; SymbolResolver: TLLVMOrcSymbolResolverFn; SymbolResolverCtx: Pointer): TLLVMErrorRef; cdecl; external CLLVMLibrary;

{**
 * Add module to be lazily compiled one function at a time.
 *}

function LLVMOrcAddLazilyCompiledIR(JITStack: TLLVMOrcJITStackRef; out RetHandle: TLLVMOrcModuleHandle; Module: TLLVMSharedModuleRef; SymbolResolver: TLLVMOrcSymbolResolverFn; SymbolResolverCtx: Pointer): TLLVMErrorRef; cdecl; external CLLVMLibrary;

{**
 * Add an object file.
 *}
function LLVMOrcAddObjectFile(JITStack: TLLVMOrcJITStackRef; out RetHandle: TLLVMOrcModuleHandle; Obj: TLLVMSharedObjectBufferRef; SymbolResolver: TLLVMOrcSymbolResolverFn; SymbolResolverCtx: Pointer): TLLVMErrorRef; cdecl; external CLLVMLibrary;

{**
 * Remove a module set from the JIT.
 *
 * This works for all modules that can be added via OrcAdd*, including object
 * files.
 *}
function LLVMOrcRemoveModule(JITStack: TLLVMOrcJITStackRef; H: TLLVMOrcModuleHandle): TLLVMErrorRef; cdecl; external CLLVMLibrary;

{**
 * Get symbol address from JIT instance.
 *}
function LLVMOrcGetSymbolAddress(JITStack: TLLVMOrcJITStackRef; out RetAddr: TLLVMOrcTargetAddress; const SymbolName: PLLVMChar): TLLVMErrorRef; cdecl; external CLLVMLibrary;

(**
 * Get symbol address from JIT instance, searching only the specified
 * handle.
 *)
function LLVMOrcGetSymbolAddressIn(JITStack: TLLVMOrcJITStackRef; out RetAddr: TLLVMOrcTargetAddress; H: TLLVMOrcModuleHandle; const SymbolName: PLLVMChar):TLLVMErrorRef;cdecl; external CLLVMLibrary;

{**
 * Dispose of an ORC JIT stack.
 *}
function LLVMOrcDisposeInstance(JITStack: TLLVMOrcJITStackRef): TLLVMErrorRef; cdecl; external CLLVMLibrary;


implementation

end.
