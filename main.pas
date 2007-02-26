unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, Menus, jpeg, ExtCtrls, ShellApi;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    zoomFoto: TTrackBar;
    Panel1: TPanel;
    img: TImage;
    foto: TPaintBox;
    zoomImg: TTrackBar;
    pnPreview: TPanel;
    imgPreview: TImage;
    tmPreview: TTimer;
    btBorder: TToolButton;
    ToolButton2: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure zoomimgChange(Sender: TObject);
    procedure imgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure imgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fotoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fotoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure fotoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fotoPaint(Sender: TObject);
    procedure zoomFotoChange(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tmPreviewTimer(Sender: TObject);
    procedure btBorderClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    imgPos, fotoPos: TPoint;
    procedure Monta3x4;
    procedure Monta10x15;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fotoW: Integer;
  FotoH: Integer;
  
implementation

uses preview;

{$R *.dfm}

function Millimetres2PixelsX(Device: THandle; Millims: integer): integer;
begin
  result := MulDiv(GetDeviceCaps(Device, LOGPIXELSX), 10 * Millims, 254);
end;

function Millimetres2PixelsY(Device: THandle; Millims: integer): integer;
begin
 result := MulDiv(GetDeviceCaps(Device, LOGPIXELSY), 10 * Millims, 254);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  screen: THandle;
begin
  screen := GetDC(0);
  try
    fotoW := Millimetres2PixelsX(screen, 30);
    fotoH := Millimetres2PixelsX(screen, 40);
    imgPos.X := -1;
    fotoPos.X := -1;
  finally
    ReleaseDC(0,screen);
  end;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    img.Left := 0;
    img.Top := 0;
    img.Picture.LoadFromFile(OpenDialog1.FileName);
    foto.Left :=0 ;
    foto.Top :=0 ;
    zoomImg.Position := 25;
    zoomFoto.Position := 100;
    zoomImgChange(nil);
    zoomFotoChange(nil);
  end;
end;

procedure TForm1.zoomimgChange(Sender: TObject);
begin
  img.Width  := MulDiv(img.Picture.Width, zoomImg.Position, 100);
  img.Height := MulDiv(img.Picture.Height, zoomImg.Position, 100);
end;

procedure TForm1.zoomFotoChange(Sender: TObject);
begin
  foto.Width  := MulDiv(FotoW, zoomFoto.Position, 100);
  foto.Height := MulDiv(FotoH, zoomFoto.Position, 100);
  pnPreview.ClientWidth := foto.Width;
  pnPreview.ClientHeight := foto.Height;
  tmPreview.Enabled := False;
  tmPreview.Enabled := True;
end;

procedure TForm1.tmPreviewTimer(Sender: TObject);
begin
  tmPreview.Enabled := False;
  pnPreview.Visible := img.Picture.Graphic <> nil;
  if not pnPreview.Visible then
    exit;
  pnPreview.Left := ClientWidth-pnPreview.Width;
  pnPreview.Top := 0;
  Monta3x4;
end;

procedure TForm1.btBorderClick(Sender: TObject);
begin
  tmPreview.Enabled := False;
  tmPreview.Enabled := True;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  tmPreview.Enabled := False;
  tmPreview.Enabled := True;
end;

procedure TForm1.imgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgPos.X := X;
  imgPos.Y := Y;
end;

procedure TForm1.imgMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if imgPos.X <> -1 then
  begin
    img.Left := img.Left + (X-imgPos.X);
    img.Top := img.Top + (Y-imgPos.Y);
    tmPreview.Enabled := False;
    tmPreview.Enabled := True;
  end;
end;

procedure TForm1.imgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgPos.X := -1;
end;

procedure TForm1.fotoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fotoPos.X := X;
  fotoPos.Y := Y;
end;

procedure TForm1.fotoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if fotoPos.X <> -1 then
  begin
    foto.Left := foto.Left + (X-fotoPos.X);
    foto.Top := foto.Top + (Y-fotoPos.Y);
    tmPreview.Enabled := False;
    tmPreview.Enabled := True;
  end;
end;

procedure TForm1.fotoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fotoPos.X := -1;
end;

procedure TForm1.fotoPaint(Sender: TObject);
begin
  if img.Picture.Graphic = nil then
    exit;
  foto.Canvas.Brush.Style := bsClear;
  foto.Canvas.Pen.Style := psSolid;
  foto.Canvas.Pen.Width := 5;
  foto.Canvas.Pen.Color := clWhite;
  foto.Canvas.Pen.Mode := pmXor;
  foto.Canvas.Rectangle(0,0,foto.Width-1, foto.Height-1);
end;

procedure TForm1.Monta3x4;
var
  fotoOriginal, foto3x4: TBitmap;
  w, h, zw, zh: Integer;
begin
  fotoOriginal := TBitmap.Create;
  foto3x4 := TBitmap.Create;
  try
    fotoOriginal.Assign(img.Picture.Graphic);
    foto3x4.PixelFormat := fotoOriginal.PixelFormat;
    w := round(foto.Width/(zoomImg.Position/100));
    h := round(foto.Height/(zoomImg.Position/100));
    foto3x4.Width := FotoW;
    foto3x4.Height := FotoH;
    SetStretchBltMode(foto3x4.Canvas.Handle, HALFTONE);
    StretchBlt(foto3x4.Canvas.Handle, 0, 0, FotoW, FotoH,
               fotoOriginal.Canvas.Handle,
               Round((foto.Left-img.Left)/(zoomImg.Position/100)),
               Round((foto.Top-img.Top)/(zoomImg.Position/100)),
               w, h,
               SRCCOPY);
    if btBorder.Down then
    begin
      foto3x4.Canvas.Brush.Style := bsClear;
      foto3x4.Canvas.Pen.Style := psSolid;
      foto3x4.Canvas.Pen.Color := clBlack;
      foto3x4.Canvas.Pen.Width := 2;
      foto3x4.Canvas.Rectangle( 0, 0, foto3x4.Width, foto3x4.Height);
    end;
    imgPreview.Picture.Graphic := foto3x4;
  finally
    fotoOriginal.Free;
    foto3x4.Free;
  end;
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
  Monta10x15;
  Form2.img.Left := 0;
  Form2.img.Top := 0;
  Form2.zoomImg.Position := 30;
  Form2.zoomImgChange(nil);
  Form2.Show;
end;

procedure TForm1.Monta10x15;
var
  b10x15: TBitmap;
  jpeg: TJpegImage;
  X, Y, PX, PY, W, H: Integer;
const
  M=3;
begin
  Monta3x4;
  b10x15 := TBitmap.Create;
  try

    b10x15.Assign(imgPreview.Picture.Bitmap);

    b10x15.Width := Millimetres2PixelsX(b10x15.Canvas.Handle, 150*M);
    b10x15.Height := Millimetres2PixelsY(b10x15.Canvas.Handle, 100*M);

    b10x15.Canvas.Brush.Color := clWhite;
    b10x15.Canvas.Brush.Style := bsSolid;
    b10x15.Canvas.Pen.Style := psClear;
    b10x15.Canvas.Rectangle(0,0,b10x15.Width, b10x15.Height);

    W := Millimetres2PixelsX(b10x15.Canvas.Handle, 30*M);
    H := Millimetres2PixelsY(b10x15.Canvas.Handle, 40*M);

    for Y := 0 to 1 do
      for X := 0 to 3 do
      begin
        PX := Millimetres2PixelsX(b10x15.Canvas.Handle, 7*M + X*35*M);
        PY := Millimetres2PixelsY(b10x15.Canvas.Handle, 7*M + Y*45*M);
        SetStretchBltMode(b10x15.Canvas.Handle, HALFTONE);
        StretchBlt(b10x15.Canvas.Handle, PX, PY, W, H,
                   imgPreview.Picture.Bitmap.Canvas.Handle,
                   0, 0,
                   imgPreview.Picture.Bitmap.Width-1,
                   imgPreview.Picture.Bitmap.Height-1,
                   SRCCOPY
                   );
      end;

    jpeg := TJpegImage.Create;
    try
      jpeg.Assign(b10x15);
      jpeg.CompressionQuality := 80;
      Form2.img.Picture.Graphic := jpeg;
    finally
      jpeg.free;
    end;
  finally
    b10x15.free;
  end;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://code.google.com/p/foto3x4', nil, nil, SW_SHOWNORMAL);
end;

end.


