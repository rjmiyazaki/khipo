object frmItemCategory: TfrmItemCategory
  Left = 0
  Top = 0
  Caption = 'Categorias'
  ClientHeight = 452
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grCategory: TcxGrid
    Left = 0
    Top = 0
    Width = 820
    Height = 452
    Align = alClient
    TabOrder = 0
    object grvCategory: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Visible = True
      FindPanel.DisplayMode = fpdmAlways
      DataController.DataSource = dtsItemCategory
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          Column = grvCategoryColumnDescription
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = grvCategoryColumnDescription
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Appending = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object grvCategoryColumnDescription: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'Description'
        FooterAlignmentHorz = taRightJustify
        Width = 150
      end
      object grvCategoryColumnCreatedDateTime: TcxGridDBColumn
        Caption = 'Criado em'
        DataBinding.FieldName = 'CreatedDateTime'
        Options.Editing = False
        Width = 100
      end
      object grvCategoryColumnCreatedBy: TcxGridDBColumn
        Caption = 'Criado por'
        DataBinding.FieldName = 'CreatedBy'
        Options.Editing = False
        Width = 100
      end
      object grvCategoryColumnModifiedDateTime: TcxGridDBColumn
        Caption = 'Modificado em'
        DataBinding.FieldName = 'ModifiedDateTime'
        Options.Editing = False
        Width = 100
      end
      object grvCategoryColumnModifiedBy: TcxGridDBColumn
        Caption = 'Modificado por'
        DataBinding.FieldName = 'ModifiedBy'
        Options.Editing = False
        Width = 100
      end
    end
    object grlCategory: TcxGridLevel
      GridView = grvCategory
    end
  end
  object dtsItemCategory: TDataSource
    Left = 628
    Top = 124
  end
end
