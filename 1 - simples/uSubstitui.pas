unit uSubstitui;

interface

uses
  uISubstitui;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    FInicioString, FFimString: Integer;
    FPalavraAumentou: Boolean;
    function Substituir(aStr, aVelho, aNovo: String): String;
    function StringExiste(aStr, aVelho: String): Boolean;
    function StringReplace(aStr, aVelho, aNovo: String): String;
  end;

implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
begin
  while StringExiste(aStr, aVelho) do
  begin
    aStr := StringReplace(aStr, aVelho, aNovo);
  end;
  Result := aStr;
end;

function TSubstitui.StringExiste(aStr, aVelho: String): Boolean;
var
  I, J: Integer;
begin
  FInicioString := 0;
  FFimString := 0;
  J := 1;
  for I := 1 to Length(aStr) do
  begin
    Result := False;
    if aStr[I] = aVelho[J] then
    begin
      if FInicioString = 0 then
        FInicioString := I;
      Result := True;
      FFimString := I + J;
      if aStr[I] <> aVelho[J] then
      begin
        Result := False;
        Break;
      end;
      Inc(J);
      if J > Length(aVelho) then
        Break;
    end
    else
    begin
      J := 1;
      FInicioString := 0;
      FFimString := 0;
    end;
  end;
end;

function TSubstitui.StringReplace(aStr, aVelho, aNovo: String): String;
var
  I, J, DifTamanho: Integer;
  StringAux: String;
begin
  if Length(aNovo) > Length(aVelho) then
  begin
    DifTamanho := (Length(aNovo) - Length(aVelho));
    FPalavraAumentou := True
  end
  else
  begin
    DifTamanho := (Length(aVelho) - Length(aNovo));
    FPalavraAumentou := False;
  end;
  J := 1;
  StringAux := aStr;
  for I := FInicioString to FInicioString + Length(aNovo) do
  begin
    if I <= Length(StringAux) then
      StringAux[I] := aNovo[J]
    else
      StringAux := StringAux + aNovo[J];
    Inc(J);
    if J > Length(aNovo) then
      Break;
  end;
  for I := FInicioString + Length(aNovo) to Length(aStr) + DifTamanho do
  begin
    if FPalavraAumentou then
    begin
      if (I <= Length(aStr)) then
        StringAux[I] := aStr[I - DifTamanho]
      else
        StringAux := StringAux + aStr[I - DifTamanho]
    end
    else
    begin
      if (I <= Length(aStr)) then
        StringAux[I] := aStr[I + DifTamanho]
      else
        StringAux := StringAux + aStr[I - DifTamanho]
    end;
  end;
  Result := StringAux;
end;

end.
