program KhipoTest;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {frmMain},
  dmConnection in 'dmConnection.pas' {dtmConnection: TDataModule},
  fLogin in 'fLogin.pas' {frmLogin},
  uConfig in 'uConfig.pas',
  uDataSetHelper in 'uDataSetHelper.pas',
  dmLogin in 'dmLogin.pas' {dtmLogin: TDataModule},
  uDAOLogin in 'uDAOLogin.pas',
  fItemTable in 'fItemTable.pas' {frmItemTable},
  fItemCategory in 'fItemCategory.pas' {frmItemCategory},
  dmItemCategory in 'dmItemCategory.pas' {dtmItemCategory: TDataModule},
  uDALItemCategory in 'uDALItemCategory.pas',
  uUser in 'uUser.pas',
  dmItemTable in 'dmItemTable.pas' {dtmItemTable: TDataModule},
  uDALItemTable in 'uDALItemTable.pas',
  fItemTransaction in 'fItemTransaction.pas' {frmItemTransaction},
  dmItemTransaction in 'dmItemTransaction.pas' {dtmItemTransaction: TDataModule},
  uDALItemTransaction in 'uDALItemTransaction.pas',
  uDefs in 'uDefs.pas',
  uTDIControl in 'uTDIControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdtmConnection, dtmConnection);
  Application.Run;
end.
