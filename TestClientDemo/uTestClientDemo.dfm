object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'ClientTest'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 619
    Height = 203
    DataSource = dsRES_GRP_MSTR_cds
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 328
    Top = 24
    Width = 240
    Height = 25
    DataSource = dsRES_GRP_MSTR_cds
    TabOrder = 1
  end
  object dcomconnMain: TDCOMConnection
    Connected = True
    ServerGUID = '{A9823DC0-C360-4F91-A42B-E1986C1D2AA2}'
    ServerName = 'ProductServer.Product'
    ComputerName = 'APT05-H9CW0N2'
    Left = 24
    Top = 8
  end
  object cdsRES_GRP_MSTR: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRES_GRP_MSTR'
    RemoteServer = dcomconnMain
    Left = 88
    Top = 48
  end
  object dsRES_GRP_MSTR_cds: TDataSource
    DataSet = cdsRES_GRP_MSTR
    Left = 264
    Top = 16
  end
end
