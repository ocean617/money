unit report1_thd_unt;

interface

uses
  Classes,Windows,Dialogs,SysUtils,forms,ActiveX,ComCtrls,Comobj,ReportUnt;

type
  report1_thd = class(TThread)
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

procedure report1_thd.Execute;
begin
  Synchronize(show);
end;

procedure report1_thd.show;
var
 fileId,sfilename,tfilename:string;
 excel,Sheet:variant;
 ZsCount,tmpval:real;
 sqlstr,strState:string;
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
sfilename:=extractFilepath(application.exename)+'report\template\r1.xls';
tfilename:=extractFilepath(application.exename)+'report\reportfiles\r1\'+FileId+'.xls';
copyfile(pchar(sfilename),pchar(tfilename),false);

frm.pbar.TotalParts:=30;
frm.pbar.Update;

//�����ݵ���Excel
try
    excel:= CreateOleObject('Excel.Application');

    excel.workbooks.open(tfilename);
    
    Sheet:= excel.Workbooks[1].WorkSheets[1];
    Sheet.Cells[1,1] :=frm.date_begin.text+'�ֽ���ͳ��';
    frm.pbar.PartsComplete:=1;
    frm.pbar.Update;

    Sheet.Cells[4,3] := frm.getR1data('''ƽ������''',strState);
    Sheet.Cells[5,3] := frm.getR1data('''ƽ�Ᵽ��''',strState); 
    Sheet.Cells[6,3] := frm.getR1data('''����������Ŀ''',strState);  
    Sheet.Cells[7,3] := frm.getR1data('''��������''',strState);
    frm.pbar.PartsComplete:=4;
    frm.pbar.Update;
    application.ProcessMessages;
    
    Sheet.Cells[8,3] := frm.getR1data('''��Ƶ����''',strState);
    Sheet.Cells[9,3] := frm.getR1data('''��ҽ�����Ʒ�''',strState);
    Sheet.Cells[10,3] := frm.getR1data('''����ʦ����''',strState);
    Sheet.Cells[11,3] := frm.getR1data('''������Ŀ''',strState);
    frm.pbar.PartsComplete:=8;
    frm.pbar.Update;
    application.ProcessMessages;

    Sheet.Cells[12,3] := frm.getR1data('''�ɶ�'',''�޽�''',strState); 
    Sheet.Cells[13,3] := frm.getR1data('''�����ʦ�շ�''',strState);
    Sheet.Cells[14,3] := frm.getR1data('''�����ܼ��շ�''',strState);
    Sheet.Cells[15,3] := frm.getR1data('''����''',strState);
    Sheet.Cells[16,3] := frm.getR1data('''��Чҩ''',strState);
    frm.pbar.PartsComplete:=13;
    frm.pbar.Update;
    application.ProcessMessages;

    Sheet.Cells[17,3] := frm.getR1data('''��ͨ����''',strState);
    Sheet.Cells[18,3] := frm.getR1data('''�߼�����1'',''�߼�����2'',''�߼�����3''',strState);
    Sheet.Cells[19,3] := frm.getR1data('''������շ�''',strState);

    //��Ա��ֵ�ϼ� (�ֽ�
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''�ֽ�'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[21,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=16;
    frm.pbar.Update;
    application.ProcessMessages;
    
    //��Ա��ֵ�ϼ� (������)
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''������'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[22,3] :=floattostr(getCount(sqlstr));

    //��Ա��ֵ�ϼ� (��ֵ����)
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''��ֵ����'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[23,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=17;
    frm.pbar.Update;
    application.ProcessMessages;

    //��Ա��ֵ�ϼ� (ҵ������)
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''ҵ������'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[24,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=18;
    frm.pbar.Update;
    application.ProcessMessages;

    //��Ա��ֵ�ϼ� (��������)
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''��������'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[25,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=19;
    frm.pbar.Update;
    application.ProcessMessages;

    //���ʽ1�򸶿ʽ2Ϊ�ֽ�ʱ�����ָ�������
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''�ֽ�'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''�ֽ�'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[26,3] :=tmpval;

    //������
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''ˢ������'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''ˢ������'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[27,3] :=tmpval;


    //��Ա������
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''ˢ��Ա��'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''ˢ��Ա��'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[28,3] :=tmpval;

    //�ⵥ����
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''�ⵥ'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''�ⵥ'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[29,3] :=tmpval;

    //�ֿ�ȯ����
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''�ֿ�ȯ'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''�ֿ�ȯ'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[30,3] :=tmpval;

    //�Ź�����
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''�Ź�'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''�Ź�'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[31,3] :=tmpval;

    //�ܿ���
    sqlstr:='select sum(OPCOUNT) as scount from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    Sheet.cells[32,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=29;
    frm.pbar.Update;
    application.ProcessMessages;

    sqlstr:='select TRUNCATE(sum(PZCOUNT+PJCOUNT+DZCOUNT+DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                          +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+''' ) and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''��ʦ'')';
    ZsCount:= getCount(sqlstr);

    Sheet.cells[33,3] := floattostr(ZsCount);
    frm.pbar.PartsComplete:=30;
    frm.pbar.Update;
    application.ProcessMessages;

    
  except
    on E:Exception do
      begin
        Showmessage('���ݱ����������,������Ϣ��'+e.Message);
        excel.DisplayAlerts := false;//�Ƿ���ʾ����
        excel.Quit;//����������˳�
      end;

  end;

  frm.pbar.PartsComplete:=0;
  frm.pbar.Update;
  excel.Visible := true;//�Ƿ���ʾ
end;

end.
