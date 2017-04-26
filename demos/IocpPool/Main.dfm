object Form1: TForm1
  Left = 438
  Top = 242
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Beta2.6'
  ClientHeight = 328
  ClientWidth = 231
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 31
    Height = 13
    Caption = 'Works'
  end
  object Label2: TLabel
    Left = 80
    Top = 40
    Width = 30
    Height = 13
    Caption = 'Active'
  end
  object Label3: TLabel
    Left = 160
    Top = 40
    Width = 33
    Height = 13
    Caption = 'In Pool'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 73
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object txtCurWorks: TEdit
    Left = 8
    Top = 56
    Width = 65
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object txtActThreads: TEdit
    Left = 80
    Top = 56
    Width = 73
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object txtCurThreads: TEdit
    Left = 160
    Top = 56
    Width = 65
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object memErros: TMemo
    Left = 8
    Top = 88
    Width = 217
    Height = 233
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
end
