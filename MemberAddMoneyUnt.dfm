object MemberAddMoneyFrm: TMemberAddMoneyFrm
  Left = 511
  Top = 257
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20250#21592#20805#20540
  ClientHeight = 269
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object czbt: TRzBitBtn
    Left = 107
    Top = 234
    FrameColor = 7617536
    Caption = #20805#20540
    Color = 15791348
    Enabled = False
    HotTrack = True
    TabOrder = 1
    OnClick = czbtClick
  end
  object RzBitBtn2: TRzBitBtn
    Left = 219
    Top = 234
    FrameColor = 7617536
    Caption = #20851#38381
    Color = 15791348
    HotTrack = True
    TabOrder = 2
    OnClick = RzBitBtn2Click
  end
  object RzPanel1: TRzPanel
    Left = 6
    Top = 8
    Width = 388
    Height = 221
    BorderOuter = fsFlatRounded
    TabOrder = 0
    VisualStyle = vsGradient
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 108
      Height = 12
      Caption = #20250#21592#21345#21495#65288#35831#21047#21345#65289
      Transparent = True
    end
    object Label2: TLabel
      Left = 7
      Top = 141
      Width = 141
      Height = 12
      AutoSize = False
      Caption = #20805#20540#37329#39069'('#26368#22823#20540#20026'5000)'
      Transparent = True
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 96
      Height = 12
      Caption = #35813#20250#21592#30446#21069#21345#20313#39069
      Transparent = True
    end
    object Label4: TLabel
      Left = 7
      Top = 163
      Width = 24
      Height = 12
      Caption = #22791#27880
      Transparent = True
    end
    object Label5: TLabel
      Left = 7
      Top = 92
      Width = 48
      Height = 12
      Caption = #20805#20540#31867#22411
      Transparent = True
    end
    object Label6: TLabel
      Left = 8
      Top = 68
      Width = 72
      Height = 12
      Caption = #35813#20250#21592#24635#31215#20998
      Transparent = True
    end
    object Label7: TLabel
      Left = 7
      Top = 117
      Width = 141
      Height = 12
      AutoSize = False
      Caption = #20805#20540#31215#20998
      Transparent = True
      Visible = False
    end
    object cardId_edt: TEdit
      Left = 150
      Top = 16
      Width = 233
      Height = 20
      TabOrder = 0
      OnKeyPress = cardId_edtKeyPress
    end
    object status_edt: TEdit
      Left = 150
      Top = 40
      Width = 233
      Height = 20
      Color = 16774120
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object smemo: TRzMemo
      Left = 149
      Top = 160
      Width = 233
      Height = 53
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object mtype_cmb: TComboBox
      Left = 150
      Top = 88
      Width = 229
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 3
      Text = #29616#37329
      OnChange = mtype_cmbChange
      Items.Strings = (
        #29616#37329
        #38134#32852#21345
        #20805#20540#36192#36865
        #19994#21153#36192#36865
        #31215#20998#36192#36865)
    end
    object num_edt: TEdit
      Left = 150
      Top = 137
      Width = 231
      Height = 20
      TabOrder = 5
      Text = '0'
    end
    object jf_edt: TEdit
      Left = 149
      Top = 64
      Width = 233
      Height = 20
      Color = 16774120
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object czjf_edt: TEdit
      Left = 150
      Top = 113
      Width = 231
      Height = 20
      TabOrder = 4
      Text = '0'
      Visible = False
      OnKeyUp = czjf_edtKeyUp
    end
  end
  object qry: TZQuery
    Connection = mainfrm.conn
    Params = <>
    Left = 364
    Top = 128
  end
end
