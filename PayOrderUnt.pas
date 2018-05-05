unit PayOrderUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzButton, RzRadChk, StdCtrls, Mask, RzLabel, ExtCtrls,
  RzPanel, DBGridEhGrouping, GridsEh, DBGridEh, Buttons, RzDBEdit, DBCtrls,
  DB, ZAbstractRODataset, ZDataset, ZAbstractDataset, 
  RzCmboBx, RzDBCmbo, DBCtrlsEh,comObj,DateUtils;

type
  TPayOrderFrm = class(TForm)
    topPane: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    CommNum_edt: TRzEdit;
    qry_bt: TRzBitBtn;
    bottomPane: TRzPanel;
    SaveOrder_bt: TRzBitBtn;
    close_bt: TRzBitBtn;
    centerGrp: TRzGroupBox;
    RzToolbarButton1: TRzToolbarButton;
    grid: TDBGridEh;
    RzToolbarButton2: TRzToolbarButton;
    DetailGrp: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    TtGrp: TRzGroupBox;
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
    SaveItemBt: TRzBitBtn;
    RzLabel12: TRzLabel;
    TjManGrp: TRzGroupBox;
    comm_order_grid: TDBGridEh;
    OMEMO_edt: TRzDBMemo;
    DBGridEh2: TDBGridEh;
    tj_add_bt: TRzToolbarButton;
    tj_del_bt: TRzToolbarButton;
    item_ds: TDataSource;
    order_ds: TDataSource;
    item_qy: TZQuery;
    order_qy: TZQuery;
    topleftGrp: TRzGroupBox;
    RzLabel13: TRzLabel;
    RzDBEdit6: TRzDBEdit;
    RzLabel14: TRzLabel;
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
    Label1: TLabel;
    Pay_bt: TRzBitBtn;
    DBGridEh1: TDBGridEh;
    tj_ds: TDataSource;
    member_panel: TPanel;
    RzLabel23: TRzLabel;
    RzDBEdit9: TRzDBEdit;
    pchk: TCheckBox;
    comm_pay_bt: TRzBitBtn;
    total_edt: TDBEditEh;
    ONUM_edt: TComboBox;
    tj_qy: TZQuery;
    ItemCmb: TComboBox;
    jsCmb: TComboBox;
    Label2: TLabel;
    Bevel1: TBevel;
    tjItemCmb: TComboBox;
    tjCount: TRzNumericEdit;
    TjjsCmb: TComboBox;
    RzLabel20: TRzLabel;
    RzDBNumericEdit8: TRzDBNumericEdit;
    hd_bt: TRzBitBtn;
    zdLabel: TLabel;
    order_date: TDBDateTimeEditEh;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    OrderpayTypeCmb1: TRzDBComboBox;
    RzLabel24: TRzLabel;
    member_panel1: TPanel;
    RzLabel25: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    Label3: TLabel;
    comm_total_edt: TEdit;
    Label4: TLabel;
    changeAmoutBt: TRzBitBtn;
    amout_change_panel: TRzPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    uedt: TComboBox;
    passedt: TRzEdit;
    newAmount_edt: TRzEdit;
    RzBitBtn1: TRzBitBtn;
    memberCardQueryBtn: TRzBitBtn;
    member_card_query_panel: TRzPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    uedt1: TComboBox;
    passedt1: TRzEdit;
    phone_edt: TRzEdit;
    RzBitBtn2: TRzBitBtn;
    Label11: TLabel;
    RzBitBtn3: TRzBitBtn;
    cardnum_edt: TMemo;
    procedure SaveOrder_btClick(Sender: TObject);
    procedure qry_btClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure order_qyAfterOpen(DataSet: TDataSet);
    procedure comm_order_gridDblClick(Sender: TObject);
    procedure SaveItemBtClick(Sender: TObject);
    procedure close_btClick(Sender: TObject);
    procedure RzToolbarButton1Click(Sender: TObject);
    procedure RzToolbarButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tj_add_btClick(Sender: TObject);
    procedure tj_del_btClick(Sender: TObject);
    procedure Pay_btClick(Sender: TObject);
    procedure OrderpayTypeCmbChange(Sender: TObject);
    procedure order_qyAfterClose(DataSet: TDataSet);
    procedure comm_pay_btClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure payTypecmbChange(Sender: TObject);
    procedure item_qyAfterScroll(DataSet: TDataSet);
    procedure noPayBtClick(Sender: TObject);
    procedure commNoPayClick(Sender: TObject);
    procedure hd_btClick(Sender: TObject);
    procedure updateZdLabel();
    procedure OrderpayTypeCmb1Change(Sender: TObject);
    procedure order_qyBeforePost(DataSet: TDataSet);
    procedure RzDBEdit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure changeAmoutBtClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure memberCardQueryBtnClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
  private
    //计算实际消费总额
    procedure CalcTotal();
    //读取所有单
    procedure getAllOrders();
    //读取项目和技师
    procedure getAllItemsAndJs();
    //读取非收银类型的用户列表
    procedure readUsers2List();
  public
    orderState:string;
    { Public declarations }
  end;

var
  PayOrderFrm: TPayOrderFrm;

implementation

uses commUnt, mainUnt,Math, CommPayHitsUnt;

{$R *.dfm}

procedure TPayOrderFrm.SaveOrder_btClick(Sender: TObject);
var
  totalsum:Real;
