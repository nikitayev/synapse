program IocpTest;

uses
  FastMM4,
  ComObj,
  ActiveX,
  Forms,
  Main in 'Main.pas' {Form1},
  IOCPPool in 'IOCPPool.pas';

{$R *.RES}

begin

  IsMultiThread := True;
  CoInitFlags := COINIT_MULTITHREADED;

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
