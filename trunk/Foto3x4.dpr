program Foto3x4;

uses
  Forms,
  main in 'main.pas' {Form1},
  preview in 'preview.pas' {Form2},
  {$IFDEF DEVELOP}
    Foto3x4_TLB in 'Foto3x4_TLB.pas',
    Foto3x4Server in 'Foto3x4Server.pas' {Foto3x4Server: CoClass},
  {$ENDIF}
  EmbeddedWB in '..\..\..\componentes\embedwb\embeddedwb.pas',
  IEUtils in '..\..\..\componentes\embedwb\IEUtils.pas',
  IeConst in '..\..\..\componentes\embedwb\IeConst.pas';

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Foto 3x4';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
