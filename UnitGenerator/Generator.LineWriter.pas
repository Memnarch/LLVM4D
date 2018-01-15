unit Generator.LineWriter;

interface

uses
  Classes,
  Generator.LineWriter.Intf;

type
  TLineWriter = class(TInterfacedObject, ILineWriter)
  private
    FTarget: TStrings;
    FIdentStr: string;
    FIdent: Integer;
    procedure UpdateIdent;
  public
    constructor Create(ATarget: TStrings);
    procedure Ident;
    procedure UnIdent;
    procedure Write(const ALine: string);
    procedure Space;
  end;

implementation

{ TLineWriter }

constructor TLineWriter.Create(ATarget: TStrings);
begin
  inherited Create();
  FTarget := ATarget;
end;

procedure TLineWriter.Ident;
begin
  Inc(FIdent);
  UpdateIdent();
end;

procedure TLineWriter.Space;
begin
  Write('');
end;

procedure TLineWriter.UnIdent;
begin
  if FIdent > 0 then
  begin
    Dec(FIdent);
    UpdateIdent();
  end;
end;

procedure TLineWriter.UpdateIdent;
const
  CIdentSize = 2;
begin

  FIdentStr := StringOfChar(' ', FIdent * CIdentSize);
end;

procedure TLineWriter.Write(const ALine: string);
begin
  FTarget.Add(FIdentStr + ALine);
end;

end.
