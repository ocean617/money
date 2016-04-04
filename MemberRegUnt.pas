unit MemberRegUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzDBEdit, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel, RzButton,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TmemberRegFrm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    uname: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    ds: TDataSource;
    qry: TZQuery;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  memberRegFrm: TmemberRegFrm;

implementation

uses commUnt, mainUnt;

{$R *.dfm}

procedure TmemberRegFrm.RzBitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TmemberRegFrm.FormCreate(Sender: TObject);
begin
 qry.SQL.Clear;
 qry.SQL.Add('select * from TB_MEMBERS where 1=2');
 qry.Open;
 qry.Append;
 
end;

procedure TmemberRegFrm.RzBitBtn1Click(Sender: TObject);
begin
  qry.FieldByName('MID').AsString:=CreateNewId();
  qry.FieldByName('UID').AsString:=mainfrm.user_id;
  qry.FieldByName('UNAME').AsString:=mainfrm.user_name;
  qry.Post;

  messagebox(0,'会员已经成功登记.','提示',mb_iconinformation);
  qry.Append;
end;

end.
