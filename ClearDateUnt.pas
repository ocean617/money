unit ClearDateUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzRadChk, StdCtrls, Mask, DBCtrlsEh, ExtCtrls,StrUtils;

type
  TclearDatafrm = class(TForm)
    RzCheckBox1: TRzCheckBox;
    RzCheckBox2: TRzCheckBox;
    RzCheckBox3: TRzCheckBox;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    sdate: TDBDateTimeEditEh;
    Label4: TLabel;
    edate: TDBDateTimeEditEh;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clearDatafrm: TclearDatafrm;

implementation

uses commUnt;

{$R *.dfm}

procedure TclearDatafrm.RzButton2Click(Sender: TObject);
begin
 close;
end;

procedure TclearDatafrm.RzButton1Click(Sender: TObject);
var
 s,sqlstr:string;
 delcount:real;
begin
if messagebox(0,'该操作将删除选定的数据，清空后将不可恢复！！请确认是否要删除？','提示',mb_iconquestion+mb_yesno)=id_yes then
   begin
    s:=AnsireplaceStr(sdate.Text,'-','');
    s:=trim(AnsireplaceStr(s,':',''));
    if length(s)=0 then
      begin
        showmessage('请选择开始时间.');
        exit;
      end;
      
    s:=AnsireplaceStr(edate.Text,'-','');
    s:=trim(AnsireplaceStr(s,':',''));
    if length(s)=0 then
      begin
        showmessage('请选择结束时间.');
        exit;
      end;
      
    if RzCheckBox1.Checked then
      begin
         delcount:=getCount('select count(*) as scount from TB_ORDER_SERVCEITEM where OID in ( select OID from TB_ORDER where ODATE >= '''+trim(sdate.Text)+''' and ODATE <='''+trim(edate.Text)+''')');
         sqlstr:= 'delete from TB_ORDER_SERVCEITEM where OID in ( select OID from TB_ORDER where ODATE >= '''+trim(sdate.Text)+''' and ODATE <='''+trim(edate.Text)+''')';
         exeSql(sqlstr);
         sqlstr:= 'delete from TB_ORDER_TJ where OID in ( select OID from TB_ORDER where ODATE >= '''+trim(sdate.Text)+''' and ODATE <='''+trim(edate.Text)+''')';
         exeSql(sqlstr);
         sqlstr:= 'delete from TB_ORDER where ODATE >= '''+trim(sdate.Text)+''' and ODATE <='''+trim(edate.Text)+'''';
         exeSql(sqlstr);
         sqlstr:= 'delete from TB_NUMS ';
         exeSql(sqlstr);
         messagebox(0,pchar(floattostr(delcount)+'条单据数据已经删除完成!'),'提示',mb_iconinformation);
      end;
      
     if RzCheckBox3.Checked then
       begin
         delcount:=getCount('select count(*) as scount from TB_MEMBER_ADDMONEY where UDATE >= '''+trim(sdate.Text)+''' and UDATE <='''+trim(edate.Text)+'''');
         sqlstr:= 'delete from TB_MEMBER_ADDMONEY where UDATE >= '''+trim(sdate.Text)+''' and UDATE <='''+trim(edate.Text)+'''';
         exeSql(sqlstr);
         messagebox(0,pchar(floattostr(delcount)+'条会员充值数据已经删除完成!'),'提示',mb_iconinformation);
       end;
         
     if RzCheckBox2.Checked then
       begin
         delcount:=getCount('select count(*) as scount from TB_MEMBER_PAYLOG where MDATE >= '''+trim(sdate.Text)+''' and MDATE <='''+trim(edate.Text)+'''');
         sqlstr:= 'delete from TB_MEMBER_PAYLOG where MDATE >= '''+trim(sdate.Text)+''' and MDATE <='''+trim(edate.Text)+'''';
         exeSql(sqlstr);
         messagebox(0,pchar(floattostr(delcount)+'会员消费数据已经删除完成!'),'提示',mb_iconinformation);
       end;
     

     
   end;
end;

end.
