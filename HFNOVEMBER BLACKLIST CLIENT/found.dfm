object Form4: TForm4
  Left = 283
  Top = 498
  Width = 500
  Height = 270
  Caption = 'MEMBER FOUND'
  Color = clMaroon
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
    Left = 24
    Top = 48
    Width = 433
    Height = 113
    AutoSize = False
    Caption = '  FOUND!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 184
    Width = 385
    Height = 33
    AutoSize = False
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Button2: TButton
    Left = 400
    Top = 195
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button2Click
  end
end
