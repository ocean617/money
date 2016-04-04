unit groupServiceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, RzButton, GridsEh, DBGridEh, ExtCtrls, RzPanel,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls;

type
  TfrmGroupServiceList = class(TForm)
    zquery_wait: TZQuery;
    zquery_aleady: TZQuery;
    zquery_exec: TZQuery;
    ds_wait: TDataSource;
    ds_aleady: TDataSource;
    RzBitBtn1: TRzBitBtn;
    jobs_grid: TDBGridEh;
    DBGridEh1: TDBGridEh;
    RzBitBtn2: TRzBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure RzButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure openwaitDs();
  public
    GID:String;//groupId
    { Public declarations }
  end;

var
  frmGroupServiceList: TfrmGroupServiceList;

implementation

uses mainUnt, commUnt;

{$R *.dfm}

procedure TfrmGroupServiceList.RzButton3Click(Sender: TObject);
begin
close();
end;

procedure TfrmGroupServiceList.FormShow(Sender: TObject);
begin

//待选
   openwaitDs;
   
//已选
with zquery_aleady do
begin
    close;
    sql.Clear;
    sql.Add('select * from TB_BASE_SERVICEITEM inner join TB_SERVICEITEMGROUPRELA  on TB_BASE_SERVICEITEM.SID=TB_SERVICEITEMGROUPRELA.SID where TB_SERVICEITEMGROUPRELA.GID='''+GID+'''');
    open;
end;


end;

procedure TfrmGroupServiceList.RzButton1Click(Sender: TObject);
var sid:String;
begin
  if(not zquery_wait.Active) then
  begin

      messagebox(handle,'当前数据源被关闭，不能删除!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  
  if(zquery_wait.IsEmpty) then
  begin

      messagebox(handle,'当前没有可以被删除的记录!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  sid := zquery_wait.fieldByName('SID').Value;
  with zquery_exec do
  begin
     close;
     sql.Clear;
     sql.Add('select * from TB_SERVICEITEMGROUPRELA');
     open;
  end;
  zquery_exec.Append;
  zquery_exec.FieldByName('GID').value:=gid;
  zquery_exec.FieldByName('SID').value:=sid;
  zquery_exec.FieldByName('RID').value:=CreateNewId();
  zquery_exec.Post;
  zquery_aleady.Refresh;
  openwaitDs;
end;

procedure TfrmGroupServiceList.RzButton2Click(Sender: TObject);
var rid:String;
begin
  if(not zquery_aleady.Active) then
  begin

      messagebox(handle,'当前数据源被关闭，不能删除!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  
  if(zquery_aleady.IsEmpty) then
  begin

      messagebox(handle,'当前没有可以被删除的记录!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  rid := zquery_aleady.fieldByName('RID').Value;
  with zquery_exec do
  begin
     close;
     sql.Clear;
     sql.Add('delete  from TB_SERVICEITEMGROUPRELA where RID='''+rid+'''');
     execsql;
  end;

  zquery_aleady.Refresh;
  openwaitDs;
end;

procedure TfrmGroupServiceList.openwaitDs;
begin
with zquery_wait do
begin
    close;
    sql.Clear;
    sql.Add('select * from TB_BASE_SERVICEITEM where SID not in (select SID from TB_SERVICEITEMGROUPRELA where GID='''+GID+''') order by SITEMNAME');
    open;
end;

end;

end.
