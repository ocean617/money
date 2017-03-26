unit CommPayHitsUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RzButton, RzPanel, RzRadGrp, Mask, RzEdit,ZAbstractRODataset, ZDataset, ZAbstractDataset,PayOrderUnt,ComObj,Math;

type
  TCommPayHitsFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    comm_pay_bt: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    comm_label: TLabel;
    scount_label: TLabel;
    Ordernum_Label: TLabel;
    sj_count_edt: TEdit;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure comm_pay_btClick(Sender: TObject);
  private
    { Private declarations }
  public
    pfrm:TPayOrderFrm;
    paytype:string;
    { Public declarations }
  end;

var
  CommPayHitsFrm: TCommPayHitsFrm;

implementation

uses mainUnt, commUnt;

{$R *.dfm}

procedure TCommPayHitsFrm.RzBitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TCommPayHitsFrm.comm_pay_btClick(Sender: TObject);
var
 scount:real;
 orders_qry,items_qry,member_qry,qry:Tzquery;
 excel,Sheet:variant;
 fileId,sfilename,tfilename,payType,payType1:string;
 i:integer;
 tmpvalue:real;
 last_banlance,last_banlance1:Real;
 //��ǰ�������
 current_order_oid:string;
 //��ӡ����
 tmp_MCSHOWID,tmp_MMONEY:string;
 sms_content,send_content,phone,jf,mname:string;
begin
 last_banlance :=0.0;
 last_banlance1 :=0.0;
 sms_content:='�𾴵�{��Ա����}��Ա��������Ϊ{��Ա����}��{����ʱ��}����{���ѽ��}Ԫ�����{���}Ԫ�����ڵ��ܻ���Ϊ{�������},��л����֧�֣���ӭ�´ι��٣�';
 
