program conncfg;

uses
  Forms,
  main in 'main.pas' {connfrm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '�����������ù���';
  Application.CreateForm(Tconnfrm, connfrm);
  Application.Run;
end.
