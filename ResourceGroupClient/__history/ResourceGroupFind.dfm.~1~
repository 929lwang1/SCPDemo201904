object fResGrpSearch: TfResGrpSearch
  Left = 0
  Top = 0
  Caption = 'Search'
  ClientHeight = 313
  ClientWidth = 703
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
    Width = 703
    Height = 44
    Align = alTop
    TabOrder = 1
    ExplicitTop = 165
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
    Width = 703
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
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
    Width = 703
    Height = 240
    Align = alTop
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 701
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
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Pass_word0;Persist Security Info=Tr' +
      'ue;User ID=SCP71Demo;Data Source=192.168.172.77'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 400
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RESOURCE_GROUP_NAME, RESOURCE_GROUP_DESC from RESOURCE_GR' +
        'OUP_MSTR where RESOURCE_GROUP_NAME LIKE '#39'%sew%'#39)
    Left = 376
    Top = 64
  end
  object dsRES_GRP_MSTR: TDataSource
    DataSet = ADOQuery1
    Left = 456
    Top = 64
  end
  object dspRES_GRP_MSTR: TDataSetProvider
    DataSet = ADOQuery1
    Left = 552
    Top = 64
  end
  object cdsRES_GRP_MSTR: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRES_GRP_MSTR'
    Left = 552
    Top = 120
  end
  object dsRES_GRP_MSTR_cds: TDataSource
    DataSet = cdsRES_GRP_MSTR
    Enabled = False
    Left = 552
    Top = 184
  end
  object ActionList1: TActionList
    Left = 640
    Top = 8
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
end
