unit loginUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzCommon, DB, ZAbstractRODataset, ZDataset, RzButton,
  StdCtrls, Mask, RzEdit, RzBorder, RzLabel, RzBckgnd, pngimage, se_image;

type
  Tloginfrm = class(TForm)
    titleImg: TImage;
    RzBackground1: TRzBackground;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzBorder1: TRzBorder;
    pedt: TRzEdit;
    loginbt: TRzButton;
    cancelbt: TRzButton;
    r_qy: TZReadOnlyQuery;
    regfile: TRzRegIniFile;
    seImage1: TseImage;
    Bevel1: TBevel;
    uedt: TComboBox;
    procedure loginbtClick(Sender: TObject);
    procedure cancelbtClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  loginfrm: Tloginfrm;

implementation

uses mainUnt;

{$R *.dfm}

procedure Tloginfrm.loginbtClick(Sender: TObject);
begin

 if (length(trim(uedt.Text))<=0) then
   begin
    messagebox(0,'请输入用户名.','提示',mb_iconinformation);
    uedt.SetFocus;
    exit;
   end;

 if (length(trim(pedt.Text))<=0) then
   begin
    messagebox(0,'请输入密码.','提示',mb_iconinformation);
    pedt.SetFocus;
    exit;
   end;

 if (pos(' ',uedt.Text)>0) then
   begin
    messagebox(0,'用户名含非法字符.','提示',mb_iconinformation);
    uedt.SetFocus;
    exit;
   end;

 if (pos(' ',pedt.Text)>0) then
   begin
    messagebox(0,'密码含非法字符.','提示',mb_iconinformation);
    pedt.SetFocus;
    exit;
   end;

 if (r_qy.Active) then  r_qy.Close;

 r_qy.ParamByName('u').AsString:=trim(uedt.Text);
 r_qy.ParamByName('p').AsString:=trim(pedt.Text);

 try
   r_qy.Open;
 except
   begin
     messagebox(0,'数据查询出错,有可能是数据库未启动或缺少连接库.请联系管理员.','提示',mb_iconerror);
     pedt.SetFocus;
     exit;
   end;
 end;

  if (r_qy.IsEmpty) then
    begin
     messagebox(0,'您的用户名或密码错误,请重新输入.','提示',mb_iconerror);
     pedt.SetFocus;
     r_qy.Close;
    end
  else
    begin
      mainfrm.user_id  := r_qy.fieldbyname('UID').AsString;
      mainfrm.user_name:= r_qy.fieldbyname('UNAME').AsString;
      mainfrm.user_password:= r_qy.fieldbyname('UPASS').AsString;
      mainfrm.user_type:= r_qy.fieldbyname('UTYPE').AsString;
      
      mainfrm.title_label.Caption := '欢迎您的登录,'+mainfrm.user_name;
      
      //进行权限判断
      if (mainfrm.user_type='收银员') then
         begin
           mainfrm.CheckOrder_bt.Enabled:=false;
           mainfrm.Members_bt.Enabled:=false;
           mainfrm.CWReport_bt.Enabled:=false;
           
           mainfrm.Staff_bt.Enabled:=false;
           mainfrm.serviceItem_bt.Enabled:=false;
           mainfrm.sMember_bt.Enabled:=false;
         end
      else if  (mainfrm.user_type='财务') then
         begin
           mainfrm.NewPay_bt.Enabled:=false;
           mainfrm.PayOrder_bt.Enabled:=false;
           mainfrm.symember_bt.Enabled:=false;
           mainfrm.SYReport_bt.Enabled:=false;

           mainfrm.Staff_bt.Enabled:=false;
           mainfrm.serviceItem_bt.Enabled:=false;
           mainfrm.sMember_bt.Enabled:=false;
         end
      else if (mainfrm.user_type='总经理') then
         mainfrm.wh_bt.Show;
         
      r_qy.Close;
      self.Tag:=2;
      close;
    end;
end;

procedure Tloginfrm.cancelbtClick(Sender: TObject);
begin
if (messagebox(0,'是否取消登录?','提示',mb_iconquestion+mb_yesno)=idyes) then
  begin
    Tag:=2;
    close;
    application.Terminate;
  end;
end;

procedure Tloginfrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then
   SendMessage(self.Handle,WM_NEXTDLGCTL,0,0);
end;

procedure Tloginfrm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (self.Tag=2) then
    canclose:=true
  else
    canclose:=false;
end;

procedure Tloginfrm.FormCreate(Sender: TObject);
var
  qry:Tzquery;
begin
  qry:=Tzquery.Create(self);
  qry.Connection:=mainfrm.conn;
  qry.SQL.Add('select * from TB_users' );
  qry.Open;
  uedt.Clear;
  while not qry.Eof do
    begin
      uedt.Items.Add(qry.fieldbyname('UNAME').AsString);
      qry.next;
    end;
  qry.Free;
    
end;

procedure Tloginfrm.FormActivate(Sender: TObject);
begin
uedt.SetFocus;
end;

procedure Tloginfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
