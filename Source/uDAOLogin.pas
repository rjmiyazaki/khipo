unit uDAOLogin;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils, System.Math, FireDAC.Stan.Param,
  Data.DB, FireDAC.Stan.Option, FireDac.Comp.Client;

type
  TDAOLogin = class
  private
    { Private declarations }
  public
    { Public declarations }
    function UserValidate(Query: TFDQuery; UserLogin, UserPass: string): Boolean;
  end;

var
  DAOLogin: TDAOLogin;

implementation

uses
  uDataSetHelper, uUser;

{ TDAOLogin }

function TDAOLogin.UserValidate(Query: TFDQuery; UserLogin, UserPass: string): Boolean;
begin
  result := False;

  if Assigned(Query) then
  begin
    Query.Close;

    Query.SQL.Text := 'SELECT Id, Name, Login FROM User WHERE Login = :UserLogin AND Password = :Password';
    Query.ParamByName('UserLogin').AsString := UserLogin;
    Query.ParamByName('Password').AsString := UserPass;

    Query.Open;
    Result := Query.RecordCount > 0;

    if (Result) then
    begin
      LoggedUser.ID := Query['Id'].Value;
      LoggedUser.Name := Query['Name'].Value;
      LoggedUser.Login := Query['Login'].Value;
    end;
  end;
end;

initialization
  if not Assigned(DAOLogin) then
    DAOLogin := TDAOLogin.Create;

finalization
  FreeAndNil(DAOLogin);

end.
