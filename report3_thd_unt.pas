unit report3_thd_unt;

interface

uses
  Classes,Windows,Dialogs,SysUtils,forms,ActiveX,ComCtrls,Comobj,ReportUnt,DateUtils,ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  report3_thd = class(TThread)
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

procedure report3_thd.Execute;
begin
  Synchronize(show);
end;

procedure report3_thd.show;
var
 fileId,sfilename,tfilename,sdate,edate:string;
 excel,Sheet:variant;
 ZsCount:real;
 qry:tZquery;
 i,j:integer;
 strState:string;
 t:Tdatetime;
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
sfilename:=extractFilepath(application.exename)+'report\template\r3.xls';
tfilename:=extractFilepath(application.exename)+'report\reportfiles\r3\'+FileId+'.xls';
copyfile(pchar(sfilename),pchar(tfilename),false);

//将数据导入Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//是否显示
    excel.workbooks.open(tfilename);
    frm.pbar.TotalParts:=10;
    frm.pbar.Update;
    
    //第一页()
    Sheet:= excel.Workbooks[1].WorkSheets[1];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    //showmessage(booltostr(TryStrToDatetime('2011-02-28 11:00:00',t)));
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        //列给值
        for j:=2 to 32 do
         begin
         if j-1>=10 then
          sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
         else
          sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
          
          try
            edate:=datetostr(incday(strtodatetime(sdate),1));
            edate:=edate+' 04:00:00';
          except
            continue;
          end;

            Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                  +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                            +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐精油养生'') and TJEID='''+qry.FieldByName('EID').AsString+''''));

         end;
         
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;

      //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=1;
    frm.pbar.Update;

    //第二页
    Sheet:= excel.Workbooks[1].WorkSheets[2];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
             if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
             else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
              try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
              except
                continue;
              end;
              
          Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐十四经养生'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
          end;
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
            
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=2;
    frm.pbar.Update;
    
    //第三页
    Sheet:= excel.Workbooks[1].WorkSheets[3];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
             if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
             else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
              try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
              except
                continue;
              end;
              
          Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                          +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐姜艾养生'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
          end;
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
            
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=2;
    frm.pbar.Update;
     
    //第4页
    Sheet:= excel.Workbooks[1].WorkSheets[4];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
             if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
             else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
              try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
              except
                continue;
              end;
              
          if (TryStrToDatetime(sdate,t) and TryStrToDatetime(edate,t)) then
            Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                  +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                            +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐中频养生'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
                                          
          end;
          
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
            
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=3;
    frm.pbar.Update;    
          
  //第5页
    Sheet:= excel.Workbooks[1].WorkSheets[5];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
           if j-1>=10 then
            sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
           else
            sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
            try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
            except
              continue;
            end;

            try
              Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                              +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐综合项目'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
            except
              continue;
            end;
                                            
          end;
                                            
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';       
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=4;
    frm.pbar.Update;
    
 //第6页
    Sheet:= excel.Workbooks[1].WorkSheets[6];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
            if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
            else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
            try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
            except
              continue;
            end;

            if (TryStrToDatetime(sdate,t) and TryStrToDatetime(edate,t)) then
              Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                              +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐特效药'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
                                            
          end;
          
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
                
    qry.close;
    qry.free;

    application.ProcessMessages;
    frm.pbar.PartsComplete:=5;
    frm.pbar.Update;

//第7页 (推荐高精2)
    Sheet:= excel.Workbooks[1].WorkSheets[7];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
            if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
            else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
            try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
            except
              continue;
            end;

            if (TryStrToDatetime(sdate,t) and TryStrToDatetime(edate,t)) then
              Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                              +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐普通精油'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
                                            
          end;
          
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
                
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=6;
    frm.pbar.Update;
    
//第8页 (推荐高精3)
    Sheet:= excel.Workbooks[1].WorkSheets[8];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
            if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
            else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
            try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
            except
              continue;
            end;

            if (TryStrToDatetime(sdate,t) and TryStrToDatetime(edate,t)) then
              Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                              +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐高级精油1'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
                                            
          end;
          
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
                
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=7;
    frm.pbar.Update;

    //第9页 (推荐泥灸)
    Sheet:= excel.Workbooks[1].WorkSheets[9];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
            if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
            else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
            try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
            except
              continue;
            end;

            if (TryStrToDatetime(sdate,t) and TryStrToDatetime(edate,t)) then
              Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                              +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐高级精油2'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
                                            
          end;
          
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
                
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=8;
    frm.pbar.Update;
    
//第10页 (推荐姜艾热疗)
    Sheet:= excel.Workbooks[1].WorkSheets[10];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
            if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
            else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
            try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
            except
              continue;
            end;

            if (TryStrToDatetime(sdate,t) and TryStrToDatetime(edate,t)) then
              Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                              +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐高级精油3'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
                                            
          end;
          
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
                
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=9;
    frm.pbar.Update;
    
//第11页 (推荐姜艾热疗)
    Sheet:= excel.Workbooks[1].WorkSheets[11];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
            if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
            else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
            try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
            except
              continue;
            end;

            if (TryStrToDatetime(sdate,t) and TryStrToDatetime(edate,t)) then
              Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                              +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐贵宾技师'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
                                            
          end;
          
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
                
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=10;
    frm.pbar.Update;

