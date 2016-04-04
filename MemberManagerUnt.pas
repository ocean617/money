unit MemberManagerUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, Buttons, RzButton, GridsEh, DBGridEh,
  ExtCtrls, RzPanel, StdCtrls, pngimage, se_image, RzBckgnd, RzTabs, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask, DBCtrlsEh,StrUtils,Comobj,
  RzEdit;

type
  TMemberManagerFrm = class(TForm)
    bg: TRzBackground;
    seImage1: TseImage;
    Label1: TLabel;
    stxt: TStaticText;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    TabSheet5: TRzTabSheet;
    RzPanel1: TRzPanel;
    member_addbt: TRzToolbarButton;
    member_delbt: TRzToolbarButton;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    grid: TDBGridEh;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    DBGridEh4: TDBGridEh;
    RzToolbarButton3: TRzToolbarButton;
    RzToolbarButton4: TRzToolbarButton;
    zquery_members: TZQuery;
    ds_members: TDataSource;
    member_edt_bt: TRzToolbarButton;
    cz_ds: TDataSource;
    cz_qy: TZQuery;
    xh_ds: TDataSource;
    xh_qy: TZQuery;
    Label2: TLabel;
    mname_qry: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    RzBitBtn1: TRzBitBtn;
    Label5: TLabel;
    logname: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    RzBitBtn2: TRzBitBtn;
    Label8: TLabel;
    RzBitBtn3: TRzBitBtn;
    Label10: TLabel;
    RzBitBtn4: TRzBitBtn;
    cztj_qy: TZQuery;
    cztj_ds: TDataSource;
    xhtj_qy: TZQuery;
    xhtj_ds: TDataSource;
    expert_bt: TRzToolbarButton;
    del_bt: TRzBitBtn;
    Label12: TLabel;
    qry_uname: TEdit;
    Label13: TLabel;
    qry_mnum: TEdit;
    RzBitBtn5: TRzBitBtn;
    memoBt: TRzBitBtn;
    sdate: TDBDateTimeEditEh;
    edate: TDBDateTimeEditEh;
    sdate1: TDBDateTimeEditEh;
    edate1: TDBDateTimeEditEh;
    umoney_bt: TRzBitBtn;
    Label14: TLabel;
    mtype_cmb: TComboBox;
    sdate2: TDBDateTimeEditEh;
    edate2: TDBDateTimeEditEh;
    Label9: TLabel;
    sdate3: TDBDateTimeEditEh;
    Label11: TLabel;
    edate3: TDBDateTimeEditEh;
    cz_export_bt: TRzToolbarButton;
    xh_export_bt: TRzToolbarButton;
    cztj_export_bt: TRzToolbarButton;
    xhtj_export_bt: TRzToolbarButton;
    RzBitBtn6: TRzBitBtn;
    RzBitBtn7: TRzBitBtn;
    limit_date_edt: TRzDateTimeEdit;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure member_addbtClick(Sender: TObject);
    procedure member_delbtClick(Sender: TObject);
    procedure member_edt_btClick(Sender: TObject);
    procedure RzToolbarButton3Click(Sender: TObject);
    procedure RzToolbarButton4Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure gridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure expert_btClick(Sender: TObject);
    procedure del_btClick(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure memoBtClick(Sender: TObject);
    procedure umoney_btClick(Sender: TObject);
    procedure cz_export_btClick(Sender: TObject);
    procedure xh_export_btClick(Sender: TObject);
    procedure cztj_export_btClick(Sender: TObject);
    procedure xhtj_export_btClick(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure RzBitBtn7Click(Sender: TObject);
  private
    wheresql:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberManagerFrm: TMemberManagerFrm;

implementation

uses commUnt, mainUnt, personAddMembers, personAddMoney, MemberAddMoneyUnt,
  MemberPayUpdateUnt, changePayRecord;

{$R *.dfm}

procedure TMemberManagerFrm.FormCreate(Sender: TObject);
begin
 wheresql:='';

if mainfrm.user_type='总经理' then
 begin
  member_delbt.Show;
  RzToolbarButton4.Show;
  del_bt.Show;
  memobt.Show;
  umoney_bt.Show;
  RzBitBtn7.Show;
 end
else
 begin
  member_delbt.Hide;
  RzToolbarButton4.Hide;
  del_bt.Hide;
  memobt.Hide;
  umoney_bt.Hide;
  RzBitBtn7.Hide;
 end;

 //openqy(zquery_members,'select * from TB_MEMBERS order by MCSHOWID');
 //openqy(cz_qy,'select * from TB_MEMBER_ADDMONEY order by MCSHOWID,UDATE');
 //openqy(xh_qy,'select TB_ORDER.ONUM,TB_MEMBER_PAYLOG.* from TB_MEMBER_PAYLOG left join TB_ORDER on TB_ORDER.OID=TB_MEMBER_PAYLOG.OID order by TB_MEMBER_PAYLOG.MCSHOWID,TB_MEMBER_PAYLOG.MDATE');
 //openqy(cztj_qy,'select MNAME,MCSHOWID,round(sum(UTOTAL),2) UTOTAL from TB_MEMBER_ADDMONEY group by MNAME');
 //openqy(xhtj_qy,'select MNAME,MCSHOWID,round(sum(MPAYCOUNT),2) MPAYCOUNT from TB_MEMBER_PAYLOG group by MNAME');
end;

procedure TMemberManagerFrm.member_addbtClick(Sender: TObject);
var
 frm_person_membersAdd:Tfrm_person_membersAdd;
begin
 frm_person_membersAdd:=Tfrm_person_membersAdd.Create(self);
 frm_person_membersAdd.add;
 frm_person_membersAdd.qry.FieldByName('MMONEY').AsFloat:=0.0;
 frm_person_membersAdd.ShowModal;
 frm_person_membersAdd.Free;
 openqy(zquery_members,'select * from TB_MEMBERS');
end;

procedure TMemberManagerFrm.member_delbtClick(Sender: TObject);
begin
if (messagebox(0,'是否确认删除数据？','提示',mb_yesno+mb_iconquestion)=id_no) then exit;

 exeSql('delete from TB_MEMBERS where MID='''+zquery_members.fieldbyname('MID').AsString+'''');
 openqy(zquery_members,'select * from TB_MEMBERS');
end;

procedure TMemberManagerFrm.member_edt_btClick(Sender: TObject);
var
 frm_person_membersAdd:Tfrm_person_membersAdd;
begin
 if ((mainfrm.user_type<>'管理员') and (mainfrm.user_type<>'总经理')) then
 begin
    ShowMessage('您没有这个权限');
    exit;
 end;

 if zquery_members.IsEmpty then exit;
 
 frm_person_membersAdd:=Tfrm_person_membersAdd.Create(self);
 frm_person_membersAdd.id:= zquery_members.fieldbyname('MID').AsString;
 frm_person_membersAdd.edit;
 frm_person_membersAdd.ShowModal;
 frm_person_membersAdd.Free;
 
 openqy(zquery_members,'select * from TB_MEMBERS');
end;

procedure TMemberManagerFrm.RzToolbarButton3Click(Sender: TObject);
var
 MemberAddMoneyFrm:TMemberAddMoneyFrm;
begin
 MemberAddMoneyFrm:=TMemberAddMoneyFrm.Create(self);
 MemberAddMoneyFrm.Show;
end;

procedure TMemberManagerFrm.RzToolbarButton4Click(Sender: TObject);
begin
if (messagebox(0,'是否确认删除数据？','提示',mb_yesno+mb_iconquestion)=id_no) then exit;

 exeSql('delete from TB_MEMBER_ADDMONEY where AID='''+cz_qy.fieldbyname('AID').AsString+'''');
 openqy(cz_qy,'select * from TB_MEMBER_ADDMONEY');
end;

procedure TMemberManagerFrm.RzBitBtn1Click(Sender: TObject);
var
 sql:string;
begin
 sql:= 'select * from TB_MEMBER_ADDMONEY where 1=1 ';
 if length(trim(mname_qry.Text))>0 then
   sql := sql +' and MCSHOWID like ''%'+trim(mname_qry.Text)+'%''';
 if length(trim(AnsireplaceStr(AnsireplaceStr(sdate.Text,'-',''),':','')))>0 then
   sql := sql +' and UDATE >= '''+trim(sdate.Text)+'''';
 if length(trim(AnsireplaceStr(AnsireplaceStr(edate.Text,'-',''),':','')))>0 then
   sql := sql +' and UDATE <= '''+trim(edate.Text)+'''';
 if mtype_cmb.itemindex>0 then
   sql := sql +' and MTYPE='''+mtype_cmb.text+'''';

sql:= sql+' order by MCSHOWID,UDATE';
openqy(cz_qy,sql);

end;

procedure TMemberManagerFrm.RzBitBtn2Click(Sender: TObject);
var
 sql:string;
begin
// sql:= 'select TB_ORDER.ONUM,TB_MEMBER_PAYLOG.* from TB_MEMBER_PAYLOG,TB_ORDER where 1=1 ';
sql:='select TB_ORDER.ONUM,TB_MEMBER_PAYLOG.* from TB_MEMBER_PAYLOG join TB_ORDER on TB_ORDER.OID=TB_MEMBER_PAYLOG.OID where 1=1  ';
 if length(trim(logname.Text))>0 then
   sql := sql +' and TB_MEMBER_PAYLOG.MCSHOWID = "'+trim(logname.Text)+'" ';
 if length(trim(AnsireplaceStr(AnsireplaceStr(sdate1.Text,'-',''),':','')))>0 then
   sql := sql +' and MDATE >= '''+trim(sdate1.Text)+'''';
 if length(trim(AnsireplaceStr(AnsireplaceStr(edate1.Text,'-',''),':','')))>0 then
   sql := sql +' and TB_MEMBER_PAYLOG.MDATE <= '''+trim(edate1.Text)+'''';
 sql := sql+'  order by TB_MEMBER_PAYLOG.MCSHOWID,TB_MEMBER_PAYLOG.MDATE';

openqy(xh_qy,sql);

end;

procedure TMemberManagerFrm.RzBitBtn3Click(Sender: TObject);
var
 sql:string;
begin
 sql:= 'select MNAME,MCSHOWID,round(sum(UTOTAL),2) UTOTAL from TB_MEMBER_ADDMONEY where 1=1 ';
 if length(trim(AnsireplaceStr(AnsireplaceStr(sdate2.Text,'-',''),':','')))>0 then
   sql := sql +' and UDATE >= '''+trim(sdate2.Text)+'''';
   
 if length(trim(AnsireplaceStr(AnsireplaceStr(edate2.Text,'-',''),':','')))>0 then
   sql := sql +' and UDATE <= '''+trim(edate2.Text)+'''';

openqy(cztj_qy,sql + ' group by MNAME order by UTOTAL DESC ');

end;

procedure TMemberManagerFrm.RzBitBtn4Click(Sender: TObject);
var
 sql:string;
begin
 sql:= 'select MNAME,MCSHOWID,round(sum(MPAYCOUNT),2) MPAYCOUNT from TB_MEMBER_PAYLOG where OID in (select OID from TB_ORDER) and 1=1 ';

 if length(trim(AnsireplaceStr(AnsireplaceStr(sdate3.Text,'-',''),':','')))>0 then
   sql := sql +' and MDATE >= '''+trim(sdate3.Text)+'''';
   
 if length(trim(AnsireplaceStr(AnsireplaceStr(edate3.Text,'-',''),':','')))>0 then
   sql := sql +' and MDATE <= '''+trim(edate3.Text)+'''';
   
openqy(xhtj_qy,sql + ' group by MCSHOWID,MNAME order by MPAYCOUNT DESC ');
end;

procedure TMemberManagerFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action := cafree;
end;

procedure TMemberManagerFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if integer(Key)=27 then
   close;
end;

procedure TMemberManagerFrm.gridTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
sortstring:string; //排序列
begin
//进行排序
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

procedure TMemberManagerFrm.expert_btClick(Sender: TObject);
 var
 fileId,sfilename,tfilename:string;
 excel,Sheet:variant;
 i:integer;
begin
 if not zquery_members.Active then exit;
 if zquery_members.RecordCount=0 then exit;
 
 fileId:=CreateNewId;
 sfilename:=extractFilepath(application.exename)+'report\template\member.xls';
 tfilename:=extractFilepath(application.exename)+'report\reportfiles\member\'+FileId+'.xls';
 copyfile(pchar(sfilename),pchar(tfilename),false);

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//是否显示
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];

    i:=2;
    zquery_members.First;
    while(not zquery_members.Eof) do
      begin
        Sheet.Cells[i,1] := zquery_members.FieldByName('MCID').AsString;
        Sheet.Cells[i,2] := zquery_members.FieldByName('MCSHOWID').AsString;
        Sheet.Cells[i,3] := zquery_members.FieldByName('MNAME').AsString;
        Sheet.Cells[i,4] := zquery_members.FieldByName('MGENDER').AsString;
        Sheet.Cells[i,5] := zquery_members.FieldByName('MPHONE').AsString;
        Sheet.Cells[i,6] := zquery_members.FieldByName('MBIRTHDAY').AsString;
        Sheet.Cells[i,7] := zquery_members.FieldByName('MDATE').AsString;
        Sheet.Cells[i,8] := zquery_members.FieldByName('MMONEY').AsString;
        Sheet.Cells[i,9] := zquery_members.FieldByName('UNAME').AsString;
        
        inc(i);
        zquery_members.Next;
      end;
      
  except
    Showmessage('初始化Excel失败，可能没有安装Excel，请安装Excel后进行报表输出。');
    excel.DisplayAlerts := false;//是否提示存盘
    excel.Quit;//如果出错则退出
    //exit;
  end;
end;

procedure TMemberManagerFrm.del_btClick(Sender: TObject);
begin
try
  exeSql('delete from TB_MEMBER_PAYLOG where PID='''+xh_qy.fieldbyname('PID').AsString+'''');
  RzBitBtn2.Click;
except
end;

end;

procedure TMemberManagerFrm.RzBitBtn5Click(Sender: TObject);
var
  sql:string;
begin
 sql:= 'select * from TB_MEMBERS where 1=1 ';
 wheresql:='';
 
 if length(trim(qry_uname.Text))>0 then
   begin
      sql := sql +' and MCSHOWID like ''%'+trim(qry_uname.Text)+'%''';
      wheresql:= wheresql +' and MCSHOWID like ''%'+trim(qry_uname.Text)+'%''';
   end;

 if length(trim(qry_mnum.Text))>0 then
   begin
      sql := sql +' and MPHONE like ''%'+trim(qry_mnum.Text)+'%''';
      wheresql:= wheresql + ' and MPHONE like ''%'+trim(qry_mnum.Text)+'%''';
   end;

   openqy(zquery_members,sql);
end;

procedure TMemberManagerFrm.memoBtClick(Sender: TObject);
var
 m:string;
 MemberPayUpdateFrm:TMemberPayUpdateFrm;
begin
if cz_qy.Active then
  if cz_qy.RecordCount>0 then
    begin
      MemberPayUpdateFrm:=tMemberPayUpdateFrm.Create(self);
      MemberPayUpdateFrm.udate.Value:=  cz_qy.FieldByName('UDATE').AsDateTime;
      MemberPayUpdateFrm.umemo.Text:=  cz_qy.FieldByName('UMEMO').AsString;
      
      if MemberPayUpdateFrm.ShowModal=mrok then
        begin
           cz_qy.Edit;
           cz_qy.FieldByName('UDATE').AsString:=MemberPayUpdateFrm.udate.Text;
           cz_qy.FieldByName('UMEMO').AsString:=MemberPayUpdateFrm.umemo.Text;
           cz_qy.Post;

        end;
     MemberPayUpdateFrm.Free;   
    end;

end;

procedure TMemberManagerFrm.umoney_btClick(Sender: TObject);
var
 pid:string;
 frm_changePay:Tfrm_changePay;
begin
 pid:='0';
 if (xh_qy.Active) then
    pid:= xh_qy.fieldbyname('PID').AsString
 else
    begin
      ShowMessage('请先进行查询.');
      exit;
    end;
    
 frm_changePay:= Tfrm_changePay.Create(Self);
 frm_changePay.edit1.Text:= xh_qy.fieldbyname('MPAYCOUNT').AsString;
 frm_changePay.edit2.Text:= xh_qy.fieldbyname('MBALANCE').AsString;
 frm_changePay.PID:=pid;

 frm_changePay.ShowModal;
 frm_changePay.Free;
 xh_qy.Close;
 xh_qy.Open;

 if (xh_qy.Active) then
    xh_qy.Locate('PID',pid,[loCaseInsensitive ,loPartialKey]);
    
end;

procedure TMemberManagerFrm.cz_export_btClick(Sender: TObject);
 var
 fileId,sfilename,tfilename:string;
 excel,Sheet:variant;
 i:integer;
begin
 if not cz_qy.Active then exit;
 if cz_qy.RecordCount=0 then exit;
 
 fileId:=CreateNewId;
 sfilename:=extractFilepath(application.exename)+'report\template\member_czjl.xls';
 tfilename:=extractFilepath(application.exename)+'report\reportfiles\member\'+FileId+'.xls';
 copyfile(pchar(sfilename),pchar(tfilename),false);

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//是否显示
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];

    i:=2;
    cz_qy.First;
    while(not cz_qy.Eof) do
      begin
        Sheet.Cells[i,1] := cz_qy.FieldByName('MNAME').AsString;
        Sheet.Cells[i,2] := cz_qy.FieldByName('MCSHOWID').AsString;
        Sheet.Cells[i,3] := cz_qy.FieldByName('MCID').AsString;
        Sheet.Cells[i,4] := cz_qy.FieldByName('UTOTAL').AsString;
        Sheet.Cells[i,5] := cz_qy.FieldByName('UDATE').AsString;
        Sheet.Cells[i,6] := cz_qy.FieldByName('MTYPE').AsString;
        Sheet.Cells[i,7] := cz_qy.FieldByName('UNAME').AsString;
        Sheet.Cells[i,8] := cz_qy.FieldByName('UMEMO').AsString;
        
        inc(i);
        cz_qy.Next;
      end;
      
  except
    Showmessage('初始化Excel失败，可能没有安装Excel，请安装Excel后进行报表输出。');
    excel.DisplayAlerts := false;//是否提示存盘
    excel.Quit;//如果出错则退出
    //exit;
  end;
end;

procedure TMemberManagerFrm.xh_export_btClick(Sender: TObject);
 var
 fileId,sfilename,tfilename:string;
 excel,Sheet:variant;
 i:integer;
begin
 if not xh_qy.Active then exit;
 if xh_qy.RecordCount=0 then exit;
 
 fileId:=CreateNewId;
 sfilename:=extractFilepath(application.exename)+'report\template\member_xhjl.xls';
 tfilename:=extractFilepath(application.exename)+'report\reportfiles\member\'+FileId+'.xls';
 copyfile(pchar(sfilename),pchar(tfilename),false);

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//是否显示
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];

    i:=2;
    xh_qy.First;
    while(not xh_qy.Eof) do
      begin
        Sheet.Cells[i,1] := xh_qy.FieldByName('MNAME').AsString;
        Sheet.Cells[i,2] := xh_qy.FieldByName('MCSHOWID').AsString;
        Sheet.Cells[i,3] := xh_qy.FieldByName('MCID').AsString;
        Sheet.Cells[i,4] := xh_qy.FieldByName('MDATE').AsString;
        Sheet.Cells[i,5] := xh_qy.FieldByName('MPAYCOUNT').AsString;
        Sheet.Cells[i,6] := xh_qy.FieldByName('MBALANCE').AsString;
        Sheet.Cells[i,7] := xh_qy.FieldByName('ONUM').AsString;
        
        inc(i);
        xh_qy.Next;
      end;
      
  except
    Showmessage('初始化Excel失败，可能没有安装Excel，请安装Excel后进行报表输出。');
    excel.DisplayAlerts := false;//是否提示存盘
    excel.Quit;//如果出错则退出
    //exit;
  end;
end;

procedure TMemberManagerFrm.cztj_export_btClick(Sender: TObject);
 var
 fileId,sfilename,tfilename:string;
 excel,Sheet:variant;
 i:integer;
begin
 if not cztj_qy.Active then exit;
 if cztj_qy.RecordCount=0 then exit;

 fileId:=CreateNewId;
 sfilename:=extractFilepath(application.exename)+'report\template\member_cztj.xls';
 tfilename:=extractFilepath(application.exename)+'report\reportfiles\member\'+FileId+'.xls';
 copyfile(pchar(sfilename),pchar(tfilename),false);

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//是否显示
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];

    i:=2;
    cztj_qy.First;
    while(not cztj_qy.Eof) do
      begin
        Sheet.Cells[i,1] := cztj_qy.FieldByName('MNAME').AsString;
        Sheet.Cells[i,2] := cztj_qy.FieldByName('MCSHOWID').AsString;
        Sheet.Cells[i,3] := cztj_qy.FieldByName('UTOTAL').AsString;
        inc(i);
        cztj_qy.Next;
      end;
      
  except
    Showmessage('初始化Excel失败，可能没有安装Excel，请安装Excel后进行报表输出。');
    excel.DisplayAlerts := false;//是否提示存盘
    excel.Quit;//如果出错则退出
    //exit;
  end;
