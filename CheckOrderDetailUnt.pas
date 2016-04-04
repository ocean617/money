unit CheckOrderDetailUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzButton, RzRadChk, StdCtrls, Mask, RzLabel, ExtCtrls,
  RzPanel, DBGridEhGrouping, GridsEh, DBGridEh, Buttons, RzDBEdit, DBCtrls,
  DB, ZAbstractRODataset, ZDataset, ZAbstractDataset, 
  DBAdvEd, RzCmboBx, RzDBCmbo;

type
  TCheckOrderDetailFrm = class(TForm)
    RzPanel2: TRzPanel;
    SaveOrder_bt: TRzBitBtn;
    close_bt: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    RzToolbarButton1: TRzToolbarButton;
    grid: TDBGridEh;
    RzToolbarButton2: TRzToolbarButton;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox4: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    RzDBNumericEdit4: TRzDBNumericEdit;
    RzDBNumericEdit5: TRzDBNumericEdit;
    RzBitBtn2: TRzBitBtn;
    RzLabel12: TRzLabel;
    RzGroupBox5: TRzGroupBox;
    comm_order_grid: TDBGridEh;
    OMEMO_edt: TRzDBMemo;
    DBGridEh2: TDBGridEh;
    tj_add_bt: TRzToolbarButton;
    tj_del_bt: TRzToolbarButton;
    item_ds: TDataSource;
    order_ds: TDataSource;
    item_qy: TZQuery;
    order_qy: TZQuery;
    RzGroupBox6: TRzGroupBox;
    RzLabel13: TRzLabel;
    RzDBEdit6: TRzDBEdit;
    RzLabel14: TRzLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzLabel15: TRzLabel;
    RzDBEdit7: TRzDBEdit;
    RzLabel16: TRzLabel;
    RzDBNumericEdit6: TRzDBNumericEdit;
    RzGroupBox7: TRzGroupBox;
    comm_order_qy: TZQuery;
    comm_order_ds: TDataSource;
    RzLabel19: TRzLabel;
    payTypecmb: TRzDBComboBox;
    RzLabel17: TRzLabel;
    OrderpayTypeCmb: TRzDBComboBox;
    RzLabel18: TRzLabel;
    RzDBNumericEdit7: TRzDBNumericEdit;
    Label1: TLabel;
    total_lab: TLabel;
    Pay_bt: TRzBitBtn;
    DBGridEh1: TDBGridEh;
    serviceItem_qy: TZQuery;
    serviceItem_ds: TDataSource;
    js_qy: TZQuery;
    js_ds: TDataSource;
    tj_ds: TDataSource;
    tj_qy: TZQuery;
    member_panel: TPanel;
    RzLabel23: TRzLabel;
    RzDBEdit9: TRzDBEdit;
    pchk: TCheckBox;
    priorOrder_bt: TRzBitBtn;
    nextOrder_bt: TRzBitBtn;
    ItemCmb: TComboBox;
    jsCmb: TComboBox;
    RzLabel20: TRzLabel;
    RzDBNumericEdit8: TRzDBNumericEdit;
    RzLabel1: TRzLabel;
    RzDBComboBox1: TRzDBComboBox;
    RzLabel21: TRzLabel;
    RzDBEdit5: TRzDBEdit;
    RzLabel24: TRzLabel;
    RzDBEdit8: TRzDBEdit;
    Panel1: TPanel;
    RzLabel4: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    procedure SaveOrder_btClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure order_qyAfterOpen(DataSet: TDataSet);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure close_btClick(Sender: TObject);
    procedure RzToolbarButton1Click(Sender: TObject);
    procedure RzToolbarButton2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn7Click(Sender: TObject);
    procedure RzBitBtn10Click(Sender: TObject);
    procedure tj_add_btClick(Sender: TObject);
    procedure tj_del_btClick(Sender: TObject);
    procedure Pay_btClick(Sender: TObject);
    procedure OrderpayTypeCmbChange(Sender: TObject);
    procedure order_qyAfterClose(DataSet: TDataSet);
    procedure nextOrder_btClick(Sender: TObject);
    procedure priorOrder_btClick(Sender: TObject);
  private
    //计算实际消费总额
    procedure CalcTotal();
  public
    { Public declarations }
  end;

