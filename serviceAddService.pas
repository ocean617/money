unit serviceAddService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, DBCtrlsEh, RzEdit, Mask, RzDBEdit, ExtCtrls,
  RzPanel, DBCtrls;

type
  Tfrm_service_serviceAdd = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    uname: TRzDBEdit;
    Label5: TLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    RzDBNumericEdit4: TRzDBNumericEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    Label11: TLabel;
    RzDBNumericEdit5: TRzDBNumericEdit;
    Label12: TLabel;
    Label13: TLabel;
    RzDBEdit1: TRzDBEdit;
    Label14: TLabel;
    DBComboBox2: TDBComboBox;
    Label15: TLabel;
    RzDBNumericEdit6: TRzDBNumericEdit;
    Label16: TLabel;
    Label17: TLabel;
    RzDBNumericEdit7: TRzDBNumericEdit;
    RzDBMemo1: TRzDBMemo;
    Label18: TLabel;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_service_serviceAdd: Tfrm_service_serviceAdd;

implementation

uses  mainUnt, serviceProjectUnt;

{$R *.dfm}

procedure Tfrm_service_serviceAdd.RzBitBtn1Click(Sender: TObject);
begin

    if(uname.Text='') then
    begin

      messagebox(handle,'项目名称不能为空!','错误',MB_ICONERROR + MB_OK	)  ;
      uname.SetFocus;
      exit;
    end;
    modalResult := mrOK;
end;

procedure Tfrm_service_serviceAdd.RzBitBtn2Click(Sender: TObject);
begin
    modalResult := mrcancel;
end;

end.
