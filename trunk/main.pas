unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, Menus, jpeg, ExtCtrls, ShellApi,
  StdCtrls;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btPreview: TToolButton;
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
    edTamFoto: TComboBox;
    Label2: TLabel;
    procedure ToolButton1Click(Sender: TObject);
    procedure zoomimgChange(Sender: TObject);
    procedure imgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
    procedure btPreviewClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tmPreviewTimer(Sender: TObject);
    procedure btBorderClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edTamFotoChange(Sender: TObject);
    procedure edPapelChange(Sender: TObject);
  private
    imgPos, fotoPos: TPoint;
    fotoW: Integer;
    FotoH: Integer;
  public
    procedure MontaFoto;
    procedure calculaTamanho(idx: Integer; var Width, Height: Integer);
    procedure calculaTamanhoMM(idx: Integer; var Width, Height: Integer);
    function Millimetres2PixelsX(Device: THandle;
      Millims: integer): integer;
    function Millimetres2PixelsY(Device: THandle;
      Millims: integer): integer;
  end;

var
  Form1: TForm1;

implementation

uses preview;

{$R *.dfm}

function TForm1.Millimetres2PixelsX(Device: THandle; Millims: integer): integer;
begin
  result := MulDiv(GetDeviceCaps(Device, LOGPIXELSX), 10 * Millims, 254);
end;

function TForm1.Millimetres2PixelsY(Device: THandle; Millims: integer): integer;
begin
 result := MulDiv(GetDeviceCaps(Device, LOGPIXELSY), 10 * Millims, 254);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edTamFoto.ItemIndex := 0;
  edTamFotoChange(nil);
end;

procedure TForm1.edTamFotoChange(Sender: TObject);
begin
  calculaTamanhoMM(edTamFoto.ItemIndex, fotoW, FotoH);
  imgPos.X := -1;
  fotoPos.X := -1;
  zoomImgChange(nil);
  zoomFotoChange(nil);
  Invalidate;
end;

procedure TForm1.edPapelChange(Sender: TObject);
begin
  zoomImgChange(nil);
  zoomFotoChange(nil);
  Invalidate;
end;

procedure TForm1.calculaTamanho(idx: Integer; var Width, Height: Integer);
begin
  case idx of
    0: begin
      Width := 30;
      Height := 40;
    end;
    1: begin
      Width := 40;
      Height := 30;
    end;
    2: begin
      Width := 150;
      Height := 100;
    end;
    3: begin
      Width := 100;
      Height := 150;
    end;
  end;
end;

procedure TForm1.calculaTamanhoMM(idx: Integer; var Width, Height: Integer);
var
  screen: THandle;
  W, H: integer;
begin
  screen := GetDC(0);
  try
    calculaTamanho(idx,W,H);
    Width := Millimetres2PixelsX(screen, W);
    Height := Millimetres2PixelsY(screen, H);
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
    btPreview.Enabled := True;
  end;
end;

procedure TForm1.zoomimgChange(Sender: TObject);
begin
  img.Width  := MulDiv(img.Picture.Width, zoomImg.Position, 100);
  img.Height := MulDiv(img.Picture.Height, zoomImg.Position, 100);
  pnPreview.ClientWidth := foto.Width;
  pnPreview.ClientHeight := foto.Height;
  tmPreview.Enabled := False;
  tmPreview.Enabled := True;
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
  MontaFoto;
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

procedure TForm1.MontaFoto;
var
  fotoOriginal, fotoBmp: TBitmap;
  w, h, zw, zh: Integer;
begin
  fotoOriginal := TBitmap.Create;
  fotoBmp := TBitmap.Create;
  try
    fotoOriginal.Assign(img.Picture.Graphic);
    fotoBmp.PixelFormat := fotoOriginal.PixelFormat;
    w := round(foto.Width/(zoomImg.Position/100));
    h := round(foto.Height/(zoomImg.Position/100));
    fotoBmp.Width := FotoW;
    fotoBmp.Height := FotoH;
    SetStretchBltMode(fotoBmp.Canvas.Handle, HALFTONE);
    StretchBlt(fotoBmp.Canvas.Handle, 0, 0, FotoW, FotoH,
               fotoOriginal.Canvas.Handle,
               Round((foto.Left-img.Left)/(zoomImg.Position/100)),
               Round((foto.Top-img.Top)/(zoomImg.Position/100)),
               w, h,
               SRCCOPY);
    if btBorder.Down then
    begin
      fotoBmp.Canvas.Brush.Style := bsClear;
      fotoBmp.Canvas.Pen.Style := psSolid;
      fotoBmp.Canvas.Pen.Color := clBlack;
      fotoBmp.Canvas.Pen.Width := 2;
      fotoBmp.Canvas.Rectangle( 0, 0, fotoBmp.Width, fotoBmp.Height);
    end;
    imgPreview.Picture.Graphic := fotoBmp;
  finally
    fotoOriginal.Free;
    fotoBmp.Free;
  end;
end;

procedure TForm1.btPreviewClick(Sender: TObject);
begin
  Form2.MontaPapel;
  Form2.Show;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://code.google.com/p/foto3x4', nil, nil, SW_SHOWNORMAL);
end;

end.