if (messagebox(0,'��ȷ��Ҫ������','��ʾ',mb_iconquestion+mb_yesno)=id_yes) then
  begin
    try
      pfrm.orderState:='�ᵥ';
      current_order_oid := pfrm.order_qy.FieldByName('OID').AsString;
      
     //��Ա����(���ʽ1�ۿ�)
     if ((pfrm.OrderpayTypeCmb.ItemIndex=2) and (pfrm.order_qy.FieldByName('OSPAYTYPESUM').AsFloat>0)) then
        begin
           member_qry:=Tzquery.Create(self);
           member_qry.Connection:=mainfrm.conn;
           member_qry.SQL.Add('select * from TB_MEMBERS where MCID='''+pfrm.RzDBEdit9.Text+''' and MGQDATE>= now() ');
           member_qry.open;
           if member_qry.IsEmpty then
             begin
               member_qry.Free;
               showmessage('δ�ҵ��û�Ա��û�Ա���Ѿ����ڣ��������ϻ򿨺Ŷ�Ӧ�Ƿ����.');
               exit;
             end;
           
           scount:= member_qry.fieldbyname('MMONEY').AsFloat;
           tmpvalue:=0.0;
           try
              tmpvalue:= strtofloat(pfrm.RzDBEdit5.Text);
           except
           end;
           
           if scount<tmpvalue then
             begin
               showmessage('�û�Ա���㣬�������Ϊ:'+floattostr(scount));
               member_qry.Free;
               exit;
             end;

           //�ӿ��Ͽۿ�,ͬʱ��ͬ�����  
           if (pfrm.orderState<>'�ⵥ') then
             begin
              exeSql('update TB_MEMBERS set MMONEY=MMONEY-'+floattostr(tmpvalue)+' where MCID='''+pfrm.RzDBEdit9.Text+'''');
              exeSql('update TB_MEMBERS set MJF=IFNULL(MJF,0)+'+floattostr(tmpvalue)+' where MCID='''+pfrm.RzDBEdit9.Text+'''');
             end;


           //�õ��ϴ��������
           //last_banlance := getCount('select MBALANCE as scount from tb_member_paylog where MCID='''+ pfrm.RzDBEdit9.Text+''' order by MDATE desc limit 1');
             //������������������
           //last_banlance := getCount('select MMONEY as scount from tb_members where MCID='''+ pfrm.RzDBEdit9.Text+''' ');
           last_banlance := scount;
           
           //�������Ѽ�¼
           orders_qry:=Tzquery.Create(self);
           orders_qry.Connection:=mainfrm.conn;

           openqy(orders_qry,'select * from TB_ORDER where OCOMMID='''+ pfrm.RzDBEdit7.Text+''' order by ONUM,ODATE');           
           orders_qry.Open;
           orders_qry.First;
           qry:=Tzquery.Create(self);
           qry.Connection:=mainfrm.conn;
           qry.SQL.Add('select * from TB_MEMBER_PAYLOG where 1=2');
           qry.open;
           
           while not orders_qry.Eof do
             begin
               qry.Append;
               qry.FieldByName('PID').AsString:=CreateNewId();
               qry.FieldByName('MID').AsString:=member_qry.fieldbyname('MID').AsString;
               qry.FieldByName('MNAME').AsString:=member_qry.fieldbyname('MNAME').AsString;
               qry.FieldByName('MCID').AsString:=member_qry.fieldbyname('MCID').AsString;
               qry.FieldByName('MCSHOWID').AsString:=member_qry.fieldbyname('MCSHOWID').AsString;
               
               //���ʼǵ���ǰ���ʵĶ�����
               if (current_order_oid =  orders_qry.fieldbyname('OID').AsString) then
                  qry.FieldByName('MPAYCOUNT').AsFloat:=pfrm.order_qy.FieldByName('OSPAYTYPESUM').AsFloat
               else
                  qry.FieldByName('MPAYCOUNT').AsFloat:=0;
                  
               qry.FieldByName('OID').AsString:=orders_qry.fieldbyname('OID').AsString;
               qry.FieldByName('MDATE').AsDateTime:=now();
               
               if (pfrm.orderState<>'�ⵥ') then
                 //�����ǰ�Ǽǵ���ǰ�ĵ��ϣ���ֱ�Ӽ���ǰ���Ķ�ȣ�����Ͳ���
                 if (current_order_oid =  orders_qry.fieldbyname('OID').AsString) then
                     //qry.FieldByName('MBALANCE').AsFloat:= scount-orders_qry.FieldByName('OSSKCOUNT').AsFloat
                     begin
                         qry.FieldByName('MBALANCE').AsFloat:= scount- pfrm.order_qy.FieldByName('OSPAYTYPESUM').AsFloat;
                         scount := scount - pfrm.order_qy.FieldByName('OSPAYTYPESUM').AsFloat;
                     end
                 else
                     qry.FieldByName('MBALANCE').AsFloat:= scount
                 
               else
                 qry.FieldByName('MBALANCE').AsFloat:= scount;



               qry.post;
               orders_qry.Next;
             end;
             
           qry.Free;
           orders_qry.Free;
           member_qry.Free;
           
        end;

    //���ʽ2  ==================
    if ((pfrm.OrderpayTypeCmb1.ItemIndex=2) and (pfrm.order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat>0)) then
      begin
           member_qry:=Tzquery.Create(self);
           member_qry.Connection:=mainfrm.conn;
           member_qry.SQL.Add('select * from TB_MEMBERS where MCID='''+pfrm.RzDBEdit1.Text+''' and MGQDATE>= now() ');
           member_qry.open;
           if member_qry.IsEmpty then
             begin
               member_qry.Free;
               showmessage('δ�ҵ��û�Ա��û�Ա���Ѿ����ڣ��������ϻ򿨺Ŷ�Ӧ�Ƿ����.');
               exit;
             end;
           
           scount:= member_qry.fieldbyname('MMONEY').AsFloat;
           tmpvalue:=0.0;
           try
              tmpvalue:= strtofloat(pfrm.RzDBEdit8.Text);
           except
           end;
           
           if scount<tmpvalue then
             begin
               showmessage('�û�Ա���㣬�������Ϊ:'+floattostr(scount));
               member_qry.Free;
               exit;
             end;

           //�ӿ��Ͽۿ�,ͬʱ��ͬ�����  
           if (pfrm.orderState<>'�ⵥ') then
             begin
              exeSql('update TB_MEMBERS set MMONEY=MMONEY-'+floattostr(tmpvalue)+' where MCID='''+pfrm.RzDBEdit1.Text+'''');
              exeSql('update TB_MEMBERS set MJF=IFNULL(MJF,0)+'+floattostr(tmpvalue)+' where MCID='''+pfrm.RzDBEdit1.Text+'''');
             end;

              //�õ��ϴ��������
           //last_banlance1 := getCount('select MBALANCE as scount from tb_member_paylog where MCID='''+ pfrm.RzDBEdit1.Text+''' order by MDATE desc limit 1');
           //������������������
           last_banlance1 := getCount('select MMONEY as scount from tb_members where MCID='''+ pfrm.RzDBEdit1.Text+''' ');

           //�������Ѽ�¼
           orders_qry:=Tzquery.Create(self);
           orders_qry.Connection:=mainfrm.conn;

           openqy(orders_qry,'select * from TB_ORDER where OCOMMID='''+ pfrm.RzDBEdit7.Text+''' order by ONUM,ODATE');           
           orders_qry.Open;
           orders_qry.First;
           qry:=Tzquery.Create(self);
           qry.Connection:=mainfrm.conn;
           qry.SQL.Add('select * from TB_MEMBER_PAYLOG where 1=2');
           qry.open;
           
           while not orders_qry.Eof do
             begin
               qry.Append;
               qry.FieldByName('PID').AsString:=CreateNewId();
               qry.FieldByName('MID').AsString:=member_qry.fieldbyname('MID').AsString;
               qry.FieldByName('MNAME').AsString:=member_qry.fieldbyname('MNAME').AsString;
               qry.FieldByName('MCID').AsString:=member_qry.fieldbyname('MCID').AsString;
               qry.FieldByName('MCSHOWID').AsString:=member_qry.fieldbyname('MCSHOWID').AsString;
               //qry.FieldByName('MPAYCOUNT').AsFloat:=orders_qry.FieldByName('OSSKCOUNT').AsFloat;
               
               //���ʼǵ���ǰ���ʵĶ�����
               if (current_order_oid =  orders_qry.fieldbyname('OID').AsString) then
                  qry.FieldByName('MPAYCOUNT').AsFloat:=pfrm.order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat
               else
                  qry.FieldByName('MPAYCOUNT').AsFloat:=0;
                  
               qry.FieldByName('OID').AsString:=orders_qry.fieldbyname('OID').AsString;
               qry.FieldByName('MDATE').AsDateTime:=now();
               
               if (pfrm.orderState<>'�ⵥ') then
               //�����ǰ�Ǽǵ���ǰ�ĵ��ϣ���ֱ�Ӽ���ǰ���Ķ�ȣ�����Ͳ���
                 if (current_order_oid =  orders_qry.fieldbyname('OID').AsString) then
                     //qry.FieldByName('MBALANCE').AsFloat:= scount-orders_qry.FieldByName('OSSKCOUNT').AsFloat
                     begin
                      qry.FieldByName('MBALANCE').AsFloat:= scount- pfrm.order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat;
                      scount := scount - pfrm.order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat;
                     end
                 else
                     qry.FieldByName('MBALANCE').AsFloat:= scount
               else
                 qry.FieldByName('MBALANCE').AsFloat:= scount;
                       
               

               qry.post;
               orders_qry.Next;
             end;
             
           qry.Free;
           orders_qry.Free;
           member_qry.Free;
           
        end;
        //======================
        
     //�������ж������
     exeSql('update TB_ORDER set OSTATE='''+pfrm.orderState+''' where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''');
     exeSql('update TB_ORDER set OSYID='''+mainfrm.user_id+''' where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''');
     exeSql('update TB_ORDER set OSYNAME='''+mainfrm.user_name+''' where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''');
     exeSql('update TB_ORDER set OSYJDDATE=now() where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''');
     exeSql('update TB_ORDER set OSPAYTYPE='''+pfrm.OrderpayTypeCmb.Text+''' where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''');

     //��¼���ѵĶ��λ�Ա��������Ϣ
     if  pfrm.OrderpayTypeCmb.Text='ˢ��Ա��' then
        exeSql('update TB_ORDER set MCID='''+pfrm.RzDBEdit9.Text+''' where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''');
        
     if  pfrm.OrderpayTypeCmb1.Text='ˢ��Ա��' then
        exeSql('update TB_ORDER set MCID1='''+pfrm.RzDBEdit1.Text+''' where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''');
     

     if pfrm.pchk.Checked then
       exeSql('update TB_ORDER set OSISJS=0 where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''')
     else
       exeSql('update TB_ORDER set OSISJS=1 where OCOMMID='''+ pfrm.RzDBEdit7.Text+'''');

     if (messagebox(0,'�Ƿ�������','��ʾ',mb_yesno+mb_iconquestion)=id_yes) then
      begin
        //�����ݵ���Excel��ӡ���
        try
          fileId:=CreateNewId;
          sfilename:=extractFilepath(application.exename)+'report\template\commsy.xls';
          tfilename:=extractFilepath(application.exename)+'report\reportfiles\comm_sy\'+FileId+'.xls';
          copyfile(pchar(sfilename),pchar(tfilename),false);

          excel:= CreateOleObject('Excel.Application');
          excel.Visible := true;//�Ƿ���ʾ
          excel.workbooks.open(tfilename);
          Sheet:= excel.Workbooks[1].WorkSheets[1];
    
          //������Ŀ
          items_qry:=Tzquery.Create(nil);
          items_qry.Connection:=mainfrm.conn;
          openqy(items_qry,'select * from TB_ORDER_SERVCEITEM where OID in (select OID from TB_ORDER where OCOMMID='''+ pfrm.RzDBEdit7.Text+''') order by ONUM');
          i:=7;

          Sheet.Cells[2,2]:=datetostr(now());
          //�õ��ܿ���
          Sheet.Cells[2,5]:=floattostr(getCount('select sum(OPCOUNT) as scount from TB_ORDER where OCOMMID='''+ pfrm.RzDBEdit7.Text+''''));

          payType:=pfrm.OrderpayTypeCmb.Text;
          if payType='ˢ��Ա��' then
            begin
              tmp_MCSHOWID:=getID('select MCSHOWID as ID from TB_MEMBERS where MCID='''+pfrm.RzDBEdit9.text+'''');
              tmp_MMONEY:=floattostr(getCount('select MMONEY as scount from TB_MEMBERS where MCID='''+pfrm.RzDBEdit9.Text+''''));
              payType := payType+' ����:'+tmp_MCSHOWID+' ������'+tmp_MMONEY;
              payType := payType +#13#10+'�ϴ���'+floattostr(Roundto(last_banlance,-2));

              //�����������ѵĶ�������
              send_content:=  StringReplace(sms_content,'{��Ա����}',tmp_MCSHOWID,[rfReplaceAll]);
              send_content := StringReplace(send_content,'{����ʱ��}',FormatdateTime('c',now),[rfReplaceAll]);
              send_content := StringReplace(send_content,' ','_',[rfReplaceAll]);
              send_content:=  StringReplace(send_content,'{���ѽ��}',sj_count_edt.Text,[rfReplaceAll]);
              send_content:=  StringReplace(send_content,'{���}', tmp_MMONEY,[rfReplaceAll]);
              //���Ͷ���
              phone:= getID('select MPHONE as ID from TB_MEMBERS where MCID='''+pfrm.RzDBEdit9.text+'''');
              mname:= getID('select MNAME as ID from TB_MEMBERS where MCID='''+pfrm.RzDBEdit9.text+'''');
              jf :=   getID('select MJF as ID from TB_MEMBERS where MCID='''+pfrm.RzDBEdit9.text+'''');

              send_content:=  StringReplace(send_content,'{��Ա����}', mname,[rfReplaceAll]);
              send_content:=  StringReplace(send_content,'{�������}', jf,[rfReplaceAll]);              
              try
               if length(phone)>0 then
                 mainfrm.sendsms(phone,send_content);
              except
              end;
              
            end
          else if (pfrm.order_qy.FieldByName('OSPAYTYPESUM').AsFloat>0) then
            begin
                  payType:=payType +  pfrm.order_qy.FieldByName('OSPAYTYPE').AsString+'����:'+ FloatToStr(Roundto(pfrm.order_qy.FieldByName('OSPAYTYPESUM').AsFloat,-2));
            end;
                
          payType1:=  pfrm.OrderpayTypeCmb1.Text;
          if pfrm.OrderpayTypeCmb1.Text='ˢ��Ա��' then
            begin
              tmp_MCSHOWID:=getID('select MCSHOWID as ID from TB_MEMBERS where MCID='''+pfrm.RzDBEdit1.text+'''');
              tmp_MMONEY:=floattostr(getCount('select MMONEY as scount from TB_MEMBERS where MCID='''+pfrm.RzDBEdit1.Text+''''));
              payType1 := payType1+' ����:'+tmp_MCSHOWID+' ��'+tmp_MMONEY;
              payType1 := payType1 +#13#10+'�ϴ���'+floattostr(Roundto(last_banlance1,-2));
              //�����������ѵĶ�������
              send_content:=  StringReplace(sms_content,'{��Ա����}',tmp_MCSHOWID,[rfReplaceAll]);
              send_content := StringReplace(send_content,'{����ʱ��}',FormatdateTime('c',now),[rfReplaceAll]);
              send_content := StringReplace(send_content,' ','_',[rfReplaceAll]);
              send_content:=  StringReplace(send_content,'{���ѽ��}',sj_count_edt.Text,[rfReplaceAll]);
              send_content:=  StringReplace(send_content,'{���}', tmp_MMONEY,[rfReplaceAll]);
              //���Ͷ���
              phone:= getID('select MPHONE as ID from TB_MEMBERS where MCID='''+pfrm.RzDBEdit1.text+'''');
              mname:= getID('select MNAME as ID from TB_MEMBERS where MCID='''+pfrm.RzDBEdit1.text+'''');
              jf :=   getID('select MJF as ID from TB_MEMBERS where MCID='''+pfrm.RzDBEdit1.text+'''');

              send_content:=  StringReplace(send_content,'{��Ա����}', mname,[rfReplaceAll]);
              send_content:=  StringReplace(send_content,'{�������}', jf,[rfReplaceAll]);              
              try
               if length(phone)>0 then
                 mainfrm.sendsms(phone,send_content);
              except
              end;
              
            end
            
           else if (pfrm.order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat>0) then
            begin
                  payType1:= payType1 + pfrm.order_qy.FieldByName('OSPAYTYPE1').AsString+'����:'+ FloatToStr(Roundto(pfrm.order_qy.FieldByName('OSPAYTYPE1SUM').AsFloat,-2));
            end;

          Sheet.Cells[3,2]:= payType;
          Sheet.Cells[4,2]:= payType1;

          while not items_qry.Eof do
            begin
               Sheet.Cells[i,1] := items_qry.FieldByName('ONUM').AsString;
               Sheet.Cells[i,2] := items_qry.FieldByName('SITEMNAME').AsString;
               Sheet.Cells[i,3] := items_qry.FieldByName('SROOMNUM').AsString;
               Sheet.Cells[i,4] := items_qry.FieldByName('ENUM').AsString;
               Sheet.Cells[i,5] := items_qry.FieldByName('PZCOUNT').AsString;
               Sheet.Cells[i,6] := items_qry.FieldByName('PJCOUNT').AsString;
               Sheet.Cells[i,7] := items_qry.FieldByName('DZCOUNT').AsString;
               Sheet.Cells[i,8] := items_qry.FieldByName('DJCOUNT').AsString;
               Sheet.Cells[i,9] := items_qry.FieldByName('TOTALCOST').AsString;
               Sheet.Cells[i,10] := items_qry.FieldByName('ZK').AsString;
         
               inc(i);
               items_qry.Next;
            end;
           inc(i);
           Sheet.Cells[i,1] := '�ϼ�';
           Sheet.Cells[i,5] := '=SUM(E6:E'+inttostr(i-1)+')';
           Sheet.Cells[i,6] := '=SUM(F6:F'+inttostr(i-1)+')';
           Sheet.Cells[i,7] := '=SUM(G6:G'+inttostr(i-1)+')';
           Sheet.Cells[i,8] := '=SUM(H6:H'+inttostr(i-1)+')';
           Sheet.Cells[i,9] := sj_count_edt.Text;

           items_qry.Close;
           items_qry.Free;
           Sheet.PrintPreview;

        except
          Showmessage('��ʼ��Excelʧ�ܣ�����û�а�װExcel���밲װExcel����б��������');
          excel.DisplayAlerts := false;//�Ƿ���ʾ����
          excel.Quit;//����������˳�
          exit;
        end;
      end;
      
     pfrm.order_qy.Close;
     messagebox(0,'�Ѿ��ɹ��ᵥ���Ѿ��������Ѷ���.','��ʾ',mb_iconinformation);
     close;
    except
      on E:Exception do
         messagebox(0,pchar('�ᵥ������ʾΪ'+e.Message),'��ʾ',mb_iconerror);
    end;
    
  end; 
end;

end.
