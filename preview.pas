unit preview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    zoomImg: TTrackBar;
    Panel1: TPanel;
    img: TImage;
    SaveDialog1: TSaveDialog;
    procedure imgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure zoomImgChange(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    imgPos: TPoint;
  public
  end;

var
  Form2: TForm2;

implementation

uses main;
{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  imgPos.X := -1;
end;

procedure TForm2.imgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgPos.X := X;
  imgPos.Y := Y;
end;

procedure TForm2.imgMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if imgPos.X <> -1 then
  begin
    img.Left := img.Left + (X-imgPos.X);
    img.Top := img.Top + (Y-imgPos.Y);
  end;
end;

procedure TForm2.imgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgPos.X := -1;
end;


procedure TForm2.zoomImgChange(Sender: TObject);
begin
  img.Width  := MulDiv(img.Picture.Width, zoomImg.Position, 100);
  img.Height := MulDiv(img.Picture.Height, zoomImg.Position, 100);
end;

procedure TForm2.ToolButton2Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    img.Picture.SaveToFile(SaveDialog1.FileName);
end;

end.
