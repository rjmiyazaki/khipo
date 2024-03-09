object dtmItemTransaction: TdtmItemTransaction
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 399
  Width = 477
  object qryItemTransaction: TFDQuery
    BeforePost = qryItemTransactionBeforePost
    OnNewRecord = qryItemTransactionNewRecord
    Left = 44
    Top = 36
  end
end
