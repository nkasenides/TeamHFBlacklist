object Form5: TForm5
  Left = 248
  Top = 173
  Width = 291
  Height = 153
  Caption = 'TEAM HF ONLY!'
  Color = clBackground
  Constraints.MaxHeight = 153
  Constraints.MaxWidth = 291
  Constraints.MinHeight = 153
  Constraints.MinWidth = 291
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clRed
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 68
    Height = 24
    AutoSize = False
    Caption = 'PASSWORD'
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 270
    Height = 16
    Caption = 'This program is restricted to HF Members only.'
  end
  object Edit1: TEdit
    Left = 104
    Top = 40
    Width = 121
    Height = 24
    PasswordChar = '*'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 112
    Top = 80
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
end