end;

procedure TMemberManagerFrm.xhtj_export_btClick(Sender: TObject);
 var
 fileId,sfilename,tfilename:string;
 excel,Sheet:variant;
 i:integer;
begin
 if not xhtj_qy.Active then exit;
 if xhtj_qy.RecordCount=0 then exit;

 fileId:=CreateNewId;
 sfilename:=extractFilepath(application.exename)+'report\template\member_xhtj.xls';
 tfilename:=extractFilepath(application.exename)+'report\reportfiles\member\'+FileId+'.xls';
 copyfile(pchar(sfilename),pchar(tfilename),false);

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//是否显示
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];

    i:=2;
    xhtj_qy.First;
    while(not xhtj_qy.Eof) do
      begin
        Sheet.Cells[i,1] := xhtj_qy.FieldByName('MNAME').AsString;
        Sheet.Cells[i,2] := xhtj_qy.FieldByName('MCSHOWID').AsString;
        Sheet.Cells[i,3] := xhtj_qy.FieldByName('MPAYCOUNT').AsString;
        inc(i);
        xhtj_qy.Next;
      end;
      
  except
    Showmessage('初始化Excel失败，可能没有安装Excel，请安装Excel后进行报表输出。');
    excel.DisplayAlerts := false;//是否提示存盘
    excel.Quit;//如果出错则退出
    //exit;
  end;
