unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzButton, StdCtrls, ZConnection, RzCommon, jpeg,
  RzPanel, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdFTP, DBGridEhGrouping, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, GridsEh, DBGridEh;

type
  Tconnfrm = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    test_bt: TRzBitBtn;
    save_bt: TRzBitBtn;
    exit_bt: TRzBitBtn;
    StaticText1: TStaticText;
    conn: TZConnection;
    reg: TRzRegIniFile;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    ipedt: TEdit;
    portedt: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbnameedt: TEdit;
    usernameedt: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    passwordedt: TEdit;
    IdFTP1: TIdFTP;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ZQuery1: TZQuery;
    Memo1: TMemo;
    RzBitBtn1: TRzBitBtn;
    procedure exit_btClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure test_btClick(Sender: TObject);
    procedure save_btClick(Sender: TObject);
    procedure webcopyConnectError(Sender: TObject);
    procedure webcopyError(Sender: TObject; ErrorCode: Integer);
    procedure webcopyFileDone(Sender: TObject; idx: Integer);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  connfrm: Tconnfrm;

implementation

{$R *.dfm}

procedure Tconnfrm.exit_btClick(Sender: TObject);
begin
  close;
end;

procedure Tconnfrm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if (messagebox(0,'�Ƿ��˳�?','��ʾ',mb_iconquestion+mb_yesno)=idyes) then
         canclose:=true
    else
         canclose:=false;

end;

procedure Tconnfrm.test_btClick(Sender: TObject);
begin
  if conn.Connected then
    try
      conn.Connected:=false;
    except
      begin
        messagebox(0,'���ݿ�ر����ӳ���','��ʾ',mb_iconerror);
        application.Terminate;
      end;
    end;
  //���ݼ��

  //���Ӳ���
  conn.HostName:=ipedt.Text;
  conn.Port:=strtoint(portedt.Text);
  conn.Database:=dbnameedt.Text;
  conn.User:=usernameedt.Text;
  conn.Password := passwordedt.Text;

  try
    test_bt.Enabled:=false;
    save_bt.Enabled:=false;
    exit_bt.Enabled:=false;
    
    conn.Connected:= true;
    messagebox(0,'���ݿ����ӳɹ�!','��ʾ',MB_ICONINFORMATION);

    conn.Connected :=false;
    
    test_bt.Enabled:=true;
    save_bt.Enabled:=true;
    exit_bt.Enabled:=true;
    
  except
    on   E:   Exception   do
    begin

      test_bt.Enabled:=true;
      save_bt.Enabled:=true;
      exit_bt.Enabled:=true;

      messagebox(0,pchar(E.Message),'��ʾ',MB_ICONERROR);
      messagebox(0,'����ʧ��,�������ݿ�������Ƿ��������������������������Ƿ���ȷ!','��ʾ',MB_ICONERROR);
      exit;
    end;
  end; 

end;

procedure Tconnfrm.save_btClick(Sender: TObject);
begin
  reg.WriteString('money','ip',ipedt.Text);
  reg.WriteString('money','port',portedt.Text);
  reg.WriteString('money','dbname',dbnameedt.Text);
  reg.WriteString('money','dbuser',usernameedt.Text);
  reg.WriteString('money','dbpass',passwordedt.Text);
  
  messagebox(0,'�����Ѿ��ɹ�����!','��ʾ',MB_ICONINFORMATION);
  close;
end;

procedure Tconnfrm.webcopyConnectError(Sender: TObject);
begin
showmessage('����ʧ��');
end;

procedure Tconnfrm.webcopyError(Sender: TObject; ErrorCode: Integer);
begin
showmessage(inttostr(Errorcode));
end;

procedure Tconnfrm.webcopyFileDone(Sender: TObject; idx: Integer);
begin
showmessage('���');
end;

procedure Tconnfrm.RzBitBtn1Click(Sender: TObject);
begin
if not (conn.Connected) then
   conn.Connected:=True;
if zquery1.Active then zquery1.Close;
zquery1.SQL.Clear;
zquery1.SQL.Add('select * from tb_order where OSTATE=''�ᵥ''');
ZQuery1.Open;

end;

end.

