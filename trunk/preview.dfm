object Form2: TForm2
  Left = 271
  Top = 181
  Width = 660
  Height = 462
  Caption = 'Visualiza'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 652
    Height = 29
    ButtonWidth = 26
    Caption = 'ToolBar1'
    Images = Form1.ImageList1
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Hint = 'Gravar'
      Caption = 'ToolButton2'
      ImageIndex = 1
      OnClick = ToolButton2Click
    end
    object Label1: TLabel
      Left = 26
      Top = 2
      Width = 33
      Height = 22
      Hint = 'Tamanho do papel (cm)'
      Caption = ' Papel '
      Layout = tlCenter
    end
    object edPapel: TComboBox
      Left = 59
      Top = 2
      Width = 76
      Height = 21
      Hint = 'Tamanho do papel (cm)'
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = espacamentoChange
      Items.Strings = (
        'igual ao tamanho da foto')
    end
    object margem: TTrackBar
      Left = 135
      Top = 2
      Width = 74
      Height = 22
      Hint = 'Margem'
      Max = 40
      Position = 5
      TabOrder = 2
      TickStyle = tsNone
      OnChange = espacamentoChange
    end
    object espacamento: TTrackBar
      Left = 209
      Top = 2
      Width = 74
      Height = 22
      Hint = 'Espa'#231'amento'
      Max = 40
      Position = 5
      TabOrder = 3
      TickStyle = tsNone
      OnChange = espacamentoChange
    end
    object zoomImg: TTrackBar
      Left = 283
      Top = 2
      Width = 150
      Height = 22
      Hint = 'Zoom'
      Max = 400
      Min = 10
      Position = 100
      TabOrder = 0
      TickStyle = tsNone
      OnChange = zoomImgChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 652
    Height = 399
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
    object lbErro: TStaticText
      Left = 16
      Top = 24
      Width = 617
      Height = 153
      AutoSize = False
      Caption = 'lbErro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.jpg'
    Filter = 'Jpeg|*.jpg;*jpeg'
    FilterIndex = 0
    Left = 216
    Top = 85
  end
end
