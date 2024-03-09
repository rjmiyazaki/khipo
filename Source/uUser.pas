unit uUser;

interface

uses
  SysUtils;

type
  TUser = class
  private
    FID: Integer;
    FName: string;
    FLogin: string;
  public
    property ID: Integer read FID write FID;
    property Name: string read FName write FName;
    property Login: string read FLogin write FLogin;
  end;

var
  LoggedUser: TUser;

implementation

initialization
  if not Assigned(LoggedUser) then
    LoggedUser := TUser.Create;

finalization
  FreeAndNil(LoggedUser);

end.
