object dtmItemCategory: TdtmItemCategory
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 359
  Width = 460
  object qryItemCategory: TFDQuery
    BeforePost = qryItemCategoryBeforePost
    OnNewRecord = qryItemCategoryNewRecord
    Left = 60
    Top = 28
  end
end
