unit personAddMembers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, DBCtrlsEh, RzEdit, Mask, RzDBEdit, ExtCtrls,
  RzPanel, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, DBGridEh, DBLookupEh;

type
  Tfrm_person_membersAdd = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    uname: TRzDBEdit;
    Label2: TLabel;
    RzDBEdit1: TRzDBEdit;
    qry: TZQuery;
    ds: TDataSource;
    Label3: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Label6: TLabel;
    RzDBEdit3: TRzDBEdit;
    Label7: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label5: TLabel;
    RzDBEdit2: TRzDBEdit;
    Label4: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label8: TLabel;
    RzDBEdit4: TRzDBEdit;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    id:string;
    procedure add();
    procedure edit();  
    { Public declarations }
  end;

var
  frm_person_membersAdd: Tfrm_person_membersAdd;

implementation

uses personUnt, commUnt, mainUnt;

{$R *.dfm}

procedure Tfrm_person_membersAdd.add;
begin
if qry.Active then qry.Close;
qry.SQL.Clear;
qry.SQL.Add('select * from TB_MEMBERS where 1=2');
qry.Open;
qry.Append;
qry.FieldByName('MID').AsString:=CreateNewId();

end;

procedure Tfrm_person_membersAdd.edit;
begin
if qry.Active then qry.Close;
qry.SQL.Clear;
qry.SQL.Add('select * from TB_MEMBERS where MID='''+id+'''');
qry.Open;
qry.Edit;

end;

procedure Tfrm_person_membersAdd.FormCreate(Sender: TObject);
begin
id:='';
end;

procedure Tfrm_person_membersAdd.RzBitBtn1Click(Sender: TObject);
begin
   if(uname.Text='') then
    begin

      messagebox(handle,'请输入会员姓名!','错误',MB_ICONERROR + MB_OK	)  ;
      uname.SetFocus;
      exit;
    end;
    
   if (RzDBEdit1.Text='')then
    begin
      messagebox(handle,'请输入会员卡号!','错误',MB_ICONERROR + MB_OK	)  ;
      RzDBEdit1.SetFocus;
      exit;
    end;

    if (getCount('select count(*) as scount from TB_MEMBERS where MCID='''+RzDBEdit1.Text+''' and MID<>'''+qry.FieldByName('MID').AsString+'''')>0) then
     begin
      messagebox(handle,'该会员卡号已经存在，请重新指定!','错误',MB_ICONERROR + MB_OK	)  ;
      RzDBEdit1.SetFocus;
      exit;     
     end;
     
    qry.FieldByName('MDATE').AsDateTime:=now();
    qry.FieldByName('UID').AsString:=mainfrm.user_id;
    qry.FieldByName('UNAME').AsString:=mainfrm.user_name;
    qry.Post;
    
    //编辑的话就关闭窗口,否则继续添加
    if length(id)>0 then  close
    else
      begin
        messagebox(0,'数据保存成功.','提示',mb_iconinformation);
        add;
      end;
end;

procedure Tfrm_person_membersAdd.RzBitBtn2Click(Sender: TObject);
begin
   close;
end;

end.
