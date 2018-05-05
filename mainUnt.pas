unit mainUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZConnection, pngimage, ExtCtrls, RzForms, se_image,
  se_pngimagelist, se_controls, se_effect, se_ani, RzCommon,shellapi,
  se_form, se_imagelist,ZAbstractRODataset, ZAbstractDataset, ZDataset, DB,
  StdCtrls, RzLabel, RzPanel, DBGridEhGrouping, RzButton, GridsEh, DBGridEh,
  jpeg,DateUtils,TConfiguratorUnit;

type
  Tmainfrm = class(TForm)
    conn: TZConnection;
    bg_img: TseImage;
    close_bt: TsePngXButton;
    imgs: TsePngImageStorage;
    NewPay_bt: TsePngXButton;
    PayOrder_bt: TsePngXButton;
    CheckOrder_bt: TsePngXButton;
    CWReport_bt: TsePngXButton;
    symember_bt: TsePngXButton;
    Staff_bt: TsePngXButton;
    serviceItem_bt: TsePngXButton;
    alist: TseAnimationList;
    seAnimation1: TseAnimation;
    SYReport_bt: TsePngXButton;
    reg: TRzRegIniFile;
    seAnimationForm1: TseAnimationForm;
    seAnimationList1: TseAnimationList;
    seAnimation2: TseAnimation;
    Members_bt: TsePngXButton;
    sMember_bt: TsePngXButton;
    title_label: TLabel;
    Label1: TLabel;
    changePass_bt: TsePngXButton;
    wh_bt: TsePngXButton;
    lbl1: TLabel;
    hit_lab: TRzURLLabel;
    show_birthday_pane: TRzPanel;
    DBGridEh1: TDBGridEh;
    Label2: TLabel;
    RzBitBtn1: TRzBitBtn;
    birthday_qy: TZReadOnlyQuery;
    birthday_ds: TDataSource;
    procedure close_btClick(Sender: TObject);
    procedure bg_imgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Staff_btClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure serviceItem_btClick(Sender: TObject);
    procedure symember_btClick(Sender: TObject);
    procedure NewPay_btClick(Sender: TObject);
    procedure SYReport_btClick(Sender: TObject);
    procedure CWReport_btClick(Sender: TObject);
    procedure PayOrder_btClick(Sender: TObject);
    procedure CheckOrder_btClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure changePass_btClick(Sender: TObject);
    procedure wh_btClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure hit_labClick(Sender: TObject);
  private
    { Private declarations }
  public
    //数据库属性
    db_ip:string;
    db_port:string;
    db_name:string;
    db_user:string;
    db_pass:string;
    
    //当前用户属性
    user_id:string;
    user_name:string;
    user_account:string;
    user_password:string;
    user_type:string;

    function sendsms(phone:string;text:string):boolean;
    procedure sendMemberLastDateHints();
  end;

var
  mainfrm: Tmainfrm;

implementation

uses personUnt, loginUnt, serviceProjectUnt, personAddUser,
  personAddMembers, commUnt, MemberRegUnt, MemberAddMoneyUnt, NewOrderUnt,
  MemberManagerUnt, ReportUnt, PayOrderUnt, CheckOrderUnt, changePassUnt,
  ClearDateUnt;

{$R *.dfm}

procedure Tmainfrm.close_btClick(Sender: TObject);
begin
if (Messagebox(0,'确认要关闭系统吗？','提示',mb_iconquestion+mb_yesno)=id_yes) then
  Application.Terminate;
end;

procedure Tmainfrm.bg_imgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
SendMessage(self.Handle, WM_SYSCOMMAND,SC_MOVE+HTCAPTION, 0);
end;

procedure Tmainfrm.Staff_btClick(Sender: TObject);
var
  frm_person:Tfrm_person;
begin
  frm_person:=Tfrm_person.Create(self);
  frm_person.Show;
end;

procedure Tmainfrm.FormCreate(Sender: TObject);
var
   loginfrm : Tloginfrm;
