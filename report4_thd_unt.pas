unit report4_thd_unt;

interface

uses
  Classes,Windows,Dialogs,SysUtils,forms,ActiveX,ComCtrls,Comobj,ReportUnt,DateUtils,ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  report4_thd = class(TThread)
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

    procedure report4_thd.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ report4_thd }

procedure report4_thd.Execute;
begin
  Synchronize(show);
end;

procedure report4_thd.show;
var
 fileId,sfilename,tfilename,sdate,edate:string;
 excel,Sheet:variant;
 ZsCount:real;
 i:integer;
 strState:string;
 tjid,enum,ename:string;
begin
 if length(frm.js_cmb.Text)=0 then
  begin
    messagebox(0,'��ѡ��ʦ.','��ʾ',mb_iconinformation);
    exit;
  end;
  
strState:='�˵�';
fileId:=CreateNewId;
sfilename:=extractFilepath(application.exename)+'report\template\r4.xls';
tfilename:=extractFilepath(application.exename)+'report\reportfiles\r4\'+FileId+'.xls';
copyfile(pchar(sfilename),pchar(tfilename),false);
//����
enum:=trim(copy(frm.js_cmb.Text,0,pos(' ',frm.js_cmb.Text)));
ename:=trim(copy(frm.js_cmb.Text,pos(' ',frm.js_cmb.Text),length(frm.js_cmb.Text)-pos('',frm.js_cmb.Text)));

tjid:= getID('select EID as ID from TB_EMPLOYEE where ENUM='''+enum+'''');

//�����ݵ���Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//�Ƿ���ʾ
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];
    Sheet.Cells[1,1] :=frm.r4_year_cmb.text+'��'+frm.r4_month.Text+'�·ݼ�ʦҵ���ۼƱ�';
    Sheet.Cells[2,2] :=enum;
    Sheet.Cells[2,4] :=ename;

    application.ProcessMessages;
    frm.pbar.TotalParts:=31;
    frm.pbar.Update;

    for i:=1 to 31 do 
      begin
        application.ProcessMessages;
        frm.pbar.PartsComplete:=i;
        frm.pbar.Update;

         if i>=10 then
          sdate:= frm.r4_year_cmb.text+'-'+frm.r4_month.Text+'-'+inttostr(i)+' 12:00:00'
         else
          sdate:= frm.r4_year_cmb.text+'-'+frm.r4_month.Text+'-0'+inttostr(i)+' 12:00:00';
          try
            edate:=datetostr(incday(strtodatetime(sdate),1));
            edate:=edate+' 04:00:00';
          except
            continue;
          end;

        //������
        Sheet.Cells[4,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT+DZCOUNT+PJCOUNT+DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''''
                                          +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'')'));
       //���Ӽ���                                   
        Sheet.Cells[5,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT+DJCOUNT+PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''''
                                          +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'')'));
        //ƽ������	��
        Sheet.Cells[6,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'
                                          +')'));
       //�ż�
        Sheet.Cells[7,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'
                                          +')'));
                                          
        Sheet.Cells[8,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'
                                          +')'));

        Sheet.Cells[9,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'
                                          +')'));
        //ƽ�Ᵽ��
        Sheet.Cells[10,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'
                                          +')'));
        //
        Sheet.Cells[11,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'
                                          +')'));
        //
        Sheet.Cells[12,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'
                                          +')'));
       // ���
        Sheet.Cells[13,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'
                                          +')'));
        //��������
        Sheet.Cells[14,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'
                                          +')'));
        //
        Sheet.Cells[15,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'
                                          +')'));
        //
        Sheet.Cells[16,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'
                                          +')'));
        //
        Sheet.Cells[17,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'
                                          +')'));
        //��������
        Sheet.Cells[18,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'
                                          +')'));
        //
        Sheet.Cells[19,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'
                                          +')'));
        //
        Sheet.Cells[20,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'
                                          +')'));
        //
        Sheet.Cells[21,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'
                                          +')'));
        //��Ƶ����
        Sheet.Cells[22,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'
                                          +')'));
        //
        Sheet.Cells[23,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'
                                          +')'));
        //
        Sheet.Cells[24,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'
                                          +')'));
        //
        Sheet.Cells[25,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'
                                          +')'));
        //������
        Sheet.Cells[26,i+2] := floattostr(getCount('select TRUNCATE(sum(TOTALCOST),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��ҽ�����Ʒ�'')'
                                          +')'));

        //����ʦ����
        Sheet.Cells[27,i+2] := floattostr(getCount('select TRUNCATE(sum(TOTALCOST),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����ʦ����'')'
                                          +')'));
       //������Ŀ
        Sheet.Cells[28,i+2] := floattostr(getCount('select TRUNCATE(sum(TOTALCOST),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''������Ŀ'')'
                                          +')'));

        //����
        Sheet.Cells[29,i+2] := floattostr(getCount('select TRUNCATE(sum(TOTALCOST),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND in(''�ɶ�'',''�޽�''))'
                                          +')'));

        //�����ʦ�շ�
        Sheet.Cells[30,i+2] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�����ʦ�շ�'')'
                                          +')'));                                          
        //�����ܼ��շ�
        Sheet.Cells[31,i+2] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�����ܼ��շ�'')'
                                          +')'));   
        //�Ƽ�����
        Sheet.Cells[32,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND in (''�Ƽ��ɶ�'',''�Ƽ��޽�''))'));

        //�Ƽ���Чҩ
        Sheet.Cells[33,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ���Чҩ'')'));
        //�Ƽ���ͨ����
        Sheet.Cells[34,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ���ͨ����'')'));
        //�Ƽ���װ�߼�����1
        Sheet.Cells[35,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ��߼�����1'')'));

        //�Ƽ���װ�߼�����2
        Sheet.Cells[36,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ��߼�����2'')'));

        //�Ƽ���װ�߼�����3
        Sheet.Cells[37,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ��߼�����3'')'));

        //��������
        Sheet.Cells[38,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�Ƽ�������շ�'')'));
                                             
      end;
    //Sheet.PrintPreview;
    
  except
    Showmessage('��ʼ��Excelʧ�ܣ�����û�а�װExcel���밲װExcel����б��������');
    excel.DisplayAlerts := false;//�Ƿ���ʾ����
    excel.Quit;//����������˳�
    //exit;
  end;
  excel.Visible := true;//�Ƿ���ʾ
      application.ProcessMessages;
    frm.pbar.TotalParts:=0;
    frm.pbar.Update;  
end;

end.
