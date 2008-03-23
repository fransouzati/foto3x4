object Form1: TForm1
  Left = 245
  Top = 103
  Width = 760
  Height = 580
  Caption = 'Foto 3x4'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 752
    Height = 29
    ButtonWidth = 26
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 0
    object btAbreArquivo: TToolButton
      Left = 0
      Top = 2
      Hint = 'Abrir imagem'
      Caption = 'btAbreArquivo'
      ImageIndex = 0
      OnClick = btAbreArquivoClick
    end
    object btCamera: TToolButton
      Left = 26
      Top = 2
      AllowAllUp = True
      Caption = 'btCamera'
      ImageIndex = 5
      Style = tbsCheck
      OnClick = btCameraClick
    end
    object btPreview: TToolButton
      Left = 52
      Top = 2
      Hint = 'Gerar'
      Caption = 'btPreview'
      Enabled = False
      ImageIndex = 2
      OnClick = btPreviewClick
    end
    object Label2: TLabel
      Left = 78
      Top = 2
      Width = 27
      Height = 22
      Hint = 'Tamanho da foto (cm)'
      Caption = ' Foto '
      Layout = tlCenter
    end
    object edTamFoto: TComboBox
      Left = 105
      Top = 2
      Width = 76
      Height = 21
      Hint = 'Tamanho da foto (cm)'
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = edTamFotoChange
      Items.Strings = (
        '2x2cm'
        '3x4cm'
        '4x3cm'
        '5x7cm'
        '7x5cm'
        '15x10cm'
        '10x15cm')
    end
    object btBorder: TToolButton
      Left = 181
      Top = 2
      Hint = 'Colocar uma borda na foto'
      AllowAllUp = True
      Caption = 'btBorder'
      Down = True
      ImageIndex = 3
      Style = tbsCheck
      OnClick = btBorderClick
    end
    object btAbout: TToolButton
      Left = 207
      Top = 2
      Hint = 'Site oficial'
      Caption = 'btAbout'
      ImageIndex = 4
      OnClick = btAboutClick
    end
    object zoomImg: TTrackBar
      Left = 233
      Top = 2
      Width = 150
      Height = 22
      Hint = 'Zoom geral'
      Max = 400
      Min = 10
      Position = 25
      TabOrder = 1
      TickStyle = tsNone
      OnChange = zoomimgChange
    end
    object zoomFoto: TTrackBar
      Left = 383
      Top = 2
      Width = 150
      Height = 22
      Hint = 'Zoom na foto'
      Max = 200
      Min = 50
      Position = 100
      TabOrder = 0
      TickStyle = tsNone
      OnChange = zoomFotoChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 52
    Width = 752
    Height = 494
    Align = alClient
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object img: TImage
      Left = 8
      Top = 48
      Width = 105
      Height = 105
      Stretch = True
      OnMouseDown = imgMouseDown
      OnMouseMove = imgMouseMove
      OnMouseUp = imgMouseUp
    end
    object foto: TPaintBox
      Left = 200
      Top = 16
      Width = 355
      Height = 472
      OnMouseDown = fotoMouseDown
      OnMouseMove = fotoMouseMove
      OnMouseUp = fotoMouseUp
      OnPaint = fotoPaint
    end
  end
  object pnPreview: TPanel
    Left = 376
    Top = 24
    Width = 249
    Height = 313
    Caption = ' '
    TabOrder = 2
    Visible = False
    object imgPreview: TImage
      Left = 1
      Top = 1
      Width = 247
      Height = 311
      Align = alClient
      Stretch = True
    end
  end
  object novaversao: TPanel
    Left = 0
    Top = 29
    Width = 752
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    Color = 9169649
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 15
      Top = 4
      Width = 295
      Height = 13
      Caption = 'Existe uma nova vers'#227'o deste programa dispon'#237'vel para voc'#234'.'
    end
    object Label3: TLabel
      Left = 319
      Top = 4
      Width = 118
      Height = 13
      Cursor = crHandPoint
      Caption = 'Clique aqui para baix'#225'-la.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = btAboutClick
    end
  end
  object ImageList1: TImageList
    Left = 64
    Top = 312
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF007F7F7F000000FF007F7F7F00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF000000FF000000FF000000FF0000FFFF00FFFFFF0000FF
      FF0000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF007F7F7F000000FF007F7F7F00FFFFFF0000FFFF00FFFF
      FF0000FFFF00000000000000000000000000000000007F7F7F000000FF007F7F
      7F0000FF00007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F00BFBFBF00BFBFBF00000000000000
      00000000000000000000BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000FF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00BFBFBF00BFBFBF00000000000000
      0000000000007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF000000FF007F7F7F0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000000000000000007F7F7F00000000000000
      00000000000000000000BFBFBF007F7F7F00BFBFBF00BFBFBF00000000007F7F
      7F00000000007F7F7F00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00BFBFBF00BFBFBF0000000000BFBF
      BF0000000000BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F00BFBFBF00BFBFBF00000000000000
      000000000000BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF007F7F7F007F7F7F0000FFFF00FFFFFF007F7F7F000000FF000000FF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000000000000000BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000BFBFBF00BFBFBF00BFBFBF00000000000000
      00000000000000000000BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF000000FF000000FF00FFFFFF0000FFFF007F7F7F000000FF000000FF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      000000000000BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF000000FF000000FF007F7F7F00FFFFFF007F7F7F000000FF000000FF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF00FFFFFF0000FF
      FF00FFFFFF0000FFFF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF000000FF000000FF000000FF00FFFFFF0000FFFF00FFFF
      FF0000FFFF0000000000000000000000000000000000BFBFBF00BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AAB6C3003B5782008B9CB0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B7C66005A7F6B005C7F6B008C96950000000000DFD9D900E4DDDD00DED6
      D600D3C7C700A89E9E007D7F810000000000B6BDC100A8A3A300B4AEAE00AFA7
      A7007E8081000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002861960034AEEE0047A3EA004DA5EC004FA2
      E7004F678C009FADBC0000000000000000000000000000000000000000000000
      00000000000000000000BDC5C8004E4E4E0030313100C3CBCF00000000000000
      00000000000059A86E0071EFA0005D806300BCBCBC00F9F7F700F3F0F000EDE8
      E800E2DADA00DCD3D300D6CCCC0090909000FFFFFF00F6F3F300EFEAEA00E8E2
      E200DBD1D100CAC0C000827E7D00F1E9E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008197B00036B5F60038BCFD0043A0E70049A3E9004FA6
      ED00529FE3003B6BA40059709200000000000000000000000000000000000000
      000000000000B7BEC2004B4E5000ADADAD00AEAEAE00686C6E00BBC3C7000000
      000000000000000000005EA469005B7E6300FFFFFF00FEFEFE00FAF9F900F5F2
      F200DED8D80056545400353535005B5B5B0074747400FDFDFD00F7F6F600F1ED
      ED00E3DCDC00DDD4D4009E989800EEE6E300303031002A2A2A00000000000000
      0000000000000000000000000000131312001010100000000000000000000000
      0000000000000102010000000000000000000000000000000000000000000000
      0000000000006382A3002F7AB2003CBEFE003BBEFE003E9EE50045A1E8004BA4
      EB0055A9EF005CADF30058A1E600778AA4000000000000000000000000000000
      0000B1B8BC004B4D4F003C3C3C0087878700F2F2F2007374740063676900B4BC
      BF00000000000000000000000000597B5F00FFFFFF00FFFFFF00FFFFFF00FCFB
      FB00C2C0C000747474004E4E4E00C0C0C00035353500FFFFFF00FEFEFE00FAF8
      F800ECE7E700E5DFDF00B5AFAF00F0E7E500343435002E2E2E00FFFFFF002728
      270021222100FFFFFF001C1B1B001516150013131300FFFFFF000C0C0B00FFFF
      FF00FFFFFF000304030002020200000000000000000000000000000000000000
      00002C6FA60043C1FE0043C1FF0040BFFE0040BEFD00369BE300307B1900307B
      19004FA6ED0055A9EF005BACF2004E678C000000000000000000BAC1C500A9B0
      B4001D1D1D003A3A3A0054545400FFFFFF00FFFFFF00FBFBFB00FCFCFC005152
      5200ADB3B700B9C1C400C7CFD30000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00A5A4A4007D7C7C00A0A0A000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFC00F7F5F50087848400F0E7E50000000000FFFFFF00A4A4A4009393
      93008E8E8E008C8C8C008C8C8C00858585008C8C8C0093939300939393009999
      990085858500FFFFFF00FFFFFF00000000000000000000000000000000000000
      00002E72A70046C2FF00307B1900307B1900307B1900307B1900307B1900307B
      19004DA4EB0053A7EE0057AAF1004F688D000000000000000000C3CACE004E52
      53002B2B2B004C4C4C00DBDBDB00FFFFFF00F8F8F800F2F2F200F0F0F000F3F3
      F30064686A00BFC7CB000000000000000000BCBCBC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFAFA00B8B5B400BCBCBC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0095959500DBD4D200F0E7E50000000000FFFFFF00929292009E9E
      9E0079797900494949003F3F3F0072727200797979008C8C8C0093939300C0C0
      C00085858500FFFFFF0008080900000000000000000000000000000000000000
      00002E73AA0049C3FF0048C3FF0046C2FF0048C0FE0052BCFD00307B1900307B
      190049A3EA004EA5EC0054A8EE004F688E0000000000C6CED200595D5F000A0A
      0A00202020008E8E8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E5E5
      E50062626200767A7D00000000000000000080828300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AEAEAE00FBF8F700CBCAC800C0C0C000D9D9D900CDCD
      CD008B898800DCD6D400F1E9E700EEE6E30000000000FFFFFF007A7A7A007474
      74007C7C7C009898980099999900383838006060600064646400797979008585
      85006B6B6B00FFFFFF00FFFFFF0000000000AE420E00FFFFFF00FEFDFD00F8F6
      F600EDE6E600E7DEDE00E1D6D600D5C7C700CFBFBF0082BDDF007CD2FF007CD1
      FF0079CFFD0064BBF30050A8ED004F6B900000000000020202003D3D3D003F3F
      3F0038383800313131004F4F4F00FFFFFF00F3F3F300FEFEFE00DCDCDC00F6F6
      F600CDCDCD00DFDFDF0050505000000000000000000083868800ADADAE00C0C0
      C00092919000D0D0D000FEFEFD00FEFEFD00FAF7F500F8F2F000F8F2F000F6EF
      ED00F2EAE800F1E9E700F0E7E500EDE4E10000000000FFFFFF0038383800D2D2
      D200828282008888880038383800C9C9C900F5F5F500989898005A5A5A00F7F7
      F700B5B5B500FFFFFF00FFFFFF0000000000C9784700FFFFFF00FBFAFA00F5F2
      F200E9D7D000E3CCC600DCC1BA00CCACAA00C5A3A3009A918F0092DCFF0092DC
      FF0092DCFF0092DCFF008DD9FF004F6B910072767900545454005D5D5D004A4A
      4A003D3D3D00484848003E3E3E00F3F3F300FFFFFF00FFFFFF00EFEFEF00D7D7
      D700D1D1D100D5D5D500A5A5A500888D90000000000000000000000000000000
      0000DED3CF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00F7F0EE00F6EFED00F4ED
      EB00F1E9E700F0E8E600EDE4E100EBE2DF0053525300FFFFFF00383838008D8D
      8D00ABABAB00AEAEAE0093939300A8A8A800C3C3C300C7C7C700D8D8D800E5E5
      E500CFCFCF00FFFFFF001414140000000000D5926700DFB29900FFEED200F2CE
      A500F3B38400ED9B6800E7824B00C84A1800C6471700A93B0D00BCE4EF00BEF0
      FF00BEF0FF009FD1E8003A608D000000000000000000666666008D8D8D006666
      6600CDCDCE00E7E7E700D5D5D6004545450057575700FFFFFF00DEDEDE00F2F2
      F200A2A2A2006D6D6D005D5D5D00B7BEC2000000000000000000000000000000
      0000DED3CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF9F800FAF7F500F8F3
      F100ECE3E000E8DEDB00E6DCD900E4DAD6005C5C5C00FFFFFF00AFAFAF00BABA
      BA00F9F9F900FFFFFF00A9A9A900CCCCCC00B4B4B400F1F1F100F7F7F700F1F1
      F100BABABA00FFFFFF001A1A1B0000000000D5946A00C4775000F8ECDF00EFE1
      CF00F8CFA600F2B08000ED976100DB6D3800C1492000B3451D00C6BBAE00D6FB
      FF009BC4D80050739A00BEC8CF00000000000000000074797B0063636300A8A8
      A800FCFCFC00EAEAEA00DFDFDF00A0A0A1004C4C4C00D9D9D900FFFFFF00ECEC
      EC0054545400545454003E404100000000000000000000000000000000000000
      0000DED3CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFC00FCFBFA00FAF7
      F500EBE2DF00E8DEDB00E3D9D500E2D6D30000000000FFFFFF00A3A3A300B5B5
      B500FFFFFF00AFAFAF00C0C0C000CECECE00D3D3D300FFFFFF00FFFFFF00FFFF
      FF00C2C2C200FFFFFF00FFFFFF0000000000D5966E00C5724100CF937600D299
      7B00D3936C00D28C6300D1865A00F8A86800F79F5900B9421900BA7E6000DDFB
      FE004F729A00BEC8CF000000000000000000000000000000000074797B00AFAF
      AF00FDFDFD00F5F5F500EAEAEA00B8B8B8009191910047474700B0B0B0008181
      8100454545003D404100BBC3C700000000000000000000000000000000000000
      0000DED3CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FDFCFB00FBF8
      F700F4EDEB00EBE2DF00DDD1CD00DBCFCA0000000000FFFFFF009D9D9D00B3B3
      B300C4C4C400C3C3C300D1D1D100CCCCCC00D6D6D600FFFFFF00FFFFFF00FFFF
      FF00C3C3C300FFFFFF002122210000000000D5997400E3C7AF00DBC6C300FAF8
      F700F9F4F400F6EFEF00F3EAEA00CA8B7100CC8E7500855D5400775552006D8C
      AB00000000000000000000000000000000000000000000000000000000000000
      0000B8B8B800FFFFFF00EFEFF000313131005A5A5A0047474700212121002121
      2100ADB3B7000000000000000000000000000000000000000000000000000000
      0000DED3CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFB00FCFAF900FAF7
      F500A3918C00A3918C00A3918C00A3918C0000000000FFFFFF0092929200A2A2
      A200AAAAAA00AAAAAA00AAAAAA00AAAAAA00AAAAAA00D2D2D200D8D8D800D2D2
      D200AAAAAA00FFFFFF002929290000000000D69B7700FFE9C200F3D6B200CDAB
      9E00F9F4F400F6EFEF00F3EAEA00EDE0E000D2B2AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000757A7C00B7B7B700B0B0B00090909000C9C9C9002B2B2B00161616003739
      3A00000000000000000000000000000000000000000000000000000000000000
      0000DED3CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFB00FBF9F800F9F5
      F300FBF9F800FFFFFF00FAF8F600C8B7B20000000000FFFFFF008A8A8A009191
      91009292920097979700999999009999990099999900A3A3A300A8A8A800A3A3
      A30099999900FFFFFF00FFFFFF0000000000C16D3F00D5936400D5906000BD64
      3400CFB6B100EEE4E300F3EAEA00E7D6D400B8948F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007C80830086868600D6D6D600757573000C0C0C0037393A00BBC3
      C700000000000000000000000000000000000000000000000000000000000000
      0000DED3CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFB00FBF8F700F9F5
      F300F8F2F000FDFCFB00E9DFDC000000000078797800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0030303100000000000000000000000000000000000000
      00000000000000000000C2B7B700C1B5B4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A1B1B003D404100BDC5C800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DED3CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAF7F500F8F3F100F6EF
      ED00EBE2DF00C8B7B2000000000000000000818281007A797A00000000000000
      00000000000000000000000000005A595A005656560000000000000000000000
      0000000000003C3C3C003938390000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFC0700000000F83F800300000000
      E00F000700000000C007003C0000000080030018000000008003000000000000
      0001000000000000000100000000000000010000000000000001001800000000
      0001803C000000008003E3FF00000000800387FF00000000C0070FFF00000000
      E00F8FFF00000000F83FDFFF00000000FF1FFFF08107FFFFFE03FC380000FFFF
      FC01F81C00003E79F800F00E00000001F000C00100008001F000C00300008001
      F000800300008001000080018000800100000000F000000100018000F0000001
      00018001F00080010003C001F0008001000FF007F0008001007FF00FF0008001
      007FF80FF0010001FCFFFE3FF0033E79}
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Jpeg|*.jpg;*jpeg|Bitmap|*.bmp|Todos arquivos|*.*'
    FilterIndex = 0
    Left = 104
    Top = 192
  end
  object tmPreview: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tmPreviewTimer
    Left = 88
    Top = 461
  end
  object tmcam: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmcamTimer
    Left = 144
    Top = 460
  end
  object DdeServerConv1: TDdeServerConv
    Left = 304
    Top = 180
  end
end
