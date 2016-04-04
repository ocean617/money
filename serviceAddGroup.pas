unit serviceAddGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, DBCtrlsEh, RzEdit, Mask, RzDBEdit, ExtCtrls,
  RzPanel;

type
  Tfrm_service_groupAdd = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    uname: TRzDBEdit;
    Label5: TLabel;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    RzDBNumericEdit4: TRzDBNumericEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_service_groupAdd: Tfrm_service_groupAdd;

implementation

uses  mainUnt, serviceProjectUnt;

{$R *.dfm}

procedure Tfrm_service_groupAdd.RzBitBtn1Click(Sender: TObject);
begin

    if(uname.Text='') then
    begin

      messagebox(handle,'项目名称不能为空!','错误',MB_ICONERROR + MB_OK	)  ;
      uname.SetFocus;
      exit;
    end;
    modalResult := mrOK;
end;

procedure Tfrm_service_groupAdd.RzBitBtn2Click(Sender: TObject);
begin
    modalResult := mrcancel;
end;

end.
