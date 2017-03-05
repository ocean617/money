unit serviceReportKindSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, RzDBNav,
  StdCtrls, RzCmboBx, RzDBCmbo, Mask, RzEdit, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RzDBEdit;

type
  TfrmServiceReportKindSettings = class(TForm)
    grid: TDBGridEh;
    Panel1: TPanel;
    Panel2: TPanel;
    RzDBNavigator1: TRzDBNavigator;
    Label2: TLabel;
    RzDBComboBox2: TRzDBComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    ds_reportkind: TDataSource;
    qry_reportkind: TZQuery;
    qry_ds_reportkind_setting: TZQuery;
    ds_reportkind_setting: TDataSource;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    RzDBNumericEdit4: TRzDBNumericEdit;
    RzDBNumericEdit5: TRzDBNumericEdit;
    Label8: TLabel;
    Label9: TLabel;
    RzDBNumericEdit6: TRzDBNumericEdit;
    procedure FormCreate(Sender: TObject);
    procedure qry_ds_reportkind_settingBeforePost(DataSet: TDataSet);
    procedure gridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServiceReportKindSettings: TfrmServiceReportKindSettings;

implementation

uses mainUnt, commUnt;

{$R *.dfm}

procedure TfrmServiceReportKindSettings.FormCreate(Sender: TObject);
begin
  if not qry_reportkind.Active then
    qry_reportkind.Open;

  if not qry_ds_reportkind_setting.Active then
    qry_ds_reportkind_setting.Open;
    
end;

procedure TfrmServiceReportKindSettings.qry_ds_reportkind_settingBeforePost(
  DataSet: TDataSet);

begin
if qry_ds_reportkind_setting.Active then
   qry_ds_reportkind_setting.FieldByName('RSID').AsString:=CreateNewId();
  
end;

procedure TfrmServiceReportKindSettings.gridTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
sortstring:string; //≈≈–Ú¡–
begin
//Ω¯––≈≈–Ú
with Column do
begin
if FieldName = '' then
  Exit;

case Title.SortMarker of
  smNoneEh:
  begin
      Title.SortMarker := smUpEh;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stAscending;
  end;
  smDownEh:
  begin
      Title.SortMarker := smUpEh; 
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stAscending;
  end;
  smUpEh:
  begin
     Title.SortMarker := smDownEh;
     ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
     ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stDescending;
  end;

end;
end;
end;

end.