var
  CheckOrderDetailFrm: TCheckOrderDetailFrm;

implementation

uses commUnt, mainUnt,Math, CheckOrderUnt;

{$R *.dfm}

procedure TCheckOrderDetailFrm.SaveOrder_btClick(Sender: TObject);
begin
try
    RzDBEdit9.DataSource.DataSet.Edit;
    RzDBEdit9.DataSource.DataSet.Post;
    messagebox(0,'数据保存成功.','提示',mb_iconinformation);
except
end;

end;

procedure TCheckOrderDetailFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then
   SendMessage(self.Handle,WM_NEXTDLGCTL,0,0);
end;

procedure TCheckOrderDetailFrm.order_qyAfterOpen(DataSet: TDataSet);
begin
 if dataset.IsEmpty then exit;
 openqy(comm_order_qy,'select * from TB_ORDER where OCOMMID='''+dataset.FieldByName('OCOMMID').AsString+''' and OSTATE=''开单'' and OID<>'''+dataset.FieldByName('OID').AsString+'''');
 //打开消费项目
 openqy(item_qy,'select * from TB_ORDER_SERVCEITEM where OID='''+dataset.Fieldbyname('OID').AsString+'''');
 item_qy.Edit;
 //打开推荐项目
 openqy(tj_qy,'select * from TB_ORDER_TJ where OID='''+dataset.Fieldbyname('OID').AsString+'''');
end;

procedure TCheckOrderDetailFrm.RzBitBtn2Click(Sender: TObject);
var
  payType:string;
  moneySum:real;
  tmpqy:Tzquery;
begin
try
  if not(item_qy.State in [dsInsert,dsEdit])then
    begin
      if item_qy.RecordCount=0 then item_qy.Append
      else
        item_qy.Edit;
    end;
    
  payType:=RzDBEdit9.DataSource.DataSet.fieldbyname('OSTYPE').AsString;
  if payType='白天价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,1);
  if payType='晚上价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,2);
  if payType='会员价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,3);
  if payType='VIP价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,4);

    moneySum :=  Roundto((item_qy.fieldbyname('PZCOUNT').AsFloat+
                 item_qy.fieldbyname('PJCOUNT').AsFloat+
                 item_qy.fieldbyname('DZCOUNT').AsFloat+
                 item_qy.fieldbyname('DJCOUNT').AsFloat) * moneySum,-2);
    //算上折扣
    moneySum :=  Roundto( moneySum * (item_qy.fieldbyname('ZK').AsInteger * 10 /100),-2);

  item_qy.fieldbyname('TOTALCOST').AsFloat := moneySum;
  item_qy.Post;

  CalcTotal;
except
end;

end;

procedure TCheckOrderDetailFrm.close_btClick(Sender: TObject);
begin
  close;
end;

procedure TCheckOrderDetailFrm.CalcTotal;
var
 qry:Tzquery;
 tmpvalue:real;
begin
if not RzDBEdit9.DataSource.DataSet.Active then exit;
try
qry:=Tzquery.Create(self);
qry.Connection:=mainfrm.conn;
qry.SQL.Add('select sum(TOTALCOST) totalCost from TB_ORDER_SERVCEITEM where ONUM='''+rzDBEdit9.DataSource.DataSet.fieldbyname('ONUM').asstring+'''');
qry.open;
tmpvalue := qry.fieldbyname('totalCost').AsFloat;
tmpvalue :=  Roundto( tmpvalue * (RzDBEdit9.DataSource.DataSet.fieldbyname('OSZK').AsInteger * 10 /100),-2);

RzDBEdit9.DataSource.DataSet.Edit;
RzDBEdit9.DataSource.DataSet.FieldByName('OSSKCOUNT').AsFloat:=tmpvalue;
RzDBEdit9.DataSource.DataSet.Post;

total_lab.Caption:=floattostr(tmpvalue);
qry.Close;
qry.Free;
except
end;
end;

procedure TCheckOrderDetailFrm.RzToolbarButton1Click(Sender: TObject);
begin
try
  if (messagebox(0,'是否要删除该消费项目？','提示',mb_iconquestion+mb_yesno)=id_yes) then
    item_qy.Delete;
except
end;
end;

procedure TCheckOrderDetailFrm.RzToolbarButton2Click(Sender: TObject);
begin
try
    item_qy.Append;
    item_qy.FieldByName('OSID').AsString:=CreateNewId();
    item_qy.FieldByName('OID').AsString:=  RzDBEdit9.DataSource.DataSet.fieldbyname('OID').AsString;
    item_qy.FieldByName('ONUM').AsString:= RzDBEdit9.DataSource.DataSet.fieldbyname('ONUM').AsString;
except
end;
end;

procedure TCheckOrderDetailFrm.RzBitBtn1Click(Sender: TObject);
begin
try
if not(item_qy.State in [dsEdit, dsInsert]) then
  item_qy.edit;

item_qy.fieldbyname('SID').AsString := serviceItem_qy.Fieldbyname('SID').AsString;
item_qy.fieldbyname('SITEMNAME').AsString := serviceItem_qy.Fieldbyname('SITEMNAME').AsString;
item_qy.Post;
except
  begin
    showmessage('请您先点击左边+按钮，再进行数据的添加.');
    item_qy.Cancel;
  end;
end;

end;

procedure TCheckOrderDetailFrm.FormCreate(Sender: TObject);
begin
 openqy(serviceItem_qy,'select * from TB_BASE_SERVICEITEM');
 openqy(js_qy,'select * from TB_EMPLOYEE');
end;

procedure TCheckOrderDetailFrm.RzBitBtn7Click(Sender: TObject);
begin
try
if not(item_qy.State in [dsEdit, dsInsert]) then
  item_qy.edit;

item_qy.fieldbyname('EID').AsString := js_qy.Fieldbyname('EID').AsString;
item_qy.fieldbyname('ENUM').AsString := js_qy.Fieldbyname('ENUM').AsString;
item_qy.fieldbyname('ENAME').AsString := js_qy.Fieldbyname('ENAME').AsString;
item_qy.Post;
except
  begin
    showmessage('请您先点击左边+按钮，再进行数据的添加.');
    item_qy.Cancel;
  end;
end;

end;

procedure TCheckOrderDetailFrm.RzBitBtn10Click(Sender: TObject);
begin
try
 tj_qy.Cancel;
except
end;

end;

procedure TCheckOrderDetailFrm.tj_add_btClick(Sender: TObject);
begin
 tj_qy.Append;
 tj_qy.FieldByName('TID').AsString:=CreateNewId();
 tj_qy.FieldByName('OID').AsString:=RzDBEdit9.DataSource.DataSet.FieldByName('OID').AsString;
 tj_qy.FieldByName('TITEMCOUNT').AsInteger:=1;;
 
end;

procedure TCheckOrderDetailFrm.tj_del_btClick(Sender: TObject);
begin
try
  tj_qy.Delete;
except
end;

end;

procedure TCheckOrderDetailFrm.Pay_btClick(Sender: TObject);
begin
if RzDBEdit9.DataSource.DataSet.FieldByName('OSTATE').AsString='开单' then
 begin
    messagebox(0,'还未结单，不允许核单!.','提示',mb_iconinformation);
    exit;
 end;
if RzDBEdit9.DataSource.DataSet.FieldByName('OSTATE').AsString='核单' then
 begin
    messagebox(0,'该单已经核对过了!.','提示',mb_iconinformation);
    exit;
 end;
  
if (messagebox(0,'核对无误吗？','提示',mb_iconquestion+mb_yesno)=id_yes) then
  begin
    try
     RzDBEdit9.DataSource.DataSet.Edit;
     RzDBEdit9.DataSource.DataSet.FieldByName('OSTATE').AsString:='核单';
     RzDBEdit9.DataSource.DataSet.FieldByName('OCWID').AsString:=mainfrm.user_id;
     RzDBEdit9.DataSource.DataSet.FieldByName('OCWNAME').AsString:=mainfrm.user_name;
     RzDBEdit9.DataSource.DataSet.FieldByName('OCWHDDATE').AsDateTime:=now();

     if pchk.Checked then
       RzDBEdit9.DataSource.DataSet.FieldByName('OSISJS').AsInteger:=0
     else
       RzDBEdit9.DataSource.DataSet.FieldByName('OSISJS').AsInteger:=1;

     RzDBEdit9.DataSource.DataSet.Post;
     messagebox(0,'已经成功核单.','提示',mb_iconinformation);

    except
      on E:Exception do
         messagebox(0,pchar('结单出错，提示为'+e.Message),'提示',mb_iconerror);
    end;
    
  end;
  
end;

procedure TCheckOrderDetailFrm.OrderpayTypeCmbChange(Sender: TObject);
begin
if OrderpayTypeCmb.Text='刷会员卡' then
  member_panel.Show
else
  member_panel.Hide;
  
end;

procedure TCheckOrderDetailFrm.order_qyAfterClose(DataSet: TDataSet);
begin
try
  comm_order_qy.Close;
  item_qy.Close;
  tj_qy.Close;
except
end;

end;

procedure TCheckOrderDetailFrm.nextOrder_btClick(Sender: TObject);
begin
try
 RzDBEdit6.DataSource.DataSet.Next;
 RzDBEdit6.DataSource.DataSet.Edit;
 openqy(comm_order_qy,'select * from TB_ORDER where OCOMMID='''+RzDBEdit6.DataSource.DataSet.FieldByName('OCOMMID').AsString+''' and OID<>'''+RzDBEdit6.DataSource.DataSet.FieldByName('OID').AsString+'''');
 //打开消费项目
 openqy(item_qy,'select * from TB_ORDER_SERVCEITEM where OID='''+RzDBEdit6.DataSource.DataSet.Fieldbyname('OID').AsString+'''');
 item_qy.Edit;
 //打开推荐项目
 openqy(tj_qy,'select * from TB_ORDER_TJ where OID='''+RzDBEdit6.DataSource.DataSet.Fieldbyname('OID').AsString+'''');
 total_lab.Caption:=floattostr(RzDBEdit6.DataSource.DataSet.FieldByName('OSSKCOUNT').AsFloat);

except
end;
end;

procedure TCheckOrderDetailFrm.priorOrder_btClick(Sender: TObject);
begin
try
 RzDBEdit6.DataSource.DataSet.Prior;
 RzDBEdit6.DataSource.DataSet.Edit;
 openqy(comm_order_qy,'select * from TB_ORDER where OCOMMID='''+RzDBEdit6.DataSource.DataSet.FieldByName('OCOMMID').AsString+''' and OID<>'''+RzDBEdit6.DataSource.DataSet.FieldByName('OID').AsString+'''');
 //打开消费项目
 openqy(item_qy,'select * from TB_ORDER_SERVCEITEM where OID='''+RzDBEdit6.DataSource.DataSet.Fieldbyname('OID').AsString+'''');
 item_qy.Edit;
 //打开推荐项目
 openqy(tj_qy,'select * from TB_ORDER_TJ where OID='''+RzDBEdit6.DataSource.DataSet.Fieldbyname('OID').AsString+'''');
 total_lab.Caption:=floattostr(RzDBEdit6.DataSource.DataSet.FieldByName('OSSKCOUNT').AsFloat);

except
end;
end;

end.
