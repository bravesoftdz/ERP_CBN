unit uCadastroEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadrao, DB, DBClient, StdCtrls, Grids, DBGrids,
  DBGridCBN, ComCtrls, Buttons, ExtCtrls, frameBuscaCidade, Mask, RxToolEdit,
  RxCurrEdit, frameFone;

type
  TfrmCadastroEmpresa = class(TfrmCadastroPadrao)
    lblRazao: TLabel;
    lblCPF_CNPJ: TLabel;
    lblRG_IE: TLabel;
    lblDtCadastro: TLabel;
    lblObservacoes: TLabel;
    edtRazao: TEdit;
    edtCpf: TMaskEdit;
    edtRg: TMaskEdit;
    edtDtCad: TMaskEdit;
    gpbEndereco: TGroupBox;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblBairro: TLabel;
    lblCEP: TLabel;
    lblPais: TLabel;
    lblComplemento: TLabel;
    Cidade: TBuscaCidade;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtPais: TEdit;
    edtCep: TMaskEdit;
    edtComplemento: TEdit;
    gpbContato: TGroupBox;
    lblEmail: TLabel;
    edtEmail: TEdit;
    memObs: TMemo;
    edtCodigo: TEdit;
    rgrpRegimeTributario: TRadioGroup;
    cdsCODIGO: TIntegerField;
    cdsRAZAO: TStringField;
    lblAsteriscoRazao: TLabel;
    lblAsteriscoCPF: TLabel;
    lblAsteriscoLogradouro: TLabel;
    lblAsteriscoNumero: TLabel;
    lblAsteriscoBairro: TLabel;
    lblAsteriscoCidade: TLabel;
    lblAsteriscoRegimeTributario: TLabel;
    Label1: TLabel;
    pgcConfiguracoes: TPageControl;
    tabPrincipal: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    lblSequenciaNotaFiscal: TLabel;
    lblSenhaCertificado: TLabel;
    cbAmb: TComboBox;
    BitBtn1: TBitBtn;
    edtSequenciaNotaFiscal: TCurrencyEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    edtCredSN: TCurrencyEdit;
    edtIcms: TCurrencyEdit;
    edtPis: TCurrencyEdit;
    edtCofins: TCurrencyEdit;
    tabConfiguracoesEmail: TTabSheet;
    lblSMTPHost: TLabel;
    lblSMTPPort: TLabel;
    lblSMTPUser: TLabel;
    lblSMTPPassword: TLabel;
    lblAssunto: TLabel;
    edtSMTPPort: TCurrencyEdit;
    chkUsaSSL: TCheckBox;
    gbMensagem: TGroupBox;
    memoMensagem: TMemo;
    edtCertificado: TEdit;
    edtSenhaDoCertificado: TEdit;
    edtAssunto: TEdit;
    edtSMTPPassword: TEdit;
    edtSMTPUser: TEdit;
    edtSMTPHost: TEdit;
    cbTipoEmissao: TComboBox;
    Label7: TLabel;
    Fone1: TFone;
    Fone2: TFone;
    FoneFax: TFone;
    procedure BitBtn1Click(Sender: TObject);

  private
    { Altera um registro existente no CDS de consulta }
    procedure AlterarRegistroNoCDS(Registro :TObject); override;

    { Carrega todos os registros pra aba de Consulta }
    procedure CarregarDados;                           override;

    procedure ExecutarDepoisAlterar;                   override;
    procedure ExecutarDepoisIncluir;                   override;

    { Inclui um registro no CDS }
    procedure IncluirRegistroNoCDS(Registro :TObject); override;

    { Limpa as informa��es da aba Dados }
    procedure LimparDados;                             override;

    { Mostra um registro detalhado na aba de Dados   }
    procedure MostrarDados;                            override;

  private
    { Persiste os dados no banco de dados }
    function GravarDados   :TObject;                   override;

    { Verifica os dados antes de persistir }
    function VerificaDados :Boolean;                   override;
  end;
var
  frmCadastroEmpresa: TfrmCadastroEmpresa;

implementation

uses
   Empresa,
   Contnrs,
   Repositorio,
   FabricaRepositorio,
   Pessoa,
   uPadrao,
   Endereco,
   EspecificacaoEnderecoComPessoaIgualA, ConfiguracoesNF,
  ConfiguracoesNFEmail, ExcecaoParametroInvalido, GeradorNFe;

{$R *.dfm}

{ TfrmCadastroEmpresa }

procedure TfrmCadastroEmpresa.AlterarRegistroNoCDS(Registro: TObject);
var
  Empresa :TEmpresa;
