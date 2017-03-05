object frmServiceReportKindSettings: TfrmServiceReportKindSettings
  Left = 284
  Top = 104
  Width = 923
  Height = 569
  Caption = #25253#34920#31867#21035#37197#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object grid: TDBGridEh
    Left = 0
    Top = 128
    Width = 907
    Height = 403
    Align = alBottom
    AutoFitColWidths = True
    ColumnDefValues.Title.Color = 16771538
    ColumnDefValues.Title.TitleButton = True
    Ctl3D = True
    DataGrouping.GroupLevels = <>
    DataSource = ds_reportkind_setting
    DrawMemoText = True
    Flat = False
    FooterColor = clYellow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OddRowColor = 16774636
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleBtnClick = gridTitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'RSNUM'
        Footers = <>
        Title.Caption = #26174#31034#24207#21495
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'RSREPORTKIND'
        Footers = <>
        Title.Caption = #25253#34920#31867#21035
        Width = 121
      end
      item
        EditButtons = <>
        FieldName = 'RSFEETYPE'
        Footers = <>
        Title.Caption = #35745#20215#26041#24335
        Width = 123
      end
      item
        EditButtons = <>
        FieldName = 'RSDZPRICE'
        Footers = <>
        Title.Caption = #28857#38047#20215
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'RSPZPRICE'
        Footers = <>
        Title.Caption = #25490#38047#20215
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'RSDJPRICE'
        Footers = <>
        Title.Caption = #28857#21152#20215
      end
      item
        EditButtons = <>
        FieldName = 'RSPJPRICE'
        Footers = <>
        Title.Caption = #25490#21152#20215
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'RSBL'
        Footers = <>
        Title.Caption = #25552#25104#27604#20363
        Width = 108
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 907
    Height = 41
    Align = alTop
    TabOrder = 1
    object RzDBNavigator1: TRzDBNavigator
      Left = 1
      Top = 1
      Width = 905
      Height = 39
      ButtonVisualStyle = vsGradient
      DataSource = ds_reportkind_setting
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 907
    Height = 87
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 12
      Top = 12
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #25253#34920#31867#21035
    end
    object Label1: TLabel
      Left = 312
      Top = 12
      Width = 70
      Height = 13
      AutoSize = False
      Caption = #35745#20215#26041#24335#65306
    end
    object Label3: TLabel
      Left = 12
      Top = 36
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #28857#38047#20215
    end
    object Label4: TLabel
      Left = 176
      Top = 36
      Width = 53
      Height = 13
      AutoSize = False
      Caption = #25490#38047#20215
    end
    object Label5: TLabel
      Left = 316
      Top = 36
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #28857#21152#20215
    end
    object Label6: TLabel
      Left = 480
      Top = 36
      Width = 53
      Height = 13
      AutoSize = False
      Caption = #25490#21152#20215
    end
    object Label7: TLabel
      Left = 12
      Top = 64
      Width = 53
      Height = 13
      AutoSize = False
      Caption = #25552#25104#27604#20363
    end
    object Label8: TLabel
      Left = 157
      Top = 62
      Width = 17
      Height = 13
      AutoSize = False
      Caption = '%'
    end
    object Label9: TLabel
      Left = 312
      Top = 60
      Width = 77
      Height = 13
      AutoSize = False
      Caption = #25253#34920#26174#31034#24207#21495
    end
    object RzDBComboBox2: TRzDBComboBox
      Left = 388
      Top = 8
      Width = 213
      Height = 20
      DataField = 'RSFEETYPE'
      DataSource = ds_reportkind_setting
      AllowEdit = False
      ItemHeight = 12
      TabOrder = 0
      Items.Strings = (
        #25353#38047#25968
        #25353#27604#20363)
    end
    object RzDBLookupComboBox1: TRzDBLookupComboBox
      Left = 88
      Top = 8
      Width = 205
      Height = 20
      DataField = 'RSREPORTKIND'
      DataSource = ds_reportkind_setting
      KeyField = 'REPORTKIND'
      ListField = 'REPORTKIND'
      ListSource = ds_reportkind
      TabOrder = 1
    end
    object RzDBNumericEdit1: TRzDBNumericEdit
      Left = 88
      Top = 32
      Width = 81
      Height = 20
      DataSource = ds_reportkind_setting
      DataField = 'RSDZPRICE'
      Alignment = taLeftJustify
      TabOrder = 2
      IntegersOnly = False
      DisplayFormat = '0.##'
    end
    object RzDBNumericEdit2: TRzDBNumericEdit
      Left = 216
      Top = 32
      Width = 77
      Height = 20
      DataSource = ds_reportkind_setting
      DataField = 'RSPZPRICE'
      Alignment = taLeftJustify
      TabOrder = 3
      IntegersOnly = False
      DisplayFormat = '0.##'
    end
    object RzDBNumericEdit3: TRzDBNumericEdit
      Left = 524
      Top = 32
      Width = 77
      Height = 20
      DataSource = ds_reportkind_setting
      DataField = 'RSPJPRICE'
      Alignment = taLeftJustify
      TabOrder = 4
      IntegersOnly = False
      DisplayFormat = '0.##'
    end
    object RzDBNumericEdit4: TRzDBNumericEdit
      Left = 388
      Top = 32
      Width = 85
      Height = 20
      DataSource = ds_reportkind_setting
      DataField = 'RSDJPRICE'
      Alignment = taLeftJustify
      TabOrder = 5
      IntegersOnly = False
      DisplayFormat = '0.##'
    end
    object RzDBNumericEdit5: TRzDBNumericEdit
      Left = 88
      Top = 60
      Width = 65
      Height = 20
      DataSource = ds_reportkind_setting
      DataField = 'RSBL'
      Alignment = taLeftJustify
      TabOrder = 6
      IntegersOnly = False
      DisplayFormat = '0.##'
    end
    object RzDBNumericEdit6: TRzDBNumericEdit
      Left = 388
      Top = 56
      Width = 85
      Height = 20
      DataSource = ds_reportkind_setting
      DataField = 'RSNUM'
      Alignment = taLeftJustify
      TabOrder = 7
      DisplayFormat = ',0;(,0)'
    end
  end
  object ds_reportkind: TDataSource
    AutoEdit = False
    DataSet = qry_reportkind
    Left = 833
    Top = 48
  end
  object qry_reportkind: TZQuery
    Connection = mainfrm.conn
    SQL.Strings = (
      
        'select distinct REPORTKIND from tb_base_serviceitem order by SNU' +
        'M')
    Params = <>
    Left = 865
    Top = 48
  end
  object qry_ds_reportkind_setting: TZQuery
    Connection = mainfrm.conn
    BeforePost = qry_ds_reportkind_settingBeforePost
    SQL.Strings = (
      'select * from tb_reportkind_setting')
    Params = <>
    Left = 865
    Top = 92
  end
  object ds_reportkind_setting: TDataSource
    DataSet = qry_ds_reportkind_setting
    Left = 829
    Top = 92
  end
end
