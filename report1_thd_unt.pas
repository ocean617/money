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
if mainfrm.user_type='收银员' then
  strState:='结单'
else
  strState:='核单';

if length(frm.date_begin.Text)=0 then
  begin
   showmessage('请选择开始日期');
   exit;
  end;

if length(frm.date_end.Text)=0 then
  begin
   showmessage('请选择结束日期');
   exit;
  end;
  
fileId:=CreateNewId;
sfilename:=extractFilepath(application.exename)+'report\template\r1.xls';
tfilename:=extractFilepath(application.exename)+'report\reportfiles\r1\'+FileId+'.xls';
copyfile(pchar(sfilename),pchar(tfilename),false);

frm.pbar.TotalParts:=30;
frm.pbar.Update;

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');

    excel.workbooks.open(tfilename);
    
    Sheet:= excel.Workbooks[1].WorkSheets[1];
    Sheet.Cells[1,1] :=frm.date_begin.text+'现金日统计';
    frm.pbar.PartsComplete:=1;
    frm.pbar.Update;

    Sheet.Cells[4,3] := frm.getR1data('''平衡足疗''',strState);
    Sheet.Cells[5,3] := frm.getR1data('''平衡保健''',strState); 
    Sheet.Cells[6,3] := frm.getR1data('''精油养生项目''',strState);  
    Sheet.Cells[7,3] := frm.getR1data('''姜艾养生''',strState);
    frm.pbar.PartsComplete:=4;
    frm.pbar.Update;
    application.ProcessMessages;
    
    Sheet.Cells[8,3] := frm.getR1data('''中频养生''',strState);
    Sheet.Cells[9,3] := frm.getR1data('''中医特殊疗法''',strState);
    Sheet.Cells[10,3] := frm.getR1data('''理疗师治疗''',strState);
    Sheet.Cells[11,3] := frm.getR1data('''美容项目''',strState);
    frm.pbar.PartsComplete:=8;
    frm.pbar.Update;
    application.ProcessMessages;

    Sheet.Cells[12,3] := frm.getR1data('''采耳'',''修脚''',strState); 
    Sheet.Cells[13,3] := frm.getR1data('''贵宾技师收费''',strState);
    Sheet.Cells[14,3] := frm.getR1data('''技术总监收费''',strState);
    Sheet.Cells[15,3] := frm.getR1data('''其它''',strState);
    Sheet.Cells[16,3] := frm.getR1data('''特效药''',strState);
    frm.pbar.PartsComplete:=13;
    frm.pbar.Update;
    application.ProcessMessages;

    Sheet.Cells[17,3] := frm.getR1data('''普通精油''',strState);
    Sheet.Cells[18,3] := frm.getR1data('''高级精油1'',''高级精油2'',''高级精油3''',strState);
    Sheet.Cells[19,3] := frm.getR1data('''贵宾房收费''',strState);

    //会员充值合计 (现金）
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''现金'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[21,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=16;
    frm.pbar.Update;
    application.ProcessMessages;
    
    //会员充值合计 (银联卡)
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''银联卡'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[22,3] :=floattostr(getCount(sqlstr));

    //会员充值合计 (充值赠送)
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''充值赠送'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[23,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=17;
    frm.pbar.Update;
    application.ProcessMessages;

    //会员充值合计 (业务赠送)
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''业务赠送'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[24,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=18;
    frm.pbar.Update;
    application.ProcessMessages;

    //会员充值合计 (积分赠送)
    sqlstr:= 'select sum(UTOTAL) as scount from TB_MEMBER_ADDMONEY where mtype=''积分赠送'' and UDATE>='''+frm.date_begin.Text+''''
                                          +' and UDATE<='''+frm.date_end.Text+'''';
                                          
    Sheet.cells[25,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=19;
    frm.pbar.Update;
    application.ProcessMessages;

    //付款方式1或付款方式2为现金时，二种付款额相加
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''现金'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''现金'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[26,3] :=tmpval;

    //银联卡
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''刷银联卡'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''刷银联卡'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[27,3] :=tmpval;


    //会员卡消费
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''刷会员卡'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''刷会员卡'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[28,3] :=tmpval;

    //免单消费
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''免单'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''免单'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[29,3] :=tmpval;

    //抵扣券消费
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''抵扣券'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''抵扣券'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[30,3] :=tmpval;

    //团购消费
    sqlstr:= 'select sum(OSPAYTYPESUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE=''团购'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval :=getCount(sqlstr);
    
    sqlstr:= 'select sum(OSPAYTYPE1SUM) as scount from TB_ORDER where OSTATE='''+strState+''' and OSPAYTYPE1=''团购'' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    tmpval := tmpval+getCount(sqlstr);
    Sheet.cells[31,3] :=tmpval;

    //总客数
    sqlstr:='select sum(OPCOUNT) as scount from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+'''';
    Sheet.cells[32,3] :=floattostr(getCount(sqlstr));
    frm.pbar.PartsComplete:=29;
    frm.pbar.Update;
    application.ProcessMessages;

    sqlstr:='select TRUNCATE(sum(PZCOUNT+PJCOUNT+DZCOUNT+DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                                          +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+frm.date_begin.Text+''''
                                          +' and ODATE<='''+frm.date_end.Text+''' ) and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''主要项目'') and ENUM in (select ENUM from TB_EMPLOYEE where ETYPE=''技师'')';
    ZsCount:= getCount(sqlstr);

    Sheet.cells[33,3] := floattostr(ZsCount);
    frm.pbar.PartsComplete:=30;
    frm.pbar.Update;
    application.ProcessMessages;

    
  except
    on E:Exception do
      begin
        Showmessage('数据报表输出出错,错误信息：'+e.Message);
        excel.DisplayAlerts := false;//是否提示存盘
        excel.Quit;//如果出错则退出
      end;

  end;

  frm.pbar.PartsComplete:=0;
  frm.pbar.Update;
  excel.Visible := true;//是否显示
end;

end.
