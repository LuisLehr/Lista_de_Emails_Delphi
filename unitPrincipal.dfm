object frmPrincipal: TfrmPrincipal
  Left = 531
  Top = 291
  Caption = 'Lista de Emails - Luis Henrique Lehr'
  ClientHeight = 501
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object lblUnidades: TLabel
    Left = 8
    Top = 23
    Width = 76
    Height = 21
    Caption = 'Unidades:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object radioDirecao: TRadioGroup
    Left = 385
    Top = 24
    Width = 225
    Height = 53
    Caption = 'Dire'#231#227'o'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Sem Dire'#231#227'o'
      'Com Dire'#231#227'o')
    TabOrder = 0
  end
  object btnGerarLista: TButton
    Left = 624
    Top = 23
    Width = 223
    Height = 54
    Caption = 'Gerar Lista'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnGerarListaClick
  end
  object comboUnidades: TComboBox
    Left = 8
    Top = 54
    Width = 361
    Height = 23
    TabOrder = 2
    Text = 'Todas'
    Items.Strings = (
      'Todas'
      'Matriz'
      'Filial 6 - Centro'
      'Filial 2 - Morro Reuter'
      'Filial 1 - Santa Maria do Herval'
      'Filial 8 - Amizade')
  end
  object Panel1: TPanel
    Left = 8
    Top = 104
    Width = 841
    Height = 385
    TabOrder = 3
    object lblPesquisa: TLabel
      Left = 8
      Top = 73
      Width = 146
      Height = 15
      Caption = 'Digite o usu'#225'rio da pessoa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 160
      Top = 70
      Width = 668
      Height = 23
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 139
      Width = 822
      Height = 233
      DataSource = DM.dsSqlConsulta
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cusuario'
          Title.Caption = 'USUARIO:'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 309
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Title.Caption = 'EMAIL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 476
          Visible = True
        end>
    end
    object btnBuscar: TButton
      Left = 8
      Top = 99
      Width = 820
      Height = 34
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnBuscarClick
    end
    object radioUsuarioEmail: TRadioGroup
      Left = 8
      Top = 9
      Width = 368
      Height = 55
      Caption = 'Buscar por Usuario ou por Email'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Usuario'
        'Email')
      TabOrder = 3
    end
  end
end
