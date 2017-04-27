unit Main;

interface

uses
  IOCPPool,
  Synsock, BlckSock, StdCtrls, Controls, Classes,
  AdoDb, SysUtils, Windows, Messages, Forms;

type
  TForm1 = class(TForm)
    Button1: TButton;
    txtCurWorks: TEdit;
    txtActThreads: TEdit;
    txtCurThreads: TEdit;
    Label1:  TLabel;
    Label2:  TLabel;
    Label3:  TLabel;
    memErros: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private
    { Private declarations }
    bAtivo: boolean;
    procedure AppOnUpdate(nActThreads, nCurWorks, nCurThreads: integer);
    procedure AppOnProcess(ASock: TTCPBlockSocket; ADBConnection: TAdoConnection);
    procedure AppOnError(AE: Exception);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TCP: TTCPDaemon;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin

  if bAtivo then
  begin

    Tcp.Stop;
    FreeAndnil(Tcp);
    Button1.Caption := 'Start';
    bAtivo := false;

  end
  else
  begin

    Tcp := TTcpDaemon.Create;

    Tcp.OnUpdate := AppOnUpdate;
    Tcp.OnProcess := AppOnProcess;
    Tcp.OnError  := AppOnError;

    Tcp.Start;

    Button1.Caption := 'Stop';
    bAtivo := true;

  end;

end;

procedure TForm1.AppOnUpdate(nActThreads, nCurWorks, nCurThreads: integer);
begin
  try
    txtCurWorks.Text := IntToStr(nCurWorks);
    txtActThreads.Text := IntToStr(nActThreads);
    txtCurThreads.Text := IntToStr(nCurThreads);
  except
  end;
end;

function IsSocketAlive(ASocket: TTCPBlockSocket): Boolean;
begin
  //ASocket.CanRead();
  Result := (ASocket.Socket <> INVALID_SOCKET) and (
    (ASocket.LastError = WSAETIMEDOUT) or (ASocket.LastError = 0));
end;

procedure TForm1.AppOnProcess(ASock: TTCPBlockSocket; ADBConnection: TAdoConnection);
var
  i: Integer;
  zBytesCount: Integer;
  b: byte;
begin
  with ASock do
  begin
    try
      //Sleep(200);
      zBytesCount := WaitingData;
      while (IsSocketAlive(ASock)) do
      begin
        for I := 0 to zBytesCount - 1 do
        begin
          b := RecvByte(100);
          SendByte(b);
        end;
        zBytesCount := WaitingData;
        if (zBytesCount = 0) then
          RecvByte(0)
      end;
    except
      raise;
    end;
  end;
end;

procedure TForm1.AppOnError(AE: Exception);
begin
  memErros.Lines.Add(AE.Message);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := not Assigned(Tcp);
end;

end.