begin
if (not reg.SectionExists('money')) then
    begin
      messagebox(0,'首次运行程序需要进行数据配置,请找管理员配置好数据连接再打开程序.','提示',mb_iconinformation);
      shellExecute(0,'open',pchar(extractfilepath(application.ExeName)+'conncfg.exe'),'','',SW_SHOW);
      application.Terminate;
    end;

  db_ip   :=   mainfrm.reg.ReadString('money','ip','');
  db_port :=   mainfrm.reg.ReadString('money','port','3306');
  db_name :=   mainfrm.reg.ReadString('money','dbname','');
  db_user :=   mainfrm.reg.ReadString('money','dbuser','');
  db_pass :=   mainfrm.reg.ReadString('money','dbpass','');

if mainfrm.conn.Connected then
    try
      mainfrm.conn.Connected:=false;
    except
      begin
        messagebox(0,'关闭连接出错','提示',mb_iconerror);
        application.Terminate;
      end;
    end;
      
  //连接测试
  conn.HostName:=mainfrm.db_ip;
  conn.Port:=strtoint(mainfrm.db_port);
  conn.Database:=mainfrm.db_name;
  conn.User:=mainfrm.db_user;
  conn.Password := mainfrm.db_pass;
  
  try
    begin
     conn.Connected:=true;
    end
  except
    begin
       messagebox(0,'连接失败,请检查数据库服务器是否正常开机或者您的数据配置是否正确!','提示',MB_ICONERROR);
       Application.Terminate;
    end;
    
  end;

  //配置处理
  doPropertiesConfiguration('log4delphi.properties');
  
  //显示登录窗口
  loginfrm := Tloginfrm.Create(self);
  loginfrm.ShowModal;

  //会员过期短信提示
  sendMemberLastDateHints;
end;

procedure Tmainfrm.serviceItem_btClick(Sender: TObject);
var
 frmServiceProject:TfrmServiceProject;
begin
 frmServiceProject:= TfrmServiceProject.Create(self);
 frmServiceProject.Show;

end;

procedure Tmainfrm.symember_btClick(Sender: TObject);
var
   MemberManagerFrm: TMemberManagerFrm;
begin
   MemberManagerFrm := TMemberManagerFrm.create(self);
   MemberManagerFrm.show;
end;

procedure Tmainfrm.NewPay_btClick(Sender: TObject);
var
  NewOrderFrm:TNewOrderFrm;
begin
 NewOrderFrm:=TNewOrderFrm.Create(self);
 NewOrderFrm.Show;
 
end;

procedure Tmainfrm.SYReport_btClick(Sender: TObject);
var
  ReportFrm:TReportFrm;
begin
  ReportFrm:= TReportFrm.Create(self);
  ReportFrm.Show;
end;

procedure Tmainfrm.CWReport_btClick(Sender: TObject);
var
  ReportFrm:TReportFrm;
begin
  ReportFrm:= TReportFrm.Create(self);
  ReportFrm.Show;
end;

procedure Tmainfrm.PayOrder_btClick(Sender: TObject);
var
  PayOrderFrm:TPayOrderFrm;
begin
  PayOrderFrm:=TPayOrderFrm.Create(self);
  PayOrderFrm.Show;
end;

procedure Tmainfrm.CheckOrder_btClick(Sender: TObject);
var
  CheckOrderFrm:TCheckOrderFrm;
begin
  CheckOrderFrm:=TCheckOrderFrm.Create(self);
  CheckOrderFrm.Show;
end;

procedure Tmainfrm.FormKeyPress(Sender: TObject; var Key: Char);
var
 KeyInt:integer;
