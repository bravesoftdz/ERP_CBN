﻿unit uFaturamentoPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, frameBuscaNaturezaOperacao, frameBuscaEmpresa, ExtCtrls,
  frameBuscaDestinatario, StdCtrls, ComCtrls, frameBuscaFormaPagamento,
  frameBuscaTransportadora, Buttons, Mask, RxToolEdit, RxCurrEdit, Grids,
  DBGrids, DBGridCBN, DB, DBClient, NotaFiscal, Menus, frameBuscaCidade,
  ConfiguracoesNF;

type TEstadoTela = (etNenhum=-1, etEmCriacao=0, etEmDigitacao=1, etEmAlteracao=2);

type
  TfrmFaturamentoPedidos = class(TfrmPadrao)
    pnlGeral: TPanel;
    BuscaNaturezaOperacao: TBuscaNaturezaOperacao;
    BuscaEmitente: TBuscaEmpresa;
    BuscaDestinatario: TBuscaDestinatario;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnFaturar: TBitBtn;
    dsPedidos: TDataSource;
    cdsPedidos: TClientDataSet;
    cdsPedidosMARCADO_PARA_FATURAR: TStringField;
    cdsItensDoPedidoSelecionado: TClientDataSet;
    cdsItensDoPedidoSelecionadoDESCRICAO_PRODUTO: TStringField;
    cdsItensDoPedidoSelecionadoCOR_VARIANTE: TStringField;
    dsItensDoPedidoSelecionado: TDataSource;
    cdsItensFisicos: TClientDataSet;
    cdsItensFisicosDESCRICAO_PRODUTO: TStringField;
    cdsItensFisicosCOR_VARIANTE: TStringField;
    dsItensFisicos: TDataSource;
    cdsItensFiscais: TClientDataSet;
    cdsItensFiscaisNR_ITEM: TIntegerField;
    cdsItensFiscaisQUANTIDADE: TFloatField;
    cdsItensFiscaisVALOR_UNITARIO: TCurrencyField;
    cdsItensFiscaisVALOR_TOTAL: TCurrencyField;
    cdsItensFiscaisFRETE: TCurrencyField;
    cdsItensFiscaisSEGURO: TCurrencyField;
    cdsItensFiscaisDESCONTO: TCurrencyField;
    cdsItensFiscaisOUTRAS_DESPESAS: TCurrencyField;
    cdsItensFisicosREFERENCIA_PRODUTO: TStringField;
    cdsItensDoPedidoSelecionadoREFERENCIA_PRODUTO: TStringField;
    cdsItensFiscaisREFERENCIA_PRODUTO: TStringField;
    cdsItensFiscaisDESCRICAO_PRODUTO: TStringField;
    dsItensFiscais: TDataSource;
    cdsPedidosCODIGO_PEDIDO: TIntegerField;
    cdsItensDoPedidoSelecionadoCOR_DESCRICAO: TStringField;
    lblCancelarDigitacaoAtual: TLabel;
    pnlCamposSemFoco: TPanel;
    edtNumeroNotalFiscal: TEdit;
    lblNumeroNotaFiscal: TLabel;
    rgpSerie: TRadioGroup;
    pmnuPedidos: TPopupMenu;
    mnuAdicionarTodos: TMenuItem;
    mnuRemoverTodos: TMenuItem;
    cdsItensFisicosDESCRICAO_COR: TStringField;
    pgcNotaFiscal: TPageControl;
    tbsCabecalho: TTabSheet;
    pgcCabecalho: TPageControl;
    tbsCabecalho1: TTabSheet;
    BuscaTransportadora: TBuscaTransportadora;
    gbTipoFrete: TGroupBox;
    cbTipoFrete: TComboBox;
    pnlFreteCalculado: TPanel;
    Label1: TLabel;
    edtFreteCalculado: TCurrencyEdit;
    gpbVolumes: TGroupBox;
    lblPesoBruto: TLabel;
    lblPesoLiquido: TLabel;
    lblQuantidadeVolumes: TLabel;
    lblEspecie: TLabel;
    edtPesoBruto: TCurrencyEdit;
    edtPesoLiquido: TCurrencyEdit;
    edtQuantidadeVolumes: TCurrencyEdit;
    edtEspecie: TEdit;
    gpbTotais: TGroupBox;
    lblBaseCalculoICMS: TLabel;
    lblValorICMS: TLabel;
    lblValorProdutos: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtBaseCalculoICMS: TCurrencyEdit;
    edtICMS: TCurrencyEdit;
    edtTotalProdutos: TCurrencyEdit;
    edtFrete: TCurrencyEdit;
    edtSeguro: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    edtIPI: TCurrencyEdit;
    edtPIS: TCurrencyEdit;
    edtCOFINS: TCurrencyEdit;
    edtOutrasDespesas: TCurrencyEdit;
    edtTotalNF: TCurrencyEdit;
    tbsDestino: TTabSheet;
    gbEnderecoEntrega: TGroupBox;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblBairro: TLabel;
    lblCEP: TLabel;
    lblComplemento: TLabel;
    lblAstLogradouro: TLabel;
    lblAstNumero: TLabel;
    lblAstBairro: TLabel;
    lblAstCidade: TLabel;
    lblCNPJ: TLabel;
    Cidade: TBuscaCidade;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCep: TMaskEdit;
    edtComplemento: TEdit;
    edtCNPJ: TMaskEdit;
    tbsItensFisicos: TTabSheet;
    gridItensFisicos: TDBGridCBN;
    tbsItensFiscais: TTabSheet;
    gridItensFiscais: TDBGridCBN;
    tbsPedidos: TTabSheet;
    lblCliqueCheckBox: TLabel;
    gridPedidos: TDBGridCBN;
    gpbItensDoPedidoSelecionado: TGroupBox;
    gridItensDoPedidoSelecionado: TDBGridCBN;
    tbsObservacoes: TTabSheet;
    gbObservacoes: TGroupBox;
    memoObservacoes: TMemo;
    gbObservacoesGeradasPeloSistema: TGroupBox;
    memoObservacoesGeradasPeloSistema: TMemo;
    lblAlterarConfiguracoesNF: TLabel;
    btnLimparLocalEntrega: TButton;
    edtPercentualDescontoFatura: TCurrencyEdit;
    Label2: TLabel;
    rgTipoNota: TRadioGroup;
    cdsPedidosNR_PED: TStringField;
    cdsItensDoPedidoSelecionadoNR_PED: TStringField;
    cdsItensFisicosNR_PED: TStringField;
    Shape1: TShape;
    btnItensAvulsos: TBitBtn;
    btnImprimirDanfe: TBitBtn;
    btnImprimirEtiquetas: TBitBtn;
    GroupBox1: TGroupBox;
    BuscaFormaPagamento: TBuscaFormaPagamento;
    GroupBox2: TGroupBox;
    lblDataSaida: TLabel;
    lblDataEmissao: TLabel;
    dtpSaida: TDateTimePicker;
    dtpEmissao: TDateTimePicker;
    GroupBox3: TGroupBox;
    cmbFinalidade: TComboBox;
    grpNfeReferenciada: TGroupBox;
    edtNfeReferenciada: TEdit;
    btnMonitor: TBitBtn;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure btnCancelarClick(Sender: TObject);
    procedure btnFaturarClick(Sender: TObject);

    procedure gridPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pgcNotaFiscalEnter(Sender: TObject);
    procedure lblCancelarDigitacaoAtualClick(Sender: TObject);
    procedure gridPedidosDblClick(Sender: TObject);

    procedure mnuAdicionarTodosClick(Sender: TObject);
    procedure mnuRemoverTodosClick(Sender: TObject);

    procedure cdsPedidosBeforeScroll(DataSet: TDataSet);
    procedure cdsPedidosMARCADO_PARA_FATURARChange(Sender: TField);

    procedure cbTipoFreteChange(Sender: TObject);
    procedure edtFreteChange(Sender: TObject);
    procedure edtSeguroChange(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtOutrasDespesasChange(Sender: TObject);
    procedure edtLogradouroChange(Sender: TObject);
    procedure edtNumeroChange(Sender: TObject);
    procedure edtBairroChange(Sender: TObject);
    procedure edtCepChange(Sender: TObject);
    procedure edtComplementoChange(Sender: TObject);
    procedure edtCNPJChange(Sender: TObject);
    procedure CidadeExit(Sender: TObject);
    procedure memoObservacoesChange(Sender: TObject);
    procedure BuscaEmitenteExit(Sender: TObject);
    procedure btnLimparLocalEntregaClick(Sender: TObject);
    procedure dtpEmissaoChange(Sender: TObject);
    procedure dtpSaidaChange(Sender: TObject);
    procedure edtPesoBrutoChange(Sender: TObject);
    procedure edtPesoLiquidoChange(Sender: TObject);
    procedure edtQuantidadeVolumesChange(Sender: TObject);
    procedure edtEspecieChange(Sender: TObject);
    procedure BuscaNaturezaOperacaoExit(Sender: TObject);
    procedure edtPercentualDescontoFaturaChange(Sender: TObject);
    procedure btnItensAvulsosClick(Sender: TObject);
    procedure rgTipoNotaClick(Sender: TObject);
    procedure pnlGeralExit(Sender: TObject);
    procedure btnImprimirEtiquetasClick(Sender: TObject);
    procedure btnImprimirDanfeClick(Sender: TObject);
    procedure cmbFinalidadeClick(Sender: TObject);
    procedure edtNfeReferenciadaExit(Sender: TObject);
    procedure btnMonitorClick(Sender: TObject);

  private
    FEstadoTela      :TEstadoTela;
    FNotaFiscal      :TNotaFiscal;
    FAbreMonitor     :Boolean;

 { Métodos delegados }
  private
    procedure AtalhosEmCriacao                    (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AtalhosEmDigitacao                  (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AtalhosEmAlteracao                  (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AtualizarAposAdicionarPrimeiroPedido(NotaFiscal :TObject);
    procedure AtualizarNotaFiscal                 (Sender :TObject);
    procedure AtualizarAposRemoverUltimoPedido    (NotaFiscal :TObject);

  private
    function VerificaPedidoFaturado(const CodigoPedido :Integer) :Boolean;
    function GetAliquotaCreditoSN     :Real;
    function GetPercentualReducaoICMS :Real;
    function GetAliquotaICMS          :Real;
    function GetAliquotaPIS           :Real;
    function GetAliquotaCOFINS        :Real;
    function TemLocalEntrega          :Boolean;
  { Fim de métodos delegados }

  private
    function ValidarNotaFiscal        :Boolean;
    procedure VerificaConferencia;

  private
    procedure AdicionarPedidoNaNotaFiscal(const CodigoPedido :Integer);
    procedure AdicionarMetodosDelegadosNaNotaFiscal;
    procedure AlterarEstadoTela          (NovoEstado :TEstadoTela);
    procedure AlterarNotaFiscal          (Sender :TObject);
    procedure AposAcharDestinatario      (Destinatario   :TObject);
    procedure AposAcharEmpresa           (Empresa        :TObject);
    procedure AposAlterarFormaPagamento  (FormaPagamento :TObject);
    procedure AposAlterarTransportadora  (Transportadora :TObject);
    procedure AtualizarTela;
    procedure CriarNotaFiscal;
    procedure DesabilitaEventosLocalEntrega;
    procedure DesabilitaOnChangeComponentes;
    procedure DestacarAoPassarOMouse(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FaturarNotaFiscal          (Sender :TObject);
    procedure HabilitaEventosLocalEntrega;
    procedure HabilitaOnChangeComponentes;
    procedure LimparNotaFiscal;
    procedure LimparTela;
    procedure ListarPedidos;
    procedure ListarItensDoPedido        (const CodigoPedido :Integer);
    procedure MarcarDesmarcarTodosPedidos(const Marcar :Boolean);
    procedure RemoverPedidoDaNotaFiscal  (const CodigoPedido :Integer);
    procedure VoltarAoNormalAoSairComOMouse(Sender: TObject);

  public
    constructor Create(AOwner :TComponent); overload; override;
    constructor Create(AOwner :TComponent; NotaFiscal :TNotaFiscal); overload;
    destructor Destroy; override;
  end;

var
  frmFaturamentoPedidos: TfrmFaturamentoPedidos;

implementation

uses
   Contnrs,
   EspecificacaoPedidosAprovadosNaoFaturados,
   ExcecaoNotaFiscalInvalida,
   ExcecaoParametroInvalido,
   FabricaRepositorio,
   Pedido,
   Repositorio,
   TipoSerie,
   PedidoFaturado,
   EspecificacaoPedidoFaturado,
   Item,
   Produto,
   Cor,
   TipoFrete,
   TotaisNotaFiscal,
   ItemNotaFiscal,
   uConfiguracoesNF,
   ExcecaoCampoNaoInformado,
   Pessoa,
   Endereco,
   Especificacao,
   EspecificacaoEnderecoComPessoaIgualA,
   EspecificacaoNaturezaPorTipo,
   TipoNaturezaOperacao,
   Empresa, IcmsEstado,
   EspecificacaoEmpresaPorCodigoPessoa,
   StringUtilitario, uMonitorControleNFe, permissoesAcesso,
   LocalEntregaNotaFiscal,
   FormaPagamento, uPesquisaSimples,
   //uImpressaoEtiquetaCaixa,
   GeradorNFe, uImpressaoEtiquetaCaixa, ItemAvulso, uItensAvulsos,
  TipoRegimeTributario, StrUtils, Funcoes, Math;

const
  MENSAGEM_DELETAR_PEDIDO = 'Ao deletar um pedido, os valores poderão ser alterados. Tais como: FRETE, DESCONTO e etc. Deseja realmente continuar?';
  NENHUMA_CONFIGURACAO_CADASTRADA = 'Nenhuma configuração de nota fiscal cadastrada!';
  PERCENTAGEM_REDUCAO_BC_NAO_CADASTRADA = 'Percentagem de redução de base de cálculo não cadastrada para estado do ';

{$R *.dfm}

procedure TfrmFaturamentoPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   if not (inherited Confirma('Se você sair, a digitação atual irá ser cancelada. Deseja CANCELAR a digitação atual?')) then
     Action := caNone
   else if FAbreMonitor then
     self.AbreForm(TfrmMonitorControleNFe, paTelaMonitorControleNFe);
end;

procedure TfrmFaturamentoPedidos.btnCancelarClick(Sender: TObject);
begin
   self.Close();
end;

procedure TfrmFaturamentoPedidos.gridPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check :Integer;
  R     :TRect;
  Grid  :TDBGrid;
begin
  if not ( Sender is TDBGrid ) then exit;

  Grid := ( Sender as TDBGrid );

  if not Assigned( Grid.DataSource.DataSet.FindField( self.cdsPedidosMARCADO_PARA_FATURAR.FieldName ) ) then exit;

  { Desenha um checkbox no dbgrid }
  if Column.FieldName = self.cdsPedidosMARCADO_PARA_FATURAR.FieldName then
   begin
      Grid.Canvas.FillRect(Rect);
      Check := 0;

      if Grid.DataSource.DataSet.FieldByName( self.cdsPedidosMARCADO_PARA_FATURAR.FieldName ).AsString = 'X' then
        Check := DFCS_CHECKED
      else Check := 0;
        R     := Rect;

      InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(Grid.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmFaturamentoPedidos.pgcNotaFiscalEnter(Sender: TObject);
begin
   if (self.FEstadoTela <> etEmCriacao) then
    exit;

   try
     self.CriarNotaFiscal();
     self.ListarPedidos();
     self.AlterarEstadoTela(etEmDigitacao);
     self.pgcNotaFiscal.ActivePageIndex := 0;
   except
      on E: TExcecaoParametroInvalido do begin
          if (pos('Natureza', E.Message) <> 0) then begin
            inherited Avisar('Informe a Natureza de Operação!');
            self.BuscaNaturezaOperacao.edtCFOP.SetFocus;
          end;

          if (pos('Serie', E.Message) <> 0) {or (pos(E.Message, 'TipoSerie') <> 0))} then begin
            inherited Avisar('Informe a série!');
            self.BuscaNaturezaOperacao.edtCFOP.SetFocus;
          end;

          if (pos('Destinatario', E.Message) <> 0) then begin
            inherited Avisar('Informe o destinatário!');
            self.BuscaDestinatario.edtCodigo.SetFocus;
          end;

          if (pos('Emitente', E.Message) <> 0) then begin
            inherited Avisar('Informe o emitente!');
            self.BuscaEmitente.edtCodigo.SetFocus;
          end;
       end;

      on E: TExcecaoNotaFiscalInvalida do begin
//        inherited Avisar(E.Message); O AVISAR VAI FICAR DESABILITADO AQUI ATÉ SER IMPLEMENTADO UM AVISAR QUE PERMITA UTILIZAR A QUEBRA DE LINHA MANUALMENTE.
        MessageDlg(E.Message, mtError, [mbOK], 0);
        self.BuscaDestinatario.edtCodigo.SetFocus;
      end;

      on E: EAccessViolation do begin
        self.BuscaDestinatario.edtCodigo.SetFocus;
        inherited Avisar(E.Message);
      end;
   end;
end;

constructor TfrmFaturamentoPedidos.Create(AOwner: TComponent);
begin
  inherited;

//  self.lblAlterarConfiguracoesNF.OnMouseMove      := self.DestacarAoPassarOMouse;
  self.lblAlterarConfiguracoesNF.OnMouseLeave     := self.VoltarAoNormalAoSairComOMouse;

  self.lblCancelarDigitacaoAtual.OnMouseMove      := self.DestacarAoPassarOMouse;
  self.lblCancelarDigitacaoAtual.OnMouseLeave     := self.VoltarAoNormalAoSairComOMouse;

  self.FNotaFiscal      := nil;
  self.FEstadoTela      := etNenhum;

  self.cdsPedidos.CreateDataSet;
  self.cdsItensDoPedidoSelecionado.CreateDataSet;
  self.cdsItensFisicos.CreateDataSet;
  self.cdsItensFiscais.CreateDataSet;

  self.BuscaDestinatario.AposAcharDestinatario        := self.AposAcharDestinatario;
  self.BuscaEmitente.AposAcharEmpresa                 := self.AposAcharEmpresa;
  self.BuscaTransportadora.AposAlterarTransportadora  := self.AposAlterarTransportadora;
  self.BuscaFormaPagamento.AposAlterarFormaPagamento  := self.AposAlterarFormaPagamento;
end;

destructor TfrmFaturamentoPedidos.Destroy;
begin
  self.cdsPedidos.Close();
  self.cdsItensDoPedidoSelecionado.Close();
  self.cdsItensFisicos.Close();
  self.cdsItensFiscais.Close();

  if (self.FEstadoTela <> etEmAlteracao) then
    FreeAndNil(self.FNotaFiscal);
    
   
  inherited;
end;

procedure TfrmFaturamentoPedidos.CriarNotaFiscal;
begin
   if not Assigned(self.FNotaFiscal) then
    begin
       self.FNotaFiscal := TNotaFiscal.Create(
                                              self.BuscaNaturezaOperacao.NaturezaOperacao,
                                              IfThen(self.rgpSerie.ItemIndex = 0, '001', '900'),
                                              self.BuscaEmitente.Empresa,
                                              self.BuscaDestinatario.Destinatario);

       self.AdicionarMetodosDelegadosNaNotaFiscal;
    end
   else
    begin
       self.FNotaFiscal.Natureza     := self.BuscaNaturezaOperacao.NaturezaOperacao;
       self.FNotaFiscal.Serie        := IfThen(self.rgpSerie.ItemIndex = 0, '001', '900');
       self.FNotaFiscal.Emitente     := self.BuscaEmitente.Empresa;
       self.FNotaFiscal.Destinatario := self.BuscaDestinatario.Destinatario; 
    end;
end;

procedure TfrmFaturamentoPedidos.btnFaturarClick(Sender: TObject);
begin
   { FaturarNotaFiscal(Sender :TObject) ou AlterarNotaFiscal(Sender :TObject) depende do estado da tela }
end;

procedure TfrmFaturamentoPedidos.ListarPedidos;
var
  EspecificacaoPedidosAprovadosNaoFaturados :TEspecificacaoPedidosAprovadosNaoFaturados;
  Repositorio                               :TRepositorio;
  Pedido                                    :TPedido;
  Pedidos                                   :TObjectList;
  nX                                        :Integer;
begin
   { Seto nil o evento BeforeScroll do cdsPedidos para não ir listar os itens no CDSItensDoPedido a cada inserção de pedido }
   self.cdsPedidos.BeforeScroll                   := nil;
   
   { Faço o mesmo nesse caso. Para não ser deletado nenhum pedido apos setar '' na propriedade MARCADO_PARA_FATURA }
   self.cdsPedidosMARCADO_PARA_FATURAR.OnChange   := nil;

   EspecificacaoPedidosAprovadosNaoFaturados := TEspecificacaoPedidosAprovadosNaoFaturados.Create(
                                                                                                  self.BuscaDestinatario.Destinatario,
                                                                                                  VerificaPedidoFaturado
                                                                                                  );
   Repositorio                               := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
     Pedidos     := Repositorio.GetListaPorEspecificacao(EspecificacaoPedidosAprovadosNaoFaturados);

     try
       if (not assigned(Pedidos)or(Pedidos.Count <= 0)) and (not assigned(self.FNotaFiscal.ItensAvulsos)or(self.FNotaFiscal.ItensAvulsos.Count <= 0)) then
        raise EAccessViolation.Create('');
     except
       on E: EAccessViolation do
        raise EAccessViolation.Create('Não há pedidos para faturar deste destinatario. Para faturar um pedido para esse destinatário, crie um pedido '+
                                      'ou adicione itens avulsos!');
     end;

     if not assigned(Pedidos) then
       Exit;

     for nX := 0 to (Pedidos.Count-1) do begin
        Pedido := (Pedidos.Items[nX] as TPedido);

        self.cdsPedidos.Append;
        self.cdsPedidosCODIGO_PEDIDO.AsInteger       := Pedido.Codigo;
        self.cdsPedidosNR_PED.AsString               := Pedido.numpedido;
        self.cdsPedidosMARCADO_PARA_FATURAR.AsString := '';
        self.cdsPedidos.Post;
     end;
     
     { Depois seto o evento normalmente }
     self.cdsPedidos.BeforeScroll := self.cdsPedidosBeforeScroll;
     self.cdsPedidos.First;
   finally
     self.cdsPedidos.BeforeScroll                 := self.cdsPedidosBeforeScroll;
     self.cdsPedidosMARCADO_PARA_FATURAR.OnChange := self.cdsPedidosMARCADO_PARA_FATURARChange;

     FreeAndNil(EspecificacaoPedidosAprovadosNaoFaturados);
     FreeAndNil(Repositorio);
     FreeAndNil(Pedidos);
   end;
end;

procedure TfrmFaturamentoPedidos.VerificaConferencia;
var i :integer;
    motivo :String;
    repositorio :TRepositorio;
begin
  try
    repositorio := TFabricaRepositorio.GetRepositorio(TPedidoFaturado.ClassName);
    if assigned(self.FNotaFiscal.PedidosFaturados) then
    for i := 0 to self.FNotaFiscal.PedidosFaturados.Count -1 do
      begin
        if not assigned(TPedidoFaturado(self.FNotaFiscal.PedidosFaturados.Items[i]).Pedido.Conferencia) then
        begin
          motivo := chamaInput('TEXT', 'Pedido Nº '+TPedidoFaturado(self.FNotaFiscal.PedidosFaturados.Items[i]).Pedido.numpedido+' não conferido. Informe o motivo:');

        if length(motivo) > 5 then
            TPedidoFaturado(self.FNotaFiscal.PedidosFaturados.Items[i]).Motivo := motivo
          else
            raise Exception.Create('Motivo não informado. Faturamento cancelado.');
        end;
      end;
    finally
    FreeAndNil(repositorio);
  end;
end;

function TfrmFaturamentoPedidos.VerificaPedidoFaturado(
  const CodigoPedido: Integer): Boolean;
var
  Repositorio                 :TRepositorio;
  EspecificacaoPedidoFaturado :TEspecificacaoPedidoFaturado;
  PedidoFaturado              :TObject;
begin
   Repositorio                 := nil;
   EspecificacaoPedidoFaturado := TEspecificacaoPedidoFaturado.Create(CodigoPedido);
   PedidoFaturado              := nil;

   try
     Repositorio    := TFabricaRepositorio.GetRepositorio(TPedidoFaturado.ClassName);
     PedidoFaturado := Repositorio.GetPorEspecificacao(EspecificacaoPedidoFaturado);
     result         := (PedidoFaturado <> nil);

   finally
     FreeAndNil(EspecificacaoPedidoFaturado);
     FreeAndNil(Repositorio);
     FreeAndNil(PedidoFaturado);
   end;
end;

procedure TfrmFaturamentoPedidos.LimparTela;
var
  nX :Integer;
begin
   self.BuscaNaturezaOperacao.Clear;
   self.BuscaEmitente.Clear;
   self.BuscaDestinatario.Clear;
   self.BuscaFormaPagamento.Limpa;
   self.BuscaTransportadora.Clear;

   self.cdsPedidos.EmptyDataSet;
   self.cdsItensDoPedidoSelecionado.EmptyDataSet;
   self.cdsItensFisicos.EmptyDataSet;
   self.cdsItensFiscais.EmptyDataSet;

   self.rgpSerie.ItemIndex    := 0;
   self.dtpEmissao.DateTime   := Now;
   self.dtpSaida.DateTime     := Now;
   self.cbTipoFrete.ItemIndex := 0;

   self.DesabilitaOnChangeComponentes;

   for nX := 0 to (self.ComponentCount-1) do begin
//      Application.ProcessMessages;

      if (self.Components[nX] is TCustomEdit) then
        TCustomEdit(self.Components[nX]).Clear;
   end;

   self.Cidade.Clear;

   self.HabilitaOnChangeComponentes;
end;

procedure TfrmFaturamentoPedidos.cdsPedidosBeforeScroll(DataSet: TDataSet);
begin
   self.ListarItensDoPedido(Dataset.FieldByName(self.cdsPedidosCODIGO_PEDIDO.FieldName).AsInteger);
end;

procedure TfrmFaturamentoPedidos.ListarItensDoPedido(const CodigoPedido :Integer);
var
  Pedido      :TPedido;
  Repositorio :TRepositorio;
  nX          :Integer;
  Item        :TItem;
begin
   if (CodigoPedido <= 0) then exit;
   
   self.cdsItensDoPedidoSelecionado.EmptyDataSet;
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);
     Pedido      := TPedido(Repositorio.Get(CodigoPedido));

     for nX := 0 to (Pedido.Itens.Count-1) do begin
        Item := (Pedido.Itens.Items[nX] as TItem);

        self.cdsItensDoPedidoSelecionado.Append;
        self.cdsItensDoPedidoSelecionadoNR_PED.AsString               := Pedido.numpedido;
        self.cdsItensDoPedidoSelecionadoDESCRICAO_PRODUTO.AsString    := Item.Produto.Descricao;
//        self.cdsItensDoPedidoSelecionadounidade_medida.AsString       := Item.Produto.UnidadeMedida;
        self.cdsItensDoPedidoSelecionadoCOR_VARIANTE.AsString         := Item.Cor.Referencia;
        self.cdsItensDoPedidoSelecionadoREFERENCIA_PRODUTO.AsString   := Item.Produto.Referencia;
        self.cdsItensDoPedidoSelecionadoCOR_DESCRICAO.AsString        := Item.Cor.Descricao;
        self.cdsItensDoPedidoSelecionado.Post;
     end;
   finally
     FreeAndNil(Repositorio);
     FreeAndNil(Pedido);
   end;
end;

procedure TfrmFaturamentoPedidos.AlterarEstadoTela(NovoEstado: TEstadoTela);
begin
   if (self.FEstadoTela = NovoEstado) then exit;
   
   case NovoEstado of
     etEmCriacao:   begin
                       self.lblCancelarDigitacaoAtual.Visible     := false;
                       self.btnFaturar.Enabled                    := false;
                       self.pnlGeral.Enabled                      := true;
//                       self.lblAlterarConfiguracoesNF.Visible     := true;
                       self.OnKeyDown                             := self.AtalhosEmCriacao;
                       self.Caption                               := 'Faturamento de Pedidos';
                       self.btnImprimirDANFE.Visible              := false;
                       self.btnImprimirEtiquetas.Visible          := false;
                       self.LimparNotaFiscal;
                       self.LimparTela;
                       self.BuscaDestinatario.edtCodigo.SetFocus;
                       self.pgcNotaFiscal.ActivePageIndex         := 0;
                       self.pgcCabecalho.ActivePageIndex          := 0;
                       self.OnClose                               := self.FormClose;
                       self.btnLimparLocalEntrega.Visible         := false;
                       self.btnMonitor.Visible                    := true;
                    end;

     etEmDigitacao: begin
                       self.lblCancelarDigitacaoAtual.Visible     := true;
                       self.btnFaturar.Enabled                    := true;
                       self.btnFaturar.OnClick                    := self.FaturarNotaFiscal;
                       self.btnFaturar.Caption                    := 'Fatu&rar';
                       self.pnlGeral.Enabled                      := false;
//                       self.lblAlterarConfiguracoesNF.Visible     := false;
                       self.btnImprimirDANFE.Visible              := false;
                       self.btnImprimirEtiquetas.Visible          := false;
                       self.OnKeyDown                             := self.AtalhosEmDigitacao;
                       self.OnClose                               := self.FormClose;
                       self.btnLimparLocalEntrega.Visible         := false;
                       self.btnMonitor.Visible                    := true;
                     end;

     etEmAlteracao: begin
                       self.Caption                               := 'Alteração de Nota Fiscal';
                       self.lblCancelarDigitacaoAtual.Visible     := false;
                       self.btnFaturar.Enabled                    := true;
                       self.btnFaturar.OnClick                    := self.AlterarNotaFiscal;
                       self.btnFaturar.Caption                    := '&Alterar';
                       self.pnlGeral.Enabled                      := true;
//                       self.lblAlterarConfiguracoesNF.Visible     := false;
                       self.btnImprimirDANFE.Visible              := true;
                       self.btnImprimirEtiquetas.Visible          := true;
                       self.OnKeyDown                             := self.AtalhosEmAlteracao;
                       self.OnClose                               := nil;
                       self.pgcNotaFiscal.ActivePageIndex         := 0;
                       self.pgcCabecalho.ActivePageIndex          := 0;
                       self.btnLimparLocalEntrega.Visible         := true;
                       self.btnMonitor.Visible                    := false;
                    end;
   else
     raise TExcecaoParametroInvalido.Create('TfrmFaturamentoPedidos', 'AlterarEstadoTela(NovoEstado: TEstadoTela)', 'NovoEstado');
   end;

   self.FEstadoTela := NovoEstado;
end;

procedure TfrmFaturamentoPedidos.LimparNotaFiscal;
begin
   if Assigned(self.FNotaFiscal) then
    FreeAndNil(self.FNotaFiscal);
end;

procedure TfrmFaturamentoPedidos.AtalhosEmCriacao(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited FormKeyDown(Sender, Key, Shift);
end;

procedure TfrmFaturamentoPedidos.AtalhosEmDigitacao(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_F1) then
    self.AlterarEstadoTela(etEmCriacao)
   else
     inherited FormKeyDown(Sender, Key, Shift);
end;

procedure TfrmFaturamentoPedidos.FormShow(Sender: TObject);
begin
  inherited;

  self.AlterarEstadoTela(etEmCriacao);
  self.pgcNotaFiscal.ActivePageIndex := 0;
  self.pgcCabecalho.ActivePageIndex  := 0;
  FAbreMonitor := false;
end;

procedure TfrmFaturamentoPedidos.lblCancelarDigitacaoAtualClick(
  Sender: TObject);
begin
  inherited;

  self.AlterarEstadoTela(etEmCriacao);
end;

procedure TfrmFaturamentoPedidos.gridPedidosDblClick(Sender: TObject);
var
  Grid :TDBGrid;
begin
  inherited;

  Grid := (Sender as TDBGrid);

  if not Assigned(Grid.SelectedField) or self.cdsPedidos.IsEmpty then
    exit;

  if (cdsItensFisicos.RecordCount > 0) and (cdsItensFisicosNR_PED.AsString = '') then begin
    avisar('Itens avulsos ja foram adicionados');
    Exit;
  end;

  if (Grid.SelectedField.FieldName = self.cdsPedidosMARCADO_PARA_FATURAR.FieldName) then begin
     self.cdsPedidos.Edit;

     if (self.cdsPedidosMARCADO_PARA_FATURAR.AsString = 'X') then begin
        if not inherited Confirma(MENSAGEM_DELETAR_PEDIDO) then
          exit;

        self.cdsPedidosMARCADO_PARA_FATURAR.AsString := '';
     end
     else
       self.cdsPedidosMARCADO_PARA_FATURAR.AsString := 'X';

     if cdsPedidos.State in [dsEdit] then
       self.cdsPedidos.Post;
  end;
end;

procedure TfrmFaturamentoPedidos.mnuAdicionarTodosClick(Sender: TObject);
begin
   self.MarcarDesmarcarTodosPedidos(true);
end;

procedure TfrmFaturamentoPedidos.MarcarDesmarcarTodosPedidos(
  const Marcar: Boolean);
var
  Linha       :Integer;
  CDS         :TClientDataSet;
  Verificador :String;
  Valor       :String;
begin
   Linha                        := self.cdsPedidos.Recno;
   self.cdsPedidos.BeforeScroll := nil;
   CDS                          := TClientDataSet.Create(nil);
   CDS.CloneCursor(self.cdsPedidos, false);

   if Marcar then begin
     Verificador := '';
     Valor       := 'X';
   end
   else begin
     Verificador := 'X';
     Valor       := '';
   end;

   try
     CDS.First;

     while not CDS.Eof do begin
        if (CDS.FieldByName('MARCADO_PARA_FATURAR').AsString = Verificador) then begin
           if self.cdsPedidos.Locate(self.cdsPedidosCODIGO_PEDIDO.FieldName, CDS.FieldByName(self.cdsPedidosCODIGO_PEDIDO.FieldName).AsInteger, []) then
            begin
               self.cdsPedidos.Edit;
               self.cdsPedidosMARCADO_PARA_FATURAR.AsString := Valor;
               self.cdsPedidos.Post;
            end;
        end;

        CDS.Next;
     end;
   finally
     FreeAndNil(CDS);
     self.cdsPedidos.Recno     := Linha;
     self.cdsPedidos.BeforeScroll := self.cdsPedidosBeforeScroll;
   end;
end;

procedure TfrmFaturamentoPedidos.mnuRemoverTodosClick(Sender: TObject);
begin
   if not inherited Confirma(MENSAGEM_DELETAR_PEDIDO) then
    exit;

   self.MarcarDesmarcarTodosPedidos(false);
end;

procedure TfrmFaturamentoPedidos.cdsPedidosMARCADO_PARA_FATURARChange(
  Sender: TField);
begin
   if (Sender.AsString = 'X') then self.AdicionarPedidoNaNotaFiscal(self.cdsPedidosCODIGO_PEDIDO.AsInteger)
   else                            self.RemoverPedidoDaNotaFiscal  (self.cdsPedidosCODIGO_PEDIDO.AsInteger);
end;

procedure TfrmFaturamentoPedidos.AdicionarPedidoNaNotaFiscal(const CodigoPedido: Integer);
var
  Repositorio :TRepositorio;
  Pedido      :TPedido;
  nx :integer;
begin                                      
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);

     try
       Pedido      := (Repositorio.Get(CodigoPedido) as TPedido);

       for nX := 0 to (Pedido.Itens.Count-1) do
         if TItem(Pedido.Itens.Items[nX]).codigoProdutoKit > 0 then
         begin
           avisar('Pedido possui kits desmembrados, portanto só poderá ser faturado após a conferência ser completada.');
           cdsPedidos.Cancel;
           exit;
         end;

       self.FNotaFiscal.AdicionarPedido(Pedido);

     except
       on E: EAccessViolation do
        inherited Avisar('Erro em TfrmFaturamentoPedidos.AdicionarPedidoNaNotaFiscal(const CodigoPedido: Integer)'+#13+
                        'Não foi possível adicionar o pedido!');
     end;
   finally
     FreeAndNil(Repositorio);
     FreeAndNil(Pedido);
   end;
end;

procedure TfrmFaturamentoPedidos.RemoverPedidoDaNotaFiscal(
  const CodigoPedido: Integer);
var
  Repositorio :TRepositorio;
  Pedido      :TPedido;
begin
   Repositorio := nil;

   try
     Repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);

     try
       Pedido      := (Repositorio.Get(CodigoPedido) as TPedido);
       self.FNotaFiscal.RemoverPedido(Pedido);

     except
       on E: EAccessViolation do
        inherited Avisar('Não foi encontrado o pedido '+IntToStr(CodigoPedido)+' no banco de dados. Não foi possível remove-lo da nota fiscal. Verifique!');
     end;
   finally
     FreeAndNil(Repositorio);
     FreeAndNil(Pedido);
   end;
end;

procedure TfrmFaturamentoPedidos.AtualizarAposAdicionarPrimeiroPedido(
  NotaFiscal: TObject);
var
  NF :TNotaFiscal;
begin
   NF := (NotaFiscal as TNotaFiscal);

   self.BuscaFormaPagamento.codigoFormaPagamento := NF.FormaPagamento.Codigo;
   self.BuscaTransportadora.Transportadora       := NF.Transportadora;
   self.cbTipoFrete.ItemIndex                    := TTipoFreteUtilitario.DeEnumeradoParaInteiro(NF.TipoFrete);
   self.cbTipoFrete.OnChange(self);
  // self.dtpEmissao.DateTime                   := NF.DataEmissao;
  // self.dtpSaida.DateTime                     := NF.DataSaida;
   self.edtFreteCalculado.Value               := NF.Totais.Frete;
end;

procedure TfrmFaturamentoPedidos.AtualizarAposRemoverUltimoPedido(NotaFiscal :TObject);
begin
   self.BuscaFormaPagamento.Limpa;
   self.BuscaTransportadora.Clear;

   self.cdsItensFisicos.EmptyDataSet;
   self.cdsItensFiscais.EmptyDataSet;

   self.dtpEmissao.DateTime   := Now;
   self.dtpSaida.DateTime     := Now;
end;

procedure TfrmFaturamentoPedidos.AtualizarNotaFiscal(Sender: TObject);
var
  NF          :TNotaFiscal;
  Pedido      :TPedido;
  ItemPedido  :TItem;
  Item        :TItemNotaFiscal;
  nX, nY      :Integer;
  Repositorio :TRepositorio;
  ItemAvulso  :TItemAvulso;
  PercentagemReducao, ICMSIntegral, valor_diferido :Real;
begin
   NF := (Sender as TNotaFiscal);

    self.DesabilitaOnChangeComponentes;

   try
     try

       if Nf.Entrada_saida = '' then
         Nf.Entrada_saida := IfThen( rgTipoNota.ItemIndex = 0,'E','S');

       if not ( Nf.Entrada_saida = 'E' ) then
         self.BuscaFormaPagamento.codigoFormaPagamento := NF.FormaPagamento.Codigo;

       self.BuscaTransportadora.Transportadora         :=  NF.Transportadora;
     except                                               
       on E: EAccessViolation do
        // Caso não tenha transportador e forma de pagamento só capturo o erro.
     end;

     if not (Self.FEstadoTela = TEstadoTela(1)) then begin
       self.dtpSaida.DateTime                      := NF.DataSaida;
       self.dtpEmissao.DateTime                    := NF.DataEmissao;
     end;

     self.edtPesoBruto.Value                    := NF.Volumes.PesoBruto;
     self.edtPesoLiquido.Value                  := NF.Volumes.PesoLiquido;
     self.edtQuantidadeVolumes.Value            := NF.Volumes.QuantidadeVolumes;
     self.edtEspecie.Text                       := NF.Volumes.Especie;

     self.cbTipoFrete.ItemIndex                 := TTipoFreteUtilitario.DeEnumeradoParaInteiro(NF.TipoFrete);
     self.edtBaseCalculoICMS.Value              := NF.Totais.BaseCalculoICMS;
     self.edtICMS.Value                         := NF.Totais.ICMS;
     self.edtTotalProdutos.Value                := NF.Totais.TotalProdutos;
     self.edtFrete.Value                        := NF.Totais.Frete;
     self.edtFreteCalculado.Value               := NF.Totais.FreteCalculado;
     self.edtSeguro.Value                       := NF.Totais.Seguro;
     self.edtDesconto.Value                     := NF.Totais.Descontos;
     self.edtPercentualDescontoFatura.Value     := NF.Totais.PercentualDescontoFatura;
     self.edtIPI.Value                          := NF.Totais.IPI;
     self.edtPIS.Value                          := NF.Totais.PIS;
     self.edtCOFINS.Value                       := NF.Totais.COFINS;
     self.edtOutrasDespesas.Value               := NF.Totais.OutrasDespesas;
     self.edtTotalNF.Value                      := NF.Totais.TotalNF;

     { Itens Fiscais }
     self.cdsItensFiscais.EmptyDataSet;
     self.cdsItensFisicos.DisableControls;

     for nX := 0 to (NF.Itens.Count-1) do begin
       Application.ProcessMessages;

       Item := (NF.Itens.Items[nX] as TItemNotaFiscal);

       self.cdsItensFiscais.Append;
       self.cdsItensFiscaisNR_ITEM.AsInteger            := (nX + 1);
       self.cdsItensFiscaisQUANTIDADE.AsFloat           := Item.Quantidade;
       self.cdsItensFiscaisVALOR_UNITARIO.AsFloat       := Item.ValorUnitario;
       self.cdsItensFiscaisVALOR_TOTAL.AsFloat          := Item.ValorTotalItem;
       self.cdsItensFiscaisFRETE.AsFloat                := Item.ValorFrete;
       self.cdsItensFiscaisSEGURO.AsFloat               := Item.ValorSeguro;
       self.cdsItensFiscaisDESCONTO.AsFloat             := Item.ValorDesconto;
       self.cdsItensFiscaisOUTRAS_DESPESAS.AsFloat      := Item.ValorOutrasDespesas;
       self.cdsItensFiscaisREFERENCIA_PRODUTO.AsString  := Item.Produto.Referencia;
       self.cdsItensFiscaisDESCRICAO_PRODUTO.AsString   := Item.Produto.Descricao;
       self.cdsItensFiscais.Post;
     end;

     self.cdsItensFisicos.EnableControls;     

     { Itens Físicos }
     self.cdsItensFisicos.EmptyDataSet;
     self.cdsItensFisicos.DisableControls;

     Repositorio := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);

     try
       try
         { Verificar se Pedidos estão assinados }

         if Assigned(NF.PedidosFaturados) and (NF.PedidosFaturados.Count > 0) then begin
             for nX := 0 to (NF.PedidosFaturados.Count-1) do begin
                 Pedido      := (Repositorio.Get(TPedidoFaturado(NF.PedidosFaturados.Items[nX]).CodigoPedido) as TPedido);

                 try
                     for nY := 0 to (Pedido.Itens.Count-1) do begin
                        Application.ProcessMessages;

                        ItemPedido := (Pedido.Itens.Items[nY] as TItem);

                        self.cdsItensFisicos.Append;
                        self.cdsItensFisicosNR_PED.AsString               := Pedido.numpedido;
                        self.cdsItensFisicosDESCRICAO_PRODUTO.AsString    := ItemPedido.Produto.Descricao;
                        self.cdsItensFisicosCOR_VARIANTE.AsString         := ItemPedido.Cor.Referencia;
                        self.cdsItensFisicosREFERENCIA_PRODUTO.AsString   := ItemPedido.Produto.Referencia;
                        self.cdsItensFisicosDESCRICAO_COR.AsString        := ItemPedido.Cor.Descricao;
                        self.cdsItensFisicos.Post;
                     end;
                 finally
                   FreeAndNil(Pedido);
                 end;
             end;
         end;

         if Assigned(NF.ItensAvulsos) and (NF.ItensAvulsos.Count > 0) then begin
             for nX := 0 to (NF.ItensAvulsos.Count-1) do begin
                 ItemAvulso      := (NF.ItensAvulsos[nX] as TItemAvulso);

                 self.cdsItensFisicos.Append;
                 self.cdsItensFisicosNR_PED.AsFloat                := 0;
                 self.cdsItensFisicosDESCRICAO_PRODUTO.AsString    := ItemAvulso.Produto.Descricao;  //ItemPedido.Produto.Descricao;
                 self.cdsItensFisicosCOR_VARIANTE.AsString         := ItemAvulso.Cor.Descricao;      //ItemPedido.Cor.Referencia;
                 self.cdsItensFisicosREFERENCIA_PRODUTO.AsString   := ItemAvulso.Produto.Referencia; //ItemPedido.Produto.Referencia;
                 self.cdsItensFisicosDESCRICAO_COR.AsString        := ItemAvulso.Cor.Descricao;
                 self.cdsItensFisicos.Post;
             end;
         end;
       except
         on E: EAccessViolation do
       end;
     finally
       FreeAndNil(Repositorio);
     end;

     self.cdsItensFisicos.EnableControls;     

     self.memoObservacoes.Lines.Clear;
     self.memoObservacoes.Text := NF.Observacoes.Observacoes;

     if (NF.NotaDeReducao) and (NF.Totais.BaseCalculoICMS > 0) and
     not(pos('DIF. PARCIAL CFE ART 108 RICMS', memoObservacoes.Text) > 0) then begin
       PercentagemReducao := 0;
       ICMSIntegral       := 0;
       valor_diferido     := 0;

       try
          PercentagemReducao := StrToFloat(campo_por_campo('ICMS_ESTADO',
                                                           'PERC_REDUCAO_BC',
                                                           'CODIGO_ESTADO',
                                                           intToStr(NF.Destinatario.Endereco.Cidade.codest) ));

          ICMSIntegral     := ((NF.Totais.BaseCalculoICMS * self.GetAliquotaICMS)/100);  

          valor_diferido   := ((ICMSIntegral * PercentagemReducao) /100);

          memoObservacoes.Text := memoObservacoes.Text + #13#10 + 'DIF. PARCIAL CFE ART 108 RICMS, '+TStringUtilitario.FormataDinheiro(valor_diferido);
          

       Except
         avisar(PERCENTAGEM_REDUCAO_BC_NAO_CADASTRADA + NF.Destinatario.Endereco.Cidade.estado.sigla);
       end;

     end;

     self.memoObservacoesGeradasPeloSistema.Lines.Clear;

     if rgTipoNota.ItemIndex = 1 then
       self.memoObservacoesGeradasPeloSistema.Lines.Text := NF.Observacoes.ObservacoesGeradasPeloSistema;

     try
       self.DesabilitaEventosLocalEntrega;

       try
          self.edtLogradouro.Text     := NF.LocalEntrega.LogradouroSemTrim;
          self.edtNumero.Text         := NF.LocalEntrega.Numero;
          self.edtBairro.Text         := NF.LocalEntrega.BairroSemTrim;
          self.Cidade.CodigoMunicipio := NF.LocalEntrega.CodigoMunicipio;
          self.edtCep.Text            := NF.LocalEntrega.CEPSemFormatacao;
          self.edtComplemento.Text    := NF.LocalEntrega.Complemento;
          self.edtCNPJ.Text           := NF.LocalEntrega.CnpjCpf;
       except
         on E: EAccessViolation do
          // Caso não tenha endereço entrega.
       end;
     finally
       self.HabilitaEventosLocalEntrega;
     end;
   except
     on e: EAccessViolation DO
      // CASO NÃO TENHA NENHUM PEDIDO ADICIONADO NA NOTA FISCAL.
   end;

   self.HabilitaOnChangeComponentes;
end;

procedure TfrmFaturamentoPedidos.cbTipoFreteChange(Sender: TObject);
begin
  inherited;

  self.FNotaFiscal.TipoFrete := TTipoFreteUtilitario.DeInteiroParaEnumerado(self.cbTipoFrete.ItemIndex);
end;

procedure TfrmFaturamentoPedidos.edtFreteChange(Sender: TObject);
begin
  inherited;

  if Pos(',', TCurrencyEdit(Sender).Text) = Length(TCurrencyEdit(Sender).Text) then
    exit;

  self.FNotaFiscal.Totais.Frete := TCurrencyEdit(Sender).Value;
//  self.AtualizarNotaFiscal(self.FNotaFiscal);

  TCurrencyEdit(Sender).SelStart := Length( TCurrencyEdit(Sender).Text );
end;

procedure TfrmFaturamentoPedidos.edtSeguroChange(Sender: TObject);
begin
  inherited;

  if Pos(',', TCurrencyEdit(Sender).Text) = Length(TCurrencyEdit(Sender).Text) then
    exit;

  self.FNotaFiscal.Totais.Seguro := TCurrencyEdit(Sender).Value;
//  self.AtualizarNotaFiscal(self.FNotaFiscal);
end;

procedure TfrmFaturamentoPedidos.edtDescontoChange(Sender: TObject);
begin
  inherited;

  if Pos(',', TCurrencyEdit(Sender).Text) = Length(TCurrencyEdit(Sender).Text) then
    exit;


  self.FNotaFiscal.Totais.Descontos := TCurrencyEdit(Sender).Value;
//  self.AtualizarNotaFiscal(self.FNotaFiscal);
end;

procedure TfrmFaturamentoPedidos.edtOutrasDespesasChange(Sender: TObject);
begin
  inherited;

  if Pos(',', TCurrencyEdit(Sender).Text) = Length(TCurrencyEdit(Sender).Text) then
    exit;

  self.FNotaFiscal.Totais.OutrasDespesas := TCurrencyEdit(Sender).Value;
//  self.AtualizarNotaFiscal(self.FNotaFiscal);
end;

procedure TfrmFaturamentoPedidos.DesabilitaOnChangeComponentes;
begin
   self.cbTipoFrete.OnChange           := nil;
   self.edtFrete.OnChange              := nil;
   self.edtSeguro.OnChange             := nil;
   self.edtDesconto.OnChange           := nil;
   self.edtOutrasDespesas.OnChange     := nil;
   self.edtLogradouro.OnChange         := nil;
   self.edtNumero.OnChange             := nil;
   self.edtBairro.OnChange             := nil;
   self.edtCep.OnChange                := nil;
   self.edtComplemento.OnChange        := nil;
   self.edtCNPJ.OnChange               := nil;
   self.dtpEmissao.OnChange            := nil;
   self.dtpSaida.OnChange              := nil;
   self.edtPesoBruto.OnChange          := nil;
   self.edtPesoLiquido.OnChange        := nil;
   self.edtQuantidadeVolumes.OnChange  := nil;
   self.edtEspecie.OnChange            := nil;
   self.edtPercentualDescontoFatura.OnChange := nil;          
end;

procedure TfrmFaturamentoPedidos.HabilitaOnChangeComponentes;
begin
   self.cbTipoFrete.OnChange           := self.cbTipoFreteChange;
   self.edtFrete.OnChange              := self.edtFreteChange;
   self.edtSeguro.OnChange             := self.edtSeguroChange;
   self.edtDesconto.OnChange           := self.edtDescontoChange;
   self.edtOutrasDespesas.OnChange     := self.edtOutrasDespesasChange;
   self.edtLogradouro.OnChange         := self.edtLogradouroChange;
   self.edtNumero.OnChange             := self.edtNumeroChange;
   self.edtBairro.OnChange             := self.edtBairroChange;
   self.edtCep.OnChange                := self.edtCepChange;
   self.edtComplemento.OnChange        := self.edtComplementoChange;
   self.edtCNPJ.OnChange               := self.edtCNPJChange;
   self.dtpEmissao.OnChange                  := self.dtpEmissaoChange;
   self.dtpSaida.OnChange                    := self.dtpSaidaChange;
   self.edtPesoBruto.OnChange                := self.edtPesoBrutoChange;
   self.edtPesoLiquido.OnChange              := self.edtPesoLiquidoChange;
   self.edtQuantidadeVolumes.OnChange        := self.edtQuantidadeVolumesChange;
   self.edtEspecie.OnChange                  := self.edtEspecieChange;
   self.edtPercentualDescontoFatura.OnChange := self.edtPercentualDescontoFaturaChange;
end;

function TfrmFaturamentoPedidos.GetAliquotaCOFINS: Real;
begin
   try
     result := self.FNotaFiscal.Empresa.ConfiguracoesNF.aliq_cofins;
   except
     on E: EAccessViolation do
       raise Exception.Create(NENHUMA_CONFIGURACAO_CADASTRADA);
   end;
end;

function TfrmFaturamentoPedidos.GetAliquotaCreditoSN: Real;
begin
   try
     result := self.FNotaFiscal.Empresa.ConfiguracoesNF.aliq_cred_sn;
   except
     on E: EAccessViolation do
       raise Exception.Create(NENHUMA_CONFIGURACAO_CADASTRADA);
   end;
end;

function TfrmFaturamentoPedidos.GetAliquotaICMS: Real;
var IcmsEstado :TIcmsEstado;
begin
   try
   try
     IcmsEstado := TIcmsEstado.CreatePorEstado(self.FNotaFiscal.Destinatario.Endereco.Cidade.estado.codigo);
     result     := IcmsEstado.aliquota;
    // result := self.FNotaFiscal.Empresa.ConfiguracoesNF.aliq_icms;

     if (self.FNotaFiscal.Destinatario.Endereco.Cidade.estado.sigla = 'PR') and
        (self.FNotaFiscal.Empresa.RegimeTributario = trtLucroPresumido ) then
       result := 18;

   except
     on E: EAccessViolation do
       raise Exception.Create(NENHUMA_CONFIGURACAO_CADASTRADA);
   end;
   finally
     FreeAndNil(IcmsEstado);
   end;
end;

function TfrmFaturamentoPedidos.GetAliquotaPIS: Real;
begin
   try
     result := self.FNotaFiscal.Empresa.ConfiguracoesNF.aliq_pis;
   except
     on E: EAccessViolation do
       raise Exception.Create(NENHUMA_CONFIGURACAO_CADASTRADA);
   end;
end;

function TfrmFaturamentoPedidos.GetPercentualReducaoICMS: Real;
var icms_por_estado :TIcmsEstado;
begin
  try
     result := 0;

     if self.FNotaFiscal.NotaDeReducao then
     begin
        icms_por_estado := TIcmsEstado.CreatePorEstado(self.FNotaFiscal.Destinatario.Endereco.Cidade.codest);

        result := icms_por_estado.perc_reducao_bc;
     end;
  except
    on E: EAccessViolation do
      raise Exception.Create(PERCENTAGEM_REDUCAO_BC_NAO_CADASTRADA+self.FNotaFiscal.Destinatario.Endereco.Cidade.estado.sigla);
  end;
end;

procedure TfrmFaturamentoPedidos.edtLogradouroChange(Sender: TObject);
begin
   self.FNotaFiscal.LocalEntrega.Logradouro := TEdit(Sender).Text;
end;

procedure TfrmFaturamentoPedidos.edtNumeroChange(Sender: TObject);
begin
   self.FNotaFiscal.LocalEntrega.Numero := TEdit(Sender).Text;
end;

procedure TfrmFaturamentoPedidos.edtBairroChange(Sender: TObject);
begin
   self.FNotaFiscal.LocalEntrega.Bairro := TEdit(Sender).Text;
end;

procedure TfrmFaturamentoPedidos.edtCepChange(Sender: TObject);
begin
   self.FNotaFiscal.LocalEntrega.CEP := TEdit(Sender).Text;
end;

procedure TfrmFaturamentoPedidos.edtComplementoChange(Sender: TObject);
begin
   self.FNotaFiscal.LocalEntrega.Complemento := TEdit(Sender).Text;
end;

procedure TfrmFaturamentoPedidos.edtCNPJChange(Sender: TObject);
begin
   self.FNotaFiscal.LocalEntrega.CnpjCpf := TEdit(Sender).Text;
end;

procedure TfrmFaturamentoPedidos.CidadeExit(Sender: TObject);
begin
   self.FNotaFiscal.LocalEntrega.CodigoMunicipio := self.Cidade.CodigoMunicipio;
   self.FNotaFiscal.LocalEntrega.NomeMunicipio   := self.Cidade.edtCidade.Text;
   self.FNotaFiscal.LocalEntrega.UF              := self.Cidade.edtUF.Text;
end;

procedure TfrmFaturamentoPedidos.memoObservacoesChange(Sender: TObject);
begin
   self.FNotaFiscal.Observacoes.Observacoes := TMemo(Sender).Lines.Text;
end;

function TfrmFaturamentoPedidos.TemLocalEntrega: Boolean;
begin
   result := (Trim(self.edtLogradouro.Text)                      <> '') or
             (Trim(self.edtNumero.Text)                          <> '') or
             (Trim(self.edtBairro.Text)                          <> '') or
             (Trim(self.Cidade.codCid)                           <> '') or
             (TStringUtilitario.ApenasNumeros(self.edtCep.Text)  <> '') or
             (Trim(self.edtComplemento.Text)                     <> '') or
             (TStringUtilitario.ApenasNumeros(self.edtCNPJ.Text) <> '');
end;

procedure TfrmFaturamentoPedidos.AposAcharDestinatario(
  Destinatario: TObject);
var
  Pessoa                  :TPessoa;
  Endereco                :TEndereco;
  Repositorio             :TRepositorio;
  FrameBuscaCidade        :TBuscaCidade;
  EnderecoComPessoaIgualA :TEspecificacao;
begin
   try
     Pessoa := (Destinatario as TPessoa);
   except
     on E: EInvalidCast do
      inherited Avisar('TfrmFaturamentoPedidos.AposAcharDestinatario. Contate o suporte!');
   end;

   Repositorio              := nil;
   Endereco                 := nil;
   frameBuscaCidade                            := nil;
   EnderecoComPessoaIgualA                     := nil;
   self.BuscaNaturezaOperacao.AbreTelaPesquisa := false;

   try
     EnderecoComPessoaIgualA := TEspecificacaoEnderecoComPessoaIgualA.Create(Pessoa);
     Repositorio             := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
     Endereco                := (Repositorio.GetPorEspecificacao(EnderecoComPessoaIgualA) as TEndereco);

     FrameBuscaCidade        := TBuscaCidade.Create(nil);
     FrameBuscaCidade.codCid := IntToStr(Endereco.CodCidade);

     if (Trim(FrameBuscaCidade.edtUF.Text) = 'PR') then begin
       self.BuscaNaturezaOperacao.edtCFOP.Text := '5101';
       self.BuscaNaturezaOperacao.Especificacao := TEspecificacaoNaturezaPorTipo.Create(tnoSaidaDentroEstado);
     end
     else begin
       self.BuscaNaturezaOperacao.edtCFOP.Text := '6101';
       self.BuscaNaturezaOperacao.Especificacao := TEspecificacaoNaturezaPorTipo.Create(tnoSaidaForaEstado);
     end;

     self.BuscaNaturezaOperacao.btnBusca.OnClick(self.BuscaNaturezaOperacao.btnBusca);
   finally
     FreeAndNil(EnderecoComPessoaIgualA);
     FreeAndNil(Repositorio);
     FreeAndNil(FrameBuscaCidade);
     FreeAndNil(Endereco);

     self.BuscaNaturezaOperacao.AbreTelaPesquisa := true;
   end;
end;

procedure TfrmFaturamentoPedidos.AtalhosEmAlteracao(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited FormKeyDown(Sender, Key, Shift);
end;

function TfrmFaturamentoPedidos.ValidarNotaFiscal: Boolean;
begin
   result := true;

   try
     if (not Assigned(self.FNotaFiscal.Itens) or (self.FNotaFiscal.Itens.Count <= 0)) then
       raise TExcecaoNotaFiscalInvalida.Create('Não é possível gravar essa nota fiscal! Nenhum item foi adicionado!');

     { Verifico se o usuário inseriu dados no local de entrega.
       Caso ele tenha inserido, então é feito a validação do local de entrega }
     if self.TemLocalEntrega then
      self.FNotaFiscal.LocalEntrega.ValidarCamposObrigatorios();

     self.FNotaFiscal.ValidarDadosObrigatorios;
     VerificaConferencia;

   except
    on E: Exception do begin
       inherited Avisar(E.Message);
       self.pgcNotaFiscal.ActivePageIndex := 0;

       if (E is TExcecaoCampoNaoInformado) then begin
          if (Pos('Pagamento', TExcecaoCampoNaoInformado(E).Campo) > 0) then
            self.BuscaFormaPagamento.edtCodigo.SetFocus;

          if (Pos('Transportadora', TExcecaoCampoNaoInformado(E).Campo) > 0) then
            self.BuscaTransportadora.edtCodigo.SetFocus;
       end;

       if (E is TExcecaoParametroInvalido) then
         self.pgcCabecalho.ActivePageIndex  := 1;

       if      (E.Message = 'LOGRADOURO') then
        self.edtLogradouro.SetFocus
       else if (E.Message = 'NÚMERO') then
        self.edtNumero.SetFocus
       else if (E.Message = 'BAIRRO') then
        self.edtBairro.SetFocus
       else if (E.Message = 'CIDADE') then
        self.Cidade.edtCodCid.SetFocus
       else if (E.Message = 'CEP') then
        self.edtCep.SetFocus
       else if (E.Message = 'COMPLEMENTO') then
        self.edtComplemento.SetFocus
       else if (E.Message = 'CPF / CNPJ') then
        self.edtCNPJ.SetFocus;

       result := false;
    end;
   end;
end;

procedure TfrmFaturamentoPedidos.FaturarNotaFiscal(Sender: TObject);
var
  RepEmpresa    :TRepositorio;
  RepNotaFiscal :TRepositorio;
begin
   RepEmpresa    := nil;
   RepNotaFiscal := nil;
   
   if not inherited Confirma('Deseja faturar essa nota fiscal?') then
    exit;

   self.FNotaFiscal.Entrada_saida := IfThen(rgTipoNota.ItemIndex = 0, 'E', 'S');
   self.FNotaFiscal.Finalidade := copy(cmbFinalidade.Items[cmbFinalidade.itemIndex], 1, 1);

   if not self.ValidarNotaFiscal() then
    exit;

   dtpEmissaoChange(dtpEmissao);
   Aguarda('Faturando Pedido'+#13#10+#13#10+'( Esta operação pode levar alguns instantes )');
   self.lblCancelarDigitacaoAtual.Visible   := false;
   self.btnFaturar.Enabled                  := false;

   try
     RepEmpresa    := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);
     RepNotaFiscal := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
     RepNotaFiscal.AdicionarEventoDeAtualizarTela(self.AtualizarTela);

     {Para pegar o nr da nota atualizado, caso estiver sendo usado mais de uma tela simultaneamente}
     self.FNotaFiscal.Empresa.ConfiguracoesNF.Free;
     self.FNotaFiscal.Empresa.ConfiguracoesNF := nil;
     self.FNotaFiscal.NumeroNotaFiscal := self.FNotaFiscal.Empresa.ConfiguracoesNF.IncrementarSequencia;

     RepEmpresa.Salvar(self.FNotaFiscal.Empresa);
     RepNotaFiscal.Salvar(self.FNotaFiscal);

     inherited Avisar('Nota fiscal salva com sucesso! Anote o número da nota fiscal: '+IntToStr(self.FNotaFiscal.NumeroNotaFiscal));

     self.AlterarEstadoTela(etEmCriacao);
   finally
     FreeAndNil(RepEmpresa);
     FreeAndNil(RepNotaFiscal);
     FimAguarda('');
     self.lblCancelarDigitacaoAtual.Visible := true;
     self.btnFaturar.Enabled                := true;
   end;
end;

procedure TfrmFaturamentoPedidos.AlterarNotaFiscal(Sender: TObject);
var
  RepNotaFiscal      :TRepositorio;
begin
   RepNotaFiscal      := nil;

   if not inherited Confirma('Deseja alterar essa nota fiscal?') then
    exit;

   if not self.ValidarNotaFiscal() then
    exit;

   try
     RepNotaFiscal      := TFabricaRepositorio.GetRepositorio(TNotaFiscal.ClassName);
     RepNotaFiscal.Salvar(self.FNotaFiscal);

     inherited Avisar('Nota fiscal alterada com sucesso!');
     self.Close();
   finally
     FreeAndNil(RepNotaFiscal);
   end;
end;

constructor TfrmFaturamentoPedidos.Create(AOwner: TComponent;
  NotaFiscal: TNotaFiscal);
var
  Repositorio    :TRepositorio;
  RepPedido      :TRepositorio;
  Especificacao  :TEspecificacao;
  Empresa        :TEmpresa;
  nX             :Integer;
  Pedido         :TPedido;
begin
   Especificacao                                := nil;
   Repositorio                                  := nil;
   Empresa                                      := nil;

   try
     self.Create(AOwner);

     self.BuscaDestinatario.AposAcharDestinatario := nil;
     self.FNotaFiscal                             := NotaFiscal;
     self.AdicionarMetodosDelegadosNaNotaFiscal;
     self.BuscaDestinatario.Destinatario          := NotaFiscal.Destinatario;
     self.BuscaDestinatario.Enabled               := false;

     Repositorio   := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);
     Especificacao := TEspecificacaoEmpresaPorCodigoPessoa.Create(NotaFiscal.Emitente.Codigo);
     Empresa       := (Repositorio.GetPorEspecificacao(Especificacao) as TEmpresa);

     self.BuscaEmitente.edtCodigo.Text            := IntToStr(Empresa.CodigoEmpresa);
     self.BuscaEmitente.btnBusca.OnClick(self.BuscaEmitente.btnBusca);
     self.BuscaEmitenteExit(self.BuscaEmitente);

     self.BuscaNaturezaOperacao.NaturezaOperacao  := NotaFiscal.Natureza;
     self.BuscaNaturezaOperacao.Especificacao     := TEspecificacaoNaturezaPorTipo.Create(NotaFiscal.Natureza.Tipo);
     self.rgpSerie.ItemIndex                      := 0;//TTipoSerieUtilitario.DeEnumeradoParaInteger(NotaFiscal.Serie);
     self.edtNumeroNotalFiscal.Text               := IntToStr(NotaFiscal.NumeroNotaFiscal);
     self.edtNfeReferenciada.Text                 := NotaFiscal.NFe_referenciada;
     self.cmbFinalidade.ItemIndex                 := StrToInt(NotaFiscal.Finalidade) -1;
     self.AlterarEstadoTela(etEmAlteracao);
     self.OnShow                                  := nil;

     self.FNotaFiscal.RecalcularNotaFiscal;

     self.cdsPedidos.BeforeScroll                 := nil;
     self.cdsPedidosMARCADO_PARA_FATURAR.OnChange := nil;

     RepPedido := nil;

     try
         if Assigned(self.FNotaFiscal.PedidosFaturados) then begin
           RepPedido := TFabricaRepositorio.GetRepositorio(TPedido.ClassName);

           for nX := 0 to (self.FNotaFiscal.PedidosFaturados.Count-1) do begin
             Application.ProcessMessages;

             Pedido := (RepPedido.Get(TPedidoFaturado(self.FNotaFiscal.PedidosFaturados[nX]).CodigoPedido) as TPedido);

             try
               self.cdsPedidos.Append;
               self.cdsPedidosNR_PED.AsString               := Pedido.numpedido;
               self.cdsPedidosMARCADO_PARA_FATURAR.AsString := 'X';
               self.cdsPedidosCODIGO_PEDIDO.AsInteger       := Pedido.Codigo;
               self.cdsPedidos.Post;
             finally
               FreeAndNil(Pedido);
             end;
         end;
       end;
     finally
       FreeAndNil(RepPedido);
       self.cdsPedidos.BeforeScroll                 := self.cdsPedidosBeforeScroll;
       self.cdsPedidosMARCADO_PARA_FATURAR.OnChange := self.cdsPedidosMARCADO_PARA_FATURARChange;
     end;

     if self.FNotaFiscal.Entrada_saida <> '' then begin
       rgtipoNota.OnClick   := nil;
       rgTipoNota.ItemIndex := IfThen( self.FNotaFiscal.Entrada_saida = 'E',0,1);
       rgtipoNota.OnClick   := rgTipoNotaClick;
     end;

     self.AtualizarNotaFiscal(self.FNotaFiscal);

  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Empresa);
    FreeAndNil(Especificacao);
  end;
end;

procedure TfrmFaturamentoPedidos.AdicionarMetodosDelegadosNaNotaFiscal;
begin
   self.FNotaFiscal.SetMetodoDelegadoAposAdicionarPrimeiroPedido  (self.AtualizarAposAdicionarPrimeiroPedido);
   self.FNotaFiscal.SetMetodoDelegadoAposAtualizarNotaFiscal      (self.AtualizarNotaFiscal);
   self.FNotaFiscal.SetMetodoDelegadoAposRemoverUltimoPedido      (self.AtualizarAposRemoverUltimoPedido);
   self.FNotaFiscal.SetMetodoDelegadoBuscadorAliquotaCreditoSN    (self.GetAliquotaCreditoSN);
   self.FNotaFiscal.SetMetodoDelegadoBuscadorPercentualReducaoICMS(self.GetPercentualReducaoICMS);
   self.FNotaFiscal.SetMetodoDelegadoBuscadorAliquotaICMS         (self.GetAliquotaICMS);
   self.FNotaFiscal.SetMetodoDelegadoBuscadorAliquotaPIS          (self.GetAliquotaPIS);
   self.FNotaFiscal.SetMetodoDelegadoBuscadorAliquotaCOFINS       (self.GetAliquotaCOFINS);

end;

procedure TfrmFaturamentoPedidos.BuscaEmitenteExit(Sender: TObject);
begin
   if Assigned(self.FNotaFiscal) and Assigned(self.BuscaEmitente.Empresa) then
    self.FNotaFiscal.Emitente := self.BuscaEmitente.Empresa;
end;

procedure TfrmFaturamentoPedidos.DesabilitaEventosLocalEntrega;
begin
   self.edtLogradouro.OnChange  := nil;
   self.edtNumero.OnChange      := nil;
   self.edtBairro.OnChange      := nil;
   self.Cidade.OnExit           := nil;
   self.edtCep.OnChange         := nil;
   self.edtComplemento.OnChange := nil;
   self.edtCNPJ.OnChange        := nil;
end;

procedure TfrmFaturamentoPedidos.HabilitaEventosLocalEntrega;
begin
   self.edtLogradouro.OnChange  := self.edtLogradouroChange;
   self.edtNumero.OnChange      := self.edtNumeroChange;
   self.edtBairro.OnChange      := self.edtBairroChange;
   self.Cidade.OnExit           := self.CidadeExit;
   self.edtCep.OnChange         := self.edtCepChange;
   self.edtComplemento.OnChange := self.edtComplementoChange;
   self.edtCNPJ.OnChange        := self.edtCNPJChange;
end;

procedure TfrmFaturamentoPedidos.btnLimparLocalEntregaClick(
  Sender: TObject);
begin
   self.edtLogradouro.Clear;
   self.edtNumero.Clear;
   self.edtBairro.Clear;
   self.Cidade.codCid := TStringUtilitario.StringVazia;
   self.CidadeExit(self.Cidade);
   self.edtCep.Clear;
   self.edtComplemento.Clear;
   self.edtCNPJ.Clear;
end;

procedure TfrmFaturamentoPedidos.btnMonitorClick(Sender: TObject);
begin
   FAbreMonitor := true;
   self.Close;
end;

procedure TfrmFaturamentoPedidos.DestacarAoPassarOMouse(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   TLabel(Sender).Font.Style := [fsBold];
end;

procedure TfrmFaturamentoPedidos.VoltarAoNormalAoSairComOMouse(
  Sender: TObject);
begin
   TLabel(Sender).Font.Style := [];
end;

procedure TfrmFaturamentoPedidos.AposAlterarFormaPagamento(
  FormaPagamento: TObject);
var
  Fpagto :TFormaPagamento;
begin
   FPagto := (FormaPagamento as TFormaPagamento);

   self.FNotaFiscal.FormaPagamento := Fpagto;
end;

procedure TfrmFaturamentoPedidos.AposAlterarTransportadora(
  Transportadora: TObject);
var
  Transp :TPessoa;
begin
  Transp := (Transportadora as TPessoa);

   self.FNotaFiscal.Transportadora := Transp;
end;

procedure TfrmFaturamentoPedidos.dtpEmissaoChange(Sender: TObject);
begin
   self.FNotaFiscal.DataEmissao := StrToDateTime(DateToStr(TDateTimePicker(Sender).Date)+' 00:00:00');
end;

procedure TfrmFaturamentoPedidos.dtpSaidaChange(Sender: TObject);
begin
   self.FNotaFiscal.DataSaida := TDateTimePicker(Sender).DateTime;
end;

procedure TfrmFaturamentoPedidos.edtPesoBrutoChange(Sender: TObject);
begin
   self.FNotaFiscal.Volumes.PesoBruto := TCurrencyEdit(Sender).Value;
end;

procedure TfrmFaturamentoPedidos.edtPesoLiquidoChange(Sender: TObject);
begin
   self.FNotaFiscal.Volumes.PesoLiquido := TCurrencyEdit(Sender).Value;
end;

procedure TfrmFaturamentoPedidos.edtQuantidadeVolumesChange(
  Sender: TObject);
begin
   self.FNotaFiscal.Volumes.QuantidadeVolumes := TCurrencyEdit(Sender).AsInteger;
end;

procedure TfrmFaturamentoPedidos.edtEspecieChange(Sender: TObject);
begin
   try
     self.FNotaFiscal.Volumes.Especie := TEdit(Sender).Text;
   except
     on E: TExcecaoParametroInvalido do
      inherited Avisar('Espécie é um campo obrigatório!');
   end;
end;

procedure TfrmFaturamentoPedidos.BuscaNaturezaOperacaoExit(
  Sender: TObject);
begin
   if Assigned(self.FNotaFiscal) and Assigned(self.BuscaNaturezaOperacao.NaturezaOperacao) then
     self.FNotaFiscal.Natureza := self.BuscaNaturezaOperacao.NaturezaOperacao;

end;

procedure TfrmFaturamentoPedidos.AtualizarTela;
begin
   Application.ProcessMessages;
end;

procedure TfrmFaturamentoPedidos.edtPercentualDescontoFaturaChange(Sender: TObject);
begin
   self.FNotaFiscal.Totais.PercentualDescontoFatura := self.edtPercentualDescontoFatura.Value;
end;

procedure TfrmFaturamentoPedidos.btnItensAvulsosClick(Sender: TObject);
begin
   if not cdsItensDoPedidoSelecionado.IsEmpty then begin
     avisar('Esta operação não é possível, pois um pedido ja foi selecionado');
     Exit;
   end;

   try
     self.CriarNotaFiscal();
     
     frmItensAvulsos := nil;

     try
       frmItensAvulsos := TfrmItensAvulsos.Create(self.FNotaFiscal);
       frmItensAvulsos.ShowModal;

       self.AtualizarNotaFiscal(self.FNotaFiscal);

       BuscaTransportadora.edtCodigo.SetFocus;
       
     finally
       frmItensAvulsos.Release;
       frmItensAvulsos := nil;
     end;
   except
      on E: TExcecaoParametroInvalido do begin
          if (pos('Natureza', E.Message) <> 0) then begin
            inherited Avisar('Informe a Natureza de Operação!');
            self.BuscaNaturezaOperacao.edtCFOP.SetFocus;
          end;

          if (pos('Serie', E.Message) <> 0) {or (pos(E.Message, 'TipoSerie') <> 0))} then begin
            inherited Avisar('Informe a série!');
            self.BuscaNaturezaOperacao.edtCFOP.SetFocus;
          end;

          if (pos('Destinatario', E.Message) <> 0) then begin
            inherited Avisar('Informe o destinatário!');
            self.BuscaDestinatario.edtCodigo.SetFocus;
          end;

          if (pos('Emitente', E.Message) <> 0) then begin
            inherited Avisar('Informe o emitente!');
            self.BuscaEmitente.edtCodigo.SetFocus;
          end;
       end;
   end;
end;

procedure TfrmFaturamentoPedidos.AposAcharEmpresa(Empresa: TObject);
var
  Emp :TEmpresa;
begin
   try
     Emp := (Empresa as TEmpresa);
   except
     on E: EInvalidCast do
      inherited Avisar('TfrmFaturamentoPedidos.AposAcharEmpresa. Contate o suporte!');
   end;

   self.BuscaNaturezaOperacao.AbreTelaPesquisa := false;

   try
     { Para empresa VLJ que é lucro presumido. O final é 2 e não 1 }

     if (Emp.RegimeTributario = trtLucroPresumido) then begin
       if      (self.BuscaNaturezaOperacao.edtCFOP.Text = '5101') then
         self.BuscaNaturezaOperacao.edtCFOP.Text := '5102'
       else if (self.BuscaNaturezaOperacao.edtCFOP.Text = '6101') then
         self.BuscaNaturezaOperacao.edtCFOP.Text := '6102';
     end
     else begin
       if      (self.BuscaNaturezaOperacao.edtCFOP.Text = '5102') then
         self.BuscaNaturezaOperacao.edtCFOP.Text := '5101'
       else if (self.BuscaNaturezaOperacao.edtCFOP.Text = '6102') then
         self.BuscaNaturezaOperacao.edtCFOP.Text := '6101';
     end;

     self.BuscaNaturezaOperacao.btnBusca.OnClick(self.BuscaNaturezaOperacao.btnBusca);
   finally
     self.BuscaNaturezaOperacao.AbreTelaPesquisa := true;
   end;
end;

procedure TfrmFaturamentoPedidos.rgTipoNotaClick(Sender: TObject);
begin

  if rgTipoNota.ItemIndex = 0 then begin
    self.BuscaNaturezaOperacao.Especificacao := nil;
    BuscaFormaPagamento.Visible       := false;
    BuscaNaturezaOperacao.Clear;
  end
  else begin

    if self.BuscaDestinatario.enabled then
      self.BuscaDestinatario.btnBusca.SetFocus;
      
    BuscaFormaPagamento.Visible       := true;
  end;

  BuscaNaturezaOperacao.edtCFOP.SetFocus;

end;

procedure TfrmFaturamentoPedidos.pnlGeralExit(Sender: TObject);
begin
  if rgTipoNota.ItemIndex = 0 then
    btnItensAvulsos.SetFocus;
end;

procedure TfrmFaturamentoPedidos.btnImprimirEtiquetasClick(Sender: TObject);
var
  GeradorNFe :TGeradorNFe;
begin
   GeradorNFe := nil;

   try
     GeradorNFe := TGeradorNFe.Create(FDM.Logo, self.FNotaFiscal.Empresa.ConfiguracoesNF);
     GeradorNFe.ImprimirComVisualizacao(self.FNotaFiscal);
   finally
     FreeAndNil(GeradorNFe);
   end;
end;

procedure TfrmFaturamentoPedidos.btnImprimirDanfeClick(Sender: TObject);
begin
  inherited;
  frmImpressaoEtiquetaCaixa := TfrmImpressaoEtiquetaCaixa.Create(self);
  frmImpressaoEtiquetaCaixa.nr_nota  := strToFloat(edtNumeroNotalFiscal.Text);
  frmImpressaoEtiquetaCaixa.vlr_nota := 'R$ ' + formatFloat('0.00', edtTotalNF.Value);
  frmImpressaoEtiquetaCaixa.ShowModal;
  frmImpressaoEtiquetaCaixa.Release;
end;

procedure TfrmFaturamentoPedidos.cmbFinalidadeClick(Sender: TObject);
begin
  grpNfeReferenciada.Visible := (cmbFinalidade.ItemIndex = 3);

  if (cmbFinalidade.ItemIndex = 3) then
    edtNfeReferenciada.Clear;

  if self.FEstadoTela = etemAlteracao then
    self.FNotaFiscal.Finalidade := IntToStr(cmbFinalidade.itemIndex + 1);
end;

procedure TfrmFaturamentoPedidos.edtNfeReferenciadaExit(Sender: TObject);
begin
  self.FNotaFiscal.NFe_referenciada := edtNfeReferenciada.Text;
end;

end.