object RGS: TRGS
  OldCreateOrder = False
  Height = 644
  Width = 974
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Pass_word0;Persist Security Info=Tr' +
      'ue;User ID=SCP71Demo;Initial Catalog=SCP71Demo;Data Source=tcp:1' +
      '0.183.137.40;Use Procedure for Prepare=1;Auto Translate=True;Pac' +
      'ket Size=4096;Workstation ID=APT05-CM3VPN2;Use Encryption for Da' +
      'ta=False;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object qryRES_GRP_MSTR: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from RESOURCE_GROUP_MSTR')
    Left = 112
    Top = 56
    object qryRES_GRP_MSTRRESOURCE_GROUP_ID: TIntegerField
      FieldName = 'RESOURCE_GROUP_ID'
    end
    object qryRES_GRP_MSTRRESOURCE_GROUP_NAME: TWideStringField
      FieldName = 'RESOURCE_GROUP_NAME'
    end
    object qryRES_GRP_MSTRRESOURCE_TYPE_CD: TSmallintField
      FieldName = 'RESOURCE_TYPE_CD'
    end
    object qryRES_GRP_MSTRRESOURCE_GROUP_DESC: TWideStringField
      FieldName = 'RESOURCE_GROUP_DESC'
      Size = 40
    end
    object qryRES_GRP_MSTRUTILIZATION_TYPE_CD: TSmallintField
      FieldName = 'UTILIZATION_TYPE_CD'
    end
    object qryRES_GRP_MSTROPERATION_COST: TFloatField
      FieldName = 'OPERATION_COST'
    end
    object qryRES_GRP_MSTRPREP_TIME: TFloatField
      FieldName = 'PREP_TIME'
    end
    object qryRES_GRP_MSTRCLEANUP_TIME: TFloatField
      FieldName = 'CLEANUP_TIME'
    end
    object qryRES_GRP_MSTRDAILY_STARTUP_TIME: TFloatField
      FieldName = 'DAILY_STARTUP_TIME'
    end
    object qryRES_GRP_MSTRDAILY_CLEANUP_TIME: TFloatField
      FieldName = 'DAILY_CLEANUP_TIME'
    end
  end
  object dspRES_GRP_MSTR: TDataSetProvider
    DataSet = qryRES_GRP_MSTR
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    Left = 208
    Top = 56
  end
  object dsRES_GRP_MSTR: TDataSource
    DataSet = qryRES_GRP_MSTR
    Left = 304
    Top = 56
  end
  object qryRES_GRP: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = dsRES_GRP_MSTR
    Parameters = <
      item
        Name = 'RESOURCE_GROUP_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    SQL.Strings = (
      'select * from RESOURCE_GROUPS'
      ' WHERE RESOURCE_GROUP_ID =:RESOURCE_GROUP_ID')
    Left = 112
    Top = 112
    object qryRES_GRPRESOURCE_GROUP_ID: TIntegerField
      FieldName = 'RESOURCE_GROUP_ID'
    end
    object qryRES_GRPRESOURCE_ID: TIntegerField
      FieldName = 'RESOURCE_ID'
    end
    object qryRES_GRPUSE_GROUP_SETTINGS_IND: TWideStringField
      FieldName = 'USE_GROUP_SETTINGS_IND'
      FixedChar = True
      Size = 1
    end
    object qryRES_GRPPRIORITY_INDEX: TIntegerField
      FieldName = 'PRIORITY_INDEX'
    end
  end
  object qryRES_MSTR: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from RESOURCE_MSTR'
      '')
    Left = 112
    Top = 224
  end
  object qryUTL_TYPE_MSTR: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from UTILIZATION_TYPE_MSTR')
    Left = 112
    Top = 280
  end
  object qryRES_GRP_ID: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select MAX(RESOURCE_GROUP_ID)  as RESOURCE_GROUP_ID from RESOURC' +
        'E_GROUP_MSTR;')
    Left = 114
    Top = 168
  end
  object dspRES_MSTR: TDataSetProvider
    DataSet = qryRES_MSTR
    Left = 208
    Top = 224
  end
  object dspUTL_TYPE_MSTR: TDataSetProvider
    DataSet = qryUTL_TYPE_MSTR
    Left = 208
    Top = 280
  end
  object dspRES_GRP_ID: TDataSetProvider
    DataSet = qryRES_GRP_ID
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 208
    Top = 168
  end
  object qryAddResource: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'LOC_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'RESOURCE_TYPE_CD'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * from RESOURCE_MSTR where LOC_ID=:LOC_ID and '
      'RESOURCE_TYPE_CD=:RESOURCE_TYPE_CD;')
    Left = 600
    Top = 56
  end
  object dspAddResource: TDataSetProvider
    DataSet = qryAddResource
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 688
    Top = 56
  end
  object dspRES_GRP_MSTR_FIND: TDataSetProvider
    DataSet = qryRES_GRP_MSTR_FIND
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 752
    Top = 216
  end
  object dspRES_GRP: TDataSetProvider
    DataSet = qryRES_GRP
    Left = 208
    Top = 112
  end
  object qryRES_GRP_MSTR_FIND: TADOQuery
    Connection = ADOConnection1
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
    Left = 594
    Top = 216
  end
  object qryRES_GRP_MSTR_DUP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from RESOURCE_GROUP_MSTR;')
    Left = 592
    Top = 136
  end
  object dspRES_GRP_MSTR_DUP: TDataSetProvider
    DataSet = qryRES_GRP_MSTR_DUP
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 720
    Top = 136
  end
end
