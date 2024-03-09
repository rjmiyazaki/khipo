unit dmItemCategory;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Dialogs, System.UITypes;

type
  TdtmItemCategory = class(TDataModule)
    qryItemCategory: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryItemCategoryNewRecord(DataSet: TDataSet);
    procedure qryItemCategoryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetList;
  end;

var
  dtmItemCategory: TdtmItemCategory;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses dmConnection, uDALItemCategory, uDataSetHelper, uUser, uDefs;

{ TdtmCategoria }

procedure TdtmItemCategory.DataModuleCreate(Sender: TObject);
begin
  qryItemCategory.Connection := dtmConnection.cnnMain;
end;

procedure TdtmItemCategory.GetList;
begin
  DALItemCategory.GetList(qryItemCategory);
end;

procedure TdtmItemCategory.qryItemCategoryBeforePost(DataSet: TDataSet);
begin
  if qryItemCategory['Description'].AsString.IsEmpty then
  begin
    MessageDlg(sMsgInvalidItemCategoryDescription, mtInformation, [mbOk], 0);
    Abort;
  end;

  qryItemCategory['ModifiedDateTime'].Value := Now;
  qryItemCategory['ModifiedBy'].Value := LoggedUser.Login;
end;

procedure TdtmItemCategory.qryItemCategoryNewRecord(DataSet: TDataSet);
begin
  qryItemCategory['CreatedDateTime'].Value := Now;
  qryItemCategory['ModifiedDateTime'].Value := Now;
  qryItemCategory['CreatedBy'].Value := LoggedUser.Login;
  qryItemCategory['ModifiedBy'].Value := LoggedUser.Login;
end;

end.
