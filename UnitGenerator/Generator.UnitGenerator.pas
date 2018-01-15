unit Generator.UnitGenerator;

interface

uses
  Classes,
  Types,
  Spring.Collections,
  DelphiAST,
  DelphiAST.Classes,
  DelphiAST.Consts,
  Generator.Types;

type
  TMethodFilter = reference to function(const ANode: TSyntaxNode): Boolean;
  TStringCleaner = reference to function(const AString: string): string;

  TLLVMUnitGenerator = class
  private
    FUnits: IList<TSyntaxNode>;
    FMethods: IList<TSyntaxNode>;
    procedure AddUnit(const AFile: string);
    procedure DefineClass(AUnit: TGenUnit; const AName: string; AConstructors: array of string; const ADestructor: string; const AMethodFilter: TMethodFilter; const ANameCleaner: TStringCleaner);
    function CreateMethod(const AClass: string; ANode: TSyntaxNode; ANameCleaner: TStringCleaner; const AAlias: string = ''): TGenMethod;
    function ParameterFilter(const AParameterType: string; const AParameterName: string = ''): TMethodFilter;
    function DefaultNameCleaner(const AReplaces: array of string): TStringCleaner;
    procedure SaveUnit(const AUnit: TGenUnit; const ATargetDir: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Execute(const ASourceDir: string; ATargetDir: string);
  end;

implementation

uses
  IOUtils,
  SysUtils,
  StrUtils,
  Generator.LineWriter.Intf,
  Generator.LineWriter,
  Generator.ItemWriter.Intf,
  Generator.ItemWriter.PasWriter;

{ TLLVMUnitGenerator }

procedure TLLVMUnitGenerator.AddUnit(const AFile: string);
var
  LUnit: TSyntaxNode;
  LInterfaceNode, LNode: TSyntaxNode;
begin
  LUnit := TPasSyntaxTreeBuilder.Run(AFile, True);
  FUnits.Add(LUnit);
  LInterfaceNode := LUnit.FindNode(ntInterface);
  if Assigned(LInterfaceNode) then
  begin
    for LNode in LInterfaceNode.ChildNodes do
    begin
      if LNode.Typ = ntMethod then
        FMethods.Add(LNode);
    end;
  end;
end;

constructor TLLVMUnitGenerator.Create;
begin
  inherited;
  FUnits := TCollections.CreateObjectList<TSyntaxNode>();
  FMethods := TCollections.CreateList<TSyntaxNode>();
end;

function TLLVMUnitGenerator.CreateMethod(const AClass: string;
  ANode: TSyntaxNode; ANameCleaner: TStringCleaner; const AAlias: string = ''): TGenMethod;
var
  LName: string;
  LReturnType, LParameters, LChild: TSyntaxNode;
  LParameter: TGenParameter;
begin
  Result := TGenMethod.Create();
  LName := ANode.GetAttribute(anName);
  Result.FunctionName := LName;
  if AAlias = '' then
  begin
    Result.Name := ANameCleaner(LName);
  end
  else
    Result.Name := AAlias;

  LParameters := ANode.FindNode(ntParameters);
  if Assigned(LParameters) then
  begin
    for LChild in LParameters.ChildNodes do
    begin
      LParameter := TGenParameter.Create();
      LParameter.Name := (LChild.FindNode(ntName) as TValuedSyntaxNode).Value;
      LParameter.TypeName := LChild.FindNode(ntType).GetAttribute(anName);
      Result.Parameters.Add(LParameter);
    end;
  end;

  LReturnType := ANode.FindNode(ntReturnType);
  if Assigned(LReturnType) then
    Result.ReturnType := LReturnType.FindNode(ntType).GetAttribute(anName);
end;

function TLLVMUnitGenerator.DefaultNameCleaner(
  const AReplaces: array of string): TStringCleaner;
var
  LReplaces: TArray<string>;
  i: Integer;
begin
  SetLength(LReplaces, Length(AReplaces));
  for i := 0 to High(LReplaces) do
    LReplaces[i] := AReplaces[i];
  Result := function(const AName: string): string
            var
              LToReplace: string;
            begin
              Result := AName;
              if StartsText('LLVM', Result) then
                Result := Copy(Result, 5, Length(Result));
//              if StartsText(AClass, Result) then
//                Result := Copy(Result, Length(AClass), Length(Result));
              for LToReplace in LReplaces do
                Result := ReplaceText(Result, LToReplace, '');
            end;
end;

procedure TLLVMUnitGenerator.DefineClass(AUnit: TGenUnit; const AName: string;
  AConstructors: array of string; const ADestructor: string;
  const AMethodFilter: TMethodFilter; const ANameCleaner: TStringCleaner);
var
  LClass: TGenClass;
  LMethodNode: TSyntaxNode;
  LName: string;
begin
  LClass := TGenClass.Create();
  try
    LClass.Name := AName;
    for LMethodNode in FMethods do
    begin
      LName := LMethodNode.GetAttribute(anName);
      if AnsiIndexText(LName, AConstructors) > -1 then
        LClass.Constructors.Add(CreateMethod(AName, LMethodNode, ANameCleaner,  'Create'))
      else if SameText(LName, ADestructor) then
        LClass.DestructorMethod := CreateMethod(AName, LMethodNode, ANameCleaner, 'Free')
      else if AMethodFilter(LMethodNode) then
        LClass.Methods.Add(CreateMethod(AName, LMethodNode, ANameCleaner))
    end;
  finally
    AUnit.Classes.Add(LClass);
  end;
end;

destructor TLLVMUnitGenerator.Destroy;
begin
  FMethods := nil;
  FUnits := nil;
  inherited;
end;

procedure TLLVMUnitGenerator.Execute(const ASourceDir: string;
  ATargetDir: string);
var
  LPasFiles: TStringDynArray;
  LFile: string;
  LUnit: TGenUnit;
begin
  LPasFiles := TDirectory.GetFiles(ASourceDir, 'LLVM.Imports.*.pas');
  for LFile in LPasFiles do
    AddUnit(LFile);

  LUnit := TGenUnit.Create();
  LUnit.Name := 'LLVM';
  DefineClass(LUnit, 'LLVMModule',['LLVMModuleCreateWithName', 'LLVMModuleCreateWithNameInContext'], 'LLVMDisposeModule', ParameterFilter('TLLVMModuleRef'), DefaultNameCleaner(['LLVMModule', 'ForModule', 'ForExistingModule', 'Modules2', 'Module', 'Orc']));
  SaveUnit(LUnit, ATargetDir);
end;

function TLLVMUnitGenerator.ParameterFilter(const AParameterType,
  AParameterName: string): TMethodFilter;
begin
  Result := function(const AMethod: TSyntaxNode): Boolean
            var
              LParameters: TSyntaxNode;
              LParameter: TSyntaxNode;
              LTypeName, LName: string;
            begin
              Result := False;
              LParameters := AMethod.FindNode(ntParameters);
              if Assigned(LParameters) then
              begin
                LParameter := LParameters.ChildNodes[0];
                LName := (LParameter.FindNode(ntName) as TValuedSyntaxNode).Value;
                LTypeName := LParameter.FindNode(ntType).GetAttribute(anName);
                Result := SameText(LTypeName, AParameterType)
                          or SameText(LName, AParameterName);
              end;
            end;
end;

procedure TLLVMUnitGenerator.SaveUnit(const AUnit: TGenUnit;
  const ATargetDir: string);
var
  LLineWriter: ILineWriter;
  LPasWriter: IItemWriter<TGenUnit>;
  LFile: TStringList;
begin
  LFile := TStringList.Create();
  try
    LLineWriter := TLineWriter.Create(LFile);
    LPasWriter := TPasWriter.Create();
    LPasWriter.Execute(LLineWriter, AUnit);
    LFile.SaveToFile(TPath.Combine(ATargetDir, AUnit.Name + '.pas'));
  finally
    LFile.Free();
  end;
end;

end.
