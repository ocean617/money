unit serviceProjectUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, DataLstFrameUnt, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RzButton, StdCtrls, DBGridEhGrouping,
  GridsEh, DBGridEh, ExtCtrls, DBCtrls;

type
  TfrmServiceProject = class(TForm)
    ds_service: TDataSource;
    zquery_service: TZQuery;
    dataLstFrame1: TdataLstFrame;
    RzBitBtn1: TRzBitBtn;
    procedure dataLstFrame1btn_deleteClick(Sender: TObject);
    procedure dataLstFrame1btn_addClick(Sender: TObject);
    procedure dataLstFrame1jobs_gridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServiceProject: TfrmServiceProject;

implementation

uses mainUnt, personAddUser, serviceAddService, loginUnt, commUnt,
  serviceAddGroup, groupServiceList, serviceReportKindSettings;

{$R *.dfm}

procedure TfrmServiceProject.dataLstFrame1btn_deleteClick(Sender: TObject);
var id:String;
begin

  if(not zquery_service.Active) then
  begin

      messagebox(handle,'当前数据源被关闭，不能删除!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  
  if(zquery_service.IsEmpty) then
  begin

      messagebox(handle,'当前没有可以被删除的记录!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  id := zquery_service.FieldByName('SID').Value;//获得当前选择值
  if(id<>'') then
  begin

      if(messagebox(handle,'您确定要删除选择的记录吗?','询问',MB_ICONQUESTION + MB_YESNO	)=id_yes)  then
      begin

         zquery_service.Delete;
      end;
  end;

end;

procedure TfrmServiceProject.dataLstFrame1btn_addClick(Sender: TObject);
var frm_service_serviceAdd: Tfrm_service_serviceAdd;
begin
  if(not zquery_service.Active) then
  begin

      messagebox(handle,'当前数据源被关闭，不能新增!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
    zquery_service.Append;
    frm_service_serviceAdd := Tfrm_service_serviceAdd.create(nil);
    if( frm_service_serviceAdd.ShowModal = mrOK) then
    begin
        zquery_service.FieldByName('SID').Value :=  CreateNewId();
        zquery_service.FieldByName('UID').Value :=  mainFrm.user_id;
        zquery_service.FieldByName('UNAME').Value := mainFrm.user_name;
        zquery_service.Post;
    end
    else
    begin
        zquery_service.Cancel;
    end;
    frm_service_serviceAdd.Free;

end;

procedure TfrmServiceProject.dataLstFrame1jobs_gridDblClick(
  Sender: TObject);
begin
  if(not zquery_service.Active) then
  begin
      messagebox(handle,'当前数据源被关闭，不能编辑!','错误',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
    zquery_service.Edit;
    frm_service_serviceAdd := Tfrm_service_serviceAdd.create(nil);
    if( frm_service_serviceAdd.ShowModal = mrOK) then
    begin
        zquery_service.FieldByName('UID').Value :=  mainFrm.user_id;
        zquery_service.FieldByName('UNAME').Value := mainFrm.user_name;
        zquery_service.Post;
    end
    else
    begin
        zquery_service.Cancel;
    end;
    frm_service_serviceAdd.Free;
end;

procedure TfrmServiceProject.FormCreate(Sender: TObject);
begin
   //打开用户的数据源
   with zquery_service do
   begin
     close;
     sql.Clear;
     sql.Add('select * from TB_BASE_SERVICEITEM order by SCODE');
     open;
   end;
end;

procedure TfrmServiceProject.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmServiceProject.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if integer(Key)=27 then
   close;
end;

procedure TfrmServiceProject.RzBitBtn1Click(Sender: TObject);
var
 frm:TfrmServiceReportKindSettings;
begin
  frm:=TfrmServiceReportKindSettings.Create(nil);
  frm.ShowModal;
  frm.Free;

end;

end.
