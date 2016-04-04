object memberRegFrm: TmemberRegFrm
  Left = 541
  Top = 323
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20250#21592#30331#35760
  ClientHeight = 206
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object RzGroupBox1: TRzGroupBox
    Left = 12
    Top = 8
    Width = 337
    Height = 157
    Caption = #20250#21592#20449#24687
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 27
      Width = 48
      Height = 12
      Caption = #20250#21592#21517#65306
    end
    object Label2: TLabel
      Left = 32
      Top = 55
      Width = 60
      Height = 12
      Caption = #20250#21592#21345#21495#65306
    end
    object Label3: TLabel
      Left = 32
      Top = 88
      Width = 60
      Height = 12
      Caption = #24320#36890#26085#26399#65306
    end
    object Label4: TLabel
      Left = 32
      Top = 117
      Width = 60
      Height = 12
      Caption = #21345#20869#20313#39069#65306
    end
    object uname: TRzDBEdit
      Left = 112
      Top = 24
      Width = 201
      Height = 20
      DataSource = ds
      DataField = 'MNAME'
      TabOrder = 0
    end
    object RzDBEdit1: TRzDBEdit
      Left = 112
      Top = 52
      Width = 201
      Height = 20
      DataSource = ds
      DataField = 'MCID'
      TabOrder = 1
    end
    object RzDBDateTimeEdit1: TRzDBDateTimeEdit
      Left = 112
      Top = 83
      Width = 201
      Height = 20
      DataSource = ds
      DataField = 'MDATE'
      TabOrder = 2
      EditType = etDate
    end
    object RzDBNumericEdit1: TRzDBNumericEdit
      Left = 112
      Top = 114
      Width = 201
      Height = 20
      DataSource = ds
      DataField = 'MMONEY'
      Alignment = taLeftJustify
      TabOrder = 3
      IntegersOnly = False
      DisplayFormat = '0.00'
    end
  end
  object RzBitBtn1: TRzBitBtn
    Left = 88
    Top = 174
    FrameColor = 7617536
    Caption = #20445#23384
    Color = 15791348
    HotTrack = True
    TabOrder = 1
    OnClick = RzBitBtn1Click
  end
  object RzBitBtn2: TRzBitBtn
    Left = 200
    Top = 174
    FrameColor = 7617536
    Caption = #20851#38381
    Color = 15791348
    HotTrack = True
    TabOrder = 2
    OnClick = RzBitBtn2Click
  end
  object ds: TDataSource
    DataSet = qry
    Left = 16
    Top = 116
  end
  object qry: TZQuery
    Connection = mainfrm.conn
    Params = <>
    Left = 16
    Top = 76
  end
end
