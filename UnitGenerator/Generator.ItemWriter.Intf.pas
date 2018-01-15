unit Generator.ItemWriter.Intf;

interface

uses
  Generator.Types,
  Generator.LineWriter.Intf;

type
  IItemWriter<T: class> = interface
    ['{F52E3C82-02A0-45F1-AF92-C53CDCD3A3CF}']
    procedure Execute(const AWriter: ILineWriter; AItem: T);
  end;

implementation

end.
