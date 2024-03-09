object frmItemTransaction: TfrmItemTransaction
  Left = 0
  Top = 0
  Caption = 'Transa'#231#245'es'
  ClientHeight = 506
  ClientWidth = 964
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
  object grdTransaction: TcxGrid
    Left = 0
    Top = 0
    Width = 964
    Height = 506
    Align = alClient
    TabOrder = 0
    object grvTransaction: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Visible = True
      DataController.DataSource = dtsItemTransaction
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object grvTransactionItemId: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'ItemId'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'Id'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            Width = 75
            FieldName = 'Id'
          end
          item
            Width = 150
            FieldName = 'Name'
          end
          item
            Caption = 'Unidade'
            Width = 75
            FieldName = 'Unit'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = dtsItemTable
        Width = 200
      end
      object grvTransactionQty: TcxGridDBColumn
        Caption = 'Quantidade'
        DataBinding.FieldName = 'Qty'
        Width = 100
      end
      object grvTransactionHisto: TcxGridDBColumn
        AlternateCaption = 'grvTransactionHisto'
        Caption = 'Hist'#243'rico'
        DataBinding.FieldName = 'Histo'
        Width = 300
      end
      object grvTransactionTransDate: TcxGridDBColumn
        Caption = 'Data da Transa'#231#227'o'
        DataBinding.FieldName = 'TransDate'
        Width = 110
      end
      object grvTransactionCreatedBy: TcxGridDBColumn
        Caption = 'Criado Por'
        DataBinding.FieldName = 'CreatedBy'
        Width = 100
      end
    end
    object grlTransaction: TcxGridLevel
      GridView = grvTransaction
    end
  end
  object dtsItemTransaction: TDataSource
    Left = 568
    Top = 148
  end
  object dtsItemTable: TDataSource
    Left = 596
    Top = 148
  end
end
