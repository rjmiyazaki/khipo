unit dmConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TdtmConnection = class(TDataModule)
    cnnMain: TFDConnection;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConnection: TdtmConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uConfig;

{$R *.dfm}

procedure TdtmConnection.DataModuleCreate(Sender: TObject);
var
  ConnectionParams: TFDPhysMySQLConnectionDefParams;
begin
  ConnectionParams := TFDPhysMySQLConnectionDefParams(cnnMain.Params);

  ConnectionParams.Database := Config.DatabaseName;
  ConnectionParams.UserName := Config.DatabaseUser;
  ConnectionParams.DriverID := 'MySQL';
  ConnectionParams.Password := Config.DatabasePassword;
  ConnectionParams.Server   := Config.DatabaseHost;
  ConnectionParams.Port     := Config.DatabasePort;

  cnnMain.Connected := True;
end;

end.
