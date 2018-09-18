object Form3: TForm3
  Left = 283
  Top = 227
  Width = 500
  Height = 270
  Caption = 'MEMBER NOT FOUND'
  Color = clGreen
  Constraints.MaxHeight = 270
  Constraints.MaxWidth = 500
  Constraints.MinHeight = 270
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 40
    Width = 329
    Height = 113
    AutoSize = False
    Caption = 'CLEAN!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 400
    Top = 184
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
end
