object dtmItemTable: TdtmItemTable
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 302
  Width = 402
  object qryItemTable: TFDQuery
    BeforePost = qryItemTableBeforePost
    OnNewRecord = qryItemTableNewRecord
    Left = 44
    Top = 52
  end
end
