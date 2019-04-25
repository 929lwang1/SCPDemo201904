object frmAddresource: TfrmAddresource
  Left = 0
  Top = 0
  Caption = 'Add resource(s)'
  ClientHeight = 373
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdResource: TDBGrid
    Left = 0
    Top = 41
    Width = 676
    Height = 282
    Align = alClient
    DataSource = dsAddResource_cds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgrdResourceDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'RESOURCE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESOURCE_DESC'
        Visible = True
      end>
  end
  object panButton: TPanel
    Left = 0
    Top = 323
    Width = 676
    Height = 50
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      676
      50)
    object btnCancel: TButton
      Left = 570
      Top = 14
      Width = 75
      Height = 25
      Action = actCancel
      Anchors = [akRight]
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 473
      Top = 14
      Width = 75
      Height = 25
      Action = actOK
      Anchors = [akRight]
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 1
    end
  end
  object panLabel: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 41
    Align = alTop
    TabOrder = 2
    object lbInfor: TLabel
      Left = 18
      Top = 13
      Width = 360
      Height = 13
      Alignment = taCenter
      Caption = 
        'You must select one resource to select what type of resource gro' +
        'up this is.'
      Layout = tlCenter
    end
  end
  object cdsAddResource: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAddResource'
    RemoteServer = fResGroup.dcomMain
    Left = 160
    Top = 160
    object cdsAddResourceRESOURCE_ID: TIntegerField
      FieldName = 'RESOURCE_ID'
    end
    object cdsAddResourceLOC_ID: TIntegerField
      FieldName = 'LOC_ID'
    end
    object cdsAddResourceRESOURCE_NAME: TWideStringField
      DisplayLabel = 'Resource Name'
      FieldName = 'RESOURCE_NAME'
    end
    object cdsAddResourceRESOURCE_TYPE_CD: TSmallintField
      FieldName = 'RESOURCE_TYPE_CD'
    end
    object cdsAddResourceRESOURCE_DESC: TWideStringField
      DisplayLabel = 'Resource Description'
      FieldName = 'RESOURCE_DESC'
      Size = 40
    end
    object cdsAddResourceDISPLAY_COLOR: TIntegerField
      FieldName = 'DISPLAY_COLOR'
    end
    object cdsAddResourceOPERATION_COST: TFMTBCDField
      FieldName = 'OPERATION_COST'
      Precision = 38
      Size = 10
    end
    object cdsAddResourcePREP_TIME: TFMTBCDField
      FieldName = 'PREP_TIME'
      Precision = 38
      Size = 10
    end
    object cdsAddResourceCLEANUP_TIME: TFMTBCDField
      FieldName = 'CLEANUP_TIME'
      Precision = 38
      Size = 10
    end
    object cdsAddResourceDAILY_STARTUP_TIME: TFMTBCDField
      FieldName = 'DAILY_STARTUP_TIME'
      Precision = 38
      Size = 10
    end
    object cdsAddResourceDAILY_CLEANUP_TIME: TFMTBCDField
      FieldName = 'DAILY_CLEANUP_TIME'
      Precision = 38
      Size = 10
    end
    object cdsAddResourceCAPACITY_QTY: TFMTBCDField
      FieldName = 'CAPACITY_QTY'
      Precision = 38
      Size = 10
    end
    object cdsAddResourceMIN_CAPACITY_QTY: TFMTBCDField
      FieldName = 'MIN_CAPACITY_QTY'
      Precision = 38
      Size = 10
    end
    object cdsAddResourceLABOR_AVAILABLE_UNITS: TFMTBCDField
      FieldName = 'LABOR_AVAILABLE_UNITS'
      Precision = 38
      Size = 10
    end
    object cdsAddResourceENFORCE_CAPACITY_CONSTRAINT: TWideStringField
      FieldName = 'ENFORCE_CAPACITY_CONSTRAINT'
      FixedChar = True
      Size = 1
    end
    object cdsAddResourceUOM_GROUP_NAME: TWideStringField
      FieldName = 'UOM_GROUP_NAME'
      Size = 40
    end
    object cdsAddResourceRUN_RATE_MODIFIER: TFMTBCDField
      FieldName = 'RUN_RATE_MODIFIER'
      Precision = 38
      Size = 10
    end
  end
  object dsAddResource_cds: TDataSource
    DataSet = cdsAddResource
    Left = 256
    Top = 160
  end
  object actAddResource: TActionList
    Left = 240
    Top = 248
    object actOK: TAction
      Caption = 'OK'
      OnUpdate = actOKUpdate
      OnExecute = actOKExecute
    end
    object actCancel: TAction
      Caption = 'Cancel'
      OnExecute = btnCancelClick
    end
  end
end
