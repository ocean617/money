unit NewOrderUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzLabel, RzEdit, RzButton,
  RzRadChk, DBGridEhGrouping, GridsEh, DBGridEh,
  DB, ZAbstractRODataset, ZDataset,
  Buttons, Grids, RzGrids,Math, RzDBEdit,
  DBCtrlsEh, Mask;

type
  TNewOrderFrm = class(TForm)
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    ONUM_edt: TRzEdit;
    RzLabel2: TRzLabel;
    seqNum_edt: TRzEdit;
    RzLabel3: TRzLabel;
    RzGroupBox1: TRzGroupBox;
    items_group: TRzGroupBox;
    RzPanel2: TRzPanel;
    SaveOrder_bt: TRzBitBtn;
    close_bt: TRzBitBtn;
    memo_group: TGroupBox;
    memo_edt: TMemo;
    OPCOUNT_edt: TRzNumericEdit;
    RzPanel3: TRzPanel;
    RzPanel5: TRzPanel;
    RzPanel6: TRzPanel;
    RzPanel7: TRzPanel;
    Item_1: TComboBox;
    Room_1: TComboBox;
    InTime_1: TComboBox;
    Item_2: TComboBox;
    Room_2: TComboBox;
    InTime_2: TComboBox;
    Item_3: TComboBox;
    Room_3: TComboBox;
    Room_4: TComboBox;
    Item_4: TComboBox;
    InTime_4: TComboBox;
    InTime_3: TComboBox;
    Item_5: TComboBox;
    Item_6: TComboBox;
    Item_8: TComboBox;
    Item_7: TComboBox;
    Room_8: TComboBox;
    Room_7: TComboBox;
    Room_6: TComboBox;
    Room_5: TComboBox;
    InTime_5: TComboBox;
    InTime_6: TComboBox;
    InTime_7: TComboBox;
    InTime_8: TComboBox;
    Item_10: TComboBox;
    Item_9: TComboBox;
    Room_9: TComboBox;
    Room_10: TComboBox;
    InTime_9: TComboBox;
    InTime_10: TComboBox;
    tj_items_group: TRzGroupBox;
    RzPanel4: TRzPanel;
    RzPanel8: TRzPanel;
    RzPanel9: TRzPanel;
    RzPanel10: TRzPanel;
    TjItem_1: TComboBox;
    TjCount_1: TComboBox;
    TjName_1: TComboBox;
    TjItem_2: TComboBox;
    TjCount_2: TComboBox;
    TjName_2: TComboBox;
    TjItem_3: TComboBox;
    TjCount_3: TComboBox;
    TjCount_4: TComboBox;
    TjItem_4: TComboBox;
    TjName_4: TComboBox;
    TjName_3: TComboBox;
    Label4: TLabel;
    payTypecmb: TComboBox;
    CommChk: TRzCheckBox;
    RzLabel4: TRzLabel;
    CommNum_edt: TRzEdit;
    SaveNextComm_bt: TRzBitBtn;
    RzLabel5: TRzLabel;
    order_date: TDBDateTimeEditEh;
    procedure close_btClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RzToolbarButton1Click(Sender: TObject);
    procedure SaveOrder_btClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Room_1Change(Sender: TObject);
    procedure InTime_1Change(Sender: TObject);
    procedure SaveNextComm_btClick(Sender: TObject);
    procedure CommChkClick(Sender: TObject);
  private
     oid:string;
     procedure opends(qry:tzreadonlyquery;sql:string);
     //读取所有项目
     procedure ReadAllItems();
  public
    { Public declarations }
  end;

var
  NewOrderFrm: TNewOrderFrm;

implementation

uses commUnt, mainUnt;

{$R *.dfm}

procedure TNewOrderFrm.close_btClick(Sender: TObject);
begin
  close;
end;

procedure TNewOrderFrm.FormCreate(Sender: TObject);
begin
  oid:=CreateNewId;
  seqNum_edt.Text:= getNextSeqNum('order');
  CommNum_edt.Text:= 'T'+getNextSeqNum('commorder');
  ReadAllItems;
  order_date.Value:=now();
end;

procedure TNewOrderFrm.opends(qry: tzreadonlyquery; sql: string);
begin
 if qry.Active then qry.Close;
 qry.SQL.Clear;
 qry.SQL.Add(sql);
 qry.Open;
end;

procedure TNewOrderFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
  begin
  if (self.ActiveControl.ClassName='TComboBox') and
     (pos('Item_',(self.ActiveControl as TComboBox).Name)=0) and
     (length((self.ActiveControl as TComboBox).Text)=0) then
       tjItem_1.SetFocus
  else
       SendMessage(self.Handle,WM_NEXTDLGCTL,0,0);
  end;
   
 if integer(Key)=27 then
   close_btClick(self);
end;

procedure TNewOrderFrm.RzToolbarButton1Click(Sender: TObject);
begin
//exesql('delete from TB_ORDER_SERVCEITEM where OSID ='''+jbxh_qy.fieldbyname('OSID').AsString+'''');
//opends(jbxh_qy,'select * from TB_ORDER_SERVCEITEM where OID='''+oid+'''');
end;

