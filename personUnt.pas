unit personUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzButton,
  DataLstFrameUnt, RzTabs, StdCtrls, ExtCtrls, Mask, RzEdit, RzDBEdit,
  DBGridEhGrouping, Buttons, GridsEh, DBGridEh, RzPanel, RzBckgnd,
  pngimage, se_image,Comobj;

type
  Tfrm_person = class(TForm)
    RzPageControl1: TRzPageControl;
    zquery_user: TZQuery;
    ds_user: TDataSource;
    zquery_employee: TZQuery;
    ds_employee: TDataSource;
    tabsheet_user: TRzTabSheet;
    tabsheet_employee: TRzTabSheet;
    seImage1: TseImage;
    Label1: TLabel;
    stxt: TStaticText;
    bg: TRzBackground;
    Bevel1: TBevel;
    RzPanel1: TRzPanel;
    grid: TDBGridEh;
    seImage2: TseImage;
    Label2: TLabel;
    RzToolbarButton1: TRzToolbarButton;
    RzToolbarButton2: TRzToolbarButton;
    RzToolbarButton3: TRzToolbarButton;
    seImage3: TseImage;
    Label3: TLabel;
    StaticText1: TStaticText;
    RzBackground1: TRzBackground;
    Label4: TLabel;
    seImage4: TseImage;
    Bevel2: TBevel;
    RzPanel2: TRzPanel;
    RzToolbarButton4: TRzToolbarButton;
    RzToolbarButton5: TRzToolbarButton;
    RzToolbarButton6: TRzToolbarButton;
    DBGridEh1: TDBGridEh;
    expert_bt: TRzToolbarButton;
    procedure FormShow(Sender: TObject);
    procedure useradd(Sender: TObject);
    procedure useredit(Sender: TObject);
    procedure userdel(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure emplyeeDel(Sender: TObject);
    procedure emplyeeAdd(Sender: TObject);
    procedure emplyeeEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure gridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure expert_btClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_person: Tfrm_person;

implementation

uses mainUnt, personAddUser, commUnt, personAddEmployee, personAddMembers,
  personAddMoney;

{$R *.dfm}

procedure Tfrm_person.FormShow(Sender: TObject);
begin
   //Ĭ��ҳ����ʾ�û�
   RzPageControl1.ActivePage := tabsheet_user;

   //���û�������Դ
   with zquery_user do
   begin
     close;
     sql.Clear;
     sql.Add('select * from TB_USERS');
     open;
   end;

end;

procedure Tfrm_person.useradd(Sender: TObject);
var frm_person_userAdd: Tfrm_person_userAdd;
begin
  if(not zquery_user.Active) then
  begin

      messagebox(handle,'��ǰ����Դ���رգ���������!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
    zquery_user.Append;
    frm_person_userAdd := Tfrm_person_userAdd.create(nil);
    if( frm_person_userAdd.ShowModal = mrOK) then
    begin
        zquery_user.FieldByName('UID').Value :=  CreateNewId();
        zquery_user.FieldByName('UPASS').Value :=  frm_person_userAdd.upwd.Text;
        zquery_user.FieldByName('UDATE').Value := now;
        zquery_user.Post;
    end
    else
    begin
        zquery_user.Cancel;
    end;
    frm_person_userAdd.Free;
end;

procedure Tfrm_person.useredit(Sender: TObject);
begin
  if(not zquery_user.Active) then
  begin

      messagebox(handle,'��ǰ����Դ���رգ����ܱ༭!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
    zquery_user.Edit;
    frm_person_userAdd := Tfrm_person_userAdd.create(nil);
    if( frm_person_userAdd.ShowModal = mrOK) then
    begin

        zquery_user.FieldByName('UPASS').Value :=  frm_person_userAdd.upwd.Text;
        zquery_user.Post;
    end
    else
    begin
        zquery_user.Cancel;
    end;
    frm_person_userAdd.Free;
  
end;

procedure Tfrm_person.userdel(Sender: TObject);
var id:String;
begin
  if(not zquery_user.Active) then
  begin

      messagebox(handle,'��ǰ����Դ���رգ�����ɾ��!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  
  if(zquery_user.IsEmpty) then
  begin

      messagebox(handle,'��ǰû�п��Ա�ɾ���ļ�¼!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  id := zquery_user.FieldByName('UID').Value;//��õ�ǰѡ��ֵ
  if(id<>'') then
  begin

      if(messagebox(handle,'��ȷ��Ҫɾ��ѡ��ļ�¼��?','ѯ��',MB_ICONQUESTION + MB_YESNO	)=id_yes)  then
      begin

         zquery_user.Delete;
      end;
  end;

end;

procedure Tfrm_person.RzPageControl1Change(Sender: TObject);
begin
   //���ѡ�����ҳ��
   if((RzPageControl1.ActivePage =  tabsheet_employee) and (not zquery_employee.Active)) then
   begin
       with zquery_employee do
       begin
           close;
           sql.Clear;
           sql.Add('select * from TB_EMPLOYEE');
           open;
       end;
   end;
end;

procedure Tfrm_person.emplyeeDel(Sender: TObject);
var id:string;
begin
  if(not zquery_employee.Active) then
  begin

      messagebox(handle,'��ǰ����Դ���رգ�����ɾ��!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;

  if(zquery_employee.IsEmpty) then
  begin

      messagebox(handle,'��ǰû�п��Ա�ɾ���ļ�¼!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
  id := zquery_employee.FieldByName('EID').Value;//��õ�ǰѡ��ֵ
  if(id<>'') then
  begin

      if(messagebox(handle,'��ȷ��Ҫɾ��ѡ��ļ�¼��?','ѯ��',MB_ICONQUESTION + MB_YESNO	)=id_yes)  then
      begin

         zquery_employee.Delete;
      end;
  end;
end;

procedure Tfrm_person.emplyeeAdd(Sender: TObject);
var frm_person_userEmployee: Tfrm_person_userEmployee;
begin
  if(not zquery_employee.Active) then
  begin

      messagebox(handle,'��ǰ����Դ���رգ���������!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
    zquery_employee.Append;
    frm_person_userEmployee := Tfrm_person_userEmployee.create(nil);
    if( frm_person_userEmployee.ShowModal = mrOK) then
    begin
        zquery_employee.FieldByName('EID').Value :=  CreateNewId();
        zquery_employee.Post;
    end
    else
    begin
        zquery_employee.Cancel;
    end;
    frm_person_userEmployee.Free;
end;

procedure Tfrm_person.emplyeeEdit(Sender: TObject);
var frm_person_userEmployee: Tfrm_person_userEmployee;
begin
  if(not zquery_employee.Active) then
  begin

      messagebox(handle,'��ǰ����Դ���رգ����ܱ༭!','����',MB_ICONERROR + MB_OK	)  ;
      exit;
  end;
    zquery_employee.Edit;
    frm_person_userEmployee := Tfrm_person_userEmployee.create(nil);
    if( frm_person_userEmployee.ShowModal = mrOK) then
    begin
        zquery_employee.Post;
    end
    else
    begin
        zquery_employee.Cancel;
    end;
    frm_person_userEmployee.Free;
end;

procedure Tfrm_person.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action := cafree;
end;

procedure Tfrm_person.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if integer(Key)=27 then
   close;
end;

procedure Tfrm_person.gridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
sortstring:string; //������
begin
//��������
with Column do
begin
if FieldName = '' then
  Exit;

case Title.SortMarker of
  smNoneEh:
  begin
      Title.SortMarker := smUpEh;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stAscending;
  end;
  smDownEh:
  begin
      Title.SortMarker := smUpEh; 
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stAscending;
  end;
  smUpEh:
  begin
     Title.SortMarker := smDownEh;
     ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
     ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stDescending;
  end;

end;
end;

end;

procedure Tfrm_person.expert_btClick(Sender: TObject);
 var
 fileId,sfilename,tfilename:string;
 excel,Sheet:variant;
 i:integer;
begin
 if not zquery_employee.Active then exit;
 if zquery_employee.RecordCount=0 then exit;
 
 fileId:=CreateNewId;
 sfilename:=extractFilepath(application.exename)+'report\template\person.xls';
 tfilename:=extractFilepath(application.exename)+'report\reportfiles\person\'+FileId+'.xls';
 copyfile(pchar(sfilename),pchar(tfilename),false);

//�����ݵ���Excel
try
    excel:= CreateOleObject('Excel.Application');
    excel.Visible := true;//�Ƿ���ʾ
    excel.workbooks.open(tfilename);
    Sheet:= excel.Workbooks[1].WorkSheets[1];

    i:=2;
    zquery_employee.First;
    while(not zquery_employee.Eof) do
      begin
        Sheet.Cells[i,1] := zquery_employee.FieldByName('ENUM').AsString;
        Sheet.Cells[i,2] := zquery_employee.FieldByName('ENAME').AsString;
        Sheet.Cells[i,3] := zquery_employee.FieldByName('EGENDER').AsString;
        Sheet.Cells[i,4] := zquery_employee.FieldByName('EDEPTNAME').AsString;
        Sheet.Cells[i,5] := zquery_employee.FieldByName('EPHONE').AsString;
        Sheet.Cells[i,6] := zquery_employee.FieldByName('EBIRTHDAY').AsString;
        Sheet.Cells[i,7] := zquery_employee.FieldByName('EIDCARD').AsString;
        Sheet.Cells[i,8] := zquery_employee.FieldByName('EJOBNAME').AsString;
        
        inc(i);
        zquery_employee.Next;
      end;
      
  except
    Showmessage('��ʼ��Excelʧ�ܣ�����û�а�װExcel���밲װExcel����б��������');
    excel.DisplayAlerts := false;//�Ƿ���ʾ����
    excel.Quit;//����������˳�
    //exit;
  end;
end;

end.
