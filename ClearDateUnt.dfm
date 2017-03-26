object clearDatafrm: TclearDatafrm
  Left = 490
  Top = 288
  BorderStyle = bsSingle
  Caption = #21024#38500#25968#25454
  ClientHeight = 191
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 13
    Top = 13
    Width = 52
    Height = 13
    Caption = #24320#22987#26102#38388
    Transparent = True
  end
  object Label1: TLabel
    Left = 13
    Top = 45
    Width = 52
    Height = 13
    Caption = #32467#26463#26102#38388
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 4
    Top = 147
    Width = 283
    Height = 6
    Shape = bsTopLine
  end
  object RzCheckBox1: TRzCheckBox
    Left = 12
    Top = 76
    Width = 71
    Height = 15
    Caption = #28165#31354#21333#25454
    State = cbUnchecked
    TabOrder = 0
  end
  object RzCheckBox2: TRzCheckBox
    Left = 12
    Top = 100
    Width = 123
    Height = 15
    Caption = #28165#31354#20250#21592#28040#36153#35760#24405
    State = cbUnchecked
    TabOrder = 1
  end
  object RzCheckBox3: TRzCheckBox
    Left = 12
    Top = 124
    Width = 123
    Height = 15
    Caption = #28165#31354#20250#21592#20805#20540#35760#24405
    State = cbUnchecked
    TabOrder = 2
  end
  object RzButton1: TRzButton
    Left = 52
    Top = 156
    Width = 95
    FrameColor = 7617536
    Caption = #25191#34892#21024#38500
    Color = 15791348
    HotTrack = True
    TabOrder = 3
    OnClick = RzButton1Click
  end
  object RzButton2: TRzButton
    Left = 152
    Top = 156
    Width = 95
    FrameColor = 7617536
    Caption = #20851#38381
    Color = 15791348
    HotTrack = True
    TabOrder = 4
    OnClick = RzButton2Click
  end
  object sdate: TDBDateTimeEditEh
    Left = 87
    Top = 9
    Width = 173
    Height = 21
    EditButtons = <>
    TabOrder = 5
    Visible = True
    EditFormat = 'YYYY-MM-DD HH:NN:SS'
  end
  object edate: TDBDateTimeEditEh
    Left = 87
    Top = 41
    Width = 174
    Height = 21
    EditButtons = <>
    TabOrder = 6
    Visible = True
    EditFormat = 'YYYY-MM-DD HH:NN:SS'
  end
  object RzCheckBox4: TRzCheckBox
    Left = 156
    Top = 72
    Width = 129
    Height = 28
    Caption = #20250#21592#25152#26377#31215#20998#28165#38646
    State = cbUnchecked
    TabOrder = 7
  end
end