procedure TNewOrderFrm.SaveOrder_btClick(Sender: TObject);
var
  qry:Tzquery;
  i:integer;
  AStrings: TStringList;
  ItemCmb,RoomCmb,InTimeCmb,TjItemCmb,TjCountCmb,TjNameCmb:TComboBox;
  scount:real;
  id:string;
begin
  if length(ONUM_edt.Text)=0 then
    begin
      messagebox(0,'请输入单号.','提示',mb_iconinformation);
      ONUM_edt.SetFocus;
      exit;
    end;
  if length(OPCOUNT_edt.Text)=0 then
    begin
      messagebox(0,'请输入总客数.','提示',mb_iconinformation);
      OPCOUNT_edt.SetFocus;
      exit;
    end;
  if length(item_1.Text)=0 then
    begin
      messagebox(0,'请至少输入一个消费项目.','提示',mb_iconinformation);
      item_1.SetFocus;
      exit;
    end;

  if getCount('select count(*) as scount from TB_ORDER where ONUM='''+ONUM_edt.Text+''' and OSTATE=''开单''')>0 then
    begin
      messagebox(0,'该单号已经开过，请重新选择单号.','提示',mb_iconinformation);
      item_1.SetFocus;
      exit;
    end;
    
  scount:=0.0;
  qry:=Tzquery.Create(self);
  qry.Connection:=mainfrm.conn;

  //添加消费项目
   AStrings := TStringList.Create;
   qry.SQL.Clear;
   qry.SQL.Add('select * from  TB_ORDER_SERVCEITEM where 1=2');
   qry.Open;
   for i:=1 to 10 do
     begin
       ItemCmb:=self.FindComponent('Item_'+inttostr(i)) as TComboBox;
       RoomCmb:=self.FindComponent('Room_'+inttostr(i)) as TComboBox;
       InTimeCmb:=self.FindComponent('InTime_'+inttostr(i)) as TComboBox;

       if (length(trim(ItemCmb.Text)))=0 then break;
       AStrings.Clear;
       ExtractStrings([' '], ['#', '.'], pchar(ItemCmb.Text),AStrings);
       if AStrings.Count<>2 then continue;

       qry.Append;
       qry.FieldByName('OSID').AsString:=CreateNewId;
       qry.FieldByName('OID').AsString:=oid;
       qry.FieldByName('ONUM').AsString:=ONUM_edt.Text;
       id:=getID('select SID as ID from TB_BASE_SERVICEITEM where SCODE='''+trim(Astrings[0])+'''');
       qry.FieldByName('SID').AsString:=id;
       qry.FieldByName('SCODE').AsString:=copy(ItemCmb.Text,0,pos(' ',ItemCmb.Text));
       
       //得到消费金额
       scount := scount + getItemPrice(id,payTypecmb.ItemIndex+1);
       
       qry.FieldByName('SITEMNAME').AsString:=trim(Astrings[1]);
       qry.FieldByName('SROOMNUM').AsString:=RoomCmb.Text;
       qry.FieldByName('STOROOMTIME').AsString:=InTimeCmb.Text;
       qry.FieldByName('PZCOUNT').AsInteger:=1;
       qry.FieldByName('PJCOUNT').AsInteger:=0;
       qry.FieldByName('DZCOUNT').AsInteger:=0;
       qry.FieldByName('DJCOUNT').AsInteger:=0;
       
       qry.FieldByName('TOTALCOST').AsFloat:=getItemPrice(id,payTypecmb.ItemIndex+1);
       qry.FieldByName('ZK').AsInteger:=10;

       qry.FieldByName('XH').AsInteger:= i;

       qry.Post;
     end;
   qry.Close;

  //添加推荐项目
   qry.SQL.Clear;
   qry.SQL.Add('select * from  TB_ORDER_TJ where 1=2');
   qry.Open;
   for i:=1 to 4 do
     begin
       TjItemCmb:=self.FindComponent('TjItem_'+inttostr(i)) as TComboBox;
       TjCountCmb:=self.FindComponent('TjCount_'+inttostr(i)) as TComboBox;
       TjNameCmb:=self.FindComponent('TjName_'+inttostr(i)) as TComboBox;
       
       if (length(trim(TjItemCmb.Text)))=0 then break;
       AStrings.Clear;
       ExtractStrings([' '], ['#', '.'], pchar(TjItemCmb.Text),AStrings);
       if AStrings.Count<>2 then continue;

       qry.Append;
       qry.FieldByName('TID').AsString:=CreateNewId;
       qry.FieldByName('OID').AsString:=oid;
       id:=getID('select SID as ID from TB_BASE_SERVICEITEM where SCODE='''+trim(Astrings[0])+'''');
       qry.FieldByName('SID').AsString:=id;
       qry.FieldByName('TITEMNAME').AsString:=trim(Astrings[1]);       
       qry.FieldByName('TITEMCOUNT').AsInteger:=strtoint(TjCountCmb.Text);

       AStrings.Clear;
       ExtractStrings([' '], ['#', '.'], pchar(TjNameCmb.Text),AStrings);
       if AStrings.Count<>2 then continue;

       id:=getID('select EID as ID from TB_EMPLOYEE where ENUM='''+trim(Astrings[0])+'''');
       qry.FieldByName('TJEID').AsString:=id;
       qry.FieldByName('TJENAME').AsString:=trim(Astrings[1]);
       
       qry.Post;
     end;
  qry.close;

  //添加单数据
  qry.SQL.Clear;
  qry.SQL.Add('select * from TB_ORDER where 1=2');
  qry.Open;
  qry.Append;

  qry.FieldByName('OID').AsString:=oid;
  qry.FieldByName('ONUM').AsString:=ONUM_edt.Text;
  qry.FieldByName('ODATE').AsDateTime:=vartodatetime(order_date.Value);
  qry.FieldByName('OXH').AsString:=seqNum_edt.Text;
  qry.FieldByName('OCOMMID').AsString:=CommNum_edt.Text;
  qry.FieldByName('OPCOUNT').AsInteger:=OPCOUNT_edt.IntValue;
  qry.FieldByName('OSYID').AsString:=mainfrm.user_id;
  qry.FieldByName('OSYNAME').AsString:=mainfrm.user_name;
  qry.FieldByName('OSYKDDATE').AsDateTime:=now();
  qry.FieldByName('OSTATE').AsString:='开单';
  qry.FieldByName('OMEMO').AsString:=memo_edt.Text;
  qry.FieldByName('OSTYPE').AsString:=payTypecmb.Text;
  qry.FieldByName('OSPAYTYPE').AsString:='现金';
  qry.FieldByName('OSZK').AsInteger:=10;
  qry.FieldByName('OSSKCOUNT').AsFloat:=roundto(scount,-2);
  qry.Post;
     
  qry.Free;
  AStrings.Free;
  Messagebox(self.Handle,'已经成功开单.','提示',mb_iconinformation);
   
  seqNum_edt.Text:= getNextSeqNum('order');
  oid:=CreateNewId;
  if not CommChk.Checked then
    CommNum_edt.Text:= 'T'+getNextSeqNum('commorder');

 ONUM_edt.Clear;
 OPCOUNT_edt.Value:=1;
 memo_edt.Clear;
 ONUM_edt.SetFocus;
end;

procedure TNewOrderFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TNewOrderFrm.ReadAllItems;
var
  lst:Tstringlist;
  qry:TzReadonlyquery;
  i:integer;
begin
  lst:=Tstringlist.Create;
  qry:=TzReadonlyquery.Create(nil);
  qry.Connection:=mainfrm.conn;
  
  opends(qry,'select SCODE,SITEMNAME,SITEMKIND from TB_BASE_SERVICEITEM order by SCODE ');
  while not qry.Eof do
   begin

     if ((qry.fieldbyname('SITEMKIND').AsString='推荐项目') or
         (qry.fieldbyname('SITEMKIND').AsString='推荐产品')) then
       begin
        for i:=1 to 4 do
          (self.FindComponent('TjItem_'+inttostr(i)) as TComboBox).Items.Add(qry.fieldbyname('SCODE').AsString+' '+qry.fieldbyname('SITEMNAME').AsString);
       end
     else
       begin
         for i:=1 to 10 do
           (self.FindComponent('Item_'+inttostr(i)) as TComboBox).Items.Add(qry.fieldbyname('SCODE').AsString+' '+qry.fieldbyname('SITEMNAME').AsString);
       end;
     qry.Next;
   end;

  opends(qry,'select ENUM,ENAME from TB_EMPLOYEE order by ENUM ');
  while not qry.Eof do
   begin
     for i:=1 to 4 do
       (self.FindComponent('TjName_'+inttostr(i)) as TComboBox).Items.Add(qry.fieldbyname('ENUM').AsString+' '+qry.fieldbyname('ENAME').AsString);
     qry.Next;
   end;
  
  qry.Free;
  lst.Free;

end;

procedure TNewOrderFrm.Room_1Change(Sender: TObject);
var
 i:integer;
begin
for i:=2 to 10 do
   (self.FindComponent('Room_'+inttostr(i)) as TComboBox).Text:=Room_1.Text;
   
end;

procedure TNewOrderFrm.InTime_1Change(Sender: TObject);
var
 i:integer;
begin
for i:=2 to 10 do
   (self.FindComponent('InTime_'+inttostr(i)) as TComboBox).Text:=InTime_1.Text;
end;

procedure TNewOrderFrm.SaveNextComm_btClick(Sender: TObject);
begin
CommNum_edt.Text:= 'T'+getNextSeqNum('commorder');
end;

procedure TNewOrderFrm.CommChkClick(Sender: TObject);
begin
if  CommChk.Checked then
  CommNum_edt.Text:= 'T'+getNextSeqNum('commorder');
  
end;

end.
