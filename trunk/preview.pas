unit preview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, StdCtrls, jpeg;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    zoomImg: TTrackBar;
    Panel1: TPanel;
    img: TImage;
    SaveDialog1: TSaveDialog;
    edPapel: TComboBox;
    Label1: TLabel;
    margem: TTrackBar;
    espacamento: TTrackBar;
    lbErro: TStaticText;
    procedure imgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure zoomImgChange(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure espacamentoChange(Sender: TObject);
  private
    imgPos: TPoint;
  public
    procedure MontaPapel;
  end;

var
  Form2: TForm2;

implementation

uses main;
{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  edPapel.Items.Text := form1.edTamFoto.Items.Text;
  edPapel.ItemIndex := 2;
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


procedure TForm2.espacamentoChange(Sender: TObject);
begin
  MontaPapel;
  zoomImgChange(nil);
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

procedure TForm2.MontaPapel;
var
  bPapel: TBitmap;
  jpeg: TJpegImage;
  xPapel, yPapel, xFoto, yFoto, X, Y, PX, PY, W, H, Q: Integer;
const
  M=3;
begin
  form1.MontaFoto;
  Q := 0;
  bPapel := TBitmap.Create;
  try

    form1.calculaTamanho(edPapel.ItemIndex, xPapel, yPapel);
    form1.calculaTamanho(form1.edTamFoto.ItemIndex, xFoto, yFoto);

    bPapel.Assign(form1.imgPreview.Picture.Bitmap);

    bPapel.Width := form1.Millimetres2PixelsX(bPapel.Canvas.Handle, xPapel*M);
    bPapel.Height := form1.Millimetres2PixelsY(bPapel.Canvas.Handle, yPapel*M);

    bPapel.Canvas.Brush.Color := clWhite;
    bPapel.Canvas.Brush.Style := bsSolid;
    bPapel.Canvas.Pen.Style := psClear;
    bPapel.Canvas.Rectangle(0,0,bPapel.Width, bPapel.Height);

    W := form1.Millimetres2PixelsX(bPapel.Canvas.Handle, xFoto*M);
    H := form1.Millimetres2PixelsY(bPapel.Canvas.Handle, yFoto*M);

    for Y := 0 to 10 do
    begin
      PY := form1.Millimetres2PixelsY(bPapel.Canvas.Handle, (margem.position)*M + Y*(yFoto+espacamento.position)*M);
      if PY + H > bPapel.Height then
        break;
      for X := 0 to 10 do
      begin
        PX := form1.Millimetres2PixelsX(bPapel.Canvas.Handle, (margem.position)*M + X*(xFoto+espacamento.position)*M);
        if PX + W > bPapel.Width then
          break;
        SetStretchBltMode(bPapel.Canvas.Handle, HALFTONE);
        StretchBlt(bPapel.Canvas.Handle, PX, PY, W, H,
                   form1.imgPreview.Picture.Bitmap.Canvas.Handle,
                   0, 0,
                   form1.imgPreview.Picture.Bitmap.Width-1,
                   form1.imgPreview.Picture.Bitmap.Height-1,
                   SRCCOPY
                   );
        inc(Q);
      end;
    end;

    jpeg := TJpegImage.Create;
    try
      jpeg.Assign(bPapel);
      jpeg.CompressionQuality := 80;
      Form2.img.Picture.Graphic := jpeg;
    finally
      jpeg.free;
    end;
  finally
    bPapel.free;
  end;
  
  img.Visible := Q > 0;
  lbErro.Visible := Q =0;
  lbErro.Caption := 'A foto não coube no papel'#13+
                    'Ajuste a margem, o espaçamento e o tamanho do papel';
  Form2.img.Left := 0;
  Form2.img.Top := 0;
  Form2.zoomImg.Position := 30;
  Form2.zoomImgChange(nil);
end;

end.
