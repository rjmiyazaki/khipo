unit dmItemTransaction;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Dialogs, System.UITypes;

type
  TdtmItemTransaction = class(TDataModule)
    qryItemTransaction: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryItemTransactionNewRecord(DataSet: TDataSet);
    procedure qryItemTransactionBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetList;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses uDALItemTransaction, dmConnection, uUser, uDataSetHelper, uDefs;

{ TdtmItemTransaction }

procedure TdtmItemTransaction.DataModuleCreate(Sender: TObject);
begin
  qryItemTransaction.Connection := dtmConnection.cnnMain;
end;

procedure TdtmItemTransaction.GetList;
begin
  DALItemTransaction.GetList(qryItemTransaction);
end;

procedure TdtmItemTransaction.qryItemTransactionBeforePost(DataSet: TDataSet);
begin
  if qryItemTransaction['ItemId'].AsInteger = 0 then
  begin
    MessageDlg(sMsgInvalidItemTransactionItemId, mtInformation, [mbOk], 0);
    Abort;
  end;

  if qryItemTransaction['Qty'].AsInteger = 0 then
  begin
    MessageDlg(  sMsgInvalidItemTransactionQty, mtInformation, [mbOk], 0);
    Abort;
  end;

  if qryItemTransaction['Histo'].AsString.IsEmpty then
  begin
    MessageDlg(sMsgInvalidItemTransactionHisto, mtInformation, [mbOk], 0);
    Abort;
  end;

end;

procedure TdtmItemTransaction.qryItemTransactionNewRecord(DataSet: TDataSet);
begin
  qryItemTransaction['TransDate'].Value := Now;
  qryItemTransaction['CreatedBy'].Value := LoggedUser.Login;
end;

end.
