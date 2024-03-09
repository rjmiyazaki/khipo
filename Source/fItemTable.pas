unit fItemTable;

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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dmItemTable,
  dmItemCategory, cxDBLookupComboBox;

type
  TfrmItemTable = class(TForm)
    grvProduct: TcxGridDBTableView;
    grlProduct: TcxGridLevel;
    grdProduct: TcxGrid;
    dtsItemTable: TDataSource;
    dtsItemCategory: TDataSource;
    grvProductName: TcxGridDBColumn;
    grvProductUnit: TcxGridDBColumn;
    grvProductUnitPrice: TcxGridDBColumn;
    grvProductItemCategoryId: TcxGridDBColumn;
    grvProductCreatedDateTime: TcxGridDBColumn;
    grvProductCreatedBy: TcxGridDBColumn;
    grvProductModifiedDateTime: TcxGridDBColumn;
    grvProductModifiedBy: TcxGridDBColumn;
    grvProductStock: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    dmItemTable: TdtmItemTable;
    dmItemCategory: TdtmItemCategory;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmItemTable.FormCreate(Sender: TObject);
begin
  dmItemTable := TdtmItemTable.Create(Self);
  dmItemCategory := TdtmItemCategory.Create(Self);

  dtsItemTable.DataSet := dmItemTable.qryItemTable;
  dtsItemCategory.DataSet := dmItemCategory.qryItemCategory;
end;

procedure TfrmItemTable.FormShow(Sender: TObject);
begin
  dmItemTable.GetList;
  dmItemCategory.GetList;
end;

initialization
  RegisterClass(TfrmItemTable);

finalization
  UnregisterClass(TfrmItemTable);

end.
