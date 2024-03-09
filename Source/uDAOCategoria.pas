unit uDAOCategoria;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils, System.Math, FireDAC.Stan.Param,
  Data.DB, FireDAC.Stan.Option, FireDac.Comp.Client;

type
  TADOCategory = class
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetList(Query: TFDQuery);
  end;

var
  ADOCategory: TADOCategory;

implementation

{ TDAOCategoria }

procedure TADOCategory.GetList(Query: TFDQuery);
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
  if not Assigned(ADOCategory) then
    ADOCategory := TADOCategory.Create;

finalization
  FreeAndNil(ADOCategory);

end.
