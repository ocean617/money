unit MemberPayUpdateUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, RzButton, ExtCtrls;

type
  TMemberPayUpdateFrm = class(TForm)
    Label3: TLabel;
    udate: TDBDateTimeEditEh;
    Label1: TLabel;
    umemo: TMemo;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    Bevel1: TBevel;
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberPayUpdateFrm: TMemberPayUpdateFrm;

implementation

{$R *.dfm}

procedure TMemberPayUpdateFrm.RzBitBtn2Click(Sender: TObject);
begin
 close;
end;

end.
