program Foto3x4;

uses
  Forms,
  main in 'main.pas' {Form1},
  preview in 'preview.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Foto 3x4';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
