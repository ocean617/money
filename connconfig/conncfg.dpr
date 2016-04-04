program conncfg;

uses
  Forms,
  main in 'main.pas' {connfrm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '数据连接配置工具';
  Application.CreateForm(Tconnfrm, connfrm);
  Application.Run;
end.
