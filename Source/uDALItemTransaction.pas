unit uDALItemTransaction;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils, System.Math, FireDAC.Stan.Param,
  Data.DB, FireDAC.Stan.Option, FireDac.Comp.Client;

type
  TDALItemTransaction = class
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetList(Query: TFDQuery);
  end;

var
  DALItemTransaction: TDALItemTransaction;

implementation

uses
  uDataSetHelper;

{ TDAOCategoria }

procedure TDALItemTransaction.GetList(Query: TFDQuery);
begin
  if Assigned(Query) then
  begin
    Query.Close;

    Query.SQL.Text :=
      'SELECT ID,' + sLineBreak +
      '       ItemId,' + slineBreak +
      '       Qty,' + slineBreak +
      '       Histo,' + slineBreak +
      '       TransDate,' + slineBreak +
      '       CreatedBy' + sLineBreak +
      '  FROM ItemTransaction';

    Query.Open;

    TNumericField(Query['Qty']).DisplayFormat := '#,##0.00';
  end;
end;

initialization
  if not Assigned(DALItemTransaction) then
    DALItemTransaction := TDALItemTransaction.Create;

finalization
  FreeAndNil(DALItemTransaction);

end.
