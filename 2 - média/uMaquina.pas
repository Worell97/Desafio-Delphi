unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, System.Generics.Collections, System.Math;

type
  TMaquinaDinheiro = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

function TMaquinaDinheiro.MontarTroco(aTroco: Double): TList;
var
  LTroco : TTroco;
  LListaTroco : TList;
  LCedula : TCedula;
  LQuantidade : Integer;
  Troco : Double;
begin
  LListaTroco := TList.Create;
  Troco := RoundTo(aTroco, -2); 
  for LCedula := Low(CValorCedula) to  High(CValorCedula) do
  begin           
  	LQuantidade := 0;
    while Troco >= CValorCedula[LCedula] do
    begin
    	LQuantidade := LQuantidade + 1; 
      Troco := Troco - CValorCedula[LCedula];   	
    end;
  	LTroco := TTroco.Create(LCedula, LQuantidade);  
    LListaTroco.Add(LTroco);  
  end;
  Result := LListaTroco;
end;
end.

