unit uConfig;

interface

uses
  Forms, System.SysUtils, IniFiles;

type
  TConfig = class
  private
    FDatabasePort: Integer;
    FDatabsePassword: string;
    FDatabaseHost: string;
    FDatabaseUser: string;
    FDatabaseName: string;

    procedure LoadConfigFile;
  public
    constructor Create;

    property DatabaseHost: string read FDatabaseHost;
    property DatabaseUser: string read FDatabaseUser;
    property DatabasePassword: string read FDatabsePassword;
    property DatabasePort: Integer read FDatabasePort;
    property DatabaseName: string read FDatabaseName;
  end;

var
  Config: TConfig;


implementation

{ TConfig }

constructor TConfig.Create;
begin
  LoadConfigFile;
end;

procedure TConfig.LoadConfigFile;
var
  ArquivoIni: TIniFile;
  Arquivo: string;
begin
  Arquivo := ExtractFilePath(Application.ExeName) + 'Config.ini';

  ArquivoIni := TIniFile.Create(Arquivo);
  try
    FDatabaseHost := ArquivoIni.ReadString('Database', 'host', '');
    FDatabaseUser := ArquivoIni.ReadString('Database', 'user', '');
    FDatabsePassword := ArquivoIni.ReadString('Database', 'password', '');
    FDatabasePort := ArquivoIni.ReadInteger('Database', 'port', 3306);
    FDatabaseName := ArquivoIni.ReadString('Database', 'name', '');
  finally
    FreeAndNil(ArquivoIni);
  end;
end;

initialization
  if not Assigned(Config) then
    Config := TConfig.Create;

finalization
  FreeAndNil(Config);

end.
