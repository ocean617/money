unit personAddUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, DBCtrlsEh, RzEdit, Mask, RzDBEdit, ExtCtrls,
  RzPanel, FormSize, AdvFocusHelper;

type
  Tfrm_person_userAdd = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    uname: TRzDBEdit;
    upwd: TRzEdit;
    usurepwd: TRzEdit;
    utype: TDBComboBoxEh;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_person_userAdd: Tfrm_person_userAdd;

implementation

uses personUnt;

{$R *.dfm}

procedure Tfrm_person_userAdd.RzBitBtn1Click(Sender: TObject);
begin
    if(upwd.Text<>usurepwd.Text) then
    begin
      messagebox(handle,'两次输入的密码不一致!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
    end;
    if(utype.Text='') then
    begin

      messagebox(handle,'用户类型未选择!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
    end;

    if(upwd.Text='') then
    begin
      messagebox(handle,'请输入密码!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
    end;

    modalResult := mrOK;
end;

procedure Tfrm_person_userAdd.RzBitBtn2Click(Sender: TObject);
begin
    modalResult := mrcancel;
end;

end.
