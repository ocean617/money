; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=东方平衡保健收银管理系统
AppVerName=东方平衡保健收银管理系统
DefaultDirName={pf}\东方平衡保健收银管理系统
DefaultGroupName=东方平衡保健收银管理系统
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
SolidCompression=yes
OutputDir=D:\other\东方平衡收银管理20130929\setup

[Files]
Source: "E:\project\东方平衡收银管理\代码\connconfig\conncfg.exe"; DestDir: "{app}"
Source: "E:\project\东方平衡收银管理\代码\DFPayManager.exe"; DestDir: "{app}"
Source: "E:\project\东方平衡收银管理\代码\libmysql41.dll"; DestDir: "{app}"
Source: "E:\project\东方平衡收银管理\代码\report\template\*.xls"; DestDir: "{app}\report\template"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\*.*"; DestDir: "{app}\report\reportfiles"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\r1\*.*"; DestDir: "{app}\report\reportfiles\r1"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\r2\*.*"; DestDir: "{app}\report\reportfiles\r2"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\r3\*.*"; DestDir: "{app}\report\reportfiles\r3"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\r4\*.*"; DestDir: "{app}\report\reportfiles\r4"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\r5\*.*"; DestDir: "{app}\report\reportfiles\r5"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\r6\*.*"; DestDir: "{app}\report\reportfiles\r6"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\sy\*.*"; DestDir: "{app}\report\reportfiles\sy"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\comm_sy\*.*"; DestDir: "{app}\report\reportfiles\comm_sy"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\member\*.*"; DestDir: "{app}\report\reportfiles\member"
Source: "E:\project\东方平衡收银管理\代码\report\reportfiles\person\*.*"; DestDir: "{app}\report\reportfiles\person"


[Icons]
Name: "{group}\东方平衡保健收银管理系统"; Filename: "{app}\DFPayManager.exe"
Name: "{group}\数据库配置"; Filename: "{app}\conncfg.exe"
Name: "{group}\卸载软件"; Filename: "{app}\unins000.exe"
Name: "{commondesktop}\东方平衡保健收银管理系统"; Filename: "{app}\DFPayManager.exe"
[Run]
Filename: "{app}\conncfg.exe"; StatusMsg: "首次运行需要进行数据库配置,数据库配置中,请稍候..."
Filename: "{app}\DFPayManager.exe";Description: "立即启动程序"; Flags: nowait  postinstall shellexec skipifsilent
