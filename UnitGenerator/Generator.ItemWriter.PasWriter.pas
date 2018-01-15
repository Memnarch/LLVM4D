unit Generator.ItemWriter.PasWriter;

interface

uses
  Spring.Collections,
  Generator.Types,
  Generator.LineWriter.Intf,
  Generator.ItemWriter.Intf;

type
  TPasWriter = class(TInterfacedObject, IItemWriter<TGenUnit>)
  private
    FTypeReplacements: IDictionary<string, string>;
    function GetType(const AType: string): string;
    procedure WriteClassHeader(const AWriter: ILineWriter; AClass: TGenClass);
    procedure WriteClassBody(const AWriter: ILineWriter; AClass: TGenClass);
    function GetParameterList(AMethod: TGenMethod; AFirstIsSelf: Boolean): string;
    procedure WriteMethodHeader(const AWriter: ILineWriter; AMethod: TGenMethod; const APrefix: string = ''; const AAttribute: string = '');
  public
    constructor Create;
    procedure Execute(const AWriter: ILineWriter; AUnit: TGenUnit);
  end;

implementation

uses
  Spring;

const
  CBaseType = 'TLLVMValueRef';
  CClassMethod = 'class';

{ TUnitWriter }

constructor TPasWriter.Create;
begin
  inherited;
  FTypeReplacements := TCollections.CreateDictionary<string, string>(TStringComparer.OrdinalIgnoreCase);
  FTypeReplacements.Add('PLLVMChar', 'string');
  FTypeReplacements.Add('TLLVMBool', 'Boolean');
  FTypeReplacements.Add('LongBool', 'Boolean');
end;

procedure TPasWriter.Execute(const AWriter: ILineWriter; AUnit: TGenUnit);
var
  LClass: TGenClass;
begin
  AWriter.Write('unit ' + AUnit.Name);
  AWriter.Space;
  AWriter.Write('interface');
  AWriter.Space;
  AWriter.Write('type');
  AWriter.Ident;
  for LClass in AUnit.Classes do
    WriteClassHeader(AWriter, LClass);
  AWriter.UnIdent;
  AWriter.Space;
  AWriter.Write('implementation');
  AWriter.Space;
  for LClass in AUnit.Classes do
    WriteClassBody(AWriter, LClass);
  AWriter.Write('end.');
end;

function TPasWriter.GetParameterList(AMethod: TGenMethod; AFirstIsSelf: Boolean): string;
var
  i, LStart: Integer;
  LParameter: TGenParameter;
begin
  Result := '';
  if AFirstIsSelf then
    LStart := 1
  else
    LStart := 0;

  for i := LStart to AMethod.Parameters.Count - 1 do
  begin
    if i > LStart then
      Result := Result + '; ';
    LParameter := AMethod.Parameters[i];
    Result := Result + LParameter.Name + ': ' + GetType(LParameter.TypeName);
  end;
  if Result <> '' then
    Result := '(' + Result + ')';
end;

function TPasWriter.GetType(const AType: string): string;
begin
  if not FTypeReplacements.TryGetValue(AType, Result) then
    Result := AType;
end;

procedure TPasWriter.WriteClassBody(const AWriter: ILineWriter;
  AClass: TGenClass);
begin

end;

procedure TPasWriter.WriteClassHeader(const AWriter: ILineWriter;
  AClass: TGenClass);
var
  LMethod: TGenMethod;
begin
  AWriter.Write(AClass.DelphiName + ' = type ' + CBaseType);
  AWriter.Write(AClass.DelphiName + 'Helper = record helper for ' + AClass.DelphiName);
  AWriter.Ident;
  for LMethod in AClass.Constructors do
    WriteMethodHeader(AWriter, LMethod, CClassMethod, 'overload');
  WriteMethodHeader(AWriter, AClass.DestructorMethod);
  for LMethod in AClass.Methods do
    WriteMethodHeader(AWriter, LMethod);
  AWriter.UnIdent;
  AWriter.Write('end;');
end;

procedure TPasWriter.WriteMethodHeader(const AWriter: ILineWriter;
  AMethod: TGenMethod; const APrefix: string; const AAttribute: string);
var
  LMethodType, LLine: string;
begin
  if AMethod.HasReturnType then
    LMethodType := 'function'
  else
    LMethodType := 'procedure';
  if APrefix <> '' then
    LMethodType := APrefix + ' ' + LMethodType;
  LLine := LMethodType + ' ' + AMethod.Name;
  LLine := LLine +  GetParameterList(AMethod, APrefix <> CClassMethod);
  if AMethod.HasReturnType then
    LLine := LLine + ': ' + GetType(AMethod.ReturnType);
  LLine := LLine + ';';
  if AAttribute <> '' then
    LLine := LLine + ' ' + AAttribute + ';';
  AWriter.Write(LLine);
end;

end.