//第12页
    Sheet:= excel.Workbooks[1].WorkSheets[12];
    qry:= tZquery.Create(nil);
    qry.Connection:=mainfrm.conn;
    qry.SQL.Add('select * from  TB_EMPLOYEE order by ENUM');
    qry.Open;
    i:=3;
    while (not qry.Eof) do
      begin
        Sheet.Cells[i,1] := qry.FieldByName('ENAME').AsString;
        for j:=2 to 32 do
          begin
            if j-1>=10 then
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-'+inttostr(j-1)+' 12:00:00'
            else
              sdate:= frm.r3_year_cmb.Text+'-'+frm.r3_month.Text+'-0'+inttostr(j-1)+' 12:00:00';
            try
              edate:=datetostr(incday(strtodatetime(sdate),1));
              edate:=edate+' 04:00:00';
            except
              continue;
            end;

            if (TryStrToDatetime(sdate,t) and TryStrToDatetime(edate,t)) then
              Sheet.Cells[i,j] := floattostr(getCount('select sum(TITEMCOUNT) as scount from TB_ORDER_TJ where OID in '
                                    +'(select OID from TB_ORDER where OSTATE='''+strState+'''  and ODATE>='''+sdate+''' and ODATE<='''+edate+''''
                                              +') and SID in (select SID from TB_BASE_SERVICEITEM where REPORTKIND=''推荐贵宾房收费'') and TJEID='''+qry.FieldByName('EID').AsString+''''));
                                            
          end;
          
        Sheet.Cells[i,33] :='=SUM(B'+inttostr(i)+':AF'+ inttostr(i)+')';
        qry.Next;
        inc(i);
      end;
   //合计
      Sheet.Cells[i,1] := '合计';
      Sheet.Cells[i,2] := '=SUM(B3:B'+inttostr(i-2)+')';
      Sheet.Cells[i,3] := '=SUM(C3:C'+inttostr(i-2)+')';
      Sheet.Cells[i,4] := '=SUM(D3:D'+inttostr(i-2)+')';
      Sheet.Cells[i,5] := '=SUM(E3:E'+inttostr(i-2)+')';
      Sheet.Cells[i,6] := '=SUM(F3:F'+inttostr(i-2)+')';
      Sheet.Cells[i,7] := '=SUM(G3:G'+inttostr(i-2)+')';
      Sheet.Cells[i,8] := '=SUM(H3:H'+inttostr(i-2)+')';
      Sheet.Cells[i,9] := '=SUM(I3:I'+inttostr(i-2)+')';
      Sheet.Cells[i,10] := '=SUM(J3:J'+inttostr(i-2)+')';
      Sheet.Cells[i,11] := '=SUM(K3:K'+inttostr(i-2)+')';
      Sheet.Cells[i,12] := '=SUM(L3:L'+inttostr(i-2)+')';
      Sheet.Cells[i,13] := '=SUM(M3:M'+inttostr(i-2)+')';
      Sheet.Cells[i,14] := '=SUM(N3:N'+inttostr(i-2)+')';
      Sheet.Cells[i,15] := '=SUM(O3:O'+inttostr(i-2)+')';
      Sheet.Cells[i,16] := '=SUM(P3:P'+inttostr(i-2)+')';
      Sheet.Cells[i,17] := '=SUM(Q3:Q'+inttostr(i-2)+')';
      Sheet.Cells[i,18] := '=SUM(R3:R'+inttostr(i-2)+')';
      Sheet.Cells[i,19] := '=SUM(S3:S'+inttostr(i-2)+')';
      Sheet.Cells[i,20] := '=SUM(T3:T'+inttostr(i-2)+')';
      Sheet.Cells[i,21] := '=SUM(U3:U'+inttostr(i-2)+')';
      Sheet.Cells[i,22] := '=SUM(V3:V'+inttostr(i-2)+')';
      Sheet.Cells[i,23] := '=SUM(W3:W'+inttostr(i-2)+')';
      Sheet.Cells[i,24] := '=SUM(X3:X'+inttostr(i-2)+')';
      Sheet.Cells[i,25] := '=SUM(Y3:Y'+inttostr(i-2)+')';
      Sheet.Cells[i,26] := '=SUM(Z3:Z'+inttostr(i-2)+')';
      Sheet.Cells[i,27] := '=SUM(AA3:AA'+inttostr(i-2)+')';
      Sheet.Cells[i,28] := '=SUM(AB3:AB'+inttostr(i-2)+')';
      Sheet.Cells[i,29] := '=SUM(AC3:AC'+inttostr(i-2)+')';
      Sheet.Cells[i,30] := '=SUM(AD3:AD'+inttostr(i-2)+')';
      Sheet.Cells[i,31] := '=SUM(AE3:AE'+inttostr(i-2)+')';
      Sheet.Cells[i,32] := '=SUM(AF3:AF'+inttostr(i-2)+')';
      Sheet.Cells[i,33] := '=SUM(AG3:AG'+inttostr(i-2)+')';
                
    qry.close;
    qry.free;
    application.ProcessMessages;
    frm.pbar.PartsComplete:=10;
    frm.pbar.Update;
                   
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
