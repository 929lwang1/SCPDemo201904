object fResGrpSearch: TfResGrpSearch
  Left = 0
  Top = 0
  Caption = 'Search'
  ClientHeight = 313
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panelControl: TPanel
    Left = 0
    Top = 281
    Width = 527
    Height = 44
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 703
    object tglCloseOnGo: TCheckBox
      Left = 8
      Top = 6
      Width = 209
      Height = 17
      Caption = 'Close Window On Go'
      TabOrder = 0
    end
    object btnGo: TButton
      Left = 360
      Top = 6
      Width = 75
      Height = 25
      Action = actGo
      TabOrder = 1
    end
    object btnClose: TButton
      Left = 441
      Top = 6
      Width = 75
      Height = 25
      Action = actClose
      TabOrder = 2
    end
  end
  object panelFind: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 703
    object lblFind: TLabel
      Left = 8
      Top = 14
      Width = 27
      Height = 13
      Caption = 'Find: '
    end
    object btnSearch: TButton
      Left = 441
      Top = 9
      Width = 75
      Height = 25
      Action = actSearch
      TabOrder = 0
    end
    object cbxFindBy: TComboBox
      Left = 41
      Top = 11
      Width = 80
      Height = 21
      Enabled = False
      ItemIndex = 0
      TabOrder = 1
      Text = 'Name'
      OnClick = cbxFindByClick
      Items.Strings = (
        'Name'
        'Description')
    end
    object cbxFindCondition: TComboBox
      Left = 127
      Top = 11
      Width = 90
      Height = 21
      ItemIndex = 1
      TabOrder = 2
      Text = 'Contains'
      Items.Strings = (
        'Starts With'
        'Contains'
        'Ends With')
    end
    object ComboBox1: TComboBox
      Left = 223
      Top = 11
      Width = 170
      Height = 21
      ItemIndex = 0
      TabOrder = 3
      Text = 'Sew'
      Items.Strings = (
        'Sew')
    end
  end
  object panelResults: TPanel
    Left = 0
    Top = 41
    Width = 527
    Height = 240
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 703
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 525
      Height = 122
      Align = alTop
      DataSource = dsRES_GRP_MSTR_cds
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object cdsRES_GRP_MSTR: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRES_GRP_MSTR'
    RemoteServer = dcomconnMain
    Left = 192
    Top = 128
  end
  object dsRES_GRP_MSTR_cds: TDataSource
    DataSet = cdsRES_GRP_MSTR
    Left = 200
    Top = 200
  end
  object ActionList1: TActionList
    Left = 296
    Top = 56
    object actSearch: TAction
      AutoCheck = True
      Caption = 'Search'
      OnExecute = actSearchExecute
    end
    object actGo: TAction
      Caption = 'Go'
      OnExecute = actGoExecute
    end
    object actClose: TAction
      Caption = 'Close'
      OnExecute = actCloseExecute
    end
  end
  object dcomconnMain: TDCOMConnection
    ServerGUID = '{A9823DC0-C360-4F91-A42B-E1986C1D2AA2}'
    ServerName = 'ProductServer.Product'
    ComputerName = 'APT05-H9CW0N2'
    Left = 184
    Top = 56
  end
end
