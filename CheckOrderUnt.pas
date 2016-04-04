unit CheckOrderUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls, RzPanel,
  DBGridEhGrouping, GridsEh, DBGridEh, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBCtrlsEh,strUtils;

type
  TCheckOrderFrm = class(TForm)
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    ONUM_edt: TRzEdit;
    qry_bt: TRzBitBtn;
    RzPanel2: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    DBGridEh6: TDBGridEh;
    chk_bt: TRzBitBtn;
    order_qy: TZQuery;
    order_ds: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    statecmb: TComboBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    cardNo_edt: TRzEdit;
    RzLabel4: TRzLabel;
    payTypecmb: TComboBox;
    RzLabel5: TRzLabel;
    zk_edt: TRzNumericEdit;
    RzLabel6: TRzLabel;
    OCOMMID_edt: TRzEdit;
    del_bt: TRzBitBtn;
    sdate: TDBDateTimeEditEh;
    edate: TDBDateTimeEditEh;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure qry_btClick(Sender: TObject);
    procedure chk_btClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh6TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure del_btClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CheckOrderFrm: TCheckOrderFrm;

implementation

uses commUnt, mainUnt, CheckOrderDetailUnt, PayOrderUnt;

{$R *.dfm}

procedure TCheckOrderFrm.RzBitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TCheckOrderFrm.qry_btClick(Sender: TObject);
var
 sql:string;
begin
 sql:= 'select * from TB_ORDER where 1=1 ';

 if length(trim(ONUM_edt.Text))>0 then
   sql := sql +' and ONUM like ''%'+trim(ONUM_edt.Text)+'%''';
   
 if length(trim(AnsireplaceStr(AnsireplaceStr(sdate.Text,'-',''),':','')))>0 then
   sql := sql +' and ODATE >= '''+trim(sdate.Text)+'''';
 if length(trim(AnsireplaceStr(AnsireplaceStr(edate.Text,'-',''),':','')))>0 then
   sql := sql +' and ODATE <= '''+trim(edate.Text)+'''';

 if length(statecmb.Text)>0 then
   sql := sql +' and OSTATE = '''+trim(statecmb.Text)+'''';
 if length(cardNo_edt.Text)>0 then
   sql := sql +' and MCID like ''%'+trim(cardNo_edt.Text)+'%''';
   
 if length(payTypecmb.Text)>0 then
   sql := sql +' and ( OSPAYTYPE = '''+trim(payTypecmb.Text)+''' or OSPAYTYPE1 = '''+trim(payTypecmb.Text)+''')';

 if ((length(zk_edt.Text)>0) and
     (zk_edt.Text<>'-1') and
     (zk_edt.Text<>'(1)') ) then
   sql := sql +' and OSZK = '+trim(zk_edt.Text);
 if length(OCOMMID_edt.Text)>0 then
   sql := sql +' and OCOMMID like ''%'+trim(OCOMMID_edt.Text)+'%''';


openqy(order_qy,sql);

end;

procedure TCheckOrderFrm.chk_btClick(Sender: TObject);
var
  //CheckOrderDetailFrm:TCheckOrderDetailFrm;
  PayOrderFrm:TPayOrderFrm;
begin
if not order_qy.Active then exit;
if order_qy.IsEmpty then exit;

{CheckOrderDetailFrm:= TCheckOrderDetailFrm.Create(nil);
openqy(CheckOrderDetailFrm.comm_order_qy,'select * from TB_ORDER where OCOMMID='''+order_qy.FieldByName('OCOMMID').AsString+''' and OID<>'''+order_qy.FieldByName('OID').AsString+'''');
 //打开消费项目
openqy(CheckOrderDetailFrm.item_qy,'select * from TB_ORDER_SERVCEITEM where OID='''+order_qy.Fieldbyname('OID').AsString+'''');
CheckOrderDetailFrm.item_qy.Edit;
 //打开推荐项目
openqy(CheckOrderDetailFrm.tj_qy,'select * from TB_ORDER_TJ where OID='''+order_qy.Fieldbyname('OID').AsString+'''');

CheckOrderDetailFrm.total_lab.Caption:=floattostr(order_qy.FieldByName('OSSKCOUNT').AsFloat);
order_qy.Edit;
CheckOrderDetailFrm.ShowModal;
CheckOrderDetailFrm.Free;}
PayOrderFrm:= TPayOrderFrm.Create(nil);
PayOrderFrm.Caption:='核单';
PayOrderFrm.comm_pay_bt.Hide;
PayOrderFrm.Pay_bt.Hide;
PayOrderFrm.hd_bt.Show;

PayOrderFrm.ONUM_edt.Text:=order_qy.fieldbyname('ONUM').AsString;
payOrderFrm.qry_bt.Click;
PayOrderFrm.ShowModal;
PayOrderFrm.Free;


end;

procedure TCheckOrderFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action := cafree;
end;

procedure TCheckOrderFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if integer(Key)=27 then
   close;
end;

procedure TCheckOrderFrm.DBGridEh6TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
sortstring:string; //排序列
begin
//进行排序
with Column do
begin
if FieldName = '' then
  Exit;

case Title.SortMarker of
  smNoneEh:
  begin
      Title.SortMarker := smUpEh;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stAscending;
  end;
  smDownEh:
  begin
      Title.SortMarker := smUpEh; 
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stAscending;
  end;
  smUpEh:
  begin
     Title.SortMarker := smDownEh;
     ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
     ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stDescending;
  end;

end;
end;

end;

procedure TCheckOrderFrm.del_btClick(Sender: TObject);
begin
if not order_qy.Active then exit;
if order_qy.IsEmpty then exit;
 
if (messagebox(0,'您确认要删除吗？','提示',mb_iconquestion+mb_yesno)=id_yes) then
  begin
    exeSql('delete from TB_ORDER_SERVCEITEM where OID='''+order_qy.fieldbyname('OID').AsString+'''');
    exeSql('delete from TB_ORDER_TJ where OID = '''+order_qy.fieldbyname('OID').AsString+'''');
    order_qy.Delete;
    order_qy.ApplyUpdates;
    
  end;
  
end;

procedure TCheckOrderFrm.FormCreate(Sender: TObject);
begin
if mainfrm.user_type='总经理' then
  del_bt.Show
else
  del_bt.Hide;
  
end;

end.
