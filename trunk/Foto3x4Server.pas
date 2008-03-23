unit Foto3x4Server;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AspTlb, Foto3x4_TLB, StdVcl;

type
  TFoto3x4Server = class(TASPMTSObject, IFoto3x4Server)
  protected
    function PegaFoto(const Arquivo: WideString; Zoom: SYSINT;
      const Tamanho: WideString; Borda: WordBool;
      const Inicia: WideString): OleVariant; safecall;
  end;

implementation

uses ComServ,Forms,main,preview, StdCtrls, Classes, Windows, Messages;

function TFoto3x4Server.PegaFoto(const Arquivo: WideString; Zoom: SYSINT;
  const Tamanho: WideString; Borda: WordBool;
  const Inicia: WideString): OleVariant;
begin
  if ClienteEsperando <> '' then
  begin
    Result := 'Erro: Outro cliente já está esperando a gravação do arquivo: '+ClienteEsperando;
    exit;
  end;
  if Arquivo='' then
  begin
    Result := 'Erro: Informe o nome do arquivo';
    exit;
  end;
  ClienteEsperando := Arquivo;
  ClienteResposta := 'Erro desconhecido';
  Form1.zoomImg.Position := Zoom;
  Form1.edTamFoto.ItemIndex := Form1.edTamFoto.Items.IndexOf(Tamanho);
  Form1.btBorder.Down := Borda;
  if Form1.edTamFoto.ItemIndex = -1 then
  begin
    Result := 'Erro: Tamanho da foto inválido';
    exit;
  end;
  Form2.edPapel.ItemIndex := Form2.edPapel.Items.IndexOf(Tamanho);
  if Form2.edPapel.ItemIndex = -1 then
  begin
    Result := 'Erro: Tamanho da foto inválido';
    exit;
  end;
  Form2.margem.Position := 0;
  Form2.espacamento.Position := 0;
  if Inicia = 'arquivo' then
    PostMessage(Form1.Handle, WM_USER, 1, 2)
  else if Inicia = 'camera' then
    PostMessage(Form1.Handle, WM_USER, 2, 2);
  while ClienteEsperando<>'' do
    Forms.Application.ProcessMessages;
  Result := ClienteResposta;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TFoto3x4Server, Class_Foto3x4Server,
    ciSingleInstance, tmApartment);
end.
