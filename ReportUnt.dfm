object ReportFrm: TReportFrm
  Left = 502
  Top = 96
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#34920
  ClientHeight = 470
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 12
  object pbar: TRzProgressBar
    Left = 4
    Top = 408
    Width = 449
    BackColorStop = clWhite
    BarColor = clBlack
    BarColorStop = clLime
    BarStyle = bsGradient
    BorderColor = 4259584
    BorderWidth = 0
    FlatColor = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    GradientDirection = gdVerticalEnd
    InteriorOffset = 0
    ParentFont = False
    PartsComplete = 0
    Percent = 0
    ShowParts = True
    TotalParts = 0
  end
  object RzGroupBox1: TRzGroupBox
    Left = 4
    Top = 64
    Width = 449
    Height = 65
    Caption = #32479#35745#25253#34920
    TabOrder = 1
    object r1_bt: TRzBitBtn
      Left = 8
      Top = 23
      Width = 205
      Height = 32
      FrameColor = 7617536
      Caption = #29616#37329#26085#25253#34920
      Color = 15791348
      HotTrack = True
      TabOrder = 1
      OnClick = r1_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830E0000830E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8820982E8E8E8E8E8E8E8E8E8E8E8E8E8AC81ACE85E5E5E5E5E
        5E5E5E5E5E5E82090909E88181818181818181818181AC818181E85ED7D7D7D7
        D7D7D7D7D7DF09090982E881E8E8E8E8E8E8E8E8E8DF818181ACE85ED7E3E3E3
        E3E3DFDFDF09090982E8E881E8ACACACACACDFDFDF818181ACE8E85ED7D7D7D7
        E35DB3B3D7880982E8E8E881E8E8E8E8AC81E3E3D7E381ACE8E8E85ED7E3E3E3
        81E6B3B3B3D756E8E8E8E881E8ACACAC81E3E3E3E3D756E8E8E8E85ED7D7D7D7
        81E6D7E6B3B356E8E8E8E881E8E8E8E881E3D7E3E3E356E8E8E8E85ED7E3E3E3
        81E6D7D7E6B356E8E8E8E881E8ACACAC81E3D7D7E3E356E8E8E8E85ED7D7D7D7
        D781E6E6E65DDFE8E8E8E881E8E8E8E8E881E3E3E381DFE8E8E8E85ED7E3E3E3
        E3E3818181E35EE8E8E8E881E8ACACACACAC818181E381E8E8E8E85ED7D7D7D7
        D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3E3
        E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7D7
        D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E381E8E8E8E8E85ED7D7D7D7
        D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E5E
        5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object r2_bt: TRzBitBtn
      Left = 228
      Top = 22
      Width = 205
      Height = 32
      FrameColor = 7617536
      Caption = #25216#24072#19994#32489#26085#25253#34920
      Color = 15791348
      HotTrack = True
      TabOrder = 0
      OnClick = r2_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830E0000830E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8820982E8E8E8E8E8E8E8E8E8E8E8E8E8AC81ACE85E5E5E5E5E
        5E5E5E5E5E5E82090909E88181818181818181818181AC818181E85ED7D7D7D7
        D7D7D7D7D7DF09090982E881E8E8E8E8E8E8E8E8E8DF818181ACE85ED7E3E3E3
        E3E3DFDFDF09090982E8E881E8ACACACACACDFDFDF818181ACE8E85ED7D7D7D7
        E35DB3B3D7880982E8E8E881E8E8E8E8AC81E3E3D7E381ACE8E8E85ED7E3E3E3
        81E6B3B3B3D756E8E8E8E881E8ACACAC81E3E3E3E3D756E8E8E8E85ED7D7D7D7
        81E6D7E6B3B356E8E8E8E881E8E8E8E881E3D7E3E3E356E8E8E8E85ED7E3E3E3
        81E6D7D7E6B356E8E8E8E881E8ACACAC81E3D7D7E3E356E8E8E8E85ED7D7D7D7
        D781E6E6E65DDFE8E8E8E881E8E8E8E8E881E3E3E381DFE8E8E8E85ED7E3E3E3
        E3E3818181E35EE8E8E8E881E8ACACACACAC818181E381E8E8E8E85ED7D7D7D7
        D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3E3
        E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7D7
        D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E381E8E8E8E8E85ED7D7D7D7
        D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E5E
        5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
  object r5: TRzGroupBox
    Left = 2
    Top = 291
    Width = 452
    Height = 53
    Caption = #20013#24515#26376#24635#25253#34920
    TabOrder = 4
    object Label10: TLabel
      Left = 9
      Top = 24
      Width = 60
      Height = 12
      Caption = #35831#36873#25321#26376#20221
      Transparent = True
    end
    object Label11: TLabel
      Left = 161
      Top = 24
      Width = 12
      Height = 12
      Caption = #24180
      Transparent = True
    end
    object Label12: TLabel
      Left = 237
      Top = 24
      Width = 12
      Height = 12
      Caption = #26376
      Transparent = True
    end
    object r5_bt: TRzBitBtn
      Left = 330
      Top = 14
      Width = 111
      Height = 29
      FrameColor = 7617536
      Caption = #29983#25104#25253#34920
      Color = 15791348
      HotTrack = True
      TabOrder = 0
      OnClick = r5_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830E0000830E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8820982E8E8E8E8E8E8E8E8E8E8E8E8E8AC81ACE85E5E5E5E5E
        5E5E5E5E5E5E82090909E88181818181818181818181AC818181E85ED7D7D7D7
        D7D7D7D7D7DF09090982E881E8E8E8E8E8E8E8E8E8DF818181ACE85ED7E3E3E3
        E3E3DFDFDF09090982E8E881E8ACACACACACDFDFDF818181ACE8E85ED7D7D7D7
        E35DB3B3D7880982E8E8E881E8E8E8E8AC81E3E3D7E381ACE8E8E85ED7E3E3E3
        81E6B3B3B3D756E8E8E8E881E8ACACAC81E3E3E3E3D756E8E8E8E85ED7D7D7D7
        81E6D7E6B3B356E8E8E8E881E8E8E8E881E3D7E3E3E356E8E8E8E85ED7E3E3E3
        81E6D7D7E6B356E8E8E8E881E8ACACAC81E3D7D7E3E356E8E8E8E85ED7D7D7D7
        D781E6E6E65DDFE8E8E8E881E8E8E8E8E881E3E3E381DFE8E8E8E85ED7E3E3E3
        E3E3818181E35EE8E8E8E881E8ACACACACAC818181E381E8E8E8E85ED7D7D7D7
        D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3E3
        E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7D7
        D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E381E8E8E8E8E85ED7D7D7D7
        D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E5E
        5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object r5_year_cmb: TComboBox
      Left = 84
      Top = 20
      Width = 73
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 4
      TabOrder = 1
      Text = '2014'
      Items.Strings = (
        '2013'
        '2010'
        '2011'
        '2012'
        '2014'
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020')
    end
    object r5_month: TComboBox
      Left = 184
      Top = 20
      Width = 44
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 2
      Text = '01'
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
    end
  end
  object r6: TRzGroupBox
    Left = 2
    Top = 351
    Width = 452
    Height = 53
    Caption = #20013#24515#26376#25216#24072#19994#32489#24635#25253#34920
    TabOrder = 5
    object Label13: TLabel
      Left = 9
      Top = 24
      Width = 60
      Height = 12
      Caption = #35831#36873#25321#26376#20221
      Transparent = True
    end
    object Label14: TLabel
      Left = 161
      Top = 24
      Width = 12
      Height = 12
      Caption = #24180
      Transparent = True
    end
    object Label15: TLabel
      Left = 237
      Top = 24
      Width = 12
      Height = 12
      Caption = #26376
      Transparent = True
    end
    object r6_bt: TRzBitBtn
      Left = 330
      Top = 14
      Width = 111
      Height = 29
      FrameColor = 7617536
      Caption = #29983#25104#25253#34920
      Color = 15791348
      HotTrack = True
      TabOrder = 0
      OnClick = r6_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830E0000830E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8820982E8E8E8E8E8E8E8E8E8E8E8E8E8AC81ACE85E5E5E5E5E
        5E5E5E5E5E5E82090909E88181818181818181818181AC818181E85ED7D7D7D7
        D7D7D7D7D7DF09090982E881E8E8E8E8E8E8E8E8E8DF818181ACE85ED7E3E3E3
        E3E3DFDFDF09090982E8E881E8ACACACACACDFDFDF818181ACE8E85ED7D7D7D7
        E35DB3B3D7880982E8E8E881E8E8E8E8AC81E3E3D7E381ACE8E8E85ED7E3E3E3
        81E6B3B3B3D756E8E8E8E881E8ACACAC81E3E3E3E3D756E8E8E8E85ED7D7D7D7
        81E6D7E6B3B356E8E8E8E881E8E8E8E881E3D7E3E3E356E8E8E8E85ED7E3E3E3
        81E6D7D7E6B356E8E8E8E881E8ACACAC81E3D7D7E3E356E8E8E8E85ED7D7D7D7
        D781E6E6E65DDFE8E8E8E881E8E8E8E8E881E3E3E381DFE8E8E8E85ED7E3E3E3
        E3E3818181E35EE8E8E8E881E8ACACACACAC818181E381E8E8E8E85ED7D7D7D7
        D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3E3
        E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7D7
        D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E381E8E8E8E8E85ED7D7D7D7
        D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E5E
        5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object r6_year_cmb: TComboBox
      Left = 84
      Top = 20
      Width = 73
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 4
      TabOrder = 1
      Text = '2014'
      Items.Strings = (
        '2013'
        '2010'
        '2011'
        '2012'
        '2014'
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020')
    end
    object r6_month: TComboBox
      Left = 184
      Top = 20
      Width = 44
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 2
      Text = '01'
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
    end
  end
  object RzBitBtn7: TRzBitBtn
    Left = 187
    Top = 437
    Width = 88
    Height = 29
    FrameColor = 7617536
    Caption = #20851#38381
    Color = 15791348
    HotTrack = True
    TabOrder = 6
    OnClick = RzBitBtn7Click
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730B0000730B00000001000000000000000000003300
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
      EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
      E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
      57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
      578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
      57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
      57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
      57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
      57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
      57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
      57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
      57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
      57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
      57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
      57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
      57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
      57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object RzGroupBox4: TRzGroupBox
    Left = 4
    Top = 4
    Width = 449
    Height = 53
    Caption = #26085#26399#36873#25321
    TabOrder = 0
    object Label2: TLabel
      Left = 9
      Top = 24
      Width = 48
      Height = 12
      Caption = #24320#22987#26085#26399
      Transparent = True
    end
    object Label16: TLabel
      Left = 217
      Top = 24
      Width = 48
      Height = 12
      Caption = #32467#26463#26085#26399
      Transparent = True
    end
    object date_begin: TDBDateTimeEditEh
      Left = 67
      Top = 20
      Width = 142
      Height = 20
      EditButtons = <>
      TabOrder = 1
      Visible = True
      EditFormat = 'YYYY-MM-DD HH:NN:SS'
    end
    object date_end: TDBDateTimeEditEh
      Left = 270
      Top = 19
      Width = 165
      Height = 20
      EditButtons = <>
      TabOrder = 0
      Visible = True
      EditFormat = 'YYYY-MM-DD HH:NN:SS'
    end
  end
  object r4: TRzGroupBox
    Left = 4
    Top = 217
    Width = 448
    Height = 72
    Caption = #25216#24072#26376#19994#32489#32047#35745
    TabOrder = 3
    object Label9: TLabel
      Left = 9
      Top = 44
      Width = 84
      Height = 12
      Caption = #35831#36873#25321#25216#24072#24037#21495
      Transparent = True
    end
    object Label1: TLabel
      Left = 9
      Top = 20
      Width = 60
      Height = 12
      Caption = #35831#36873#25321#26376#20221
      Transparent = True
    end
    object Label3: TLabel
      Left = 177
      Top = 20
      Width = 12
      Height = 12
      Caption = #24180
      Transparent = True
    end
    object Label4: TLabel
      Left = 253
      Top = 20
      Width = 12
      Height = 12
      Caption = #26376
      Transparent = True
    end
    object js_cmb: TComboBox
      Left = 100
      Top = 41
      Width = 165
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 3
    end
    object r4_bt: TRzBitBtn
      Left = 328
      Top = 28
      Width = 109
      Height = 29
      FrameColor = 7617536
      Caption = #29983#25104#25253#34920
      Color = 15791348
      HotTrack = True
      TabOrder = 2
      OnClick = r4_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830E0000830E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8820982E8E8E8E8E8E8E8E8E8E8E8E8E8AC81ACE85E5E5E5E5E
        5E5E5E5E5E5E82090909E88181818181818181818181AC818181E85ED7D7D7D7
        D7D7D7D7D7DF09090982E881E8E8E8E8E8E8E8E8E8DF818181ACE85ED7E3E3E3
        E3E3DFDFDF09090982E8E881E8ACACACACACDFDFDF818181ACE8E85ED7D7D7D7
        E35DB3B3D7880982E8E8E881E8E8E8E8AC81E3E3D7E381ACE8E8E85ED7E3E3E3
        81E6B3B3B3D756E8E8E8E881E8ACACAC81E3E3E3E3D756E8E8E8E85ED7D7D7D7
        81E6D7E6B3B356E8E8E8E881E8E8E8E881E3D7E3E3E356E8E8E8E85ED7E3E3E3
        81E6D7D7E6B356E8E8E8E881E8ACACAC81E3D7D7E3E356E8E8E8E85ED7D7D7D7
        D781E6E6E65DDFE8E8E8E881E8E8E8E8E881E3E3E381DFE8E8E8E85ED7E3E3E3
        E3E3818181E35EE8E8E8E881E8ACACACACAC818181E381E8E8E8E85ED7D7D7D7
        D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3E3
        E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7D7
        D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E381E8E8E8E8E85ED7D7D7D7
        D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E5E
        5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object r4_year_cmb: TComboBox
      Left = 100
      Top = 16
      Width = 73
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 4
      TabOrder = 0
      Text = '2014'
      Items.Strings = (
        '2013'
        '2010'
        '2011'
        '2012'
        '2014'
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020')
    end
    object r4_month: TComboBox
      Left = 200
      Top = 16
      Width = 44
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
      Text = '01'
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 3
    Top = 137
    Width = 448
    Height = 76
    Caption = #25512#33616#26376#25253#34920
    TabOrder = 2
    object Label6: TLabel
      Left = 9
      Top = 20
      Width = 60
      Height = 12
      Caption = #35831#36873#25321#26376#20221
      Transparent = True
    end
    object Label7: TLabel
      Left = 177
      Top = 20
      Width = 12
      Height = 12
      Caption = #24180
      Transparent = True
    end
    object Label8: TLabel
      Left = 253
      Top = 20
      Width = 12
      Height = 12
      Caption = #26376
      Transparent = True
    end
    object r3_bt: TRzBitBtn
      Left = 328
      Top = 10
      Width = 113
      Height = 29
      FrameColor = 7617536
      Caption = #29983#25104#25253#34920
      Color = 15791348
      HotTrack = True
      TabOrder = 0
      OnClick = r3_btClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830E0000830E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8820982E8E8E8E8E8E8E8E8E8E8E8E8E8AC81ACE85E5E5E5E5E
        5E5E5E5E5E5E82090909E88181818181818181818181AC818181E85ED7D7D7D7
        D7D7D7D7D7DF09090982E881E8E8E8E8E8E8E8E8E8DF818181ACE85ED7E3E3E3
        E3E3DFDFDF09090982E8E881E8ACACACACACDFDFDF818181ACE8E85ED7D7D7D7
        E35DB3B3D7880982E8E8E881E8E8E8E8AC81E3E3D7E381ACE8E8E85ED7E3E3E3
        81E6B3B3B3D756E8E8E8E881E8ACACAC81E3E3E3E3D756E8E8E8E85ED7D7D7D7
        81E6D7E6B3B356E8E8E8E881E8E8E8E881E3D7E3E3E356E8E8E8E85ED7E3E3E3
        81E6D7D7E6B356E8E8E8E881E8ACACAC81E3D7D7E3E356E8E8E8E85ED7D7D7D7
        D781E6E6E65DDFE8E8E8E881E8E8E8E8E881E3E3E381DFE8E8E8E85ED7E3E3E3
        E3E3818181E35EE8E8E8E881E8ACACACACAC818181E381E8E8E8E85ED7D7D7D7
        D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3E3
        E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7D7
        D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E381E8E8E8E8E85ED7D7D7D7
        D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E5E
        5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object r3_year_cmb: TComboBox
      Left = 100
      Top = 16
      Width = 73
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
      Text = '2014'
      Items.Strings = (
        '2014'
        '2010'
        '2011'
        '2012'
        '2013'
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020')
    end
    object r3_month: TComboBox
      Left = 200
      Top = 16
      Width = 44
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 2
      Text = '01'
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
    end
    object rzbtbtn_tj: TRzBitBtn
      Left = 328
      Top = 42
      Width = 113
      Height = 29
      FrameColor = 7617536
      Caption = #25512#33616#26597#35810
      Color = 15791348
      HotTrack = True
      TabOrder = 3
      OnClick = rzbtbtn_tjClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830E0000830E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8820982E8E8E8E8E8E8E8E8E8E8E8E8E8AC81ACE85E5E5E5E5E
        5E5E5E5E5E5E82090909E88181818181818181818181AC818181E85ED7D7D7D7
        D7D7D7D7D7DF09090982E881E8E8E8E8E8E8E8E8E8DF818181ACE85ED7E3E3E3
        E3E3DFDFDF09090982E8E881E8ACACACACACDFDFDF818181ACE8E85ED7D7D7D7
        E35DB3B3D7880982E8E8E881E8E8E8E8AC81E3E3D7E381ACE8E8E85ED7E3E3E3
        81E6B3B3B3D756E8E8E8E881E8ACACAC81E3E3E3E3D756E8E8E8E85ED7D7D7D7
        81E6D7E6B3B356E8E8E8E881E8E8E8E881E3D7E3E3E356E8E8E8E85ED7E3E3E3
        81E6D7D7E6B356E8E8E8E881E8ACACAC81E3D7D7E3E356E8E8E8E85ED7D7D7D7
        D781E6E6E65DDFE8E8E8E881E8E8E8E8E881E3E3E381DFE8E8E8E85ED7E3E3E3
        E3E3818181E35EE8E8E8E881E8ACACACACAC818181E381E8E8E8E85ED7D7D7D7
        D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3E3
        E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7D7
        D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E381E8E8E8E8E85ED7D7D7D7
        D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E5E
        5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
end