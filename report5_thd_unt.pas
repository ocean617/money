unit report5_thd_unt;

interface

uses
  Classes,Windows,Dialogs,SysUtils,forms,ActiveX,ComCtrls,Comobj,ReportUnt,DateUtils,ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  report5_thd = class(TThread)
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

    procedure report5_thd.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ report5_thd }

procedure report5_thd.Execute;
begin
  Synchronize(show);
end;

procedure report5_thd.show;
var
 fileId,sfilename,tfilename,sdate,edate:string;
 excel,Sheet:variant;
 ZsCount,tmpval:real;
 i:integer;
 strState:string;
begin
strState:='�˵�';
fileId:=CreateNewId;
sfilename:=extractFilepath(application.exename)+'report\template\r5.xls';
tfilename:=extractFilepath(application.exename)+'report\reportfiles\r5\'+FileId+'.xls';
copyfile(pchar(sfilename),pchar(tfilename),false);

//�����ݵ���Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := True;//�Ƿ���ʾ
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];
    Sheet.Cells[1,1] :=frm.r5_year_cmb.text+'��'+frm.r5_month.Text+'�·������ܱ���';

    application.ProcessMessages;
    frm.pbar.TotalParts:=31;
    frm.pbar.Update;
    
    for i:=1 to 31 do 
      begin
            application.ProcessMessages;
            frm.pbar.PartsComplete:=i;
            frm.pbar.Update;
    
         if i>=10 then
          sdate:= frm.r5_year_cmb.text+'-'+frm.r5_month.Text+'-'+inttostr(i)+' 12:00:00'
         else
          sdate:= frm.r5_year_cmb.text+'-'+frm.r5_month.Text+'-0'+inttostr(i)+' 12:00:00';
          try
            edate:=datetostr(incday(strtodatetime(sdate),1));
            edate:=edate+' 04:00:00';
          except
            continue;
          end;
      
        Sheet.Cells[i+2,2] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ������'')'
                                          +')'));
                                          
        Sheet.Cells[i+2,3] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''ƽ�Ᵽ��'')'
                                          +')'));
                                          
        Sheet.Cells[i+2,4] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����������Ŀ'')'
                                          +')'));
                                          
         Sheet.Cells[i+2,5] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��������'')'
                                          +')'));

         Sheet.Cells[i+2,6] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Ƶ����'')'
                                          +')'));

        Sheet.Cells[i+2,7] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��ҽ�����Ʒ�'')'
                                          +')'));
        //����ʦ����
        Sheet.Cells[i+2,8] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����ʦ����'')'
                                          +')'));

         //������Ŀ
        Sheet.Cells[i+2,9] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''������Ŀ'')'
                                          +')'));
        //����
        Sheet.Cells[i+2,10] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND in(''�ɶ�'',''�޽�''))'
                                          +')'));

        //�����ʦ�շ�
        Sheet.Cells[i+2,11] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�����ʦ�շ�'')'
                                          +')'));
        //�����ܼ��շ�
        Sheet.Cells[i+2,12] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�����ܼ��շ�'')'
                                          +')'));  
        //�������
        Sheet.Cells[i+2,13] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''����'')'
                                          +')'));
       //��Чҩ
        Sheet.Cells[i+2,14] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��Чҩ'')'
                                          +')'));
        //��ͨ����
        Sheet.Cells[i+2,15] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''��ͨ����'')'
                                          +')'));
        //�߼�����1                                  
        Sheet.Cells[i+2,16] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                                  +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�߼�����1'')'
                                                  +')'));
        Sheet.Cells[i+2,17] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                                  +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�߼�����2'')'
                                                  +')'));
        Sheet.Cells[i+2,18] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                                  +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''�߼�����3'')'
                                                  +')'));
        //������շ�
        Sheet.Cells[i+2,19] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                                  +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''������շ�'')'
                                                  +')'));

       //ÿ��Ӫҵ��
        Sheet.Cells[i+2,20] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +')'));
       //��2��ҳ��
       
        //����ֵ���
        Sheet.Cells[i+2,22] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''�ֽ�'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        Sheet.Cells[i+2,23] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''������'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        Sheet.Cells[i+2,24] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''��ֵ����'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        Sheet.Cells[i+2,25] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''ҵ������'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        Sheet.Cells[i+2,26] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''��������'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));

        //�ֽ����ѽ��
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''�ֽ�'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''�ֽ�'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,27] := floattostr(tmpval);
        
        //ˢ���������ѽ��
         tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''ˢ������'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''ˢ������'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,28] := floattostr(tmpval);

        //ˢ��Ա�����ѽ��
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''ˢ��Ա��'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''ˢ��Ա��'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,29] := floattostr(tmpval);
        
         
        //�ⵥ���
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''�ⵥ'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''�ⵥ'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,30] := floattostr(tmpval);
        
        //�ֿ�ȯ
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''�ֿ�ȯ'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''�ֿ�ȯ'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,31] := floattostr(tmpval);
        
        
        //�Ź�
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''�Ź�'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''�Ź�'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,32] := floattostr(tmpval);
        
        //�ֽ�����(�ֽ����Ѻͳ�ֵ)
        {Sheet.Cells[i+2,32] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and OSPAYTYPE=''�ֽ�'''
                                          +')')+getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''�ֽ�'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        }
        
        //ˢ������(�������򵥺ͳ�ֵ)
        {
        Sheet.Cells[i+2,33] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and OSPAYTYPE=''ˢ������'')')+getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''������'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        }
        //����������
        Sheet.Cells[i+2,35] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''��ʦ'') '));
        //�ż�������
        Sheet.Cells[i+2,36] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''��ʦ'')'));
        //����������
        Sheet.Cells[i+2,37] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''��ʦ'')'));
        //���������
        Sheet.Cells[i+2,38] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''��ʦ'')'));
        //������
        Sheet.Cells[i+2,39] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT+PJCOUNT+DZCOUNT+DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''��Ҫ��Ŀ'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''��ʦ'')'));

        //�ܿ���
        Sheet.Cells[i+2,40] := floattostr(getCount('select sum(OPCOUNT) as scount from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''));
                                        
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
