unit MemberAddMoneyUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, RzPanel,DateUtils;

type
  TMemberAddMoneyFrm = class(TForm)
    czbt: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    qry: TZQuery;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cardId_edt: TEdit;
    status_edt: TEdit;
    smemo: TRzMemo;
    Label5: TLabel;
    mtype_cmb: TComboBox;
    num_edt: TEdit;
    Label6: TLabel;
    jf_edt: TEdit;
    Label7: TLabel;
    czjf_edt: TEdit;
    procedure cardId_edtKeyPress(Sender: TObject; var Key: Char);
    procedure czbtClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtype_cmbChange(Sender: TObject);
    procedure czjf_edtKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    mid,mname,mcid,mcshowid:string;
    //会员手机号
    phone:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberAddMoneyFrm: TMemberAddMoneyFrm;

implementation

uses commUnt, mainUnt;

{$R *.dfm}

procedure TMemberAddMoneyFrm.cardId_edtKeyPress(Sender: TObject;
  var Key: Char);
begin
if length(trim(cardId_edt.Text))=0 then exit;

if key=#13 then
  begin
     if qry.Active then qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add('select * from TB_MEMBERS where MCID='''+cardId_edt.Text+'''');
     qry.Open;
     if qry.IsEmpty then
       begin
           czbt.Enabled:=false;
           messagebox(0,'找不到该卡号对应的会员数据，请检查.','提示',mb_iconinformation);
           exit;
       end;
     status_edt.Text:= qry.fieldbyname('MMONEY').AsString;
     jf_edt.Text:=qry.fieldbyname('MJF').AsString;

     mid:= qry.fieldbyname('MID').AsString;
     mname:=qry.fieldbyname('MNAME').AsString;
     mcid:=qry.fieldbyname('MCID').AsString;
     mcshowid:=qry.fieldbyname('MCSHOWID').AsString;
     //记录电话号码
     phone := qry.fieldbyname('MPHONE').AsString;
     
     qry.Close;
     czbt.Enabled:=true; 
  end;
end;

procedure TMemberAddMoneyFrm.czbtClick(Sender: TObject);
var
 s:real;
 sql,sms,sms_result:string;
begin
 if qry.Active then qry.Close;
 sms_result:='';
 //发送短信
 sms :='尊敬的{会员姓名}会员，您于{充值时间}充值{充值金额}元，您的余额是{金额}元，感谢您的支持，欢迎下次光临！';
 sms := StringReplace(sms,'{会员姓名}',mname,[rfReplaceAll]);
 sms := StringReplace(sms,'{充值时间}',FormatdateTime('c',now),[rfReplaceAll]);
 sms := StringReplace(sms,' ','_',[rfReplaceAll]);

 if (mtype_cmb.Text='积分赠送') then
   begin
      try
        if (StrToInt(czjf_edt.Text)>StrToInt(jf_edt.Text)) then
           begin
             MessageBox(0,'积分不足,不能充值.','提示',MB_ICONINFORMATION);
             exit;
           end;
        smemo.Text := '积分:'+czjf_edt.Text;
      except
      end;
   end;
  
 try
   s:=strtofloat(num_edt.text);
 except
   begin
     Messagebox(0,'请输入数值.','提示',mb_iconerror);
     exit;
   end;
 end;

 if s>20000 then
   begin
     Messagebox(0,'每次充值数不能大于2万.','提示',mb_iconerror);
     exit;
   end;

 qry.SQL.Clear;
 qry.SQL.Add('select * from TB_MEMBER_ADDMONEY where 1=2');
 qry.Open;
 qry.Append;

 qry.FieldByName('AID').AsString:=createNewId();
 qry.FieldByName('MID').AsString:= mid;
 qry.FieldByName('MNAME').AsString:=mname;
 qry.FieldByName('MCID').AsString:=mcid;
 qry.FieldByName('MCSHOWID').AsString:=mcshowid;
 qry.FieldByName('UID').AsString:=mainfrm.user_id;
 qry.FieldByName('UNAME').AsString:=mainfrm.user_name;
 qry.FieldByName('UDATE').AsDateTime:=now();
 qry.FieldByName('UTOTAL').AsFloat:=s;
 qry.FieldByName('UMEMO').AsString:=smemo.Text;
 qry.FieldByName('MTYPE').AsString:=trim(mtype_cmb.Text);
 
 qry.Post;

 //更新会员余额表
 qry.Close;
 qry.SQL.Clear;
 qry.SQL.Add('update TB_MEMBERS set MMONEY = MMONEY+'+floattostr(s)+' where MID='''+mid+'''');
 qry.ExecSQL;

 //如果充值金额大于等于2000，2年，小于2000，1年
 if (s>=2000) then
   begin
     sql := 'update TB_MEMBERS set MGQDATE=DATE_ADD(now(),INTERVAL 2 YEAR) where MID='''+mid+'''';
   end
 else
     sql := 'update TB_MEMBERS set MGQDATE=DATE_ADD(now(),INTERVAL 1 YEAR) where MID='''+mid+'''';

 qry.SQL.Clear;
 qry.SQL.Add(sql);
 qry.ExecSQL;

 //更新积分额度
//如果是积分赠送，删除对应的积分
 if (mtype_cmb.Text='积分赠送') then
   begin
    sql := 'update TB_MEMBERS set MJF=MJF-'+czjf_edt.Text+' where MID='''+mid+'''';
    qry.SQL.Clear;
    qry.SQL.Add(sql);
    qry.ExecSQL;
  end;

 sms := StringReplace(sms,'{充值金额}',floattostr(s),[rfReplaceAll]);
 sms := StringReplace(sms,'{金额}',floattostr(getCount('select MMONEY as scount from TB_MEMBERS where MID='''+mid+'''')),[rfReplaceAll]);

 if(length(phone)>0) then
 begin
   if (mainfrm.sendsms(phone,sms)) then
      sms_result:='短信发送成功!'
   else
      sms_result:='短信发送失败!';
 end;

 messagebox(0,pchar('会员已经成功充值！'+sms_result),'提示',mb_iconinformation);
 cardId_edt.Clear;
 czbt.Enabled:=false;
 
end;

procedure TMemberAddMoneyFrm.RzBitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TMemberAddMoneyFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
try
  action:=cafree;
except
end;

end;

procedure TMemberAddMoneyFrm.mtype_cmbChange(Sender: TObject);
begin
if (mtype_cmb.Text='积分赠送') then
  begin
    Label7.Show;
    czjf_edt.Show;
    num_edt.ReadOnly:=true;
  end
else
  begin
    Label7.hide;
    czjf_edt.hide;
    num_edt.ReadOnly:=false;
  end;
end;

procedure TMemberAddMoneyFrm.czjf_edtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  jf:real;
  jf_sum:integer;
begin
if ((Length(jf_edt.Text)>0) and (Length(czjf_edt.Text)>0) ) then
  begin
    try
      begin
         jf:= strtofloat(jf_edt.Text);
         if(StrToFloat(czjf_edt.Text)>jf) then czjf_edt.Text:= jf_edt.Text;
         //金额换算,3000积分50元,5000积分100元,10000积分300元

          jf_sum:=0;
          jf:= strtofloat(czjf_edt.Text);
          jf_sum := trunc(jf/100);
          num_edt.Text:=IntToStr(jf_sum);

          {
          if (jf>=10000) then
            begin
              jf_sum := trunc(jf/10000);
              num_edt.Text:=IntToStr(jf_sum*200);
            end
          else if (jf>=5000) then
            begin
               jf_sum := trunc(jf/5000);
               num_edt.Text:=IntToStr(jf_sum*80);
            end
          else if (jf>=3000) then
            begin
               jf_sum := trunc(jf/3000);
               num_edt.Text:=IntToStr(jf_sum*50);
            end
          else
            begin
              num_edt.Text:='0';
            end;
          }
      end
    except
    end;

  end;

end;

end.
