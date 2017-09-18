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
  PLLVMTypeRef = ^TLLVMTypeRef;

  TLLVMValueRef = type TLLVMRef;
  PLLVMValueRef = ^TLLVMValueRef;

  TLLVMBasicBlockRef = type TLLVMRef;
  PLLVMBasicBlockRef = ^TLLVMBasicBlockRef;

  TLLVMMetadataRef = type TLLVMRef;

  TLLVMBuilderRef = type TLLVMRef;

  TLLVMDIBuilderRef = type TLLVMRef;

  TLLVMModuleProviderRef = type TLLVMRef;

  TLLVMPassManagerRef = type TLLVMRef;

  TLLVMPassRegistryRef = type TLLVMRef;

  TLLVMUseRef = type TLLVMRef;

  TLLVMAttributeRef = type TLLVMRef;
  PLLVMAttributeRef = ^TLLVMAttributeRef;

  TLLVMDiagnosticInfoRef = type TLLVMRef;

implementation

class operator TLLVMBool.Implicit(const AValue: TLLVMBool): Boolean;
begin
  Result := AValue.ResultCode = 0;
end;

end.
