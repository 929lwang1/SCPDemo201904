object Product: TProduct
  OldCreateOrder = False
  Height = 401
  Width = 766
  object connMain: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Pass_word0;Persist Security Info=Tr' +
      'ue;User ID=SCP71Demo;Initial Catalog=SCP71Demo;Data Source=APT05' +
      '-H9CW0N2'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object qryRES_GRP_MSTR: TADOQuery
    Active = True
    Connection = connMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from resource_group_mstr')
    Left = 104
    Top = 64
  end
  object qryRES_GRPS: TADOQuery
    Active = True
    Connection = connMain
    CursorType = ctStatic
    DataSource = dsRES_GRP_MSTR
    Parameters = <
      item
        Name = 'resource_group_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    SQL.Strings = (
      
        'select * from resource_groups where resource_group_id = :resourc' +
        'e_group_id')
    Left = 208
    Top = 64
  end
  object qryRES_MSTR: TADOQuery
    Active = True
    Connection = connMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from resource_mstr')
    Left = 312
    Top = 64
  end
  object dsRES_GRP_MSTR: TDataSource
    DataSet = qryRES_GRP_MSTR
    Left = 40
    Top = 136
  end
  object dspRES_GRP_MSTR: TDataSetProvider
    DataSet = qryRES_GRP_MSTR
    Left = 104
    Top = 208
  end
  object qryUTL_TYPE_MSTR: TADOQuery
    Active = True
    Connection = connMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from utilization_type_mstr')
    Left = 408
    Top = 64
  end
  object dspRES_MSTR: TDataSetProvider
    DataSet = qryRES_MSTR
    Left = 320
    Top = 208
  end
  object dspUTL_TYPE_MSTR: TDataSetProvider
    DataSet = qryUTL_TYPE_MSTR
    Left = 424
    Top = 208
  end
end
