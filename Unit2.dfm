object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 288
  Width = 531
  object Zconecction: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'Localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\xampp\mysql\bin\libmysql.dll'
    Left = 48
    Top = 40
  end
  object Zsatuan: TZQuery
    Connection = Zconecction
    Active = True
    SQL.Strings = (
      'SELECT * FROM satuan;')
    Params = <>
    Left = 120
    Top = 32
  end
  object dsSatuan: TDataSource
    DataSet = Zsatuan
    Left = 120
    Top = 112
  end
end
