object ResourceGroup: TResourceGroup
  OldCreateOrder = False
  Height = 503
  Width = 864
  object connMain: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Pass_word0;Persist Security Info=Tr' +
      'ue;User ID=SCP71Demo;Initial Catalog=SCP71Demo;Data Source=APT05' +
      '-H9CW0N2'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object qryRES_GRP_MSTR: TADOQuery
    Active = True
    Connection = connMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from resource_group_mstr order by resource_group_id')
    Left = 56
    Top = 64
  end
  object qryRES_GRP: TADOQuery
    Active = True
    Connection = connMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from resource_group_mstr order by resource_group_id')
    Left = 152
    Top = 64
  end
end
