unit LLVM.Imports.InitFunctions;

interface

//based on Initialization.h

uses
  LLVM.Imports,
  LLVM.Imports.Types;

procedure LLVMInitializeCore(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeTransformUtils(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeScalarOpts(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeObjCARCOpts(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeVectorization(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeInstCombine(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeAggressiveInstCombiner(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeIPO(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeInstrumentation(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeAnalysis(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeIPA(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeCodeGen(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;
procedure LLVMInitializeTarget(R: TLLVMPassRegistryRef); cdecl; external CLLVMLibrary;

implementation

end.
