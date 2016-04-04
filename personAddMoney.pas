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

      messagebox(handle,'操作员密码不能为空!','错误',MB_ICONERROR + MB_OK	)  ;
      upwd.SetFocus;
      exit;
    end;
    if(ucard.Text='') then
    begin

      messagebox(handle,'会员卡号不能为空!','错误',MB_ICONERROR + MB_OK	)  ;
      ucard.SetFocus;
      exit;
    end;
     if(umoney.Text='') then
    begin

      messagebox(handle,'充值金额不能为空!','错误',MB_ICONERROR + MB_OK	)  ;
      umoney.SetFocus;
      exit;
    end;
    //先判断密码是否正确
     if(upwd.Text<>mainFrm.user_password) then
     begin

      messagebox(handle,'操作员密码不正确!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
     end;
    //然后查询会员卡是否正确
    with zquery_addmoney do
    begin
       close;
       sql.Clear;
       sql.Add('select * from TB_MEMBERS where MCID='''+ucard.Text+'''');
       open;
    end;
    if(zquery_addmoney.IsEmpty) then
    begin

      messagebox(handle,'错误的会员卡号!','错误',MB_ICONERROR + MB_OK	)  ;
      ucard.SetFocus;
      exit;
    end;
    memberUid :=   zquery_addmoney.FieldByName('MID').Value;
    memberName :=   zquery_addmoney.FieldByName('MNAME').Value;
    memberCard :=   zquery_addmoney.FieldByName('MCID').Value;
    //然后记录充值日志
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
    //然后更新余额
       with zquery_addmoney do
      begin
       close;
       sql.Clear;
       sql.Add('update TB_MEMBERS set MMONEY='+umoney.Text+' where MCID='''+ucard.Text+'''');
       execSql;
      end;
      messagebox(handle,'充值成功!','恭喜',MB_ICONINFORMATION + MB_OK	)  ;
    modalResult := mrOK;
end;

procedure Tfrm_person_moneyAdd.RzBitBtn2Click(Sender: TObject);
begin
    modalResult := mrcancel;
end;

end.