begin
  inherited;

  Empresa := (Registro as TEmpresa);

  self.cds.Edit;
  self.cdsCODIGO.AsInteger := Empresa.CodigoEmpresa;
  self.cdsRAZAO.AsString   := Empresa.Razao;
  self.cds.Post;
end;

procedure TfrmCadastroEmpresa.CarregarDados;
var
  Empresas    :TObjectList;
  Repositorio :TRepositorio;
  nX          :Integer;
begin
  inherited;

  Repositorio := nil;
  Empresas    := nil;

  try
    Repositorio := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);
    Empresas    := Repositorio.GetAll;

    if Assigned(Empresas) and (Empresas.Count > 0) then begin

       for nX := 0 to (Empresas.Count-1) do
         self.IncluirRegistroNoCDS(Empresas.Items[nX]);
         
    end;
  finally
    FreeAndNil(Repositorio);
    FreeAndNil(Empresas);
  end;
end;

procedure TfrmCadastroEmpresa.ExecutarDepoisAlterar;
begin
  inherited;

  self.edtRazao.SetFocus;
end;

procedure TfrmCadastroEmpresa.ExecutarDepoisIncluir;
begin
  inherited;

  self.edtRazao.SetFocus;
  self.edtDtCad.Text := FormatDateTime('dd/mm/yyyy', Date);
end;

function TfrmCadastroEmpresa.GravarDados: TObject;
var
  Empresa     :TEmpresa;
  Endereco    :TEndereco;

  Especificacao :TEspecificacaoEnderecoComPessoaIgualA;

  RepositorioEmpresa  :TRepositorio;
  RepositorioEndereco :TRepositorio;
begin
   Empresa             := nil;
   Endereco            := nil;

   Especificacao       := nil;

   RepositorioEmpresa  := nil;
   RepositorioEndereco := nil;


   try
     RepositorioEmpresa  := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);
     RepositorioEndereco := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
     Empresa             := TEmpresa(RepositorioEmpresa.Get(StrToIntDef(self.edtCodigo.Text, 0)));

     if not Assigned(Empresa) then
      Empresa := TEmpresa.Create;

     Empresa.Razao                    := self.edtRazao.Text;
     Empresa.CPF_CNPJ                 := self.edtCpf.Text;
     Empresa.RG_IE                    := self.edtRg.Text;
     Empresa.RegimeTributarioInteger  := self.rgrpRegimeTributario.ItemIndex;
     Empresa.Fone1                    := Fone1.edtFone.Text;
     Empresa.Fone2                    := Fone2.edtFone.Text;
     Empresa.Fax                      := FoneFax.edtFone.Text;
     Empresa.Email                    := self.edtEmail.Text;
     Empresa.Observacao               := self.memObs.Lines.Text;

     { Configura��es NF }
     try
       Empresa.AdicionarConfiguracoes(self.edtCredSN.Value, self.edtIcms.Value,
                                      self.edtPis.Value, self.edtCofins.Value,
                                      self.edtCertificado.Text, Copy(self.cbAmb.Text, 1, 1),
                                      self.edtSenhaDoCertificado.Text, self.edtSequenciaNotaFiscal.AsInteger,
                                      (self.cbTipoEmissao.ItemIndex +1));
     except
       on E: Exception do begin
          if (Pos('AmbienteNFe', e.Message) > 0) then begin
            self.cbAmb.SetFocus;
            raise Exception.Create('Ambiente � um campo obrigat�rio!');
          end;
       end;
     end;

     { Configura��es E-mail }
      try
        Empresa.AdicionarConfiguracoesEmail(self.edtSMTPHost.Text,
                                            self.edtSMTPPort.Text,
                                            self.edtSMTPUser.Text,
                                            self.edtSMTPPassword.Text,
                                            self.edtAssunto.Text,
                                            self.memoMensagem.Text,
                                            self.chkUsaSSL.Checked);
      except
        on E: TExcecaoParametroInvalido do begin
          self.pgcConfiguracoes.TabIndex := 1;
          raise Exception.Create('N�o foram inclu�dos todos os dados para configura��o de e-mail para envio de NF-e. As configura��es de e-mail n�o ser�o gravadas. '+
                                 'A opera��o vai ser abortada!');
        end;
      end;

     RepositorioEmpresa.Salvar(Empresa);

     Especificacao := TEspecificacaoEnderecoComPessoaIgualA.Create(Empresa);

     Endereco := TEndereco(RepositorioEndereco.GetPorEspecificacao(Especificacao));

     if not Assigned(Endereco) then
      Endereco := TEndereco.Create;

     Endereco.codpessoa   := Empresa.Codigo;
     Endereco.Logradouro  := self.edtLogradouro.Text;
     Endereco.Numero      := self.edtNumero.Text;
     Endereco.Bairro      := self.edtBairro.Text;
     Endereco.CodCidade   := Cidade.edtCodCid.AsInteger;
     Endereco.CEP         := self.edtCep.Text;
     Endereco.Pais        := self.edtPais.Text;
     Endereco.Complemento := self.edtComplemento.Text;

     RepositorioEndereco.Salvar(Endereco); 

     result := Empresa;

   finally
     FreeAndNil(Especificacao);
     FreeAndNil(RepositorioEndereco);
     FreeAndNil(RepositorioEmpresa);
     FreeAndNil(Endereco);
   end;
