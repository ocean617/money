object NewOrderFrm: TNewOrderFrm
  Left = 318
  Top = 30
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24320#21333
  ClientHeight = 629
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 12
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 41
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 0
    VisualStyle = vsGradient
    object RzLabel1: TRzLabel
      Left = 12
      Top = 16
      Width = 33
      Height = 12
      AutoSize = False
      Caption = #21333#21495
      Transparent = True
    end
    object RzLabel2: TRzLabel
      Left = 156
      Top = 16
      Width = 41
      Height = 12
      AutoSize = False
      Caption = #27969#27700#21495
      Transparent = True
    end
    object RzLabel3: TRzLabel
      Left = 328
      Top = 16
      Width = 41
      Height = 12
      AutoSize = False
      Caption = #24635#23458#25968
      Transparent = True
    end
    object RzLabel5: TRzLabel
      Left = 410
      Top = 16
      Width = 50
      Height = 12
      AutoSize = False
      Caption = #24320#21333#26102#38388
      Transparent = True
    end
    object ONUM_edt: TRzEdit
      Left = 44
      Top = 12
      Width = 105
      Height = 20
      TabOrder = 0
    end
    object seqNum_edt: TRzEdit
      Left = 200
      Top = 12
      Width = 125
      Height = 20
      Color = clInfoBk
      FocusColor = 12189695
      ReadOnly = True
      TabOrder = 1
    end
    object OPCOUNT_edt: TRzNumericEdit
      Left = 372
      Top = 12
      Width = 21
      Height = 20
      TabOrder = 2
      Max = 40.000000000000000000
      Value = 1.000000000000000000
      DisplayFormat = ',0;(,0)'
    end
    object order_date: TDBDateTimeEditEh
      Left = 464
      Top = 12
      Width = 205
      Height = 20
      EditButtons = <>
      Kind = dtkDateTimeEh
      TabOrder = 3
      Visible = True
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 41
    Width = 677
    Height = 547
    Align = alClient
    TabOrder = 1
    object Label4: TLabel
      Left = 10
      Top = 497
      Width = 58
      Height = 13
      AutoSize = False
      Caption = #35745#20215#31867#22411
    end
    object RzLabel4: TRzLabel
      Left = 11
      Top = 523
      Width = 49
      Height = 12
      AutoSize = False
      Caption = #22242#20307#21333#21495
      Transparent = True
    end
    object items_group: TRzGroupBox
      Left = 8
      Top = 12
      Width = 665
      Height = 295
      BorderWidth = 3
      Caption = #28040#36153#30340#22522#26412#39033#30446'('#25552#37266#65306#35831#20005#26684#25353#29031#19968#34892#19968#34892#36755#20837#65292#19981#35201#38548#34892#36755#20837#65292#20197#36991#20813#20986#38169')'
      TabOrder = 0
      object RzPanel3: TRzPanel
        Left = 8
        Top = 20
        Width = 649
        Height = 30
        BorderInner = fsPopup
        BorderOuter = fsGroove
        TabOrder = 0
        object RzPanel5: TRzPanel
          Left = 3
          Top = 3
          Width = 302
          Height = 24
          Align = alLeft
          BorderOuter = fsNone
          Caption = #28040#36153#39033#30446
          Color = 16444367
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          VisualStyle = vsGradient
        end
        object RzPanel6: TRzPanel
          Left = 305
          Top = 3
          Width = 172
          Height = 24
          Align = alLeft
          BorderOuter = fsNone
          Caption = #25151#21495
          Color = 16310712
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          VisualStyle = vsGradient
        end
        object RzPanel7: TRzPanel
          Left = 477
          Top = 3
          Width = 168
          Height = 24
          Align = alLeft
          BorderOuter = fsNone
          Caption = #36827#25151#26102#38388
          Color = 15978639
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          VisualStyle = vsGradient
        end
      end
      object Item_1: TComboBox
        Left = 8
        Top = 52
        Width = 305
        Height = 20
        ItemHeight = 12
        TabOrder = 2
      end
      object Room_1: TComboBox
        Left = 315
        Top = 52
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 3
        Text = 'a1'
        OnChange = Room_1Change
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object InTime_1: TComboBox
        Left = 487
        Top = 51
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 1
        OnChange = InTime_1Change
      end
      object Item_2: TComboBox
        Left = 8
        Top = 76
        Width = 305
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 5
      end
      object Room_2: TComboBox
        Left = 315
        Top = 76
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 6
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object InTime_2: TComboBox
        Left = 487
        Top = 75
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 4
      end
      object Item_3: TComboBox
        Left = 8
        Top = 99
        Width = 305
        Height = 20
        ItemHeight = 12
        TabOrder = 8
      end
      object Room_3: TComboBox
        Left = 315
        Top = 99
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 9
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object Room_4: TComboBox
        Left = 315
        Top = 123
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 12
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object Item_4: TComboBox
        Left = 8
        Top = 123
        Width = 305
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 11
      end
      object InTime_4: TComboBox
        Left = 487
        Top = 122
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 10
      end
      object InTime_3: TComboBox
        Left = 487
        Top = 98
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 7
      end
      object Item_5: TComboBox
        Left = 8
        Top = 146
        Width = 305
        Height = 20
        ItemHeight = 12
        TabOrder = 14
      end
      object Item_6: TComboBox
        Left = 8
        Top = 170
        Width = 305
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 17
      end
      object Item_8: TComboBox
        Left = 8
        Top = 217
        Width = 305
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 23
      end
      object Item_7: TComboBox
        Left = 8
        Top = 193
        Width = 305
        Height = 20
        ItemHeight = 12
        TabOrder = 20
      end
      object Room_8: TComboBox
        Left = 315
        Top = 217
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 24
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object Room_7: TComboBox
        Left = 315
        Top = 193
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 21
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object Room_6: TComboBox
        Left = 315
        Top = 170
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 18
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object Room_5: TComboBox
        Left = 315
        Top = 146
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 15
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object InTime_5: TComboBox
        Left = 487
        Top = 145
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 13
      end
      object InTime_6: TComboBox
        Left = 487
        Top = 169
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 16
      end
      object InTime_7: TComboBox
        Left = 487
        Top = 192
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 19
      end
      object InTime_8: TComboBox
        Left = 487
        Top = 216
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 22
      end
      object Item_10: TComboBox
        Left = 8
        Top = 264
        Width = 305
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 29
      end
      object Item_9: TComboBox
        Left = 8
        Top = 240
        Width = 305
        Height = 20
        ItemHeight = 12
        TabOrder = 26
      end
      object Room_9: TComboBox
        Left = 315
        Top = 240
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 27
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object Room_10: TComboBox
        Left = 315
        Top = 264
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 30
        Items.Strings = (
          'a1'
          'a2'
          'a3'
          'a5'
          'a6'
          'a8'
          'a9'
          'a10'
          'a11'
          'a12'
          'a13'
          'b01'
          'b02'
          'b03'
          'b05'
          'b06'
          'b08'
          'b09'
          'b10'
          'b11'
          'b12'
          'b13'
          'b15'
          'b16'
          'b18'
          'b19'
          'b20'
          'b21'
          'b22'
          'b23'
          'b25'
          'b26'
          'b28'
          'b29'
          '8101'
          '8102'
          '8103'
          '8105'
          '8106'
          '8108'
          '8109'
          '8110'
          '8111'
          '8112'
          '8113'
          '8115'
          '8116'
          '8118'
          '8301'
          '8302'
          '8303'
          '8305'
          '8306'
          '8308'
          '8309'
          '8310'
          '8311'
          '8312'
          '8313'
          '8066'
          '8088'
          '8099')
      end
      object InTime_9: TComboBox
        Left = 487
        Top = 239
        Width = 170
        Height = 20
        ItemHeight = 12
        TabOrder = 25
      end
      object InTime_10: TComboBox
        Left = 487
        Top = 263
        Width = 170
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 28
      end
    end
    object memo_group: TGroupBox
      Left = 368
      Top = 320
      Width = 301
      Height = 217
      Caption = #22791#27880
      TabOrder = 2
      object memo_edt: TMemo
        Left = 8
        Top = 16
        Width = 287
        Height = 193
        Align = alCustom
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tj_items_group: TRzGroupBox
      Left = 8
      Top = 320
      Width = 353
      Height = 161
      BorderWidth = 3
      Caption = #25512#33616#39033#30446'('#25552#37266#65306#35831#19968#34892#19968#34892#36755#20837#65292#19981#35201#38548#34892#36755#20837')'
      TabOrder = 1
      object RzPanel4: TRzPanel
        Left = 5
        Top = 20
        Width = 344
        Height = 30
        BorderInner = fsPopup
        BorderOuter = fsGroove
        TabOrder = 0
        object RzPanel8: TRzPanel
          Left = 3
          Top = 3
          Width = 146
          Height = 24
          Align = alLeft
          BorderOuter = fsNone
          Caption = #25512#33616#39033#30446
          Color = 16444367
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          VisualStyle = vsGradient
        end
        object RzPanel9: TRzPanel
          Left = 149
          Top = 3
          Width = 56
          Height = 24
          Align = alLeft
          BorderOuter = fsNone
          Caption = #25968#37327
          Color = 16310712
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          VisualStyle = vsGradient
        end
        object RzPanel10: TRzPanel
          Left = 205
          Top = 3
          Width = 136
          Height = 24
          Align = alLeft
          BorderOuter = fsNone
          Caption = #25512#33616#20154
          Color = 15978639
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          VisualStyle = vsGradient
        end
      end
      object TjItem_1: TComboBox
        Left = 8
        Top = 52
        Width = 147
        Height = 20
        ItemHeight = 12
        TabOrder = 1
      end
      object TjCount_1: TComboBox
        Left = 157
        Top = 52
        Width = 53
        Height = 20
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 2
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object TjName_1: TComboBox
        Left = 212
        Top = 51
        Width = 136
        Height = 20
        ItemHeight = 12
        TabOrder = 3
      end
      object TjItem_2: TComboBox
        Left = 8
        Top = 76
        Width = 147
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 4
      end
      object TjCount_2: TComboBox
        Left = 157
        Top = 76
        Width = 53
        Height = 20
        Color = 16772055
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 5
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object TjName_2: TComboBox
        Left = 212
        Top = 75
        Width = 136
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 6
      end
      object TjItem_3: TComboBox
        Left = 8
        Top = 99
        Width = 147
        Height = 20
        ItemHeight = 12
        TabOrder = 7
      end
      object TjCount_3: TComboBox
        Left = 157
        Top = 99
        Width = 53
        Height = 20
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 8
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object TjCount_4: TComboBox
        Left = 157
        Top = 123
        Width = 53
        Height = 20
        Color = 16772055
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 11
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object TjItem_4: TComboBox
        Left = 8
        Top = 123
        Width = 147
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 10
      end
      object TjName_4: TComboBox
        Left = 212
        Top = 122
        Width = 136
        Height = 20
        Color = 16772055
        ItemHeight = 12
        TabOrder = 12
      end
      object TjName_3: TComboBox
        Left = 212
        Top = 98
        Width = 136
        Height = 20
        ItemHeight = 12
        TabOrder = 9
      end
    end
    object payTypecmb: TComboBox
      Left = 72
      Top = 494
      Width = 149
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 4
      Text = #30333#22825#20215
      Items.Strings = (
        #30333#22825#20215
        #26202#19978#20215
        #20250#21592#20215
        'VIP'#20215
        #22242#36141#20215)
    end
    object CommChk: TRzCheckBox
      Left = 255
      Top = 496
      Width = 67
      Height = 15
      Caption = #22242#20307#28040#36153
      State = cbUnchecked
      TabOrder = 3
      Transparent = True
      OnClick = CommChkClick
    end
    object CommNum_edt: TRzEdit
      Left = 71
      Top = 519
      Width = 182
      Height = 20
      Color = clInfoBk
      FocusColor = 12189695
      ReadOnly = True
      TabOrder = 6
    end
    object SaveNextComm_bt: TRzBitBtn
      Left = 254
      Top = 517
      Width = 107
      Height = 23
      FrameColor = 7617536
      Caption = #37325#26032#21462#21495'(&M)'
      Color = 15791348
      HotTrack = True
      TabOrder = 5
      OnClick = SaveNextComm_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000630B0000630B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
        0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
        120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
        12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
        1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
        181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
        E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
        E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
        E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
        E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
        E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
        E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 588
    Width = 677
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    VisualStyle = vsGradient
    object SaveOrder_bt: TRzBitBtn
      Left = 475
      Top = 4
      Width = 89
      Height = 29
      FrameColor = 7617536
      Caption = #24320#21333'(&O)'
      Color = 15791348
      HotTrack = True
      TabOrder = 0
      OnClick = SaveOrder_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000630B0000630B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
        0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
        120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
        12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
        1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
        181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
        E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
        E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
        E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
        E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
        E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
        E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object close_bt: TRzBitBtn
      Left = 571
      Top = 4
      Width = 89
      Height = 29
      FrameColor = 7617536
      Caption = #20851#38381'(&C)'
      Color = 15791348
      HotTrack = True
      TabOrder = 1
      OnClick = close_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000630B0000630B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8B46C6C6CE8
        E8E8E8E8B46C6C6CE8E8E8E2DFDFDFE8E8E8E8E8E2DFDFDFE8E8E8B49090906C
        E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8E8B4909090
        6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8E8E8B49090
        906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8E8E8B490
        909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8E8E8B4
        9090906CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8B490
        909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8B49090
        906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8B4909090
        6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8B49090906C
        E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8B4B4B4B4E8
        E8E8E8E8B4B4B4B4E8E8E8E2E2E2E2E8E8E8E8E8E2E2E2E2E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
end