begin
 KeyInt := integer(Key);
 
 if (KeyInt=27) then
   close_btClick(self);
   
 if ((KeyInt=49) and (NewPay_bt.Enabled)) then
    NewPay_btClick(self);

 if ((KeyInt=50) and (PayOrder_bt.Enabled)) then
    PayOrder_btClick(self);
    
 if ((KeyInt=51) and (symember_bt.Enabled)) then
    symember_btClick(self);

 if ((KeyInt=52) and (SYReport_bt.Enabled)) then
    SYReport_btClick(self);

 if ((KeyInt=53) and (CheckOrder_bt.Enabled)) then
    CheckOrder_btClick(self);

 if ((KeyInt=54) and (symember_bt.Enabled)) then
    symember_btClick(self);
    
 if ((KeyInt=55) and (CWReport_bt.Enabled)) then
    CWReport_btClick(self);
    
 if ((KeyInt=56) and (Staff_bt.Enabled)) then
    Staff_btClick(self);
    
 if ((KeyInt=57) and (serviceItem_bt.Enabled)) then
    serviceItem_btClick(self);

 if ((KeyInt=48) and (symember_bt.Enabled)) then
    symember_btClick(self);

 if (KeyInt=112) then
    changePass_btClick(self);

 if (KeyInt=119) then
    wh_btClick(self);    
end;

procedure Tmainfrm.changePass_btClick(Sender: TObject);
var
 changePassFrm:TchangePassFrm;
begin
 changePassFrm:= TchangePassFrm.Create(self);
 changePassFrm.Show;
end;

procedure Tmainfrm.wh_btClick(Sender: TObject);
var
 clearDatafrm:TclearDatafrm;
begin
 clearDatafrm:= TclearDatafrm.Create(self);
 clearDatafrm.ShowModal;
end;

procedure Tmainfrm.FormActivate(Sender: TObject);
var
  tmpqy:TZQuery;
  sms_content,send_content,phone:string;
  i:integer;
begin
  tmpqy:= TZQuery.Create(nil);
  tmpqy.Connection:=conn;
  tmpqy.SQL.Add('select count(*) ct from tb_members where month(MBIRTHDAY)=month(now()) and day(MBIRTHDAY)=day(now())');
  tmpqy.Open;

  if (tmpqy.FieldByName('ct').AsInteger>0) then
      begin
        sms_content := '尊敬的{会员姓名}会员，祝您生日快乐！身体健康！万事如意！';
        
        //ShowMessage('今天有'+tmpqy.FieldByName('ct').AsString+'个会员生日.');
        if birthday_qy.Active then birthday_qy.Close;
        birthday_qy.SQL.Clear;
        birthday_qy.SQL.Add('select MNAME as "姓名",MCSHOWID as "卡号" ,MGENDER as "性别",MPHONE as "电话",BIRTHDAYSMSDATE as "短信发送日期" from tb_members where month(MBIRTHDAY)=month(now()) and day(MBIRTHDAY)=day(now()) ');
        
        birthday_qy.Open;
        if not birthday_qy.IsEmpty then
          for i:=0 to  birthday_qy.RecordCount-1 do
            begin
               send_content :=  StringReplace(sms_content,'{会员姓名}',birthday_qy.fieldbyname('姓名').AsString,[rfReplaceAll]);
               phone :=  birthday_qy.fieldbyname('电话').AsString;
               if (length(phone)>0) and
                  (length(birthday_qy.fieldbyname('短信发送日期').AsString)=0) then
                  try
                    sendsms(phone,send_content);
                    exeSql('update tb_members set BIRTHDAYSMSDATE=now() where MCSHOWID="'+birthday_qy.fieldbyname('卡号').AsString+'"');
                  except
                  end;

               //判断最后发送的日期是不是今天，如果不是今天也要重新发送一次
            if (length(phone)>0) and
               ((length(birthday_qy.fieldbyname('短信发送日期').AsString)>0)) and
               (
                  (yearof(birthday_qy.fieldbyname('短信发送日期').AsDateTime)<>yearof(now())) or
                  (monthof(birthday_qy.fieldbyname('短信发送日期').AsDateTime)<>monthof(now())) or
                  (dayof(birthday_qy.fieldbyname('短信发送日期').AsDateTime)<>dayof(now()))
                ) then
               begin
                  try
                    sendsms(phone,send_content);
                    exeSql('update tb_members set BIRTHDAYSMSDATE=now() where MCSHOWID="'+birthday_qy.fieldbyname('卡号').AsString+'"');
                  except
                  end;

               end;
               
               birthday_qy.Next;
            end;
        
      end;
      
  hit_lab.Caption:='今天过生日的会员: '+ tmpqy.FieldByName('ct').AsString+' 个';
  hit_lab.Update;

  tmpqy.Close;
  tmpqy.Free;
  
