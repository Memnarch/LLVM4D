unit Generator.LineWriter.Intf;

interface

type
  ILineWriter = interface
    ['{D9314F4B-2713-4030-BEAF-9C46AEE18B57}']
    procedure Write(const ALine: string);
    procedure Ident;
    procedure UnIdent;
    procedure Space;
  end;

implementation

end.
