unit uIMaquina;

interface

uses
  Classes, uTroco;

type

  IMaquina = interface
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

end.

