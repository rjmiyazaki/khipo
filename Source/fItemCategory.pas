unit fItemCategory;

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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dmItemCategory;

type
  TfrmItemCategory = class(TForm)
    grvCategory: TcxGridDBTableView;
    grlCategory: TcxGridLevel;
    grCategory: TcxGrid;
    dtsItemCategory: TDataSource;
    grvCategoryColumnDescription: TcxGridDBColumn;
    grvCategoryColumnCreatedDateTime: TcxGridDBColumn;
    grvCategoryColumnCreatedBy: TcxGridDBColumn;
    grvCategoryColumnModifiedDateTime: TcxGridDBColumn;
    grvCategoryColumnModifiedBy: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    dmItemCategory: TdtmItemCategory;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmItemCategory.FormCreate(Sender: TObject);
begin
  dmItemCategory := TdtmItemCategory.Create(Self);

  dtsItemCategory.DataSet := dmItemCategory.qryItemCategory;
end;

procedure TfrmItemCategory.FormShow(Sender: TObject);
begin
  dmItemCategory.GetList;
end;

initialization
  RegisterClass(TfrmItemCategory);

finalization
  UnregisterClass(TfrmItemCategory);

end.
