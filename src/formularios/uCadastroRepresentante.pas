unit uCadastroRepresentante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, uPadrao,
  frameBuscaCidade, Provider, DB, DBClient, Grids, DBGrids, DBGridCBN, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, Mask, Pessoa, Repositorio, StrUtils, ZAbstractRODataset, ZAbstractDataset, ZDataset, Endereco,
  DBCtrls, RxToolEdit, RxCurrEdit;

type
  TfrmCadastroRepresentante = class(TfrmPadrao)
    panBotoes: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    cdsCODIGO: TIntegerField;
    cdsPESSOA: TStringField;
    cdsCPF_CNPJ: TStringField;
    cdsRG_IE: TStringField;
    cdsDTCADASTRO: TDateField;
    cdsFONE1: TStringField;
    cdsFONE2: TStringField;
    cdsFAX: TStringField;
    cdsOBSERVACAO: TStringField;
    cdsBLOQUEADO: TStringField;
    cdsMOTIVO_BLOQ: TStringField;
    cdsTIPO: TStringField;
    cdsCODIGO_1: TIntegerField;
    cdsCODPESSOA: TIntegerField;
    cdsLOGRADOURO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCODCIDADE: TIntegerField;
    cdsCEP: TStringField;
    cdsPAIS: TStringField;
    cdsCOMPLEMENTO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtRazao: TEdit;
    comPessoa: TComboBox;
    edtCpf: TMaskEdit;
    edtRg: TMaskEdit;
    edtDtCad: TMaskEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Cidade: TBuscaCidade;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtPais: TEdit;
    edtCep: TMaskEdit;
    edtComplemento: TEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtFone1: TMaskEdit;
    edtFone2: TMaskEdit;
    edtFax: TMaskEdit;
    edtCodigo: TEdit;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    pagRepresentantes: TPageControl;
    gridRepresentantes: TDBGridCBN;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    Shape2: TShape;
    ZQuery1: TZQuery;
    cdsRAZAO: TStringField;
    cdsNUMERO: TStringField;
    GroupBox8: TGroupBox;
    memObs: TMemo;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBGrid1: TDBGrid;
    edtEmail: TDBEdit;
    dsEmails: TDataSource;
    cdsEmails: TClientDataSet;
    cdsEmailsEMAIL: TStringField;
    cdsEMAIL: TStringField;
    lblAsterisco: TLabel;
    lblCamposObrigatorios: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtComissao: TCurrencyEdit;
    Label25: TLabel;
    cdsPERCENTAGEM_COMISSAO: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure comPessoaExit(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure gridRepresentantesTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmailEnter(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);

  private
    Representante :TPessoa;
    Endereco :TEndereco;
    rep, repEnd :TRepositorio;

    procedure salvar;
    procedure mostraDados;
    procedure limpaCampos;
    function verificaObrigatorios :Boolean;
    procedure habilita(SN:Boolean);
    procedure addEmail;
    procedure carregaEmails(emails :String);
    function concatenaEmails :String;
    
  public
    { Public declarations }
  end;

var
  frmCadastroRepresentante: TfrmCadastroRepresentante;

implementation

uses
  FabricaRepositorio, Math, DadosRepresentante;

{$R *.dfm}

procedure TfrmCadastroRepresentante.FormShow(Sender: TObject);
begin
  inherited;
  pagRepresentantes.ActivePageIndex := 0;
  cdsEmails.CreateDataSet;
  
  cds.Close;
  dsp.DataSet := FDM.GetConsulta('SELECT p.*, en.*, dr.percentagem_comissao FROM pessoas p                 '+
                                 ' left join enderecos en on en.codpessoa = p.codigo'+
                                 ' left join dados_representante dr on dr.codigo_representante = p.codigo '+
                                 ' where p.tipo = ''R''                             ');
  cds.Open;

  gridRepresentantes.SetFocus;
end;

procedure TfrmCadastroRepresentante.btnIncluirClick(Sender: TObject);
begin
  inherited;
  self.Tag := 1;
  limpaCampos;
  pagRepresentantes.ActivePageIndex := 0;
  gridRepresentantes.SetFocus;
  pagRepresentantes.ActivePageIndex := 1;
end;

procedure TfrmCadastroRepresentante.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not (cds.Active) or (cds.IsEmpty) then
    exit;

  self.Tag := 2;
  pagRepresentantes.ActivePageIndex := 0;
  gridRepresentantes.SetFocus;
  pagRepresentantes.ActivePageIndex := 1;
  TabSheet2Enter(nil);
end;

procedure TfrmCadastroRepresentante.mostraDados;
begin
  limpaCampos;
  edtCodigo.Text        := cdsCODIGO.AsString;
  edtRazao.text         := cdsRAZAO.AsString;
  comPessoa.itemIndex   := IfThen((cdsPESSOA.AsString = 'F'),0,1);
  edtCpf.text           := cdsCPF_CNPJ.AsString;
  edtRg.text	          := cdsRG_IE.AsString;
  edtDtCad.text         := dateToStr(cdsDTCADASTRO.AsDateTime);
  edtLogradouro.text    := cdsLOGRADOURO.AsString;
  edtNumero.text	      := intToStr(cdsNumero.AsInteger);
  edtBairro.text        := cdsBAIRRO.AsString;
  Cidade.codCid         := cdsCODCIDADE.AsString;
  edtCep.text 	        := cdsCEP.AsString;
  edtPais.text 	        := cdsPais.AsString;
  edtComplemento.text   := cdsCOMPLEMENTO.AsString;
  edtFone1.text         := cdsFONE1.AsString;
  edtFone2.text         := cdsFone2.AsString;
  edtFax.text 	        := cdsFAX.AsString;
  carregaEmails(cdsEmail.AsString);
  memObs.text 	        := cdsObservacao.AsString;
  edtComissao.Value     := cdsPERCENTAGEM_COMISSAO.AsFloat;
end;

procedure TfrmCadastroRepresentante.TabSheet2Enter(Sender: TObject);
begin
  inherited;

  if not pagRepresentantes.Pages[1].Enabled then
    habilita(true);

  if (self.Tag <> 1) and not (cds.IsEmpty) then
    mostraDados;

  if not (self.Tag in [1,2]) then
    habilita(false)
  else begin
    habilita(true);
    edtRazao.SetFocus;
  end;

  if Rep = nil then begin
    Rep     := TFabricaRepositorio.GetRepositorio(TPessoa.ClassName);
    Representante := TPessoa.Create;
  end;

  if repEnd = nil then begin
    RepEnd   := TFabricaRepositorio.GetRepositorio(TEndereco.ClassName);
    Endereco := TEndereco.Create;
  end;
end;

procedure TfrmCadastroRepresentante.limpaCampos;
begin
  edtcodigo.Text := '0';
  edtRazao.Clear;
  comPessoa.itemIndex := 0;
  edtCpf.Clear;
  edtRg.Clear;
  edtDtCad.text := dateToStr(date);
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  Cidade.edtCodCid.Clear;
  Cidade.edtCidade.Clear;
  Cidade.edtUf.Clear;
  edtCep.Clear;
  edtPais.Text := 'BRASIL';
  edtComplemento.Clear;
  edtFone1.Clear;
  edtFone2.Clear;
  edtFax.Clear;
  edtEmail.Clear;
  memObs.Clear;
  edtComissao.Clear;
  cdsEmails.EmptyDataSet;
end;

procedure TfrmCadastroRepresentante.btnCancelarClick(Sender: TObject);
begin
  inherited;
  pagRepresentantes.ActivePageIndex := 0;
  self.Tag := 0;
  habilita(false);

  gridRepresentantes.SetFocus;
  FreeAndNil(Representante);
  FreeAndNil(Rep);
  FreeAndNil(Endereco);
  FreeAndNil(RepEnd);
end;

procedure TfrmCadastroRepresentante.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if verificaObrigatorios then
    salvar;
end;

function TfrmCadastroRepresentante.verificaObrigatorios: Boolean;
begin
  Result := true;

  if trim(edtRazao.Text) = '' then begin
    avisar('Favor informar o Nome / Raz�o social do Representante');
    edtRazao.SetFocus;
    result := false;
  end
  else if trim(edtCpf.Text) = '' then begin
    avisar('Favor informar o CPF / CNPJ do Representante');
    edtCpf.SetFocus;
    result := false;
  end
  else if trim(edtLogradouro.Text) = '' then begin
    avisar('Endere�o obrigat�rio! Favor informe o Logradouro');
    edtLogradouro.SetFocus;
    result := false;
  end
  else if trim(edtNumero.Text) = '' then begin
    avisar('Endere�o obrigat�rio! Favor informe o n�mero');
    edtNumero.SetFocus;
    result := false;
  end
  else if trim(edtBairro.Text) = '' then begin
    avisar('Endere�o obrigat�rio! Favor informe o bairro');
    edtBairro.SetFocus;
    result := false;
  end
  else if trim(Cidade.edtCidade.Text) = '' then begin
    avisar('Endere�o obrigat�rio! Favor informe a cidade');
    cidade.edtCodCid.SetFocus;
    result := false;
  end
  else if (trim(edtFone1.Text) = '(  )    -') and
          (trim(edtFone2.Text) = '(  )    -') and
          (trim(edtFax.Text)   = '(  )    -') then begin
    avisar('Favor informar ao menos um telefone para contato');
    edtFone1.SetFocus;
    result := false;
  end;
end;

procedure TfrmCadastroRepresentante.salvar;
var repositorio :TRepositorio;
begin
 try
   if self.Tag = 2 then
      Representante.Codigo := cdsCODIGO.asInteger;

   Representante.Razao                := edtRazao.text;
   Representante.Pessoa               := copy(comPessoa.text,1,1);
   Representante.CPF_CNPJ             := edtCpf.text;
   Representante.RG_IE                := edtRg.text;
   Representante.DtCadastro           := strToDate(edtDtCad.text);
   Representante.Fone1                := edtFone1.text;
   Representante.Fone2                := edtFone2.text;
   Representante.Fax                  := edtFax.text;
   Representante.Email                := concatenaEmails;
   Representante.Observacao           := memObs.text;
   Representante.Tipo                 := 'R';

   if edtComissao.Value > 0 then
    begin
       repositorio := TFabricaRepositorio.GetRepositorio(TDadosRepresentante.ClassName);
       if not assigned(Representante.DadosRepresentante) then
         Representante.DadosRepresentante := TDadosRepresentante.Create;

       Representante.DadosRepresentante.percentagem_comissao := edtComissao.Value;
    end;

   Rep.Salvar(Representante);

   if self.Tag = 2 then
      Endereco.Codigo := cdsCODIGO_1.asInteger;

   Endereco.CodPessoa   := Representante.Codigo;
   Endereco.Logradouro  := edtLogradouro.text;
   Endereco.Numero      := edtNumero.text;
   Endereco.Bairro      := edtBairro.text;
   Endereco.CodCidade   := StrToInt(Cidade.edtCodCid.text);
   Endereco.CEP         := edtCep.text;
   Endereco.Pais        := edtPais.text;
   Endereco.Complemento := edtComplemento.text;

   RepEnd.Salvar(Endereco);

   btnCancelar.Click;

   avisar('Opera��o realizada com sucesso!');

   cds.Close;
   cds.Open;
 finally
   FreeAndNil(repositorio);
 end;
end;

procedure TfrmCadastroRepresentante.comPessoaExit(Sender: TObject);
begin
  inherited;
  if comPessoa.ItemIndex = 0 then
    edtCpf.EditMask := '999\.999\.999\-99;0; '
  else
    edtCpf.EditMask := '99\.999\.999/9999\-99;0; ';  
end;

procedure TfrmCadastroRepresentante.TabSheet1Exit(Sender: TObject);
begin
  inherited;
  TabSheet2Enter(nil);

  if self.Tag in [1,2]  then  edtRazao.SetFocus;
end;

procedure TfrmCadastroRepresentante.cdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar altera��o do Representante '+edtCodigo.Text+' - '+ edtRazao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      pagRepresentantes.ActivePageIndex := 1;
    end;

end;

procedure TfrmCadastroRepresentante.gridRepresentantesTitleClick(Column: TColumn);
begin
  inherited;
  if (self.Tag = 2) and (cdsCODIGO.AsString <> edtCodigo.Text) then
    if confirma('Cancelar altera��o do Representante '+edtCodigo.Text+' - '+ edtRazao.Text+'?') then
      btnCancelar.Click
    else begin
      cds.Locate('CODIGO', edtCodigo.Text, []);
      pagRepresentantes.ActivePageIndex := 1;
    end;
end;

procedure TfrmCadastroRepresentante.habilita(SN: Boolean);
begin
  if SN then begin
    btnIncluir.Enabled  := false;
    btnAlterar.Enabled  := false;
    btnSalvar.Enabled   := true;
    btnCancelar.Enabled := true;
    pagRepresentantes.Pages[1].Enabled := true;
  end
  else begin
    btnIncluir.Enabled  := true;
    btnAlterar.Enabled  := true;
    btnSalvar.Enabled   := false;
    btnCancelar.Enabled := false;
    pagRepresentantes.Pages[1].Enabled := false;
  end;
end;

procedure TfrmCadastroRepresentante.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F1 then
    pagRepresentantes.ActivePageIndex := 0
  else if key = VK_F2 then
    pagRepresentantes.ActivePageIndex := 1
  else if (key = VK_F3)and(btnIncluir.Enabled) then
    btnIncluir.Click
  else if (key = VK_F4)and(btnAlterar.Enabled) then
    btnAlterar.Click;
end;

procedure TfrmCadastroRepresentante.addEmail;
begin
  cdsEmails.Post;
end;

procedure TfrmCadastroRepresentante.carregaEmails(emails: String);
begin
  while emails <> '' do begin
    cdsEmails.Append;
    cdsEmailsEMAIL.AsString := copy( emails, 1, ( pos( ';', emails ) -1 ) );
    cdsEmails.Post;

    emails := trim( copy( emails, (pos(';',emails) +1), length(emails) ) );
  end;
end;

function TfrmCadastroRepresentante.concatenaEmails: String;
begin
  Result := '';

  if not (cdsEmails.Active) or (cdsEmails.IsEmpty) then
    exit;

  cdsEmails.First;
  while not cdsEmails.Eof do begin
    Result := Result + cdsEmailsEMAIL.AsString + ';';

    cdsemails.Next;
  end;
end;

procedure TfrmCadastroRepresentante.DBGrid1DblClick(Sender: TObject);
begin
  if not (cdsEmails.Active) or (cdsEmails.IsEmpty) then   exit;
  cdsEmails.Edit;
  edtemail.SetFocus;
end;

procedure TfrmCadastroRepresentante.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not (cdsEmails.Active) or (cdsEmails.IsEmpty) then
    exit;
    
  if key = vk_delete then
    if confirma('Deseja realmente remover e-mail selecionado?') then
      cdsEmails.Delete;

end;

procedure TfrmCadastroRepresentante.edtEmailEnter(Sender: TObject);
begin
  if not (cdsEmails.State in [dsEdit, dsInsert]) then
    cdsEmails.Append;
end;

procedure TfrmCadastroRepresentante.edtEmailExit(Sender: TObject);
begin
  if length(edtEmail.text) > 5 then
    addEmail
  else
    edtEmail.SetFocus;
end;

procedure TfrmCadastroRepresentante.TabSheet2Exit(Sender: TObject);
begin
  if cdsEmails.State in [dsInsert] then
    cdsEmails.Cancel;
end;

end.
