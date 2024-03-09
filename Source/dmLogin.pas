unit dmLogin;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils, System.Math, FireDAC.Stan.Param,
  Data.DB, FireDAC.Stan.Option, FireDac.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdtmLogin = class(TDataModule)
    qryUser: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function UserValidate(UserLogin, UserPass: string): Boolean;

  end;

implementation

uses
  dmConnection, uDAOLogin;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmLogin.DataModuleCreate(Sender: TObject);
begin
  qryUser.Connection := dtmConnection.cnnMain;
end;

function TdtmLogin.UserValidate(UserLogin, UserPass: string): Boolean;
begin
  Result := DAOLogin.UserValidate(qryUser, UserLogin, UserPass);
end;

end.
