object Form2: TForm2
  Left = 219
  Top = 237
  Width = 870
  Height = 640
  Caption = 'Visualiza'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 862
    Height = 29
    ButtonHeight = 25
    ButtonWidth = 26
    Caption = 'ToolBar1'
    Images = Form1.ImageList1
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton2'
      ImageIndex = 1
      OnClick = ToolButton2Click
    end
    object zoomImg: TTrackBar
      Left = 26
      Top = 2
      Width = 150
      Height = 25
      Max = 400
      Min = 10
      Position = 100
      TabOrder = 0
      OnChange = zoomImgChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 862
    Height = 584
    Align = alClient
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object img: TImage
      Left = 16
      Top = 24
      Width = 105
      Height = 105
      Stretch = True
      OnMouseDown = imgMouseDown
      OnMouseMove = imgMouseMove
      OnMouseUp = imgMouseUp
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.jpg'
    Filter = 'Jpeg|*.jpg;*jpeg|Bitmap|*.bmp|Todos arquivos|*.*'
    FilterIndex = 0
    Left = 216
    Top = 85
  end
end
