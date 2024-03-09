unit fItemTransaction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dmItemTransaction, dmItemTable, cxDBLookupComboBox;

type
  TfrmItemTransaction = class(TForm)
    grvTransaction: TcxGridDBTableView;
    grlTransaction: TcxGridLevel;
    grdTransaction: TcxGrid;
    dtsItemTransaction: TDataSource;
    dtsItemTable: TDataSource;
    grvTransactionItemId: TcxGridDBColumn;
    grvTransactionQty: TcxGridDBColumn;
    grvTransactionHisto: TcxGridDBColumn;
    grvTransactionTransDate: TcxGridDBColumn;
    grvTransactionCreatedBy: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    dmItemTransaction: TdtmItemTransaction;
    dmItemTable: TdtmItemTable;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmItemTransaction.FormCreate(Sender: TObject);
begin
  dmItemTransaction := TdtmItemTransaction.Create(Self);
  dmItemTable := TdtmItemTable.Create(Self);

  dtsItemTransaction.DataSet := dmItemTransaction.qryItemTransaction;
  dtsItemTable.DataSet := dmItemTable.qryItemTable;
end;

procedure TfrmItemTransaction.FormShow(Sender: TObject);
begin
  dmItemTransaction.GetList;
  dmItemTable.GetList;
end;

initialization
  RegisterClass(TfrmItemTransaction);

finalization
  UnregisterClass(TfrmItemTransaction);

end.
