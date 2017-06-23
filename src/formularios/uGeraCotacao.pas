unit uGeraCotacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.Mask, Vcl.FileCtrl,
  RxToolEdit, RxCurrEdit, frameBuscaPessoa, frameBuscaEmpresa, Vcl.Buttons,
  Vcl.ExtCtrls, TipoPessoa, frameBuscaCliente;

type
  TfrmGeraCotacao = class(TfrmPadrao)
    BuscaEmpresa1: TBuscaEmpresa;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtCidade: TEdit;
    edtEstado: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    edtPeso: TCurrencyEdit;
    edtVolume: TCurrencyEdit;
    edtValor: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    edtCaminho: TEdit;
    btnSeleciona: TBitBtn;
    pnlBotoes: TPanel;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    BuscaCliente: TBuscaCliente;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure BuscaClienteExit(Sender: TObject);
  private
    FNumPedido: String;
    { Private declarations }
  public
    property numPedido :String read FNumPedido write FNumPedido;
  end;

var
  frmGeraCotacao: TfrmGeraCotacao;

implementation

{$R *.dfm}

procedure TfrmGeraCotacao.btnImprimirClick(Sender: TObject);
var arq: TextFile;
begin
  AssignFile(arq, edtCaminho.Text+'\Cotacao_Ped_'+FNumPedido+'.txt');
  Rewrite(arq);

  Writeln(arq, 'CIDADE: '+edtCidade.Text);
  Writeln(arq, 'ESTADO: '+edtEstado.Text);
  Writeln(arq, 'PESO: '+FloatToStr(edtPeso.Value)+' KG   VOL: '+IntTostr(edtVolume.AsInteger));
  Writeln(arq, 'VALOR: '+FloatToStr(edtValor.Value));
  Writeln(arq, 'EMPRESA: '+BuscaEmpresa1.Empresa.CPF_CNPJ);
  Writeln(arq, 'CNPJ: '+BuscaCliente.Cliente.CPF_CNPJ);
  Writeln(arq, BuscaCliente.edtRazao.Text);
  CloseFile(arq);

  avisar('Cota��o gerada com sucesso!');
end;

procedure TfrmGeraCotacao.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmGeraCotacao.btnSelecionaClick(Sender: TObject);
var caminho :String;
begin
  SelectDirectory('Selecione a pasta destino','', caminho);

  if caminho <> '' then
    edtCaminho.Text := caminho;
end;

procedure TfrmGeraCotacao.BuscaClienteExit(Sender: TObject);
begin
  if BuscaCliente.edtRazao.Text <> '' then
  begin
     edtCidade.Text                 := BuscaCliente.Cliente.Endereco.Cidade.nome;
     edtEstado.Text                 := BuscaCliente.Cliente.Endereco.Cidade.estado.sigla;
  end;
end;

procedure TfrmGeraCotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_ESCAPE then
      btnSair.Click;
end;

procedure TfrmGeraCotacao.FormShow(Sender: TObject);
begin
  self.BuscaClienteExit(nil);
end;

end.
