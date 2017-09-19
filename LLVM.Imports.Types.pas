unit LLVM.Imports.Types;

interface

//based on Types.h

uses
  LLVM.Imports;

type
  TLLVMBool = packed record
    ResultCode: Integer;
    class operator Implicit(const AValue: TLLVMBool): Boolean;
    class operator Implicit(const AValue: Boolean): TLLVMBool;
    class operator LogicalNot(const AValue: TLLVMBool): TLLVMBool;
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

class operator TLLVMBool.Implicit(const AValue: Boolean): TLLVMBool;
begin
  if AValue then
    Result.ResultCode := 0
  else
    Result.ResultCode := 1;
end;

class operator TLLVMBool.LogicalNot(const AValue: TLLVMBool): TLLVMBool;
begin
  if AValue.ResultCode <> 0 then
    Result.ResultCode := 0
  else
    Result.ResultCode := 1;
end;

end.