end;

procedure Tmainfrm.RzBitBtn1Click(Sender: TObject);
begin
show_birthday_pane.Hide;
end;

procedure Tmainfrm.hit_labClick(Sender: TObject);
begin

show_birthday_pane.Top:=268;
show_birthday_pane.Left:=260;
show_birthday_pane.Show;
end;

function Tmainfrm.sendsms(phone, text: string): boolean;
var
  si: TStartupInfo;
  pi: TProcessInformation;
  cpath:String;
  retvalue:boolean;
begin
//  retvalue:=false;
    FillChar(si,SizeOf(si),0);
    FillChar(pi,SizeOf(pi),0);
    si.cb:= SizeOf(si);
    cpath := extractfilePath(application.ExeName);
   
  if not CreateProcess(nil, pchar('jre\bin\javaw.exe -jar sms.jar '+phone+' '+text+'【和顺堂】'), nil,  
                       nil, False, 0, nil, PChar(cpath), si, pi) then
                       begin
                         retvalue:=false;
                       end
  else
    begin
      retvalue:=true;
      WaitForSingleObject(pi.hProcess, Infinite);
      CloseHandle(pi.hThread);
      CloseHandle(pi.hProcess);
    end;

  result:= retvalue;
end;

procedure Tmainfrm.sendMemberLastDateHints;
var
  qry:Tzquery;
  i:integer;
  sms_content,send_content,phone:string;
begin
  sms_content:='尊敬的{会员姓名}会员，您卡号为{会员卡号}即将于明天到期，请您及时到店消费或办理延期手续。谢谢！';
  qry:= Tzquery.Create(nil);
  qry.Connection:=conn;
  qry.SQL.Add('select mname,mcshowid,mphone,GQSMSDATE from tb_members where DATEDIFF(MGQDATE,NOW())=1');
  
  qry.open;
  if not qry.IsEmpty then
    begin
      qry.First;
      for i:=0 to qry.RecordCount-1 do
        begin
           send_content := StringReplace(sms_content,'{会员姓名}',qry.fieldbyname('mname').AsString,[rfReplaceAll]);
           send_content := StringReplace(send_content,'{会员卡号}',qry.fieldbyname('mcshowid').AsString,[rfReplaceAll]);
           phone :=     qry.fieldbyname('mphone').AsString;
           
           if (length(phone)>0) and
              (length(qry.fieldbyname('GQSMSDATE').AsString)=0)then
            try
              sendsms(phone,send_content);
              exeSql('update tb_members set GQSMSDATE=now() where MCSHOWID="'+qry.fieldbyname('mcshowid').AsString+'"');
            except
            end;

            //判断最后发送的日期是不是今天，如果不是今天也要重新发送一次
            if (length(phone)>0) and
               (length(qry.fieldbyname('GQSMSDATE').AsString)>0) and
               (
                  (yearof(qry.fieldbyname('GQSMSDATE').AsDateTime)<>yearof(now())) or
                  (monthof(qry.fieldbyname('GQSMSDATE').AsDateTime)<>monthof(now())) or
                  (dayof(qry.fieldbyname('GQSMSDATE').AsDateTime)<>dayof(now()))
                ) then
               begin

                  try
                    sendsms(phone,send_content);
                    exeSql('update tb_members set GQSMSDATE=now() where MCSHOWID="'+qry.fieldbyname('mcshowid').AsString+'"');
                  except
                  end;

               end;
               
           qry.next;
        end;
    end;
  
  qry.Close;
  qry.Free;
  
end;

end.
