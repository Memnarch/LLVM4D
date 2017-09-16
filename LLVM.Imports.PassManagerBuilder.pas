unit LLVM.Imports.PassManagerBuilder;

interface

//based on PassManagerBuilder.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

type
  TLLVMPassManagerBuilderRef = type TLLVMRef;


function LLVMPassManagerBuilderCreate: TLLVMPassManagerBuilderRef; cdecl; external CLLVMLibrary;
procedure LLVMPassManagerBuilderDispose(PMB: TLLVMPassManagerBuilderRef); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderSetOptLevel(PMB: TLLVMPassManagerBuilderRef; OptLevel: Cardinal); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderSetSizeLevel(PMB: TLLVMPassManagerBuilderRef; SizeLevel: Cardinal); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderSetDisableUnitAtATime(PMB: TLLVMPassManagerBuilderRef; Value: TLLVMBool); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderSetDisableUnrollLoops(PMB: TLLVMPassManagerBuilderRef; Value: TLLVMBool); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderSetDisableSimplifyLibCalls(PMB: TLLVMPassManagerBuilderRef; Value: TLLVMBool); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderUseInlinerWithThreshold(PMB: TLLVMPassManagerBuilderRef; Threshold: Cardinal); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderPopulateFunctionPassManager(PMB: TLLVMPassManagerBuilderRef; PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderPopulateModulePassManager(PMB: TLLVMPassManagerBuilderRef; PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

procedure LLVMPassManagerBuilderPopulateLTOPassManager(PMB: TLLVMPassManagerBuilderRef; PM: TLLVMPassManagerRef; Internalize: TLLVMBool; RunInliner: TLLVMBool); cdecl; external CLLVMLibrary;

implementation

end.
