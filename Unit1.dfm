object Form1: TForm1
  Left = 536
  Top = 211
  Width = 473
  Height = 366
  Caption = 'Form Satuan'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 32
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object lbl2: TLabel
    Left = 24
    Top = 64
    Width = 52
    Height = 13
    Caption = 'DESKRIPSI'
  end
  object lbl3: TLabel
    Left = 24
    Top = 280
    Width = 79
    Height = 13
    Caption = 'MASUKAN NAME'
  end
  object edt2: TEdit
    Left = 112
    Top = 56
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object edt1: TEdit
    Left = 112
    Top = 24
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 88
    Top = 104
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 176
    Top = 104
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 264
    Top = 104
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 4
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 352
    Top = 104
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 5
    OnClick = btn4Click
  end
  object dbgrd1: TDBGrid
    Left = 24
    Top = 144
    Width = 409
    Height = 120
    DataSource = DataModule2.dsSatuan
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'deskripsi'
        Width = 229
        Visible = True
      end>
  end
  object edt3: TEdit
    Left = 120
    Top = 272
    Width = 305
    Height = 21
    TabOrder = 7
    OnChange = edt3Change
  end
end
