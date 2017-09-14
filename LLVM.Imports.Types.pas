unit LLVM.Imports.Types;

interface

//based on Types.h

uses
  LLVM.Imports;

type
  TLLVMBool = packed record
    ResultCode: Integer;
    class operator Implicit(const AValue: TLLVMBool): Boolean;
  end;

  TLLVMMemoryBufferRef = type TLLVMRef;

  TLLVMContextRef = type TLLVMRef;

  TLLVMModuleRef = type TLLVMRef;

  TLLVMTypeRef = type TLLVMRef;

  TLLVMValueRef = type TLLVMRef;

  TLLVMBasicBlockRef = type TLLVMRef;

  TLLVMMetadataRef = type TLLVMRef;

  TLLVMBuilderRef = type TLLVMRef;

  TLLVMDIBuilderRef = type TLLVMRef;

  TLLVMModuleProviderRef = type TLLVMRef;

  TLLVMPassManagerRef = type TLLVMRef;

  TLLVMPassRegistryRef = type TLLVMRef;

  TLLVMUseRef = type TLLVMRef;

  TLLVMAttributeRef = type TLLVMRef;

  TLLVMDiagnosticInfoRef = type TLLVMRef;

implementation

class operator TLLVMBool.Implicit(const AValue: TLLVMBool): Boolean;
begin
  Result := AValue.ResultCode = 0;
end;

end.