end;

procedure TMemberManagerFrm.RzBitBtn6Click(Sender: TObject);
var
 sql:string;
begin
// sql:= 'select TB_ORDER.ONUM,TB_MEMBER_PAYLOG.* from TB_MEMBER_PAYLOG,TB_ORDER where 1=1 ';
sql:='select TB_ORDER.ONUM,TB_MEMBER_PAYLOG.* from TB_MEMBER_PAYLOG left join TB_ORDER on TB_ORDER.OID=TB_MEMBER_PAYLOG.OID where 1=1  ';
 if length(trim(logname.Text))>0 then
   sql := sql +' and TB_MEMBER_PAYLOG.MCSHOWID = "'+trim(logname.Text)+'" ';
 if length(trim(AnsireplaceStr(AnsireplaceStr(sdate1.Text,'-',''),':','')))>0 then
   sql := sql +' and MDATE >= '''+trim(sdate1.Text)+'''';
 if length(trim(AnsireplaceStr(AnsireplaceStr(edate1.Text,'-',''),':','')))>0 then
   sql := sql +' and TB_MEMBER_PAYLOG.MDATE <= '''+trim(edate1.Text)+'''';
 sql := sql+'  order by TB_MEMBER_PAYLOG.MCSHOWID,TB_MEMBER_PAYLOG.MDATE';

openqy(xh_qy,sql);
end;

procedure TMemberManagerFrm.RzBitBtn7Click(Sender: TObject);
var
  sql:string;
begin
if (Length(limit_date_edt.Text)=0) then
  begin
    showmessage('请选择过期日期再进行操作');
    exit;
  end;
  
if (grid.DataSource.DataSet.Active = false) then
  begin
    showmessage('请设置条件进行会员查询');
    exit;
  end;
  
if(MessageBox(0,PChar('本操作是批量操作，如果点击直接操作将会将所有本次查询到的会员的过期日期修改为'+limit_date_edt.Text+'，是否确认?'),'提示',MB_YESNO+MB_ICONQUESTION	)=id_yes) then
 begin
  sql:='  update TB_MEMBERS set MGQDATE="'+limit_date_edt.Text+'" where 1=1 '+wheresql;
  exeSql(sql);
  RzBitBtn5.Click;
 end; 
end;

end.
