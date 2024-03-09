object frmItemTable: TfrmItemTable
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 478
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grdProduct: TcxGrid
    Left = 0
    Top = 0
    Width = 980
    Height = 478
    Align = alClient
    TabOrder = 0
    object grvProduct: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Visible = True
      FindPanel.DisplayMode = fpdmAlways
      DataController.DataSource = dtsItemTable
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          Column = grvProductName
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = grvProductName
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object grvProductName: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'Name'
        Width = 200
      end
      object grvProductUnit: TcxGridDBColumn
        Caption = 'Unidade'
        DataBinding.FieldName = 'Unit'
        Width = 75
      end
      object grvProductUnitPrice: TcxGridDBColumn
        Caption = 'Pre'#231'o'
        DataBinding.FieldName = 'UnitPrice'
        Width = 75
      end
      object grvProductItemCategoryId: TcxGridDBColumn
        Caption = 'Categoria'
        DataBinding.FieldName = 'ItemCategoryId'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'Id'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            FieldName = 'Id'
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 100
            FieldName = 'Description'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dtsItemCategory
        Properties.ReadOnly = False
        Width = 120
      end
      object grvProductStock: TcxGridDBColumn
        Caption = 'Estoque'
        DataBinding.FieldName = 'Stock'
        Options.Editing = False
        Width = 75
      end
      object grvProductCreatedDateTime: TcxGridDBColumn
        Caption = 'Criado Em'
        DataBinding.FieldName = 'CreatedDateTime'
        Options.Editing = False
        Width = 100
      end
      object grvProductCreatedBy: TcxGridDBColumn
        Caption = 'Criado Por'
        DataBinding.FieldName = 'CreatedBy'
        Options.Editing = False
        Width = 100
      end
      object grvProductModifiedDateTime: TcxGridDBColumn
        Caption = 'Modificado Em'
        DataBinding.FieldName = 'ModifiedDateTime'
        Options.Editing = False
        Width = 100
      end
      object grvProductModifiedBy: TcxGridDBColumn
        Caption = 'Modificado Por'
        DataBinding.FieldName = 'ModifiedBy'
        Options.Editing = False
        Width = 100
      end
    end
    object grlProduct: TcxGridLevel
      GridView = grvProduct
    end
  end
  object dtsItemTable: TDataSource
    Left = 640
    Top = 108
  end
  object dtsItemCategory: TDataSource
    Left = 672
    Top = 108
  end
end
