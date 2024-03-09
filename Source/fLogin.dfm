object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 203
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 17
    Top = 92
    Caption = 'Usu'#225'rio:'
    Transparent = True
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 357
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object Bevel1: TBevel
      Left = 0
      Top = 63
      Width = 357
      Height = 2
      Align = alBottom
      ExplicitTop = 15
      ExplicitWidth = 422
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 12
      AutoSize = False
      Caption = 'Bem vindo. Para prosseguir, informe suas credenciais de acesso.'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.WordWrap = True
      Transparent = True
      Height = 33
      Width = 326
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 162
    Width = 357
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      357
      41)
    object Bevel2: TBevel
      Left = 0
      Top = 0
      Width = 357
      Height = 2
      Align = alTop
      ExplicitWidth = 486
    end
    object btnOk: TcxButton
      Left = 183
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Cancelar: TcxButton
      Left = 267
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object edtUsuario: TcxTextEdit
    Left = 87
    Top = 91
    TabOrder = 0
    Width = 255
  end
  object cxLabel2: TcxLabel
    Left = 17
    Top = 119
    Caption = 'Password:'
    Transparent = True
  end
  object edtPassword: TcxTextEdit
    Left = 87
    Top = 118
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 1
    Width = 255
  end
end
