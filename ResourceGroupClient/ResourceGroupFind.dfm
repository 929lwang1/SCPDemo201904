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
      Caption = 'Close'
      TabOrder = 2
      OnClick = actCloseExecute
    end
  end
  object panelFind: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 41
    Align = alTop
    TabOrder = 0
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
      Caption = 'Search'
      TabOrder = 0
      OnClick = actSearchExecute
    end
    object cbxFindBy: TComboBox
      Left = 41
      Top = 11
      Width = 80
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = 'Name'
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
    object cbxNameDesc: TComboBox
      Left = 223
      Top = 11
      Width = 170
      Height = 21
      TabOrder = 3
    end
  end
  object panelResults: TPanel
    Left = 0
    Top = 41
    Width = 703
    Height = 240
    Align = alTop
    TabOrder = 2
    object dbgridResults: TDBGrid
      Left = 1
      Top = 1
      Width = 701
      Height = 122
      Align = alTop
      DataSource = dsRES_GRP_MSTR_cds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgridResultsDblClick
    end
  end
  object cdsRES_GRP_MSTR: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRES_GRP_MSTR'
    Left = 184
    Top = 176
  end
  object dsRES_GRP_MSTR_cds: TDataSource
    DataSet = cdsRES_GRP_MSTR
    Left = 184
    Top = 232
  end
  object qryRES_GRP_MSTR: TADOQuery
    Connection = fResGroup.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'resource_group_name'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'resource_group_desc'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 40
        Value = Null
      end>
    SQL.Strings = (
      
        'select resource_group_name, resource_group_desc,  resource_group' +
        '_id from resource_group_mstr WHERE resource_group_name like :res' +
        'ource_group_name'
      ' OR resource_group_desc like :resource_group_desc')
    Left = 544
  end
  object dspRES_GRP_MSTR: TDataSetProvider
    DataSet = qryRES_GRP_MSTR
    Left = 552
    Top = 72
  end
  object ActionList1: TActionList
    Left = 296
    Top = 184
    object actGo: TAction
      Caption = 'Go'
      OnExecute = actGoExecute
      OnUpdate = actGoUpdate
    end
  end
end
