unit Wait4D.View.Sample;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Wait4D.Interfaces,
  Wait4D;

type
  TPageSample = class(TForm)
    btnLoading: TButton;
    btnProgress: TButton;
    procedure btnProgressClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure ProcessLoading;
    procedure ProcessProgress;
    procedure btnLoadingClick(Sender: TObject);
  private
    FWait4D : iWait4D;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageSample: TPageSample;

implementation

{$R *.dfm}

{ TPageSample }

procedure TPageSample.btnLoadingClick(Sender: TObject);
begin
// change title and description displayed loading
  FWait4D
    .Notificacao
      .Titulo('Wait...')
      .Descricao('Processing...')
    .&End
    .Form(Self)
    .Process(ProcessLoading)
    .Loading
    .Executar;

//  FWait4D
//    .Form(Self)
//    .Process(ProcessLoading)
//    .Loading
//    .Executar;
end;

procedure TPageSample.btnProgressClick(Sender: TObject);
begin
// change title and description displayed progress
//  FWait4D.Notificacao.Titulo('Wait...').Descricao('Processing...');
  FWait4D
    .Notificacao
      .Titulo('Wait...')
      .Descricao('Processing...')
    .&End
    .Form(Self)
    .Process(ProcessProgress)
    .Progress
    .Executar;
end;

procedure TPageSample.ProcessLoading;
begin
// process executed in task during loading execution
  Sleep(2000);
// change title and description displayed loading
  FWait4D
    .Notificacao
      .Titulo('Title...')
      .Descricao('Description...');
  FWait4D.Notificar;
//
  Sleep(2000);
end;

procedure TPageSample.FormCreate(Sender: TObject);
begin
  FWait4D := TWait4D.New;
end;

procedure TPageSample.ProcessProgress;
var
  LCount, i : Integer;
begin
  Sleep(500);
  LCount:= 20;
  FWait4D.Notificacao.PosicaoMaxima(LCount);
  for i := 1 to LCount do
  begin
    FWait4D.Notificacao.Descricao('Registro ' + i.ToString + ' de ' + LCount.ToString);
    FWait4D.Notificacao.PosicaoAtual(i);
    FWait4D.Notificar;
    Sleep(200);
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
