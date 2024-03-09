unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxStatusBar, cxClasses, dxSkinsForm, dxBarBuiltInMenu, System.ImageList,
  Vcl.ImgList, cxImageList, dxBar, cxPC, System.Actions, Vcl.ActnList, 
  fItemCategory, fItemTable, System.UITypes, fItemTransaction, uTDIControl;

type
  TfrmMain = class(TForm)
    dxStatusBar1: TdxStatusBar;
    dxSkinController: TdxSkinController;
    dxBarManager: TdxBarManager;
    dxBarManagerBar1: TdxBar;
    cxPageControl: TcxPageControl;
    dxBarLargeButton1: TdxBarLargeButton;
    cxImageList: TcxImageList;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    ActionList: TActionList;
    actItemTable: TAction;
    actItemCategory: TAction;
    actItemTransactions: TAction;
    actSair: TAction;
    procedure FormShow(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxPageControlCanClose(Sender: TObject; var ACanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure actExecute(Sender: TObject);
  private
    { Private declarations }
    JustClose: Boolean;
    TDIControl: TTDIControl;

    procedure WmUser(var Msg: TMessage); message WM_USER;
    procedure LoadForms;

    procedure Login;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  fLogin, uDefs;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TDIControl := TTDIControl.Create(Self);
  TDIControl.PageControl := cxPageControl;
  LoadForms;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_USER, 10, 0);
end;

procedure TfrmMain.actExecute(Sender: TObject);
begin
  TDIControl.ShowForm(Sender as TAction);
end;

procedure TfrmMain.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.cxPageControlCanClose(Sender: TObject;
  var ACanClose: Boolean);
var
  ActivePage: TcxTabSheet;
begin
  ActivePage := TcxPageControl(Sender).ActivePage;
  ShowMessage(ActivePage.Caption);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (JustClose) or (MessageDlg(sMsgQueryCloseApp, mtInformation, [mbYes, mbNo], 1) = IDYES);
end;

procedure TfrmMain.LoadForms;
begin
  TDIControl.AddForm(actItemTable, 'TfrmItemTable');
  TDIControl.AddForm(actItemCategory, 'TfrmItemCategory');
  TDIControl.AddForm(actItemTransactions, 'TfrmItemTransaction');
end;

procedure TfrmMain.Login;
var
  frmLogin: TfrmLogin;
begin
  frmLogin := TfrmLogin.Create(nil);    
  try
    frmLogin.ShowModal;
    
    if frmLogin.ModalResult = mrCancel then
    begin
      JustClose := True;
      Close;
    end;
  finally
    frmLogin.Release;
  end;
end;

procedure TfrmMain.WmUser(var Msg: TMessage);
begin
  if Msg.WParam = 10 then
    Login;
end;

end.
