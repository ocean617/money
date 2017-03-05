program DFPayManager;

uses
  Forms,
  mainUnt in 'mainUnt.pas' {mainfrm},
  loginUnt in 'loginUnt.pas' {loginfrm},
  commUnt in 'commUnt.pas',
  DataLstFrameUnt in 'DataLstFrameUnt.pas' {dataLstFrame: TFrame},
  personUnt in 'personUnt.pas' {frm_person},
  personAddEmployee in 'personAddEmployee.pas' {frm_person_userEmployee},
  personAddMembers in 'personAddMembers.pas' {frm_person_membersAdd},
  personAddMoney in 'personAddMoney.pas' {frm_person_moneyAdd},
  personAddUser in 'personAddUser.pas' {frm_person_userAdd},
  serviceAddService in 'serviceAddService.pas' {frm_service_serviceAdd},
  serviceProjectUnt in 'serviceProjectUnt.pas' {frmServiceProject},
  MemberRegUnt in 'MemberRegUnt.pas' {memberRegFrm},
  MemberAddMoneyUnt in 'MemberAddMoneyUnt.pas' {MemberAddMoneyFrm},
  NewOrderUnt in 'NewOrderUnt.pas' {NewOrderFrm},
  MemberManagerUnt in 'MemberManagerUnt.pas' {MemberManagerFrm},
  ReportUnt in 'ReportUnt.pas' {ReportFrm},
  PayOrderUnt in 'PayOrderUnt.pas' {PayOrderFrm},
  CheckOrderUnt in 'CheckOrderUnt.pas' {CheckOrderFrm},
  CheckOrderDetailUnt in 'CheckOrderDetailUnt.pas' {CheckOrderDetailFrm},
  CommPayHitsUnt in 'CommPayHitsUnt.pas' {CommPayHitsFrm},
  changePassUnt in 'changePassUnt.pas' {changePassFrm},
  ClearDateUnt in 'ClearDateUnt.pas' {clearDatafrm},
  MemberPayUpdateUnt in 'MemberPayUpdateUnt.pas' {MemberPayUpdateFrm},
  tj_grid_unt in 'tj_grid_unt.pas' {tj_grid_frm},
  report1_thd_unt in 'report1_thd_unt.pas',
  report2_thd_unt in 'report2_thd_unt.pas',
  report3_thd_unt in 'report3_thd_unt.pas',
  report4_thd_unt in 'report4_thd_unt.pas',
  report5_thd_unt in 'report5_thd_unt.pas',
  report6_thd_unt in 'report6_thd_unt.pas',
  changePayRecord in 'changePayRecord.pas' {frm_changePay},
  serviceReportKindSettings in 'serviceReportKindSettings.pas' {frmServiceReportKindSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '东方平衡保健收银管理系统';
  Application.CreateForm(Tmainfrm, mainfrm);
  Application.Run;

end.
