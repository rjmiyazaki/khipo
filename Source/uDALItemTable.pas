unit uDALItemTable;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils, System.Math, FireDAC.Stan.Param,
  Data.DB, FireDAC.Stan.Option, FireDac.Comp.Client;

type
  TDALItemTable = class
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetList(Query: TFDQuery);
  end;

var
  DALItemTable: TDALItemTable;

implementation

uses
  uDataSetHelper;

{ TDAOCategoria }

procedure TDALItemTable.GetList(Query: TFDQuery);
begin
  if Assigned(Query) then
  begin
    Query.Close;

    Query.SQL.Text :=
      'SELECT ID,' + sLineBreak +
      '       Name,' + slineBreak +
      '       Unit,' + slineBreak +
      '       UnitPrice,' + slineBreak +
      '       ItemCategoryId,' + slineBreak +
      '       (SELECT IFNULL(SUM(Qty), 0) FROM ItemTransaction WHERE ItemId = ItemTable.Id) AS Stock,' + sLineBreak +
      '       CreatedDateTime,' + sLineBreak +
      '       CreatedBy,' + sLineBreak +
      '       ModifiedDateTime,' + sLineBreak +
      '       ModifiedBy' + sLineBreak +
      '  FROM ItemTable';

    Query.Open;

    Query.RemoveFieldsDataPacket(['Stock']);
    TNumericField(Query['UnitPrice']).DisplayFormat := '#,##0.00';
    TNumericField(Query['Stock']).DisplayFormat := '#,##0.00';
  end;
end;

initialization
  if not Assigned(DALItemTable) then
    DALItemTable := TDALItemTable.Create;

finalization
  FreeAndNil(DALItemTable);

end.
