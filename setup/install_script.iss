; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=����ƽ�Ᵽ����������ϵͳ
AppVerName=����ƽ�Ᵽ����������ϵͳ
DefaultDirName={pf}\����ƽ�Ᵽ����������ϵͳ
DefaultGroupName=����ƽ�Ᵽ����������ϵͳ
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
SolidCompression=yes
OutputDir=D:\other\����ƽ����������20130929\setup

[Files]
Source: "E:\project\����ƽ����������\����\connconfig\conncfg.exe"; DestDir: "{app}"
Source: "E:\project\����ƽ����������\����\DFPayManager.exe"; DestDir: "{app}"
Source: "E:\project\����ƽ����������\����\libmysql41.dll"; DestDir: "{app}"
Source: "E:\project\����ƽ����������\����\report\template\*.xls"; DestDir: "{app}\report\template"
Source: "E:\project\����ƽ����������\����\report\reportfiles\*.*"; DestDir: "{app}\report\reportfiles"
Source: "E:\project\����ƽ����������\����\report\reportfiles\r1\*.*"; DestDir: "{app}\report\reportfiles\r1"
Source: "E:\project\����ƽ����������\����\report\reportfiles\r2\*.*"; DestDir: "{app}\report\reportfiles\r2"
Source: "E:\project\����ƽ����������\����\report\reportfiles\r3\*.*"; DestDir: "{app}\report\reportfiles\r3"
Source: "E:\project\����ƽ����������\����\report\reportfiles\r4\*.*"; DestDir: "{app}\report\reportfiles\r4"
Source: "E:\project\����ƽ����������\����\report\reportfiles\r5\*.*"; DestDir: "{app}\report\reportfiles\r5"
Source: "E:\project\����ƽ����������\����\report\reportfiles\r6\*.*"; DestDir: "{app}\report\reportfiles\r6"
Source: "E:\project\����ƽ����������\����\report\reportfiles\sy\*.*"; DestDir: "{app}\report\reportfiles\sy"
Source: "E:\project\����ƽ����������\����\report\reportfiles\comm_sy\*.*"; DestDir: "{app}\report\reportfiles\comm_sy"
Source: "E:\project\����ƽ����������\����\report\reportfiles\member\*.*"; DestDir: "{app}\report\reportfiles\member"
Source: "E:\project\����ƽ����������\����\report\reportfiles\person\*.*"; DestDir: "{app}\report\reportfiles\person"


[Icons]
Name: "{group}\����ƽ�Ᵽ����������ϵͳ"; Filename: "{app}\DFPayManager.exe"
Name: "{group}\���ݿ�����"; Filename: "{app}\conncfg.exe"
Name: "{group}\ж�����"; Filename: "{app}\unins000.exe"
Name: "{commondesktop}\����ƽ�Ᵽ����������ϵͳ"; Filename: "{app}\DFPayManager.exe"
[Run]
Filename: "{app}\conncfg.exe"; StatusMsg: "�״�������Ҫ�������ݿ�����,���ݿ�������,���Ժ�..."
Filename: "{app}\DFPayManager.exe";Description: "������������"; Flags: nowait  postinstall shellexec skipifsilent
