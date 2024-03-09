unit uDALItemCategory;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils, System.Math, FireDAC.Stan.Param,
  Data.DB, FireDAC.Stan.Option, FireDac.Comp.Client;

type
  TDALItemCategory = class
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetList(Query: TFDQuery);
  end;

var
  DALItemCategory: TDALItemCategory;

implementation

{ TDAOCategoria }

procedure TDALItemCategory.GetList(Query: TFDQuery);
begin
  if Assigned(Query) then
  begin
    Query.Close;

    Query.SQL.Text :=
      'SELECT ID,' + sLineBreak +
      '       Description,' + slineBreak +
      '       CreatedDateTime,' + sLineBreak +
      '       CreatedBy,' + sLineBreak +
      '       ModifiedDateTime,' + sLineBreak +
      '       ModifiedBy' + sLineBreak +
      '  FROM ItemCategory';

    Query.Open;
  end;
end;

initialization
  if not Assigned(DALItemCategory) then
    DALItemCategory := TDALItemCategory.Create;

finalization
  FreeAndNil(DALItemCategory);

end.
