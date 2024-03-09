object dtmConnection: TdtmConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 293
  Width = 407
  object cnnMain: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    Left = 180
    Top = 116
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 276
    Top = 116
  end
end
