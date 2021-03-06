unit ReportUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, Mask, RzEdit,comObj,DateUtils,ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBGridEhGrouping, DB, GridsEh, DBGridEh,
  DBCtrlsEh, RzPrgres;

type
  TReportFrm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    r5: TRzGroupBox;
    r5_bt: TRzBitBtn;
    r6: TRzGroupBox;
    r6_bt: TRzBitBtn;
    RzBitBtn7: TRzBitBtn;
    Label10: TLabel;
    r5_year_cmb: TComboBox;
    Label11: TLabel;
    r5_month: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    r6_year_cmb: TComboBox;
    Label14: TLabel;
    r6_month: TComboBox;
    Label15: TLabel;
    RzGroupBox4: TRzGroupBox;
    Label2: TLabel;
    date_begin: TDBDateTimeEditEh;
    Label16: TLabel;
    date_end: TDBDateTimeEditEh;
    r1_bt: TRzBitBtn;
    r2_bt: TRzBitBtn;
    r4: TRzGroupBox;
    Label9: TLabel;
    js_cmb: TComboBox;
    r4_bt: TRzBitBtn;
    Label1: TLabel;
    r4_year_cmb: TComboBox;
    r4_month: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    RzGroupBox2: TRzGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    r3_bt: TRzBitBtn;
    r3_year_cmb: TComboBox;
    r3_month: TComboBox;
    rzbtbtn_tj: TRzBitBtn;
    pbar: TRzProgressBar;
    procedure RzBitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure r1_btClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rzbtbtn_tjClick(Sender: TObject);
    //现金报表行数据
    function getR1data(ReportKind,strState:string):string;
    procedure r2_btClick(Sender: TObject);
    procedure r3_btClick(Sender: TObject);
    procedure r4_btClick(Sender: TObject);
    procedure r5_btClick(Sender: TObject);
    procedure r6_btClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  ReportFrm: TReportFrm;

implementation

uses commUnt, mainUnt, tj_grid_unt, report1_thd_unt, report2_thd_unt,
  report3_thd_unt, report4_thd_unt, report5_thd_unt, report6_thd_unt;

{$R *.dfm}

procedure TReportFrm.RzBitBtn7Click(Sender: TObject);
begin
  close;
end;

procedure TReportFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action := cafree;
end;

procedure TReportFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if integer(Key)=27 then
   close;
end;

procedure TReportFrm.r1_btClick(Sender: TObject);
var 
  th:report1_thd;
begin
  th:=report1_thd.Create(true);
  th.frm:=self;
  th.Resume;
end;

procedure TReportFrm.FormCreate(Sender: TObject);
var
 qry:Tzquery;
begin
date_begin.Value:=now();
date_end.Value:=now();

qry:=Tzquery.Create(nil);
qry.Connection:=mainfrm.conn;
qry.SQL.Add('select * from TB_EMPLOYEE order by ENUM');
qry.Open;
js_cmb.Clear;

while(not qry.Eof) do
  begin
    js_cmb.Items.Add(qry.fieldbyname('ENUM').AsString+' '+qry.fieldbyname('ENAME').AsString);
    qry.Next;
  end;
qry.Close;
qry.Free;

r4_month.ItemIndex:=monthof(now())-1;
r5_month.ItemIndex:=monthof(now())-1;
r6_month.ItemIndex:=monthof(now())-1;

end;

function TReportFrm.getR1data(ReportKind,strState:string):string;
var
  ret_str:string;
  sqlstr:string;
  scount:real;
begin
 ret_str:='';
 {sqlstr := 'select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                          +'(select OID from TB_ORDER where OSTATE='''+strState+''' and (OSPAYTYPE='''+paytype+''' or OSPAYTYPE1='''+paytype+''') and ODATE>='''+date_begin.Text
                                          +''' and ODATE<='''+date_end.Text+''')'
                                          +' and  SID in (select SID from TB_BASE_SERVICEITEM where SCODE in ( select SCODE from TB_BASE_SERVICEITEM where REPORTKIND in('+ReportKind+')) ) ';
 }
 
 sqlstr := 'select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                          +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+date_begin.Text
                                          +''' and ODATE<='''+date_end.Text+''')'
                                          +' and  SID in (select SID from TB_BASE_SERVICEITEM where SCODE in ( select SCODE from TB_BASE_SERVICEITEM where REPORTKIND in('+ReportKind+')) ) ';

 scount:=getCount(sqlstr);
 ret_str := floattostr(scount);
 result:= ret_str;
end;


procedure TReportFrm.rzbtbtn_tjClick(Sender: TObject);
var
   frm:Ttj_grid_frm;
begin
   frm:= Ttj_grid_frm.Create(self);
   frm.ShowModal;
   frm.Free;
end;

procedure TReportFrm.r2_btClick(Sender: TObject);
var 
  th:report2_thd;
begin
  th:=report2_thd.Create(true);
  th.frm:=self;
  th.Resume;

end;

procedure TReportFrm.r3_btClick(Sender: TObject);
var 
  th:report3_thd;
begin
  th:=report3_thd.Create(true);
  th.frm:=self;
  th.Resume;

end;

procedure TReportFrm.r4_btClick(Sender: TObject);
var 
  th:report4_thd;
begin
  th:=report4_thd.Create(true);
  th.frm:=self;
  th.Resume;

end;

procedure TReportFrm.r5_btClick(Sender: TObject);
var 
  th:report5_thd;
begin
  th:=report5_thd.Create(true);
  th.frm:=self;
  th.Resume;

end;

procedure TReportFrm.r6_btClick(Sender: TObject);
var 
  th:report6_thd;
begin
  th:=report6_thd.Create(true);
  th.frm:=self;
  th.Resume;

end;

end.
