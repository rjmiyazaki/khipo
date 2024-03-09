unit fLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Vcl.Menus, cxTextEdit, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxLabel, dmLogin,
  System.UITypes, Registry;

type
  TfrmLogin = class(TForm)
    cxLabel1: TcxLabel;
    pnlTop: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    Bevel2: TBevel;
    btnOk: TcxButton;
    Cancelar: TcxButton;
    edtUsuario: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtPassword: TcxTextEdit;
    cxLabel3: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    dmLogin: TdtmLogin;

    procedure GetPersistency;
    procedure SetPersistency;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  uDefs;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  dmLogin := TdtmLogin.Create(Self);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  GetPersistency;
  edtUsuario.SetFocus;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
    if not dmLogin.UserValidate(edtUsuario.Text, edtPassword.Text) then
    begin
      MessageDlg(sMsgUserNotFound, mtInformation, [mbOK], 0);
      CanClose := False;
    end;

    SetPersistency;
  end;
end;

procedure TfrmLogin.GetPersistency;
var
  Registry: TRegIniFile;
begin
  Registry := TRegIniFile.Create;
  try
    Registry.RootKey := HKEY_CURRENT_USER;

    if Registry.OpenKey(sRegMain, False) then
    begin
      edtUsuario.Text := Registry.ReadString(sRegLogin, sRegLoginLastUser, '');
    end;
  finally
    FreeAndNil(Registry);
  end;
end;

procedure TfrmLogin.SetPersistency;
var
  Registry: TRegIniFile;
begin
  Registry := TRegIniFile.Create;
  try
    Registry.RootKey := HKEY_CURRENT_USER;

    if Registry.OpenKey(sRegMain, True) then
    begin
      Registry.WriteString(sRegLogin, sRegLoginLastUser, edtUsuario.Text);
    end;
  finally
    FreeAndNil(Registry);
  end;
end;

end.
