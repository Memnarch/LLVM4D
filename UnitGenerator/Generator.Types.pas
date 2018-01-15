unit Generator.Types;

interface

uses
  Spring.Collections;

type
  TParameterPrefix = (ptNone, ptVar, ptOut);

  TGenParameter = class
  private
    FName: string;
    FTypeName: string;
    FPrefix: TParameterPrefix;
  public
    property Name: string read FName write FName;
    property TypeName: string read FTypeName write FTypeName;
    property Prefix: TParameterPrefix read FPrefix write FPrefix;
  end;

  TGenMethod = class
  private
    FName: string;
    FReturnType: string;
    FFunctionName: string;
    FParameters: IList<TGenParameter>;
    function GetHasReturnType: Boolean;
  public
    constructor Create;
    property Name: string read FName write FName;
    property FunctionName: string read FFunctionName write FFunctionName;
    property ReturnType: string read FReturnType write FReturnType;
    property HasReturnType: Boolean read GetHasReturnType;
    property Parameters: IList<TGenParameter> read FParameters;
  end;

  TGenProperty = class
  private
    FName: string;
    FSetter: TGenMethod;
    FGetter: TGenMethod;
  public
    property Name: string read FName write FName;
    property Getter: TGenMethod read FGetter write FGetter;
    property Setter: TGenMethod read FSetter write FSetter;
  end;

  TGenClass = class
  private
    FDestructorMethod: TGenMethod;
    FConstructors: IList<TGenMethod>;
    FProperties: IList<TGenProperty>;
    FMethods: IList<TGenMethod>;
    FName: string;
    function GetDelphiName: string;
  public
    constructor Create;
    property Name: string read FName write FName;
    property DelphiName: string read GetDelphiName;
    property Constructors: IList<TGenMethod> read FConstructors;
    property DestructorMethod: TGenMethod read FDestructorMethod write FDestructorMethod;
    property Methods: IList<TGenMethod> read FMethods;
    property Properties: IList<TGenProperty> read FProperties;
  end;

  TGenUnit = class
  private
    FClasses: IList<TGenClass>;
    FName: string;
  public
    constructor Create;
    property Classes: IList<TGenClass> read FClasses;
    property Name: string read FName write FName;
  end;

implementation

{ TGenUnit }

constructor TGenUnit.Create;
begin
  inherited;
  FClasses := TCollections.CreateObjectList<TGenClass>();
end;

{ TGenMethod }

constructor TGenMethod.Create;
begin
  inherited;
  FParameters := TCollections.CreateObjectList<TGenParameter>();
end;

function TGenMethod.GetHasReturnType: Boolean;
begin
  Result := FReturnType <> '';
end;

{ TGenClass }

constructor TGenClass.Create;
begin
  inherited;
  FConstructors := TCollections.CreateObjectList<TGenMethod>();
  FMethods := TCollections.CreateObjectList<TGenMethod>();
  FProperties := TCollections.CreateObjectList<TGenProperty>();
end;

function TGenClass.GetDelphiName: string;
begin
  Result := 'T' + FName;
end;

end.
