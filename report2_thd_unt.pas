unit report2_thd_unt;

interface

uses
  Classes,Windows,Dialogs,SysUtils,forms,ActiveX,ComCtrls,Comobj,ReportUnt,DateUtils,ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  report2_thd = class(TThread)
  private
    { Private declarations }
    public
     frm:TReportFrm;
  protected
    procedure Execute; override;
    procedure show();
  end;

implementation
uses MemberAddMoneyUnt, mainUnt, commUnt;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure report2_thd.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ report2_thd }

procedure report2_thd.Execute;
begin
 Synchronize(show);
end;

procedure report2_thd.show;
var
 fileId,sfilename,tfilename:string;
 excel,Sheet:variant;
 ZsCount:real;
 qry:tZquery;
 i,inc_m:integer;
 strState:string;
begin
if mainfrm.user_type='����Ա' then
  strState:='�ᵥ'
else
  strState:='�˵�';

if length(frm.date_begin.Text)=0 then
  begin
   showmessage('��ѡ��ʼ����');
   exit;
  end;

if length(frm.date_end.Text)=0 then
  begin
   showmessage('��ѡ���������');
   exit;
  end;
  
fileId:=CreateNewId;
sfilename:=extractFilepath(application.exename)+'report\template\r2.xls';
tfilename:=extractFilepath(application.exename)+'report\reportfiles\r2\'+FileId+'.xls';
copyfile(pchar(sfilename),pchar(tfilename),false);

//�����ݵ���Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//�Ƿ���ʾ
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];
    Sheet.Cells[1,1] :=frm.date_begin.Text+'��ʦҵ���ձ���';

    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE where ETYPE=''��ʦ'' order by ENUM');
    qry.Open;
    i:=4;

    inc_m:= qry.RecordCount;
    frm.pbar.TotalParts:=inc_m;
    inc_m:=0;
    frm.pbar.Update;

    while (not qry.Eof) do
      begin
        Inc(inc_m);
        application.ProcessMessages;
        frm.pbar.PartsComplete:=inc_m;
        frm.pbar.Update;

        Sheet.Cells[i,1] := qry.FieldByName('ENUM').AsString;
        Sheet.Cells[i,2] := qry.FieldByName('ENAME').AsString;
        Sheet.Cells[i,3] := floattostr(getCount('select IFNULL(TRUNCATE(sum(PZCOUNT+PJCOUNT+DZCOUNT+DJCOUNT),2),0) as scount from TB_ORDER_SERVCEITEM where OID in '
                                          +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'')'));
                                          
        Sheet.Cells[i,4] := floattostr(getCount('select IFNULL(TRUNCATE(sum(PJCOUNT+DJCOUNT+DZCOUNT),2),0) as scount from TB_ORDER_SERVCEITEM where OID in '
                                          +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'')'));
                                          
        Sheet.Cells[i,5] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'));
                                          
        Sheet.Cells[i,6] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'));
                                          
        Sheet.Cells[i,7] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'));

        Sheet.Cells[i,8] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'));
         //ƽ�Ᵽ��
        Sheet.Cells[i,9] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'));
                                          
        Sheet.Cells[i,10] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'));
                                          
        Sheet.Cells[i,11] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'));

        Sheet.Cells[i,12] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'));
        //������Ŀ 
        Sheet.Cells[i,13] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'));

        Sheet.Cells[i,14] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'));

        Sheet.Cells[i,15] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'));

        Sheet.Cells[i,16] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'));
        //��������
        Sheet.Cells[i,17] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'));

        Sheet.Cells[i,18] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'));

        Sheet.Cells[i,19] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'));

        Sheet.Cells[i,20] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'));
        //��Ƶ����
        Sheet.Cells[i,21] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'));

        Sheet.Cells[i,22] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'));

        Sheet.Cells[i,23] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                          +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'));

        Sheet.Cells[i,24] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'));
       

        //��ҽ�����Ʒ�
        Sheet.Cells[i,25] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��ҽ�����Ʒ�'')'));

        //����ʦ����
        Sheet.Cells[i,26] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����ʦ����'')'));

        //������Ŀ
        Sheet.Cells[i,27] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''������Ŀ'')'));
                                        

        //����
        Sheet.Cells[i,28] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND in (''�ɶ�'',''�޽�''))'));


        //�����ʦ���
        Sheet.Cells[i,29] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�����ʦ�շ�'')'));

        //�����ܼ����
        Sheet.Cells[i,30] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and ENUM='''+qry.FieldByName('ENUM').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�����ܼ��շ�'')'));

        Sheet.Cells[i,31] := qry.FieldByName('ENUM').AsString;
        Sheet.Cells[i,32] := qry.FieldByName('ENAME').AsString;
        
        //�Ƽ�����
        Sheet.Cells[i,33] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and TJEID='''+qry.FieldByName('EID').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND in (''�Ƽ��ɶ�'',''�Ƽ��޽�''))'));
        //�Ƽ���Чҩ
        Sheet.Cells[i,34] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                        +') and TJEID='''+qry.FieldByName('EID').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ���Чҩ'')'));
        //�Ƽ���ͨ����
        Sheet.Cells[i,35] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                                +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                                +') and TJEID='''+qry.FieldByName('EID').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ���ͨ����'')'));
        //�Ƽ��߾�1
        Sheet.Cells[i,36] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                                +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                                +') and TJEID='''+qry.FieldByName('EID').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ��߼�����1'')'));

        //�Ƽ��߾�2
        Sheet.Cells[i,37] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                                +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                                +') and TJEID='''+qry.FieldByName('EID').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ��߼�����2'')'));

        //�Ƽ��߾�3
        Sheet.Cells[i,38] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                                +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                                +') and TJEID='''+qry.FieldByName('EID').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ��߼�����3'')'));


        //��������
        Sheet.Cells[i,39] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                                +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+frm.date_begin.Text+''' and ODATE<='''+frm.date_end.Text+''''
                                                +') and TJEID='''+qry.FieldByName('EID').AsString+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ�������շ�'')'));


        qry.Next;
        inc(i);
      end;

      inc(i);
      //�ϼ�
      Sheet.Cells[i,1] := '�ϼ�';
      Sheet.Cells[i,3] := '=SUM(C4:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D4:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E4:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F4:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G4:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H4:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I4:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J4:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K4:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L4:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M4:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N4:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O4:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P4:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q4:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R4:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S4:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T4:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U4:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V4:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W4:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X4:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y4:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z4:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA4:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB4:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC4:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD4:AD'+inttostr(i-2)+')';

     Sheet.Cells[i,33] := '=SUM(AG4:AG'+inttostr(i-2)+')';
     Sheet.Cells[i,34] := '=SUM(AH4:AH'+inttostr(i-2)+')';
     Sheet.Cells[i,35] := '=SUM(AI4:AI'+inttostr(i-2)+')';
     Sheet.Cells[i,36] := '=SUM(AJ4:AJ'+inttostr(i-2)+')';
     Sheet.Cells[i,37] := '=SUM(AK4:AK'+inttostr(i-2)+')';
     Sheet.Cells[i,38] := '=SUM(AL4:AL'+inttostr(i-2)+')';
     Sheet.Cells[i,39] := '=SUM(AM4:AM'+inttostr(i-2)+')';
  except
    Showmessage('��ʼ��Excelʧ�ܣ�����û�а�װExcel���밲װExcel����б��������');
    excel.DisplayAlerts := false;//�Ƿ���ʾ����
    excel.Quit;//����������˳�
  end;
  excel.Visible := true;//�Ƿ���ʾ
  frm.pbar.TotalParts:=0;
end;

end.
