unit personAddMoney;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, DBCtrlsEh, RzEdit, Mask, RzDBEdit, ExtCtrls,
  RzPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tfrm_person_moneyAdd = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ucard: TRzEdit;
    upwd: TRzEdit;
    Label4: TLabel;
    zquery_addmoney: TZQuery;
    umoney: TRzNumericEdit;
    uRemark: TRzMemo;
    Label5: TLabel;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_person_moneyAdd: Tfrm_person_moneyAdd;

implementation

uses personUnt, mainUnt, commUnt;

{$R *.dfm}

procedure Tfrm_person_moneyAdd.RzBitBtn1Click(Sender: TObject);
var memberName,memberCard,memberUid:String;
begin
    if(upwd.Text='') then
    begin

      messagebox(handle,'����Ա���벻��Ϊ��!','����',MB_ICONERROR + MB_OK	)  ;
      upwd.SetFocus;
      exit;
    end;
    if(ucard.Text='') then
    begin

      messagebox(handle,'��Ա���Ų���Ϊ��!','����',MB_ICONERROR + MB_OK	)  ;
      ucard.SetFocus;
      exit;
    end;
     if(umoney.Text='') then
    begin

      messagebox(handle,'��ֵ����Ϊ��!','����',MB_ICONERROR + MB_OK	)  ;
      umoney.SetFocus;
      exit;
    end;
    //���ж������Ƿ���ȷ
     if(upwd.Text<>mainFrm.user_password) then
     begin

      messagebox(handle,'����Ա���벻��ȷ!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
     end;
    //Ȼ���ѯ��Ա���Ƿ���ȷ
    with zquery_addmoney do
    begin
       close;
       sql.Clear;
       sql.Add('select * from TB_MEMBERS where MCID='''+ucard.Text+'''');
       open;
    end;
    if(zquery_addmoney.IsEmpty) then
    begin

      messagebox(handle,'����Ļ�Ա����!','����',MB_ICONERROR + MB_OK	)  ;
      ucard.SetFocus;
      exit;
    end;
    memberUid :=   zquery_addmoney.FieldByName('MID').Value;
    memberName :=   zquery_addmoney.FieldByName('MNAME').Value;
    memberCard :=   zquery_addmoney.FieldByName('MCID').Value;
    //Ȼ���¼��ֵ��־
      with zquery_addmoney do
      begin
       close;
       sql.Clear;
       sql.Add('select * from TB_MEMBER_ADDMONEY');
       open;
      end;
      zquery_addmoney.Append;
      zquery_addmoney.FieldByName('AID').Value :=  CreateNewId();
      zquery_addmoney.FieldByName('MID').Value :=  memberUid;
      zquery_addmoney.FieldByName('MNAME').Value := memberName;
      zquery_addmoney.FieldByName('MCID').Value :=  memberCard;
      zquery_addmoney.FieldByName('UID').Value :=  mainfrm.user_id;
      zquery_addmoney.FieldByName('UNAME').Value :=  mainFrm.user_name;
      zquery_addmoney.FieldByName('UDATE').Value :=  now;
      zquery_addmoney.FieldByName('UTOTAL').Value :=  umoney.Text;
      zquery_addmoney.FieldByName('UMEMO').Value :=  uRemark.Text;
      zquery_addmoney.Post;
    //Ȼ��������
       with zquery_addmoney do
      begin
       close;
       sql.Clear;
       sql.Add('update TB_MEMBERS set MMONEY='+umoney.Text+' where MCID='''+ucard.Text+'''');
       execSql;
      end;
      messagebox(handle,'��ֵ�ɹ�!','��ϲ',MB_ICONINFORMATION + MB_OK	)  ;
    modalResult := mrOK;
end;

procedure Tfrm_person_moneyAdd.RzBitBtn2Click(Sender: TObject);
begin
    modalResult := mrcancel;
end;

end.
