object DM: TDM
  Height = 480
  Width = 640
  object conexao: TFDConnection
    Params.Strings = (
      'Database=testeemail'
      'User_Name=postgres'
      'Password=1234'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 40
  end
  object libPg: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 80
    Top = 136
  end
  object sqlConsulta: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 224
    Top = 40
    ParamData = <
      item
        Name = 'pConsulta'
        ArrayType = atArray
        DataType = ftString
        FDDataType = dtAnsiString
      end>
  end
  object dsSqlConsulta: TDataSource
    DataSet = sqlConsulta
    Left = 224
    Top = 136
  end
end
