unit LLVM.Imports;

interface
   uses System.SysUtils;

const
  CLLVMLibrary = 'LLVM-C-10-0-0.dll';

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

   if Result then
   begin
       try
          CompareMem(Value,Value,SizeOf(Value))
       except
          Result := False;
       end;
   end;

   if Result then
   begin
       try
          Move(Value,Value,SizeOf(Value))
       except
          Result := False;
       end;
   end;
end;

end.
