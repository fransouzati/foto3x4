unit Testar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses ComObj, jpeg;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  F: Variant;
begin
  F := CreateOleObject('Foto3x4.Foto3x4Server');
  caption := F.PegaFoto('c:\tmp.jpg',85, '3x4cm',false,'camera');
  image1.Picture.LoadFromFile('c:\tmp.jpg');
end;

end.
