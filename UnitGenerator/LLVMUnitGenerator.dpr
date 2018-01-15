program LLVMUnitGenerator;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Generator.UnitGenerator in 'Generator.UnitGenerator.pas',
  Generator.Types in 'Generator.Types.pas',
  Generator.LineWriter in 'Generator.LineWriter.pas',
  Generator.LineWriter.Intf in 'Generator.LineWriter.Intf.pas',
  Generator.ItemWriter.PasWriter in 'Generator.ItemWriter.PasWriter.pas',
  Generator.ItemWriter.Intf in 'Generator.ItemWriter.Intf.pas';

var
  LGenerator: TLLVMUnitGenerator;
begin
  try
    LGenerator := TLLVMUnitGenerator.Create();
    try
      LGenerator.Execute(ParamStr(1), ParamStr(2));
    finally
      LGenerator.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
