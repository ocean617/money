unit changePayRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit;

type
  Tfrm_changePay = class(TForm)
    Label1: TLabel;
    lbl1: TLabel;
    btn1: TButton;
    btn2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    PID:string;
    { Public declarations }
  end;

var
  frm_changePay: Tfrm_changePay;

implementation

uses MemberManagerUnt, commUnt;

{$R *.dfm}

procedure Tfrm_changePay.btn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_changePay.btn1Click(Sender: TObject);
begin
if length(edit1.Text)>0 then
  try
    exeSql('update TB_MEMBER_PAYLOG set MPAYCOUNT= '+ edit1.Text +' where PID='''+PID+'''');
  except
  end;

if length(edit2.Text)>0 then
try
  exeSql('update TB_MEMBER_PAYLOG set MBALANCE= '+ edit2.Text +' where PID='''+PID+'''');
except
end;

  close;
end;

end.