end;

procedure TfrmCadastroEmpresa.IncluirRegistroNoCDS(Registro: TObject);
var
  Empresa :TEmpresa;
begin
  inherited;

  Empresa := (Registro as TEmpresa);

  self.cds.Append;
  self.cdsCODIGO.AsInteger := Empresa.CodigoEmpresa;
  self.cdsRAZAO.AsString   := Empresa.Razao;
  self.cds.Post;
end;

procedure TfrmCadastroEmpresa.LimparDados;
begin
  inherited;

  self.edtCodigo.Clear;
  self.edtRazao.Clear;
  self.edtCpf.Clear;
  self.edtRg.Clear;
  self.edtDtCad.Clear;
  self.rgrpRegimeTributario.ItemIndex := -1;
  self.edtLogradouro.Clear;
  self.edtNumero.Clear;
  self.edtBairro.Clear;
  self.Cidade.Clear;
  self.edtCep.Clear;
  self.edtPais.Text := 'BRASIL';
  self.edtComplemento.Clear;
  Fone1.limpa;
  Fone2.limpa;
  FoneFax.limpa;
  self.edtEmail.Clear;
  self.memObs.Clear;

  { Configura��es NF }
  self.edtCertificado.Clear;
  self.edtSenhaDoCertificado.Clear;
  self.edtSequenciaNotaFiscal.Clear;
  self.cbAmb.ItemIndex := -1;
  self.cbTipoEmissao.ItemIndex := 0;
  self.edtCredSN.Clear;
  self.edtIcms.Clear;
  self.edtPis.Clear;
  self.edtCofins.Clear;

  { Configura��es de E-mail }
  self.edtSMTPHost.Clear;
  self.edtSMTPPort.Clear;
  self.edtSMTPUser.Clear;
  self.edtSMTPPassword.Clear;
  self.edtAssunto.Clear;
  self.memoMensagem.Lines.Clear;
  self.chkUsaSSL.Checked := false;
end;

procedure TfrmCadastroEmpresa.MostrarDados;
var
  Empresa                              :TEmpresa;
  Endereco                             :TEndereco;
  RepositorioEmpresa                   :TRepositorio;
  RepositorioEndereco                  :TRepositorio;
  EspecificacaoEnderecoComPessoaIgualA :TEspecificacaoEnderecoComPessoaIgualA;
