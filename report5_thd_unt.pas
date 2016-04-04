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
strState:='核单';
fileId:=CreateNewId;
sfilename:=extractFilepath(application.exename)+'report\template\r5.xls';
tfilename:=extractFilepath(application.exename)+'report\reportfiles\r5\'+FileId+'.xls';
copyfile(pchar(sfilename),pchar(tfilename),false);

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := True;//是否显示
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];
    Sheet.Cells[1,1] :=frm.r5_year_cmb.text+'年'+frm.r5_month.Text+'月份中心总报表';

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
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡足疗'')'
                                          +')'));
                                          
        Sheet.Cells[i+2,3] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡保健'')'
                                          +')'));
                                          
        Sheet.Cells[i+2,4] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''精油养生项目'')'
                                          +')'));
                                          
         Sheet.Cells[i+2,5] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''姜艾养生'')'
                                          +')'));

         Sheet.Cells[i+2,6] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''中频养生'')'
                                          +')'));

        Sheet.Cells[i+2,7] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''中医特殊疗法'')'
                                          +')'));
        //理疗师治疗
        Sheet.Cells[i+2,8] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''理疗师治疗'')'
                                          +')'));

         //美容项目
        Sheet.Cells[i+2,9] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''美容项目'')'
                                          +')'));
        //采修
        Sheet.Cells[i+2,10] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND in(''采耳'',''修脚''))'
                                          +')'));

        //贵宾技师收费
        Sheet.Cells[i+2,11] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''贵宾技师收费'')'
                                          +')'));
        //技术总监收费
        Sheet.Cells[i+2,12] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''技术总监收费'')'
                                          +')'));  
        //其他金额
        Sheet.Cells[i+2,13] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''其它'')'
                                          +')'));
       //特效药
        Sheet.Cells[i+2,14] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''特效药'')'
                                          +')'));
        //普通精油
        Sheet.Cells[i+2,15] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''普通精油'')'
                                          +')'));
        //高级精油1                                  
        Sheet.Cells[i+2,16] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                                  +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''高级精油1'')'
                                                  +')'));
        Sheet.Cells[i+2,17] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                                  +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''高级精油2'')'
                                                  +')'));
        Sheet.Cells[i+2,18] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                                  +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''高级精油3'')'
                                                  +')'));
        //贵宾房收费
        Sheet.Cells[i+2,19] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                                  +' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''贵宾房收费'')'
                                                  +')'));

       //每日营业额
        Sheet.Cells[i+2,20] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +')'));
       //第2个页面
       
        //卡充值金额
        Sheet.Cells[i+2,22] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''现金'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        Sheet.Cells[i+2,23] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''银联卡'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        Sheet.Cells[i+2,24] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''充值赠送'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        Sheet.Cells[i+2,25] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''业务赠送'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        Sheet.Cells[i+2,26] := floattostr(getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''积分赠送'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));

        //现金消费金额
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''现金'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''现金'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,27] := floattostr(tmpval);
        
        //刷银联卡消费金额
         tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''刷银联卡'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''刷银联卡'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,28] := floattostr(tmpval);

        //刷会员卡消费金额
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''刷会员卡'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''刷会员卡'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,29] := floattostr(tmpval);
        
         
        //免单金额
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''免单'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''免单'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,30] := floattostr(tmpval);
        
        //抵扣券
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''抵扣券'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''抵扣券'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,31] := floattostr(tmpval);
        
        
        //团购
        tmpval :=  getCount('select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''团购'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
        
        tmpval := tmpval + getCount('select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''团购'' and ODATE>='''+sdate+''''
                                          +' and ODATE<='''+edate+'''');
                                          
        Sheet.Cells[i+2,32] := floattostr(tmpval);
        
        //现金收入(现金消费和充值)
        {Sheet.Cells[i+2,32] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and OSPAYTYPE=''现金'''
                                          +')')+getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''现金'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        }
        
        //刷银联卡(银联卡买单和充值)
        {
        Sheet.Cells[i+2,33] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and OSPAYTYPE=''刷银联卡'')')+getCount('select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where MTYPE=''银联卡'' and UDATE>='''+sdate+''' and UDATE<='''+edate+''''));
        }
        //排钟总钟数
        Sheet.Cells[i+2,35] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''主要项目'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''技师'') '));
        //排加总钟数
        Sheet.Cells[i+2,36] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''主要项目'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''技师'')'));
        //点钟总钟数
        Sheet.Cells[i+2,37] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''主要项目'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''技师'')'));
        //点加总钟数
        Sheet.Cells[i+2,38] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''主要项目'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''技师'')'));
        //总钟数
        Sheet.Cells[i+2,39] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT+PJCOUNT+DZCOUNT+DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                        +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''主要项目'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''技师'')'));

        //总客数
        Sheet.Cells[i+2,40] := floattostr(getCount('select sum(OPCOUNT) as scount from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''));
                                        
      end;
      
    //Sheet.PrintPreview;
    
  except
    Showmessage('初始化Excel失败，可能没有安装Excel，请安装Excel后进行报表输出。');
    excel.DisplayAlerts := false;//是否提示存盘
    excel.Quit;//如果出错则退出
    //exit;
  end;
  excel.Visible := true;//是否显示
      application.ProcessMessages;
    frm.pbar.TotalParts:=0;
    frm.pbar.Update;  
end;

end.
