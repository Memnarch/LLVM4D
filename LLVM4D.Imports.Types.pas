unit LLVM4D.Imports.Types;

interface

//based on Types.h

//our Data Pointer is private right now and not used. We just wrap the references in records to allow helpers
{$Hints off}

type
  TLLVMBool = packed record
    ResultCode: Integer;
    class operator Implicit(const AValue: TLLVMBool): Boolean;
  end;

  TLLVMMemoryBufferRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMContextRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMModuleRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMTypeRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMValueRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMBasicBlockRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMMetadataRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMBuilderRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMDIBuilderRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMModuleProviderRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMPassManagerRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMPassRegistryRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMUseRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMAttributeRef = packed record
  private
    Data: Pointer;
  end;

  TLLVMDiagnosticInfoRef = packed record
  private
    Data: Pointer;
  end;

implementation

class operator TLLVMBool.Implicit(const AValue: TLLVMBool): Boolean;
begin
  Result := AValue.ResultCode = 0;
end;

end.