begin
  inherited;

  Empresa                              := nil;
  Endereco                             := nil;
  EspecificacaoEnderecoComPessoaIgualA := nil;
  RepositorioEmpresa                   := nil;
  RepositorioEndereco                  := nil;

  try
    RepositorioEmpresa  := TFabricaRepositorio.GetRepositorio(TEmpresa.ClassName);
    RepositorioEndereco := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);

    Empresa             := TEmpresa(RepositorioEmpresa.Get(self.cdsCODIGO.AsInteger));

    EspecificacaoEnderecoComPessoaIgualA := TEspecificacaoEnderecoComPessoaIgualA.Create(Empresa);

    if not Assigned(Empresa) then exit;

    Endereco            := TEndereco(RepositorioEndereco.GetPorEspecificacao(EspecificacaoEnderecoComPessoaIgualA));

    self.edtCodigo.Text                 := IntToStr(Empresa.CodigoEmpresa);
    self.edtRazao.Text                  := Empresa.Razao;
    self.edtCpf.Text                    := Empresa.CPF_CNPJ;
    self.edtRg.Text                     := Empresa.RG_IE;
    self.edtDtCad.Text                  := FormatDateTime('dd/mm/yyyy', Empresa.DtCadastro);
    self.rgrpRegimeTributario.ItemIndex := Empresa.RegimeTributarioInteger;
    Fone1.Fone                          := Empresa.Fone1;
    Fone2.Fone                          := Empresa.Fone2;
    FoneFax.Fone                        := Empresa.Fax;
    self.edtEmail.Text                  := Empresa.Email;
    self.memObs.Lines.Add(Empresa.Observacao);

    { Endere�o }
    if not Assigned(Endereco) then exit;

    self.edtLogradouro.Text  := Endereco.Logradouro;
    self.edtNumero.Text      := Endereco.Numero;
    self.edtBairro.Text      := Endereco.Bairro;
    self.Cidade.codCid       := IntToStr(Endereco.CodCidade);
    self.edtCep.Text         := Endereco.CEP;
    self.edtPais.Text        := Endereco.Pais;
    self.edtComplemento.Text := Endereco.Complemento;

    self.pgcConfiguracoes.TabIndex := 0;
    
    { Configura��es NF }
    if Assigned(Empresa.ConfiguracoesNF) then begin
      self.edtCertificado.Text := Empresa.ConfiguracoesNF.num_certificado;
      self.edtSenhaDoCertificado.Text := Empresa.ConfiguracoesNF.SenhaCertificado;
      self.edtSequenciaNotaFiscal.AsInteger := Empresa.ConfiguracoesNF.SequenciaNotaFiscal;

      if (Empresa.ConfiguracoesNF.ambiente_nfe = 'P') then
        self.cbAmb.ItemIndex := 0
      else
        self.cbAmb.ItemIndex := 1;

      self.cbTipoEmissao.ItemIndex := Empresa.ConfiguracoesNF.Tipo_emissao - 1;

      self.edtCredSN.Value := Empresa.ConfiguracoesNF.aliq_cred_sn;
      self.edtIcms.Value   := Empresa.ConfiguracoesNF.aliq_icms;
      self.edtPis.Value    := Empresa.ConfiguracoesNF.aliq_pis;
      self.edtCofins.Value := Empresa.ConfiguracoesNF.aliq_cofins;
    end;

    { Configura��es de E-mail }
    if Assigned(Empresa.ConfiguracoesEmail) then begin
       self.edtSMTPHost.Text          := Empresa.ConfiguracoesEmail.SMTPHost;
       self.edtSMTPPort.Text          := Empresa.ConfiguracoesEmail.SMTPPort;
       self.edtSMTPUser.Text          := Empresa.ConfiguracoesEmail.SMTPUser;
       self.edtSMTPPassword.Text      := Empresa.ConfiguracoesEmail.SMTPPassword;
       self.edtAssunto.Text           := Empresa.ConfiguracoesEmail.Assunto;
       self.memoMensagem.Text         := Empresa.ConfiguracoesEmail.Mensagem.Text;
       self.chkUsaSSL.Checked         := Empresa.ConfiguracoesEmail.UsaSSL;
    end;    
  finally
    FreeAndNil(EspecificacaoEnderecoComPessoaIgualA);
    FreeAndNil(RepositorioEndereco);
    FreeAndNil(RepositorioEmpresa);
    FreeAndNil(Endereco);
    FreeAndNil(Empresa);
  end;
end;

function TfrmCadastroEmpresa.VerificaDados: Boolean;
begin
  result := verificar(trim(edtRazao.Text) = '', 'Favor informar o Nome / Raz�o social do cliente', edtRazao) and
            verificar(trim(edtCpf.Text) = '', 'Favor informar o CPF / CNPJ do cliente', edtCpf) and
            verificar(trim(edtRG.Text) = '', 'Favor informar o RG / IE do cliente', edtRG) and
            verificar(trim(edtLogradouro.Text) = '', 'Endere�o obrigat�rio! Favor informe o Logradouro', edtLogradouro) and
            verificar(trim(edtNumero.Text) = '', 'Endere�o obrigat�rio! Favor informe o n�mero', edtNumero) and
            verificar(trim(edtBairro.Text) = '', 'Endere�o obrigat�rio! Favor informe o bairro', edtBairro) and
            verificar(Cidade.edtCodCid.AsInteger = 0, 'Endere�o obrigat�rio! Favor informe a cidade', cidade.edtCodCid) and
            verificar((StringReplace(trim(Fone1.edtFone.Text),' ','',[rfReplaceAll]) = '()-') and
                      (StringReplace(trim(Fone2.edtFone.Text),' ','',[rfReplaceAll]) = '()-') and
                      (StringReplace(trim(FoneFax.edtFone.Text),' ','',[rfReplaceAll]) = '()-'), 'Favor informar ao menos um telefone para contato', Fone1.edtFone) and
            verificar((self.rgrpRegimeTributario.ItemIndex < 0) or (self.rgrpRegimeTributario.ItemIndex > 2), 'Favor informar o regime tribut�rio da empresa', rgrpRegimeTributario);
end;

procedure TfrmCadastroEmpresa.BitBtn1Click(Sender: TObject);
var
  GeradorNFe :TGeradorNFe;
begin
   GeradorNFe := nil;

   try
     GeradorNFe               := TGeradorNFe.Create;
     self.edtCertificado.Text := GeradorNFe.ObterCertificado;
   finally
     FreeAndNil(GeradorNFe);
   end;
end;

end.
