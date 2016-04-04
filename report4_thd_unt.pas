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
    messagebox(0,'请选择技师.','提示',mb_iconinformation);
    exit;
  end;
  
strState:='核单';
fileId:=CreateNewId;
sfilename:=extractFilepath(application.exename)+'report\template\r4.xls';
tfilename:=extractFilepath(application.exename)+'report\reportfiles\r4\'+FileId+'.xls';
copyfile(pchar(sfilename),pchar(tfilename),false);
//工号
enum:=trim(copy(frm.js_cmb.Text,0,pos(' ',frm.js_cmb.Text)));
ename:=trim(copy(frm.js_cmb.Text,pos(' ',frm.js_cmb.Text),length(frm.js_cmb.Text)-pos('',frm.js_cmb.Text)));

tjid:= getID('select EID as ID from TB_EMPLOYEE where ENUM='''+enum+'''');

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//是否显示
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];
    Sheet.Cells[1,1] :=frm.r4_year_cmb.text+'年'+frm.r4_month.Text+'月份技师业绩累计表';
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

        //总钟数
        Sheet.Cells[4,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT+DZCOUNT+PJCOUNT+DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''''
                                          +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''主要项目'')'));
       //点钟加钟                                   
        Sheet.Cells[5,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT+DJCOUNT+PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''''
                                          +') and SID in (select SID from TB_BASE_SERVICEITEM where SITEMKIND=''主要项目'')'));
        //平衡足疗	排
        Sheet.Cells[6,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡足疗'')'
                                          +')'));
       //排加
        Sheet.Cells[7,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡足疗'')'
                                          +')'));
                                          
        Sheet.Cells[8,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡足疗'')'
                                          +')'));

        Sheet.Cells[9,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡足疗'')'
                                          +')'));
        //平衡保健
        Sheet.Cells[10,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡保健'')'
                                          +')'));
        //
        Sheet.Cells[11,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡保健'')'
                                          +')'));
        //
        Sheet.Cells[12,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡保健'')'
                                          +')'));
       // 点加
        Sheet.Cells[13,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''平衡保健'')'
                                          +')'));
        //精油养生
        Sheet.Cells[14,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''精油养生项目'')'
                                          +')'));
        //
        Sheet.Cells[15,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''精油养生项目'')'
                                          +')'));
        //
        Sheet.Cells[16,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''精油养生项目'')'
                                          +')'));
        //
        Sheet.Cells[17,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''精油养生项目'')'
                                          +')'));
        //姜艾养生
        Sheet.Cells[18,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''姜艾养生'')'
                                          +')'));
        //
        Sheet.Cells[19,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''姜艾养生'')'
                                          +')'));
        //
        Sheet.Cells[20,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''姜艾养生'')'
                                          +')'));
        //
        Sheet.Cells[21,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''姜艾养生'')'
                                          +')'));
        //中频养生
        Sheet.Cells[22,i+2] := floattostr(getCount('select TRUNCATE(sum(PZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''中频养生'')'
                                          +')'));
        //
        Sheet.Cells[23,i+2] := floattostr(getCount('select TRUNCATE(sum(PJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''中频养生'')'
                                          +')'));
        //
        Sheet.Cells[24,i+2] := floattostr(getCount('select TRUNCATE(sum(DZCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''中频养生'')'
                                          +')'));
        //
        Sheet.Cells[25,i+2] := floattostr(getCount('select TRUNCATE(sum(DJCOUNT),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''中频养生'')'
                                          +')'));
        //中特疗
        Sheet.Cells[26,i+2] := floattostr(getCount('select TRUNCATE(sum(TOTALCOST),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''中医特殊疗法'')'
                                          +')'));

        //理疗师治疗
        Sheet.Cells[27,i+2] := floattostr(getCount('select TRUNCATE(sum(TOTALCOST),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''理疗师治疗'')'
                                          +')'));
       //美容项目
        Sheet.Cells[28,i+2] := floattostr(getCount('select TRUNCATE(sum(TOTALCOST),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''美容项目'')'
                                          +')'));

        //采修
        Sheet.Cells[29,i+2] := floattostr(getCount('select TRUNCATE(sum(TOTALCOST),2) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND in(''采耳'',''修脚''))'
                                          +')'));

        //贵宾技师收费
        Sheet.Cells[30,i+2] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''贵宾技师收费'')'
                                          +')'));                                          
        //技术总监收费
        Sheet.Cells[31,i+2] := floattostr(getCount('select sum(TOTALCOST) as scount from TB_ORDER_SERVCEITEM where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' and ENUM='''+enum+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''技术总监收费'')'
                                          +')'));   
        //推荐采修
        Sheet.Cells[32,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND in (''推荐采耳'',''推荐修脚''))'));

        //推荐特效药
        Sheet.Cells[33,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐特效药'')'));
        //推荐普通精油
        Sheet.Cells[34,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐普通精油'')'));
        //推荐精装高级精油1
        Sheet.Cells[35,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐高级精油1'')'));

        //推荐精装高级精油2
        Sheet.Cells[36,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐高级精油2'')'));

        //推荐精装高级精油3
        Sheet.Cells[37,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐高级精油3'')'));

        //贵宾房提成
        Sheet.Cells[38,i+2] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                            +'(select OID from TB_ORDER where OSTATE='''+strState+''' and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                        +' ) and TJEID='''+tjid+''' and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐贵宾房收费'')'));
                                             
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
