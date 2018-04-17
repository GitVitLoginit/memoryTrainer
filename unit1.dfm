object formlevel1: Tformlevel1
  Left = -5
  Top = 170
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'level1'
  ClientHeight = 575
  ClientWidth = 1444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labeltime: TLabel
    Left = 40
    Top = 16
    Width = 12
    Height = 52
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -47
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Labellogin: TLabel
    Left = 1144
    Top = 512
    Width = 6
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Labelnumber: TLabel
    Left = 176
    Top = 208
    Width = 12
    Height = 64
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -53
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Labelhint: TLabel
    Left = 168
    Top = 328
    Width = 119
    Height = 13
    Caption = #1053#1072#1078#1084#1080#1090#1077', '#1077#1089#1083#1080' '#1075#1086#1090#1086#1074#1099' '
  end
  object Labelright: TLabel
    Left = 936
    Top = 208
    Width = 5
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 880
    Top = 40
    Width = 511
    Height = 16
    Caption = 
      #1053#1077#1090' '#1083#1102#1076#1077#1081' '#1089' '#1087#1083#1086#1093#1086#1081' '#1087#1072#1084#1103#1090#1100#1102'. '#1045#1089#1090#1100' '#1083#1102#1076#1080', '#1082#1086#1090#1086#1088#1086#1099#1077' '#1085#1077' '#1091#1084#1077#1102#1090' '#1077#1102' '#1087#1086#1083#1100 +
      #1079#1086#1074#1072#1090#1100#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EditInPut: TEdit
    Left = 168
    Top = 344
    Width = 649
    Height = 72
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = EditInPutClick
  end
  object Buttoninput: TButton
    Left = 912
    Top = 344
    Width = 145
    Height = 65
    Caption = #1042#1074#1086#1076
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtoninputClick
  end
  object Buttonrepeat: TButton
    Left = 928
    Top = 440
    Width = 121
    Height = 57
    Caption = #1089#1099#1075#1088#1072#1090#1100' '#1077#1097#1077' '#1088#1072#1079
    Default = True
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonrepeatClick
  end
  object Buttonback: TButton
    Left = 32
    Top = 520
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1074' '#1084#1077#1085#1102
    TabOrder = 3
    OnClick = ButtonbackClick
  end
  object Timerlevel1: TTimer
    Enabled = False
    OnTimer = Timerlevel1Timer
    Left = 24
    Top = 48
  end
end
