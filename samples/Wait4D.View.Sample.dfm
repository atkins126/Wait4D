object PageSample: TPageSample
  Left = 0
  Top = 0
  Caption = 'PageSample'
  ClientHeight = 368
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoading: TButton
    Left = 80
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Loading'
    TabOrder = 0
    OnClick = btnLoadingClick
  end
  object btnProgress: TButton
    Left = 360
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Progress'
    TabOrder = 1
    OnClick = btnProgressClick
  end
end
