unit personAddEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, DBCtrlsEh, RzEdit, Mask, RzDBEdit, ExtCtrls,
  RzPanel, RzDBSpin, AdvFocusHelper;

type
  Tfrm_person_userEmployee = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    uname: TRzDBEdit;
    utype: TDBComboBoxEh;
    username: TRzDBEdit;
    Label3: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Label5: TLabel;
    RzDBEdit2: TRzDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    RzDBEdit4: TRzDBEdit;
    Label8: TLabel;
    DBComboBoxEh2: TDBComboBoxEh;
    Label9: TLabel;
    DBComboBoxEh3: TDBComboBoxEh;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    AdvFocusHelper1: TAdvFocusHelper;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_person_userEmployee: Tfrm_person_userEmployee;

implementation

uses personUnt;

{$R *.dfm}

procedure Tfrm_person_userEmployee.RzBitBtn1Click(Sender: TObject);
begin
    if(username.Text='') then
    begin

      messagebox(handle,'用户姓名未输入!','错误',MB_ICONERROR + MB_OK	)  ;
      username.SetFocus;
      exit;
    end;
    modalResult := mrOK;
end;

procedure Tfrm_person_userEmployee.RzBitBtn2Click(Sender: TObject);
begin
    modalResult := mrcancel;
end;

end.
