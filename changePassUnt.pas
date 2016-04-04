unit changePassUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzButton, AdvFocusHelper;

type
  TchangePassFrm = class(TForm)
    oldpass_edt: TRzEdit;
    RzLabel2: TRzLabel;
    newpass_edt: TRzEdit;
    RzLabel1: TRzLabel;
    renewpass_edt: TRzEdit;
    RzLabel3: TRzLabel;
    updateBt: TRzBitBtn;
    closebt: TRzBitBtn;
    AdvFocusHelper1: TAdvFocusHelper;
    procedure closebtClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure updateBtClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changePassFrm: TchangePassFrm;

implementation

uses commUnt, mainUnt;

{$R *.dfm}

procedure TchangePassFrm.closebtClick(Sender: TObject);
begin
  close;
end;

procedure TchangePassFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TchangePassFrm.updateBtClick(Sender: TObject);
begin
if length(trim(oldpass_edt.text))=0 then
  begin
    showmessage('旧密码不可为空，请重新输入');
    exit;
  end;
if length(trim(newpass_edt.text))=0 then
  begin
    showmessage('新密码不可为空，请重新输入');
    exit;
  end;
if length(trim(renewpass_edt.text))=0 then
  begin
    showmessage('请再次输入新密码.');
    exit;
  end;
if  newpass_edt.text<>renewpass_edt.text then
  begin
    showmessage('新旧密码不一致，请重新输入.');
    exit;
  end;

 if trim(oldpass_edt.text)<>mainfrm.user_password then
   begin
     showmessage('旧密码输入错误，请重新输入.');
     exit;
   end;

 exeSql('update TB_USERS set UPASS='''+newpass_edt.Text+''' where UID='''+mainfrm.user_id+'''');
 showmessage('密码修改成功，下次登录请用新密码登录即可.');
 close;
 
end;

procedure TchangePassFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then
   SendMessage(self.Handle,WM_NEXTDLGCTL,0,0);
   
 if integer(Key)=27 then
    close;
end;

end.
