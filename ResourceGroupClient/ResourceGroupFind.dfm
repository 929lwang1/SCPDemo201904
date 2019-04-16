object fResGrpSearch: TfResGrpSearch
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Search'
  ClientHeight = 361
  ClientWidth = 606
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 490
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
    Top = 325
    Width = 606
    Height = 36
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      606
      36)
    object tglCloseOnGo: TCheckBox
      Left = 4
      Top = 3
      Width = 209
      Height = 25
      Anchors = [akLeft]
      Caption = 'Close Window On Go'
      TabOrder = 0
    end
    object btnGo: TButton
      Left = 446
      Top = 3
      Width = 75
      Height = 25
      Action = actGo
      Anchors = [akRight]
      TabOrder = 1
    end
    object btnClose: TButton
      Left = 527
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = 'Close'
      TabOrder = 2
      OnClick = actCloseExecute
    end
  end
  object panelFind: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      606
      41)
    object lblFind: TLabel
      Left = 8
      Top = 14
      Width = 27
      Height = 13
      Anchors = [akLeft]
      Caption = 'Find: '
    end
    object btnSearch: TButton
      Left = 527
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight]
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
    Width = 606
    Height = 284
    Align = alClient
    TabOrder = 2
    object dbgridResults: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 598
      Height = 276
      Align = alClient
      DataSource = dsRES_GRP_MSTR_cds
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgridResultsDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'resource_group_name'
          Title.Caption = 'Name'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'resource_group_desc'
          Title.Caption = 'Description'
          Visible = True
        end>
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
    Left = 400
    Top = 88
  end
  object dspRES_GRP_MSTR: TDataSetProvider
    DataSet = qryRES_GRP_MSTR
    Left = 400
    Top = 144
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