begin
if not RzDBEdit6.DataSource.DataSet.Active then exit;
try
if order_qy.state in [dsEdit,dsInsert] then
    order_qy.Post;

 //计算该单的团体总额
  totalsum:= getCount('select round(sum(OSSKCOUNT),2) scount from TB_ORDER where OCOMMID='''+order_qy.FieldByName('OCOMMID').AsString+'''');
  comm_total_edt.Text := FloatToStr(totalsum);
         
order_qy.Edit;
  
messagebox(0,'数据保存成功.','提示',mb_iconinformation);
except
end;

end;

procedure TPayOrderFrm.qry_btClick(Sender: TObject);
var
  sqlstr:string;
begin
if (length(ONUM_edt.Text)=0) and (length(CommNum_edt.Text)=0) then
  begin
    Messagebox(0,'请输入单号或团体单号.','提示',mb_iconinformation);
    exit;
  end;
 if self.Caption='结单' then
   sqlstr := 'select * from TB_ORDER where OSTATE=''开单'' and 1=1 '
 else
   sqlstr := 'select * from TB_ORDER where 1=1 ';

 if length(ONUM_edt.Text)>0 then
   sqlstr := sqlstr + ' and ONUM='''+ONUM_edt.Text+'''';

 if length(CommNum_edt.Text)>0 then
   sqlstr := sqlstr + ' and OCOMMID'''+CommNum_edt.Text+'''';

 openqy(order_qy,sqlstr);

 if order_qy.IsEmpty then Messagebox(0,'没有找到任何数据，请检查该单是否已经结帐或是单号输入错误.','提示',mb_iconinformation)
 else
  begin
    order_qy.Edit;
    if order_qy.FieldByName('OSPAYTYPE').AsString='刷会员卡' then
       member_panel.Show
    else
       member_panel.Hide;

    if order_qy.FieldByName('OSPAYTYPE1').AsString='刷会员卡' then
       member_panel1.Show
    else
       member_panel1.Hide;

    //order_qy.fieldbyname('OSPAYTYPESUM').AsFloat := order_qy.fieldbyname('OSSKCOUNT').AsFloat;
  end;

  updateZdLabel;
end;

procedure TPayOrderFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then
   SendMessage(self.Handle,WM_NEXTDLGCTL,0,0);
 if integer(Key)=27 then
   close_btClick(self); 
end;

procedure TPayOrderFrm.order_qyAfterOpen(DataSet: TDataSet);
var
  totalsum:real;
begin
 if dataset.IsEmpty then exit;
 openqy(comm_order_qy,'select * from TB_ORDER where OCOMMID='''+dataset.FieldByName('OCOMMID').AsString+''' and OID<>'''+dataset.FieldByName('OID').AsString+'''');

 //打开消费项目
 openqy(item_qy,'select * from TB_ORDER_SERVCEITEM where OID='''+dataset.Fieldbyname('OID').AsString+''' order by XH');
 item_qy.Edit;
 //打开推荐项目
 openqy(tj_qy,'select * from TB_ORDER_TJ where OID='''+dataset.Fieldbyname('OID').AsString+'''');

 //计算该单的团体总额
  totalsum:= getCount('select round(sum(OSSKCOUNT),2) scount from TB_ORDER where OCOMMID='''+dataset.FieldByName('OCOMMID').AsString+'''');
  comm_total_edt.Text := FloatToStr(totalsum);

end;

procedure TPayOrderFrm.comm_order_gridDblClick(Sender: TObject);
var
 sqlstr:string;
begin
if not comm_order_qy.Active then exit;
if comm_order_qy.IsEmpty then exit;
sqlstr := 'select * from TB_ORDER where ONUM='''+comm_order_qy.FieldByName('ONUM').AsString+'''';
openqy(order_qy,sqlstr);

if order_qy.IsEmpty then Messagebox(0,'没有找到任何数据.','提示',mb_iconinformation)
 else
   order_qy.Edit;
   
end;

procedure TPayOrderFrm.SaveItemBtClick(Sender: TObject);
var
  payType,Id:string;
  zk,moneySum,totalsum:real;
  tmpqy:Tzquery;
begin

try
  zk:=StrToFloat(RzDBEdit3.Text);
except
  begin
   MessageBox(0,'折扣应该是数字','提示',MB_ICONERROR);
   exit;
  end;
end;

if ((zk<5) or (zk>10)) then
  begin
    MessageBox(0,'折扣不能小于5或大于10','提示',MB_ICONERROR);
    exit;
  end;

try
  if not(item_qy.State in [dsInsert,dsEdit])then
    begin
      if item_qy.RecordCount=0 then item_qy.Append
      else
        item_qy.Edit;
    end;

  if (item_qy.State in [dsInsert])then
    begin
      item_qy.FieldByName('OSID').AsString:=CreateNewId;
      item_qy.FieldByName('OID').AsString:=order_qy.FieldByName('OID').AsString;
      item_qy.FieldByName('ONUM').AsString:=order_qy.FieldByName('ONUM').AsString;
      item_qy.FieldByName('XH').AsInteger:=item_qy.RecordCount+1;
    end;
    
  //得到项目ID
  if length(ItemCmb.Text)>0 then
    begin
      Id:= trim(getID('select SID as ID from TB_BASE_SERVICEITEM where SCODE='''+copy(ItemCmb.Text,0,pos(' ',ItemCmb.Text))+''''));
      item_qy.fieldbyname('SID').AsString:=Id;
      item_qy.fieldbyname('SCODE').AsString:=trim(copy(ItemCmb.Text,0,pos(' ',ItemCmb.Text)));
      item_qy.fieldbyname('SITEMNAME').AsString:=trim(copy(ItemCmb.Text,pos(' ',ItemCmb.Text),length(ItemCmb.Text)-pos('',ItemCmb.Text)));

      Id:= trim(getID('select EID as ID from TB_EMPLOYEE where ENUM='''+copy(jsCmb.Text,0,pos(' ',jsCmb.Text))+''''));
      item_qy.fieldbyname('EID').AsString:=Id;
      item_qy.fieldbyname('ENUM').AsString:=trim(copy(jsCmb.Text,0,pos(' ',jsCmb.Text)));
      item_qy.fieldbyname('ENAME').AsString:=trim(copy(jsCmb.Text,pos(' ',jsCmb.Text),length(jsCmb.Text)-pos('',jsCmb.Text)));

    end;
  //得到JSID

  payType:=order_qy.fieldbyname('OSTYPE').AsString;
  if payType='白天价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,1);
  if payType='晚上价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,2);
  if payType='会员价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,3);
  if payType='VIP价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,4);
  if payType='团购价' then
    moneySum:=getItemPrice(item_qy.fieldbyname('SID').AsString,5);

    moneySum :=  Roundto((item_qy.fieldbyname('PZCOUNT').AsFloat+
                 item_qy.fieldbyname('PJCOUNT').AsFloat+
                 item_qy.fieldbyname('DZCOUNT').AsFloat+
                 item_qy.fieldbyname('DJCOUNT').AsFloat) * moneySum,-2);
    //算上折扣
    moneySum :=  Roundto( moneySum * (item_qy.fieldbyname('ZK').AsFloat * 10 /100),-2);
    
  if RzDBNumericEdit8.Value = 0 then
     begin
      item_qy.fieldbyname('TOTALCOST').AsFloat := moneySum;
      RzDBEdit5.Text := FloatToStr(moneySum);
     end;
  

  
  item_qy.Post;

  CalcTotal;

   //计算该单的团体总额
  totalsum:= getCount('select round(sum(OSSKCOUNT),2) scount from TB_ORDER where OCOMMID='''+order_qy.FieldByName('OCOMMID').AsString+'''');
  comm_total_edt.Text := FloatToStr(totalsum);
  
except
end;

end;

procedure TPayOrderFrm.close_btClick(Sender: TObject);
begin
  close;
end;

procedure TPayOrderFrm.CalcTotal;
var
 qry:Tzquery;
 tmpvalue:real;
begin
if not order_qy.Active then exit;
try
qry:=Tzquery.Create(self);
qry.Connection:=mainfrm.conn;
qry.SQL.Add('select sum(TOTALCOST) totalCost from TB_ORDER_SERVCEITEM where ONUM='''+order_qy.fieldbyname('ONUM').asstring+'''');
qry.open;
tmpvalue := qry.fieldbyname('totalCost').AsFloat;
tmpvalue :=  Roundto( tmpvalue * (order_qy.fieldbyname('OSZK').AsInteger * 10 /100),-2);

order_qy.Edit;
order_qy.FieldByName('OSSKCOUNT').AsFloat:=tmpvalue;
total_edt.Text:=order_qy.FieldByName('OSSKCOUNT').AsString;
order_qy.Post;

//total_lab.Caption:=floattostr(tmpvalue);
qry.Close;
qry.Free;
except
end;
end;

procedure TPayOrderFrm.RzToolbarButton1Click(Sender: TObject);
begin
try
  if (messagebox(0,'是否要删除该消费项目？','提示',mb_iconquestion+mb_yesno)=id_yes) then
    item_qy.Delete;
except
end;
end;

procedure TPayOrderFrm.RzToolbarButton2Click(Sender: TObject);
begin
try
    item_qy.Append;
    item_qy.FieldByName('OSID').AsString:=CreateNewId();
    item_qy.FieldByName('OID').AsString:= order_qy.fieldbyname('OID').AsString;
    item_qy.FieldByName('ONUM').AsString:= order_qy.fieldbyname('ONUM').AsString;
    item_qy.FieldByName('PZCOUNT').AsInteger:=0;
    item_qy.FieldByName('PJCOUNT').AsInteger:=0;
    item_qy.FieldByName('DZCOUNT').AsInteger:=0;
    item_qy.FieldByName('DJCOUNT').AsInteger:=0;
    item_qy.FieldByName('TOTALCOST').AsInteger:=0;
    item_qy.FieldByName('ZK').AsInteger:=10;
except
end;
end;

procedure TPayOrderFrm.FormCreate(Sender: TObject);
begin
  changeAmoutBt.Hide;
  orderState:='结单';
// openqy(js_qy,'select * from TB_EMPLOYEE order by ENUM');
// openqy(sItem_qy,'select * from TB_BASE_SERVICEITEM where SITEMKIND=''推荐项目'' order by SCODE');
// openqy(tjs_qy,'select * from TB_EMPLOYEE');
 getAllOrders;
 getAllItemsAndJs;
 updateZdLabel;

 //读取非收银员名称列表
 readUsers2List;

 //收银员不能修改消费总额
 if mainfrm.user_type = '收银员' then
   begin
     total_edt.ReadOnly:=true;
     changeAmoutBt.Show;
   end;
 
end;

procedure TPayOrderFrm.tj_add_btClick(Sender: TObject);
var
 Id:string;
begin
if not tj_qy.Active then exit;
if ((length(tjItemCmb.Text)= 0 ) or (length(TjjsCmb.Text)= 0 )) then exit;

 tj_qy.Append;
 tj_qy.FieldByName('TID').AsString:=CreateNewId();
 tj_qy.FieldByName('OID').AsString:=order_qy.FieldByName('OID').AsString;
 tj_qy.FieldByName('TITEMCOUNT').AsInteger:=tjCount.IntValue;
 //项目编号与技师编号
  Id:= trim(getID('select SID as ID from TB_BASE_SERVICEITEM where SCODE='''+copy(tjItemCmb.Text,0,pos(' ',tjItemCmb.Text))+''''));
  tj_qy.fieldbyname('SID').AsString:=Id;
  tj_qy.fieldbyname('TITEMNAME').AsString:=trim(copy(tjItemCmb.Text,pos(' ',tjItemCmb.Text),length(tjItemCmb.Text)-pos('',tjItemCmb.Text)));
      
  Id:= trim(getID('select EID as ID from TB_EMPLOYEE where ENUM='''+copy(TjjsCmb.Text,0,pos(' ',TjjsCmb.Text))+''''));      
  tj_qy.fieldbyname('TJEID').AsString:=Id;
  tj_qy.fieldbyname('TJENAME').AsString:=trim(copy(TjjsCmb.Text,pos(' ',TjjsCmb.Text),length(TjjsCmb.Text)-pos('',TjjsCmb.Text)));

 tj_qy.Post;
end;

procedure TPayOrderFrm.tj_del_btClick(Sender: TObject);
begin
try
  tj_qy.Delete;
except
end;

end;

procedure TPayOrderFrm.Pay_btClick(Sender: TObject);
var
 scount:real;
 member_qry,qry:Tzquery;
 excel,Sheet:variant;
 fileId,sfilename,tfilename,tmpstr,tmpstr1:string;
 last_banlance,last_banlance1:Real;
 i:integer;
 tmpvalue,totalsum:real;
 //打印变量
 tmp_MCSHOWID,tmp_MMONEY:string;
 sms_content,send_content,phone,jf,mname:string;
begin
if not RzDBEdit6.DataSource.DataSet.Active then exit;
sms_content :='尊敬的{会员姓名}会员，您卡号为{会员卡号}于{消费时间}消费{消费金额}元，余额{金额}元，现在的总积分为{积分余额},感谢您的支持，欢迎下次光临！';
 
//先保存
try
if order_qy.state in [dsEdit,dsInsert] then
    order_qy.Post;

 //计算该单的团体总额
  totalsum:= getCount('select round(sum(OSSKCOUNT),2) scount from TB_ORDER where OCOMMID='''+order_qy.FieldByName('OCOMMID').AsString+'''');
  comm_total_edt.Text := FloatToStr(totalsum);
         
order_qy.Edit;
except
end;

//上次消费余额
last_banlance :=0.0;
last_banlance1 :=0.0;

tmpstr :='';
tmpstr1 :='';

if (messagebox(0,'您确认要结帐吗？','提示',mb_iconquestion+mb_yesno)=id_yes) then
  begin
    try

     self.orderState:='结单';
     //会员消费(付款方式1)
     if ((OrderpayTypeCmb.ItemIndex=2) and (order_qy.FieldByName('OSPAYTYPESUM').AsFloat>0)) then
        begin
           //得到上次消费余额
           //last_banlance := getCount('select MBALANCE as scount from tb_member_paylog where MCID='''+ RzDBEdit9.Text+''' order by MDATE desc limit 1');
           //读基本资料里面的余额
           last_banlance := getCount('select MMONEY as scount from tb_members where MCID='''+ RzDBEdit9.Text+''' ');

           member_qry:=Tzquery.Create(self);
           member_qry.Connection:=mainfrm.conn;
           member_qry.SQL.Add('select * from TB_MEMBERS where MCID='''+RzDBEdit9.Text+''' and MGQDATE>= now() ');
           member_qry.open;
           if member_qry.IsEmpty then
             begin
               member_qry.Free;
               showmessage('未找到该会员或该会员卡已经过期，请检查资料或卡号对应是否错误.');
               exit;
             end;
           
           scount:= member_qry.fieldbyname('MMONEY').AsFloat;
           tmpvalue:=0.0;
           try
              tmpvalue:= strtofloat(RzDBEdit5.Text);
           except
           end;

           if ((OrderpayTypeCmb.ItemIndex=2) and (scount<tmpvalue)) then
             begin
               showmessage('该会员余额不足，帐面余额为:'+floattostr(scount));
               member_qry.Free;
               exit;
             end;

           if (orderState<>'免单') then
             begin
              exeSql('update TB_MEMBERS set MMONEY=MMONEY-'+floattostr(order_qy.FieldByName('OSPAYTYPESUM').AsFloat)+' where MCID='''+RzDBEdit9.Text+'''');
              exeSql('update TB_MEMBERS set MJF=IFNULL(MJF,0)+'+floattostr(order_qy.FieldByName('OSPAYTYPESUM').AsFloat)+' where MCID='''+RzDBEdit9.Text+'''');
             end;
              
           //更新消费记录
           qry:=Tzquery.Create(self);
           qry.Connection:=mainfrm.conn;
           
           qry.SQL.Add('select * from TB_MEMBER_PAYLOG where 1=2');
           qry.open;
           qry.Append;
           qry.FieldByName('PID').AsString:=CreateNewId();
           qry.FieldByName('MID').AsString:=member_qry.fieldbyname('MID').AsString;
           qry.FieldByName('MNAME').AsString:=member_qry.fieldbyname('MNAME').AsString;
           qry.FieldByName('MCID').AsString:=member_qry.fieldbyname('MCID').AsString;
           qry.FieldByName('MCSHOWID').AsString:=member_qry.fieldbyname('MCSHOWID').AsString;
           qry.FieldByName('MPAYCOUNT').AsFloat:=order_qy.FieldByName('OSPAYTYPESUM').AsFloat;
           qry.FieldByName('OID').AsString:=order_qy.fieldbyname('OID').AsString;
           qry.FieldByName('MDATE').AsDateTime:=now();
           
           if (orderState<>'免单') then
             qry.FieldByName('MBALANCE').AsFloat:= scount-order_qy.FieldByName('OSPAYTYPESUM').AsFloat
           else
             qry.FieldByName('MBALANCE').AsFloat:= scount;
             
           qry.post;
           qry.Free;
           member_qry.Free;
        end;
        
     //付款方式2
     if ((OrderpayTypeCmb1.ItemIndex=2) and (order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat>0)) then
        begin
            //得到上次消费余额
           //last_banlance1 := getCount('select MBALANCE as scount from tb_member_paylog where MCID='''+ RzDBEdit1.Text+''' order by MDATE desc limit 1');
           //读基本资料里面的余额
           last_banlance1 := getCount('select MMONEY as scount from tb_members where MCID='''+ RzDBEdit1.Text+''' ');

           member_qry:=Tzquery.Create(self);
           member_qry.Connection:=mainfrm.conn;
           member_qry.SQL.Add('select * from TB_MEMBERS where MCID='''+RzDBEdit1.Text+''' and MGQDATE>= now() ');
           member_qry.open;
           if member_qry.IsEmpty then
             begin
               member_qry.Free;
               showmessage('未找到该会员，请检查资料或卡号对应是否错误.');
               exit;
             end;
           
           scount:= member_qry.fieldbyname('MMONEY').AsFloat;
           tmpvalue:=0.0;
           try
              tmpvalue:= strtofloat(RzDBEdit8.Text);
           except
           end;
           
           if ((OrderpayTypeCmb1.ItemIndex=2) and (scount<tmpvalue)) then
             begin
               showmessage('该会员余额不足，帐面余额为:'+floattostr(scount));
               member_qry.Free;
               exit;
             end;

           if (orderState<>'免单') then
              begin
                exeSql('update TB_MEMBERS set MMONEY=MMONEY-'+floattostr(order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat)+' where MCID='''+RzDBEdit1.Text+'''');
                exeSql('update TB_MEMBERS set MJF=IFNULL(MJF,0)+'+floattostr(order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat)+' where MCID='''+RzDBEdit1.Text+'''');
              end;
              
           //更新消费记录
           qry:=Tzquery.Create(self);
           qry.Connection:=mainfrm.conn;
           qry.SQL.Add('select * from TB_MEMBER_PAYLOG where 1=2');
           qry.open;
           qry.Append;
           qry.FieldByName('PID').AsString:=CreateNewId();
           qry.FieldByName('MID').AsString:=member_qry.fieldbyname('MID').AsString;
           qry.FieldByName('MNAME').AsString:=member_qry.fieldbyname('MNAME').AsString;
           qry.FieldByName('MCID').AsString:=member_qry.fieldbyname('MCID').AsString;
           qry.FieldByName('MCSHOWID').AsString:=member_qry.fieldbyname('MCSHOWID').AsString;
           qry.FieldByName('MPAYCOUNT').AsFloat:=order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat;
           qry.FieldByName('OID').AsString:=order_qy.fieldbyname('OID').AsString;
           qry.FieldByName('MDATE').AsDateTime:=now();
           
           if (orderState<>'免单') then
             qry.FieldByName('MBALANCE').AsFloat:= scount-order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat
           else
             qry.FieldByName('MBALANCE').AsFloat:= scount;
             
           qry.post;
           qry.Free;
           member_qry.Free;
        end;

     if not(order_qy.State in [dsEdit,dsInsert]) then
        order_qy.Edit;
        
     order_qy.FieldByName('OSTATE').AsString:=orderState;
     order_qy.FieldByName('OSYID').AsString:=mainfrm.user_id;
     order_qy.FieldByName('OSYNAME').AsString:=mainfrm.user_name;
     order_qy.FieldByName('OSYJDDATE').AsDateTime:=now();

     //采用了付款方式1或2
     if ((OrderpayTypeCmb1.ItemIndex=2) and (order_qy.FieldByName('OSPAYTYPESUM').AsFloat>0)) then
       order_qy.FieldByName('MCID').AsString:=RzDBEdit9.Text;
       
     if ((OrderpayTypeCmb1.ItemIndex=2) and (order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat>0)) then
       order_qy.FieldByName('MCID1').AsString:=RzDBEdit1.Text;
     
     if pchk.Checked then
       order_qy.FieldByName('OSISJS').AsInteger:=0
     else
       order_qy.FieldByName('OSISJS').AsInteger:=1;
     
     order_qy.Post;
     
     if (messagebox(0,'是否打单输出？','提示',mb_yesno+mb_iconquestion)=id_yes) then
      begin
        //打印操作
          fileId:=CreateNewId;
          sfilename:=extractFilepath(application.exename)+'report\template\sy.xls';
          tfilename:=extractFilepath(application.exename)+'report\reportfiles\sy\'+FileId+'.xls';
          copyfile(pchar(sfilename),pchar(tfilename),false);
          //将数据导入Excel
          try
              excel:= CreateOleObject('Excel.Application');
              excel.Visible := true;//是否显示
              excel.workbooks.open(tfilename);
              Sheet:= excel.Workbooks[1].WorkSheets[1];
              //内容添加
              Sheet.Cells[2,2] :=RzDBEdit6.Text;
              Sheet.Cells[2,4] :=RzDBNumericEdit6.Text;
              Sheet.Cells[3,2] :=datetostr(now());
              Sheet.Cells[4,2] :=OrderpayTypeCmb.Text;
              
              if (order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat>0)then
                    Sheet.Cells[5,2] :=OrderpayTypeCmb1.Text;
              
              if ((trim(OrderpayTypeCmb.Text)='刷会员卡') and (Length(order_qy.FieldByName('MCID').AsString)>0)) then
                 begin
                    //得到余额
                    tmp_MCSHOWID:=getID('select MCSHOWID as ID from TB_MEMBERS where MCID='''+order_qy.FieldByName('MCID').AsString+'''');
                    tmp_MMONEY:= floattostr(roundto(getCount('select MMONEY as scount from TB_MEMBERS where MCID='''+ order_qy.fieldbyname('MCID').AsString+''''),-2));
                    tmpstr :='卡号:'+tmp_MCSHOWID+' 本次余额:'+tmp_MMONEY;
                    tmpstr := tmpstr +#13#10+'上次余额：'+floattostr(Roundto(last_banlance,-2));
                    //发送短信

                    send_content:=  StringReplace(sms_content,'{会员卡号}',tmp_MCSHOWID,[rfReplaceAll]);
                    send_content := StringReplace(send_content,'{消费时间}',FormatdateTime('c',now),[rfReplaceAll]);
                    send_content := StringReplace(send_content,' ','_',[rfReplaceAll]);
                    send_content:=  StringReplace(send_content,'{消费金额}',total_edt.Text,[rfReplaceAll]);
                    send_content:=  StringReplace(send_content,'{金额}', tmp_MMONEY,[rfReplaceAll]);
                    //发送短信
                    phone:= getID('select MPHONE as ID from TB_MEMBERS where MCID='''+order_qy.FieldByName('MCID').AsString+'''');
                    mname:= getID('select MNAME as ID from TB_MEMBERS where MCID='''+order_qy.FieldByName('MCID').AsString+'''');
                    jf :=   getID('select MJF as ID from TB_MEMBERS where MCID='''+order_qy.FieldByName('MCID').AsString+'''');

                    send_content:=  StringReplace(send_content,'{会员姓名}', mname,[rfReplaceAll]);
                    send_content:=  StringReplace(send_content,'{积分余额}', jf,[rfReplaceAll]);
                    try
                     if length(phone)>0 then
                       mainfrm.sendsms(phone,send_content);
                    except
                    end;

                 end
              else if (order_qy.FieldByName('OSPAYTYPESUM').AsFloat>0) then
                begin
                  tmpstr:=tmpstr +  order_qy.FieldByName('OSPAYTYPE').AsString+'消费:'+ FloatToStr(Roundto(order_qy.FieldByName('OSPAYTYPESUM').AsFloat,-2));
                end;
                 

              if ((trim(OrderpayTypeCmb1.Text)='刷会员卡') and (Length(order_qy.FieldByName('MCID1').AsString)>0)) then
                 begin
                   tmp_MCSHOWID:=getID('select MCSHOWID as ID from TB_MEMBERS where MCID='''+order_qy.FieldByName('MCID1').AsString+'''');
                   tmp_MMONEY:= floattostr(roundto(getCount('select MMONEY as scount from TB_MEMBERS where MCID='''+ order_qy.fieldbyname('MCID1').AsString+''''),-2));

                   tmpstr1 :=  '卡号:'+tmp_MCSHOWID+' 余额:'+tmp_MMONEY;
                   tmpstr1 := tmpstr1 +#13#10+'上次余额：'+floattostr(Roundto(last_banlance1,-2));

                   //发送短信
                    send_content:=  StringReplace(sms_content,'{会员卡号}',tmp_MCSHOWID,[rfReplaceAll]);
                    send_content := StringReplace(send_content,'{消费时间}',FormatdateTime('c',now),[rfReplaceAll]);
                    send_content := StringReplace(send_content,' ','_',[rfReplaceAll]);
                    send_content:=  StringReplace(send_content,'{消费金额}',total_edt.Text,[rfReplaceAll]);
                    send_content:=  StringReplace(send_content,'{金额}', tmp_MMONEY,[rfReplaceAll]);
                    //发送短信
                    phone:= getID('select MPHONE as ID from TB_MEMBERS where MCID='''+order_qy.FieldByName('MCID1').AsString+'''');
                    mname:= getID('select MNAME as ID from TB_MEMBERS where MCID='''+order_qy.FieldByName('MCID1').AsString+'''');
                    jf :=   getID('select MJF as ID from TB_MEMBERS where MCID='''+order_qy.FieldByName('MCID1').AsString+'''');

                    send_content:=  StringReplace(send_content,'{会员姓名}', mname,[rfReplaceAll]);
                    send_content:=  StringReplace(send_content,'{积分余额}', jf,[rfReplaceAll]);
                    try
                     if length(phone)>0 then
                       mainfrm.sendsms(phone,send_content);
                    except
                    end;
                     
                 end
               else if (order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat>0) then
                begin
                  tmpstr1:= tmpstr1 + order_qy.FieldByName('OSPAYTYPE1').AsString+'消费:'+ FloatToStr(Roundto(order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat,-2));
                end;   
                 
              Sheet.Cells[4,5] := tmpstr;
              Sheet.Cells[5,5] := tmpstr1;
              
              //添加消费项目
              item_qy.First;
              i:=8; 
              while (not item_qy.Eof) do
                begin
                  Sheet.Cells[i,1] := item_qy.FieldByName('SITEMNAME').AsString;
                  Sheet.Cells[i,2] := item_qy.FieldByName('SROOMNUM').AsString;
                  Sheet.Cells[i,3] := item_qy.FieldByName('ENUM').AsString;
                  Sheet.Cells[i,4] := item_qy.FieldByName('PZCOUNT').AsString;
                  Sheet.Cells[i,5] := item_qy.FieldByName('PJCOUNT').AsString;
                  Sheet.Cells[i,6] := item_qy.FieldByName('DZCOUNT').AsString;
                  Sheet.Cells[i,7] := item_qy.FieldByName('DJCOUNT').AsString;
                  Sheet.Cells[i,8] := item_qy.FieldByName('TOTALCOST').AsString;
                  if item_qy.FieldByName('ZK').AsInteger=10 then
                     Sheet.Cells[i,9] := '无'
                  else
                     Sheet.Cells[i,9] := item_qy.FieldByName('ZK').AsString+'折';

                  inc(i);
                  item_qy.Next;
                end;
            
              Sheet.Cells[i+1,1] :='合计';
              Sheet.Cells[i+1,8] :=total_edt.Text;
              Sheet.PrintPreview;
            except
              Showmessage('初始化Excel失败，可能没有安装Excel，请安装Excel后进行打印回单输出。');
              excel.DisplayAlerts := false;//是否提示存盘
              excel.Quit;//如果出错则退出
              exit;
            end;
     end;
     
     order_qy.Close;
     messagebox(0,'已经成功结单并已经发送消费短信.','提示',mb_iconinformation);
     getAllOrders;
     updateZdLabel;
     
    except
      on E:Exception do
         messagebox(0,pchar('结单出错，提示为'+e.Message),'提示',mb_iconerror);
    end;
    
  end;
  
end;

procedure TPayOrderFrm.OrderpayTypeCmbChange(Sender: TObject);
begin
if OrderpayTypeCmb.Text='刷会员卡' then
  member_panel.Show
else
  member_panel.Hide;
  
end;

procedure TPayOrderFrm.order_qyAfterClose(DataSet: TDataSet);
begin
try
  comm_order_qy.Close;
  item_qy.Close;
  tj_qy.Close;
except
end;

end;

procedure TPayOrderFrm.comm_pay_btClick(Sender: TObject);
var
 CommPayHitsFrm:TCommPayHitsFrm;
 scount,ordersum,tmpvalue:real;
 d_numstr:string;
 i:integer;
begin
if not RzDBEdit6.DataSource.DataSet.Active then exit;
if ((length(RzDBEdit5.Text)=0) and (length(RzDBEdit8.Text)=0)) then
  begin
    messagebox(0,'结帐金额不能为空.','提示',mb_iconinformation);
    exit;
  end;

if comm_order_qy.RecordCount=0 then
  begin
    messagebox(0,'该单不是团体单，请直接结帐即可.','提示',mb_iconinformation);
    exit;
  end;

   
//保存数据
try
if order_qy.state in [dsEdit,dsInsert] then
    order_qy.Post;
       
order_qy.Edit;
except
end;
  
self.orderState:='结单';

 scount:=0.0;
 d_numstr:='';
 
 CommPayHitsFrm:= TCommPayHitsFrm.Create(self);
 CommPayHitsFrm.pfrm:=self;

 //赋值
 CommPayHitsFrm.scount_label.Caption:=inttostr(comm_order_qy.RecordCount+1);
 CommPayHitsFrm.comm_label.Caption:=RzDBEdit7.Text;
 comm_order_qy.First;
   for i:=0 to comm_order_qy.RecordCount-1 do
     begin    
        //免单金额不加入计算
        if comm_order_qy.FieldByName('OSPAYTYPE').AsString<>'免单' then
           scount := scount + comm_order_qy.fieldbyname('OSSKCOUNT').AsFloat;

        d_numstr:= d_numstr+comm_order_qy.fieldbyname('ONUM').AsString+',';
        comm_order_qy.Next;
     end;
 comm_order_qy.First;
 
 scount := scount + RzDBEdit6.DataSource.DataSet.fieldbyname('OSSKCOUNT').AsFloat;
 ordersum :=   roundto(scount,-2);
 d_numstr:= d_numstr+RzDBEdit6.DataSource.DataSet.fieldbyname('ONUM').AsString;
 
 CommPayHitsFrm.Ordernum_Label.Caption:=d_numstr;
 CommPayHitsFrm.sj_count_edt.Text:=floattostr(ordersum);
 
 //检查值是否为总共单的和
 tmpvalue:=0.0;
 
   if ((OrderpayTypeCmb.ItemIndex>=0) and (Length(RzDBEdit5.Text)>0)) then
     try
        tmpvalue :=StrToFloat( RzDBEdit5.Text);
     except
     end;

   if ((OrderpayTypeCmb1.ItemIndex>=0) and (Length(RzDBEdit8.Text)>0)) then
     try
        tmpvalue :=tmpvalue + StrToFloat( RzDBEdit8.Text);
     except
     end;

     tmpvalue :=  roundto(tmpvalue,-2);
{
 if(ordersum <> tmpvalue) then
    begin
      showmessage('团体单的总额不正确.请保证付款方式1与付款方式2的付款总额等于团体单总额.');
      CommPayHitsFrm.Free;
    end
 else
   begin
      CommPayHitsFrm.ShowModal;
      CommPayHitsFrm.Free;
   end;
 }
 CommPayHitsFrm.ShowModal;
 CommPayHitsFrm.Free;

 getAllOrders;
 updateZdLabel;
end;

procedure TPayOrderFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TPayOrderFrm.getAllOrders;
var
 qry:Tzquery;
begin
 qry:=Tzquery.Create(self);
 qry.Connection:=mainfrm.conn;
 qry.SQL.Add('select * from TB_ORDER where OSTATE=''开单'' order by ONUM');
 qry.Open;
 ONUM_edt.Items.Clear;
 while(not qry.Eof) do 
   begin
     ONUM_edt.Items.Add(qry.fieldbyname('ONUM').AsString);
     qry.Next;
   end;
 qry.Close;
 qry.Free;
end;

procedure TPayOrderFrm.payTypecmbChange(Sender: TObject);
var
 scount:real;
begin
if item_qy.IsEmpty then exit;
scount := 0.0;

item_qy.First;
while( not item_qy.Eof) do
  begin
     item_qy.Edit;
     scount:=commUnt.getItemPrice(item_qy.FieldByName('SID').asstring,payTypecmb.ItemIndex+1);
     scount:=scount*(item_qy.fieldbyname('PZCOUNT').AsFloat+item_qy.fieldbyname('PJCOUNT').AsFloat+item_qy.fieldbyname('DZCOUNT').AsFloat+item_qy.fieldbyname('DJCOUNT').AsFloat);
     //折扣
     scount:=scount*((item_qy.FieldByName('ZK').AsInteger*10)/100);
     item_qy.FieldByName('TOTALCOST').AsFloat:= roundTo(scount,-2);
     item_qy.Post;
     item_qy.Next;
  end;
  
item_qy.First;
CalcTotal;
end;

procedure TPayOrderFrm.getAllItemsAndJs;
var
 qry:Tzquery;
begin
 qry:=Tzquery.Create(self);
 qry.Connection:=mainfrm.conn;
 qry.SQL.Add('select * from TB_BASE_SERVICEITEM where SITEMKIND<>''推荐项目'' and SITEMKIND<>''推荐产品'' order by SCODE');
 qry.Open;
 ItemCmb.Items.Clear;
 while(not qry.Eof) do
   begin
     ItemCmb.Items.Add(qry.fieldbyname('SCODE').AsString+' '+qry.fieldbyname('SITEMNAME').AsString);
     qry.Next;
   end;
 qry.Close;

 qry.SQL.Clear;
 qry.SQL.Add('select * from TB_EMPLOYEE where ETYPE=''技师'' order by ENUM');
 qry.Open;
 jsCmb.Items.Clear;
 while(not qry.Eof) do 
   begin
     jsCmb.Items.Add(qry.fieldbyname('ENUM').AsString+' '+qry.fieldbyname('ENAME').AsString);
     qry.Next;
   end;
 qry.Close;

 qry.SQL.Clear;
 qry.SQL.Add('select * from TB_BASE_SERVICEITEM where SITEMKIND=''推荐项目'' or SITEMKIND=''推荐产品'' order by SCODE');
 qry.Open;
 tjItemCmb.Items.Clear;
 while(not qry.Eof) do 
   begin
     tjItemCmb.Items.Add(qry.fieldbyname('SCODE').AsString+' '+qry.fieldbyname('SITEMNAME').AsString);
     qry.Next;
   end;
 qry.Close;

 qry.SQL.Clear;
 qry.SQL.Add('select * from TB_EMPLOYEE order by ENUM');
 qry.Open;
 TjjsCmb.Items.Clear;
 while(not qry.Eof) do 
   begin
     TjjsCmb.Items.Add(qry.fieldbyname('ENUM').AsString+' '+qry.fieldbyname('ENAME').AsString);
     qry.Next;
   end;
 qry.Close;
 
 qry.Free;
end;

procedure TPayOrderFrm.item_qyAfterScroll(DataSet: TDataSet);
var
 itemname:string;
begin
try
 itemname:= trim(dataset.FieldByName('SCODE').AsString)+' '+dataset.FieldByName('SITEMNAME').AsString;
 itemCmb.itemIndex:= itemCmb.Items.IndexOf(itemname);

 itemname:= trim(dataset.FieldByName('ENUM').AsString)+' '+dataset.FieldByName('ENAME').AsString;
 jsCmb.ItemIndex:= jsCmb.Items.IndexOf(itemname);
 
except
end;

end;

procedure TPayOrderFrm.noPayBtClick(Sender: TObject);
begin
self.orderState:='免单';
Pay_bt.Click;

end;

procedure TPayOrderFrm.commNoPayClick(Sender: TObject);
begin
self.orderState:='免单';
comm_pay_bt.Click;
end;

procedure TPayOrderFrm.hd_btClick(Sender: TObject);
begin
if order_qy.FieldByName('OSTATE').AsString='开单' then
 begin
    messagebox(0,'还未结单，不允许核单!.','提示',mb_iconinformation);
    exit;
 end;
if order_qy.FieldByName('OSTATE').AsString='核单' then
 begin
    messagebox(0,'该单已经核对过了!.','提示',mb_iconinformation);
    exit;
 end;
  
if (messagebox(0,'核对无误吗？','提示',mb_iconquestion+mb_yesno)=id_yes) then
  begin
    try
     order_qy.Edit;
     order_qy.FieldByName('OSTATE').AsString:='核单';
     order_qy.FieldByName('OCWID').AsString:=mainfrm.user_id;
     order_qy.FieldByName('OCWNAME').AsString:=mainfrm.user_name;
     order_qy.FieldByName('OCWHDDATE').AsDateTime:=now();

     if pchk.Checked then
       order_qy.FieldByName('OSISJS').AsInteger:=0
     else
       order_qy.FieldByName('OSISJS').AsInteger:=1;

     order_qy.Post;
     messagebox(0,'已经成功核单.','提示',mb_iconinformation);

    except
      on E:Exception do
         messagebox(0,pchar('核单出错，提示为'+e.Message),'提示',mb_iconerror);
    end;
    
  end;
updateZdLabel;  
end;

procedure TPayOrderFrm.updateZdLabel;
var
 s:real;
 sqlstr:string;
 now_day:tdatetime;
begin
 if (Hourof(now())>=0) and (HourOf(now())<5) then
   now_day := incday(now(),-1)
 else
   now_day := now();

 sqlstr:= 'select count(*) as scount from TB_ORDER where OSTATE=''开单'' and OSYKDDATE>='''+formatdatetime('yyyy-MM-dd ',now_day)+' 12:00:00'' and OSYKDDATE<='''+formatdatetime('yyyy-MM-dd ',incday(now_day,1))+' 04:00:00''';
 s:=getCount(sqlstr);
 zdLabel.Caption:='今日未结单数: '+ floattostr(s);

 sqlstr:= 'select count(*) as scount from TB_ORDER where OSTATE=''结单'' and OSYJDDATE>='''+formatdatetime('yyyy-MM-dd ',now_day)+' 12:00:00'' and OSYJDDATE<='''+formatdatetime('yyyy-MM-dd ',incday(now_day,1))+' 04:00:00''';
 s:=getCount(sqlstr);
 zdLabel.Caption:= zdLabel.Caption + ' 结单数: '+ floattostr(s);

 sqlstr:= 'select count(*) as scount from TB_ORDER where OSTATE=''免单'' and ODATE>='''+formatdatetime('yyyy-MM-dd ',now_day)+' 12:00:00'' and ODATE<='''+formatdatetime('yyyy-MM-dd ',incday(now_day,1))+' 04:00:00''';
 s:=getCount(sqlstr);
 zdLabel.Caption:= zdLabel.Caption + ' 免单数: '+ floattostr(s);

 zdLabel.update;
end;

procedure TPayOrderFrm.OrderpayTypeCmb1Change(Sender: TObject);
begin
if OrderpayTypeCmb1.Text='刷会员卡' then
  member_panel1.Show
else
  member_panel1.Hide;
end;

procedure TPayOrderFrm.order_qyBeforePost(DataSet: TDataSet);
var
  zk:Real;
begin
try
  zk:=StrToFloat(RzDBEdit4.Text);
except
  begin
   MessageBox(0,'折扣应该是数字','提示',MB_ICONERROR);
   DataSet.FieldByName('OSZK').AsFloat:=10;
   exit;
  end;
end;

if ((zk<8) or (zk>10)) then
  begin
    MessageBox(0,'折扣不能小于8或大于10','提示',MB_ICONERROR);
    DataSet.FieldByName('OSZK').AsFloat:=10;
    exit;
  end;
end;

procedure TPayOrderFrm.RzDBEdit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{if not(order_qy.Active) then exit;
 if Length(RzDBEdit8.text)=0 then exit;
 if length(RzDBEdit5.text)=0 then exit;

  RzDBEdit8.Text:=floattostr(strtofloat(comm_total_edt.text)-strtofloat(RzDBEdit5.text));
}
end;

procedure TPayOrderFrm.changeAmoutBtClick(Sender: TObject);
begin

newAmount_edt.Text:='';
//由部长修改消费金额
amout_change_panel.Show;

end;

procedure TPayOrderFrm.RzBitBtn1Click(Sender: TObject);
var
  qry:Tzquery;
begin
//用户名密码判断
 if (length(trim(passedt.Text))<=0) then
   begin
    messagebox(0,'请输入密码.','提示',mb_iconinformation);
    passedt.SetFocus;
    exit;
   end;
   
 if (length(trim(newAmount_edt.Text))<=0) then
   begin
    messagebox(0,'请输入金额.','提示',mb_iconinformation);
    newAmount_edt.SetFocus;
    exit;
   end;
   
//检查用户名和密码是否正确
  qry:=Tzquery.Create(self);
  qry.Connection:=mainfrm.conn;
  qry.SQL.Add('select * from TB_USERS where UNAME=:u and UPASS=:p ' );
  
  qry.ParamByName('u').AsString:=trim(uedt.Text);
  qry.ParamByName('p').AsString:=trim(passedt.Text);

  try
   qry.Open;
 except
   begin
     messagebox(0,'数据查询出错,有可能是数据库未启动或缺少连接库.请联系管理员.','提示',mb_iconerror);
     qry.Free;
     exit;
   end;
 end;

 if (qry.IsEmpty) then
    begin
     messagebox(0,'您的用户名或密码错误,请重新输入.','提示',mb_iconerror);
     passedt.SetFocus;
     qry.Close;
     qry.Free;
     exit;
    end;
 
passedt.Text:='';
total_edt.Text:=newAmount_edt.Text;
amout_change_panel.hide;

end;

procedure TPayOrderFrm.readUsers2List;
var
  qry:Tzquery;
begin
  qry:=Tzquery.Create(self);
  qry.Connection:=mainfrm.conn;
  qry.SQL.Add('select * from TB_users where UTYPE<>"收银员" ' );
  qry.Open;
  uedt.Clear;
  while not qry.Eof do
    begin
      uedt.Items.Add(qry.fieldbyname('UNAME').AsString);
      uedt1.Items.Add(qry.fieldbyname('UNAME').AsString);      
      qry.next;
    end;
  qry.Free;

end;

procedure TPayOrderFrm.memberCardQueryBtnClick(Sender: TObject);
begin
member_card_query_panel.Show;
end;

procedure TPayOrderFrm.RzBitBtn2Click(Sender: TObject);
begin
  passedt1.Clear;
  member_card_query_panel.hide;
end;

procedure TPayOrderFrm.RzBitBtn3Click(Sender: TObject);
var
  qry:Tzquery;
  i:integer;
begin
//用户名密码判断
 if (length(trim(passedt1.Text))<=0) then
   begin
    messagebox(0,'请输入密码.','提示',mb_iconinformation);
    passedt1.SetFocus;
    exit;
   end;
   
 if (length(trim(phone_edt.Text))<=0) then
   begin
    messagebox(0,'请输入会员手机号码.','提示',mb_iconinformation);
    phone_edt.SetFocus;
    exit;
   end;
   
//检查用户名和密码是否正确
  qry:=Tzquery.Create(self);
  qry.Connection:=mainfrm.conn;
  qry.SQL.Add('select * from TB_USERS where UNAME=:u and UPASS=:p ' );
  
  qry.ParamByName('u').AsString:=trim(uedt1.Text);
  qry.ParamByName('p').AsString:=trim(passedt1.Text);

  try
   qry.Open;
 except
   begin
     messagebox(0,'数据查询出错,有可能是数据库未启动或缺少连接库.请联系管理员.','提示',mb_iconerror);
     qry.Free;
     exit;
   end;
 end;

 if (qry.IsEmpty) then
    begin
     messagebox(0,'您的用户名或密码错误,请重新输入.','提示',mb_iconerror);
     passedt1.SetFocus;
     qry.Close;
     qry.Free;
     exit;
    end;
 
passedt1.Text:='';
//关闭查询
if qry.Active then qry.Free;

//根据手机号查询会员编号
  qry:=Tzquery.Create(self);
  qry.Connection:=mainfrm.conn;
  qry.SQL.Add('select MCID,MMONEY,MCSHOWID from tb_members where MPHONE=:p and MGQDATE>now()' );
  qry.ParamByName('p').AsString:=trim(phone_edt.Text);
  qry.Open;
  if qry.IsEmpty then
    begin
      messagebox(0,'根据该手机号未找到对应的会员编号.','提示',mb_iconerror);
      qry.Free;
      exit;
    end
  else
    begin
      qry.First;
      for i:=0 to qry.recordcount-1 do
      begin
         cardnum_edt.Text:= cardnum_edt.Text+ qry.fieldbyname('MCSHOWID').AsString+'[余额:'+qry.fieldbyname('MMONEY').AsString+']';
         qry.Next;
      end;

      qry.Close;
      qry.Free;
    end;


end;

end.
