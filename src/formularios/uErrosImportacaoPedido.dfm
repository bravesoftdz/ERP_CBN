inherited frmErrosImportacaoPedido: TfrmErrosImportacaoPedido
  Caption = 'Erros de importa'#231#227'o de pedido'
  ClientHeight = 543
  ClientWidth = 1163
  OnShow = FormShow
  ExplicitWidth = 1179
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 15
  object DBGridCBN1: TDBGridCBN
    Left = 8
    Top = 16
    Width = 1147
    Height = 457
    Color = 14803425
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    BuscaHabilitada = True
    ConfCores.Normal.CorFonte = clWindowText
    ConfCores.Normal.CorFundo = 14803425
    ConfCores.Normal.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Normal.Tipo.Color = clWindowText
    ConfCores.Normal.Tipo.Height = -11
    ConfCores.Normal.Tipo.Name = 'MS Sans Serif'
    ConfCores.Normal.Tipo.Style = []
    ConfCores.Zebrada.CorFonte = clWindowText
    ConfCores.Zebrada.CorFundo = clWhite
    ConfCores.Zebrada.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Zebrada.Tipo.Color = clWindowText
    ConfCores.Zebrada.Tipo.Height = -11
    ConfCores.Zebrada.Tipo.Name = 'MS Sans Serif'
    ConfCores.Zebrada.Tipo.Style = []
    ConfCores.Selecao.CorFonte = clWindowText
    ConfCores.Selecao.CorFundo = 16037533
    ConfCores.Selecao.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Selecao.Tipo.Color = clWindowText
    ConfCores.Selecao.Tipo.Height = -11
    ConfCores.Selecao.Tipo.Name = 'MS Sans Serif'
    ConfCores.Selecao.Tipo.Style = []
    ConfCores.Destacado.CorFonte = 8650884
    ConfCores.Destacado.CorFundo = clWhite
    ConfCores.Destacado.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Destacado.Tipo.Color = 8650884
    ConfCores.Destacado.Tipo.Height = -11
    ConfCores.Destacado.Tipo.Name = 'Lucida Console'
    ConfCores.Destacado.Tipo.Style = [fsBold]
    ConfCores.Titulo.CorFonte = clWindowText
    ConfCores.Titulo.CorFundo = clBtnFace
    ConfCores.Titulo.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Titulo.Tipo.Color = clWindowText
    ConfCores.Titulo.Tipo.Height = -11
    ConfCores.Titulo.Tipo.Name = 'MS Sans Serif'
    ConfCores.Titulo.Tipo.Style = []
    Ordenavel = True
    TipoBusca.ListarApenasEncontrados = False
    TipoBusca.QualquerParte = False
    SalvaConfiguracoes = False
    Columns = <
      item
        Expanded = False
        FieldName = 'ERRO'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 488
    Width = 1163
    Height = 55
    Align = alBottom
    TabOrder = 1
    object btnMarcar: TBitBtn
      Left = 968
      Top = 16
      Width = 169
      Height = 30
      Caption = 'Marcar como verificado'
      TabOrder = 0
      OnClick = btnMarcarClick
    end
    object btnSair: TBitBtn
      Left = 784
      Top = 16
      Width = 169
      Height = 30
      Caption = '[ ESC ] Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 144
    object cdsERRO: TStringField
      FieldName = 'ERRO'
      Size = 1000
    end
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 208
    Top = 144
  end
end
