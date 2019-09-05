unit LLVM.Imports;

interface

const
  CLLVMLibrary = 'LLVM_C.dll';

type
  TLLVMChar = AnsiChar;
  PLLVMChar = PAnsiChar;
  TLLVMSizeT = NativeUInt;

  TLLVMRef = packed record
  public
    Value: Pointer;
  public
    function IsValid: Boolean;
    class operator Implicit(AData: Pointer): TLLVMRef;
  end;

implementation

{ TLLVMRef }

class operator TLLVMRef.Implicit(AData: Pointer): TLLVMRef;
begin

end;

function TLLVMRef.IsValid: Boolean;
begin
  Result := Assigned(Value);
end;

end.
