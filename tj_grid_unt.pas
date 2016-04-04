unit tj_grid_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, RzButton, DBGridEhGrouping,
  GridsEh, DBGridEh, ExtCtrls, RzPanel, StdCtrls, Mask, DBCtrlsEh, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,ComObj,shellapi;

type
  Ttj_grid_frm = class(TForm)
    rzpnl1: TRzPanel;
    dbgrdhgrid: TDBGridEh;
    lbl1: TLabel;
    date_begin: TDBDateTimeEditEh;
    lbl2: TLabel;
    date_end: TDBDateTimeEditEh;
    lbl3: TLabel;
    cbb_tj: TComboBox;
    rzbtbtn1: TRzBitBtn;
    zqry_user: TZQuery;
    ds_tj: TDataSource;
    rzbtbtn2: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    savedlg: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure rzbtbtn1Click(Sender: TObject);
    procedure rzbtbtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tj_grid_frm: Ttj_grid_frm;

implementation

uses mainUnt;

{$R *.dfm}

procedure Ttj_grid_frm.FormCreate(Sender: TObject);
var
 qry:Tzquery;
begin

date_begin.Value:=now();
date_end.Value:=now();

qry:=Tzquery.Create(nil);
qry.Connection:=mainfrm.conn;
qry.SQL.Add('select * from TB_EMPLOYEE order by ENUM');
qry.Open;
cbb_tj.clear;
cbb_tj.Items.Add('全部');

while(not qry.Eof) do
  begin
    cbb_tj.Items.Add(qry.fieldbyname('ENUM').AsString+' '+qry.fieldbyname('ENAME').AsString);
    qry.Next;
  end;
  
qry.Close;
qry.Free;

end;

procedure Ttj_grid_frm.rzbtbtn1Click(Sender: TObject);
var
 ZsCount:real;
 i,inc_m:integer;
 strState,enum,ename,sql:string;
begin
if mainfrm.user_type='收银员' then
  strState:='结单'
else
  strState:='核单';

if length(date_begin.Text)=0 then
  begin
   showmessage('请选择开始日期');
   exit;
  end;

if length(date_end.Text)=0 then
  begin
   showmessage('请选择结束日期');
   exit;
  end;

enum:='';
ename:='';
sql :='';

if (cbb_tj.ItemIndex>0) then
  begin
    enum:=trim(copy(cbb_tj.Text,0,pos(' ',cbb_tj.Text)));
    ename:=trim(copy(cbb_tj.Text,pos(' ',cbb_tj.Text),length(cbb_tj.Text)-pos('',cbb_tj.Text)));
    sql :='select TITEMNAME as ''项目'',sum(TITEMCOUNT) as ''数量'',TJENAME as ''推荐人'' from TB_ORDER_TJ where TJENAME="'+ename+'" and OID in (select OID from TB_ORDER where OSTATE="'+strState+'" and ODATE>="'+date_begin.Text+'" and ODATE<="'+date_end.Text+'") group by TITEMNAME,TJENAME order by TITEMCOUNT';
  end
else
  begin
    sql :='select TITEMNAME as ''项目'',sum(TITEMCOUNT) as ''数量'',TJENAME as ''推荐人'' from TB_ORDER_TJ where OID in (select OID from TB_ORDER where OSTATE="'+strState+'" and ODATE>="'+date_begin.Text+'" and ODATE<="'+date_end.Text+'") group by TITEMNAME,TJENAME order by TITEMCOUNT';
  end;

if zqry_user.Active then zqry_user.Close;
zqry_user.SQL.Clear;
zqry_user.SQL.Add(sql);
zqry_user.Open;

end;

procedure Ttj_grid_frm.rzbtbtn2Click(Sender: TObject);
var
 ZsCount:real;
 i,inc_m:integer;
 strState,enum,ename,sql:string;
begin
if mainfrm.user_type='收银员' then
  strState:='结单'
else
  strState:='核单';

if length(date_begin.Text)=0 then
  begin
   showmessage('请选择开始日期');
   exit;
  end;

if length(date_end.Text)=0 then
  begin
   showmessage('请选择结束日期');
   exit;
  end;

enum:='';
ename:='';
sql :='';

if (cbb_tj.ItemIndex>0) then
  begin
    enum:=trim(copy(cbb_tj.Text,0,pos(' ',cbb_tj.Text)));
    ename:=trim(copy(cbb_tj.Text,pos(' ',cbb_tj.Text),length(cbb_tj.Text)-pos('',cbb_tj.Text)));
    sql :='select TITEMNAME as ''项目'',sum(TITEMCOUNT) as ''数量'' from TB_ORDER_TJ where TJENAME="'+ename+'" and OID in (select OID from TB_ORDER where OSTATE="'+strState+'" and ODATE>="'+date_begin.Text+'" and ODATE<="'+date_end.Text+'") group by TITEMNAME order by TITEMCOUNT';
  end
else
  begin
    sql :='select TITEMNAME as ''项目'',sum(TITEMCOUNT) as ''数量'' from TB_ORDER_TJ where OID in (select OID from TB_ORDER where OSTATE="'+strState+'" and ODATE>="'+date_begin.Text+'" and ODATE<="'+date_end.Text+'") group by TITEMNAME order by TITEMCOUNT';
  end;

if zqry_user.Active then zqry_user.Close;
zqry_user.SQL.Clear;
zqry_user.SQL.Add(sql);
zqry_user.Open;

end;


procedure DBGridInFoToExcel(FileName, TitleCaption: string;  MakeDataSource: TDataSource; makeDBGrid: TDBGridEh);
var
xlApp, xlSheet, szValue: Variant;
ARow, iLoop: word;
begin
  xlApp := CreateOleObject('Excel.Application');
  try
    xlSheet := CreateOleObject('Excel.Sheet');
    xlSheet := xlApp.WorkBooks.Add;

//   表格标题
    for iLoop := 0 to makeDBGrid.Columns.Count - 1 do
      xlSheet.WorkSheets[1].Cells[1, iLoop + 1] := makeDBGrid.Columns[iLoop].Title.Caption;
      // 数据
      ARow := 2;
      with MakeDataSource.DataSet do
        begin
          DisableControls;
          First;
          while not Eof do
            begin
              for iLoop := 0 to Fields.Count - 1 do
                 begin
                   szValue := Fields[iLoop].Value;
                   xlSheet.WorkSheets[1].Cells[ARow, iLoop + 1] := szValue;
                 end;
                 inc(ARow);
                 Next;
             end;

         First;
         EnableControls;
    end;

    try
      	xlSheet.SaveAs(FileName);
    finally
        xlSheet.Close;
        xlApp.Quit;
        xlApp := UnAssigned;
    end;
  except
    Application.MessageBox('本机没有安装Excel.', '错误', MB_OK);
   end;

 end;

procedure Ttj_grid_frm.RzBitBtn1Click(Sender: TObject);
begin
if savedlg.Execute then
  begin
    DBGridInFoToExcel(savedlg.FileName, '推荐数据导出', ds_tj, dbgrdhgrid);
    ShellExecute(0,'open',pchar(savedlg.filename),nil,nil,SW_SHOWNORMAL);
  end;

end;

end.
