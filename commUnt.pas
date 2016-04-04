{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit commUnt;

interface

uses windows,messages, SysUtils, Variants, Classes,ActiveX,StrUtils,DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset,ZConnection,RzLabel,DateUtils,Controls,MSHTML,OleCtrls, SHDocVw,Math;
const
  XorKey:array[0..7] of Byte=($B2,$08,$AA,$55,$93,$6D,$84,$47); //字符串加密用

   {分割字符串}
   function splitStr(str:string;sepstr:TSysCharSet):TStringList;
   {生成GUID}
   function CreateNewId():string;
   {执行SQL}
   procedure ExeNoReTurnSQL(sqls:TstringList);
   {执行按主键删除某行数据}
   procedure DelDataByKey(tablename,keyfieldname,keyfieldvalue:string) ;
   {修改密码}
   procedure changePass(uid:String;newPass:string);

   {字符加密函數  這是用的一個異或加密}
   function Enc(Str:String):String;
   {字符解密函數}
   function Dec(Str:String):string;
   procedure exeSql(sql:string);
   {得到某个种类的下一个流水号}
   function getNextSeqNum(stypeName:String):string;
   {打开数据查询}
   procedure openqy(qy:Tzquery;sql:string);
   {根据项目ID得到项目价格}
   function getItemPrice(ItemId:string;level:integer):real;
   {得到某个数据的查询}
   function getCount(sql:string):real;
   {根据编码得到ID}
   function getID(sql:string):string;
   {判断是否有效日期}
   function IsDate(dateStr:string):boolean;

implementation

uses mainUnt;

 function splitStr(str:string;sepstr:TSysCharSet):TStringList;
  var
   s:Tstringlist;
   ACount:Integer;
  begin
    s:=TStringList.Create;
    ACount := ExtractStrings(sepstr, [' ', '#', '.'], pchar(str),s);
    result:=s;
    s.Free;
  end;

 function CreateNewId():string;
 var
   TmpGUID: TGUID;
   s:string;
   begin
     result := '';
     if CoCreateGUID(TmpGUID) = S_OK then
       begin
         s:=   GUIDToString(TmpGUID) ;
         s:= AnsiReplaceText(s,'{','');
         s:= AnsiReplaceText(s,'}','');
         result := s;
       end;
   end;
   

procedure ExeNoReTurnSQL(sqls:TstringList);
var
 qry:TZquery;
 i:integer;
begin
 qry:= TZquery.Create(nil);
 qry.Connection:= mainfrm.conn;
 for i:=0 to sqls.Count-1 do
   begin
     qry.SQL.Clear;
     qry.SQL.Append(sqls[i]);
     qry.ExecSQL;
     qry.Close;
   end;
 qry.Free;
end;

procedure DelDataByKey(tablename,keyfieldname,keyfieldvalue:string);
var
 s:Tstringlist;
begin
 s:=Tstringlist.Create;
 s.Append('delete from '+tablename+' where '+ keyfieldname+'='''+keyfieldvalue+'''');
 ExeNoReTurnSQL(s);
 s.Free;
end;

procedure changePass(uid:String;newPass:string);
var
 s:Tstringlist;
begin
 s:=Tstringlist.Create;
 s.Append('update users set upassword='''+newPass+''' where uid='''+uid+'''');
 ExeNoReTurnSQL(s);
 s.Free;
end;

function getFieldList(tablename,keyfieldname,keyfieldvalue,ListFieldname,Symbol:String):string;
var
 sqlstr:string;
 qry:TZquery;
 i:integer;
 retstr:string;
begin
 qry:= TZquery.Create(nil);
 qry.Connection:= mainfrm.conn;
 retstr:='';
 
 sqlstr:= 'select '+ListFieldname +' from '+tablename+' where '+keyfieldname+'='''+keyfieldvalue+'''';
 qry.SQL.Clear;
 qry.SQL.Append(sqlstr);
 qry.Open;

 if (not qry.IsEmpty) then
      while (qry.Eof<>true) do
        begin
           retstr:= retstr + qry.FieldByName(ListFieldname).AsString+Symbol;
           qry.Next;
        end;
 if length(retstr)>0 then
   retstr := copy(retstr,0,length(retstr)-1);

 qry.Close;
 qry.Free;
 result:= retstr;
end;

function Enc(Str:String):String;
var
 i,j:Integer;
begin
 Result:='';
 j:=0;
 for i:=1 to Length(Str) do
   begin
     Result:=Result+IntToHex(Byte(Str[i]) xor XorKey[j],2);
     j:=(j+1) mod 8;
   end;
end;

   {字符解密函數}
function Dec(Str:String):string;
var
 i,j:Integer;
begin
 Result:='';
 j:=0;
 for i:=1 to Length(Str) div 2 do
   begin
     Result:=Result+Char(StrToInt('$'+Copy(Str,i*2-1,2)) xor XorKey[j]);
     j:=(j+1) mod 8;
   end;
end;

procedure exeSql(sql:string);
var
 tmpqy:Tzquery;
begin
  tmpqy:=Tzquery.Create(nil);
  tmpqy.Connection:=mainfrm.conn;
  tmpqy.SQL.Add(sql);
  tmpqy.ExecSQL;
  tmpqy.Free;
end;

function getNextSeqNum(stypeName:String):string;
var
 qry:tzquery;
 monthstr,ret_str,numstr:string;
 nnum:integer;
begin
 ret_str := inttostr(yearof(now()));
 nnum:=1;
 
 monthstr:= inttostr(monthof(now()));
 if length(monthstr)=1 then monthstr := '0'+monthstr;
 ret_str := ret_str + monthstr;
 
 monthstr:= inttostr(dayof(now()));
 if length(monthstr)=1 then monthstr := '0'+monthstr;
 ret_str := ret_str + monthstr;

 qry:=tzquery.Create(nil);
 qry.Connection:=mainfrm.conn;
 qry.SQL.Clear;
 qry.SQL.Add('select * from TB_NUMS where Ntype='''+stypeName+''' and day(NDATE)=day(now()) and month(NDATE)=month(now()) and year(NDATE)=year(now())');
 qry.open;
 
 if qry.IsEmpty then
   begin
     ret_str :=ret_str +'001';
     exesql('insert into TB_NUMS(NID,NTYPE,NDATE,NNUM) values('''+CreateNewId()+''','''+stypeName+''',now(),1)');
   end
 else
   begin
     nnum := qry.fieldbyname('NNUM').AsInteger;
     exesql('update TB_NUMS set NNUM=NNUM+1 where Ntype='''+stypeName+''' and day(NDATE)=day(now()) and month(NDATE)=month(now()) and year(NDATE)=year(now())');
     numstr:=inttostr(nnum);
     if length(numstr)=1 then numstr:= '00'+numstr
     else if length(numstr)=2 then numstr :='0'+numstr;
     
     ret_str := ret_str + numstr;
   end;

 qry.Close;
 qry.Free;
 
 result:= ret_str;
 
end;

procedure openqy(qy:Tzquery;sql:string);
begin
if qy.Active then qy.Close;
qy.SQL.Clear;
qy.SQL.Add(sql);
qy.Open;
end;

function getItemPrice(ItemId:string;level:integer):real;
var
 price:real;
 qry:tzquery;
begin
 price:=0.0;
 qry:=tzquery.Create(nil);
 qry.Connection:=mainfrm.conn;
 qry.SQL.Add('select * from TB_BASE_SERVICEITEM where SID='''+ItemId+'''');
 qry.Open;
 if not qry.IsEmpty then
   begin
     if (level=1) then
       price := qry.fieldbyname('SDAYPRICE').AsFloat;
     if (level=2) then
       price := qry.fieldbyname('SNIGHTPRICE').AsFloat;
     if (level=3) then
       price := qry.fieldbyname('SMEMBERPRICE').AsFloat;
     if (level=4) then
       price := qry.fieldbyname('SVIPPRICE').AsFloat;
     if (level=5) then
       price := qry.fieldbyname('TGPRICE').AsFloat;
   end;
 qry.Close;
 qry.Free;
 result:=price;
end;

function getCount(sql:string):real;
var
  qry:tzquery;
  ret_value:real;
begin
  qry:=tzquery.Create(nil);
  qry.Connection:=mainfrm.conn;
  ret_value:=0.0;
  
  try
  qry.ParamCheck:=false;
  qry.SQL.Add(sql);
  qry.Open;
  //ret_value := Round(qry.fieldbyname('scount').AsFloat,2);
  ret_value :=  qry.fieldbyname('scount').AsFloat;
  except
    ret_value:=0.0;
  end;
  qry.Free;

  result:=ret_value;
end;

function getID(sql:string):string;
var
  qry:tzquery;
  ret_value:string;
begin
  qry:=tzquery.Create(nil);
  qry.Connection:=mainfrm.conn;

  qry.SQL.Add(sql);
  qry.Open;
  ret_value := qry.fieldbyname('ID').AsString;
  qry.Free;

  result:=ret_value;
end;

function IsDate(dateStr:string):boolean;
begin
try
  strtodatetime(dateStr);
  result :=true;
except
  result :=false;
end;
end;

end.
