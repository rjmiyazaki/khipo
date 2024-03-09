unit dmItemTable;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Dialogs, System.UITypes;

type
  TdtmItemTable = class(TDataModule)
    qryItemTable: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryItemTableNewRecord(DataSet: TDataSet);
    procedure qryItemTableBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetList;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses dmConnection, uDALItemTable, uDataSetHelper, uUser, uDefs;

{ TdtmItemTable }

procedure TdtmItemTable.DataModuleCreate(Sender: TObject);
begin
  qryItemTable.Connection := dtmConnection.cnnMain;
end;

procedure TdtmItemTable.GetList;
begin
  DALItemTable.GetList(qryItemTable);
end;

procedure TdtmItemTable.qryItemTableBeforePost(DataSet: TDataSet);
begin
  if qryItemTable['Name'].AsString.IsEmpty then
  begin
    MessageDlg(sMsgInvalidItemTableName, mtInformation, [mbOk], 0);
    Abort;
  end;

  if qryItemTable['Unit'].AsString.IsEmpty then
  begin
    MessageDlg(sMsgInvalidItemTableUnit, mtInformation, [mbOk], 0);
    Abort;
  end;

  if qryItemTable['UnitPrice'].AsFloat <= 0 then
  begin
    MessageDlg(sMsgInvalidItemTableUnitPrice, mtInformation, [mbOk], 0);
    Abort;
  end;

  if qryItemTable['ItemCategoryId'].AsInteger <= 0 then
  begin
    MessageDlg(sMsgInvalidItemTAbleItemCategoryId, mtInformation, [mbOk], 0);
    Abort;
  end;


  qryItemTable['ModifiedDateTime'].Value := Now;
  qryItemTable['ModifiedBy'].Value := LoggedUser.Login;
end;

procedure TdtmItemTable.qryItemTableNewRecord(DataSet: TDataSet);
begin
  qryItemTable['CreatedDateTime'].Value := Now;
  qryItemTable['ModifiedDateTime'].Value := Now;
  qryItemTable['CreatedBy'].Value := LoggedUser.Login;
  qryItemTable['ModifiedBy'].Value := LoggedUser.Login;
  qryItemTable['Stock'].Value := 0;
end;

end.
