unit RepositorioGrupo;

interface

uses DB, Auditoria, Repositorio;

type
  TRepositorioGrupo = class(TRepositorio)

  protected
    function Get             (Dataset :TDataSet) :TObject; overload; override;
    function GetNomeDaTabela                     :String;            override;
    function GetIdentificador(Objeto :TObject)   :Variant;           override;
    function GetRepositorio                     :TRepositorio;       override;

  protected
    function SQLGet                      :String;            override;
    function SQLSalvar                   :String;            override;
    function SQLGetAll                   :String;            override;
    function SQLRemover                  :String;            override;
    function SQLGetExiste(arrayDeCampos :array of string): String;            override;

  protected
    function IsInsercao(Objeto :TObject) :Boolean;           override;
  protected
    procedure SetParametros   (Objeto :TObject                        ); override;
    procedure SetIdentificador(Objeto :TObject; Identificador :Variant); override;

  protected
    procedure SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
    procedure SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject); override;
    procedure SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject); override;
end;

implementation

uses SysUtils, Grupo;

{ TRepositorioGrupo }

function TRepositorioGrupo.Get(Dataset: TDataSet): TObject;
var
  Grupo :TGrupo;
begin
   Grupo:= TGrupo.Create;
   Grupo.codigo    := self.FQuery.FieldByName('codigo').AsInteger;
   Grupo.descricao := self.FQuery.FieldByName('descricao').AsString;

   result := Grupo;
end;

function TRepositorioGrupo.GetIdentificador(Objeto: TObject): Variant;
begin
  result := TGrupo(Objeto).Codigo;
end;

function TRepositorioGrupo.GetNomeDaTabela: String;
begin
  result := 'GRUPO';
end;

function TRepositorioGrupo.GetRepositorio: TRepositorio;
begin
  result := TRepositorioGrupo.Create;
end;

function TRepositorioGrupo.IsInsercao(Objeto: TObject): Boolean;
begin
  result := (TGrupo(Objeto).Codigo <= 0);
end;

procedure TRepositorioGrupo.SetCamposAlterados(Auditoria :TAuditoria; AntigoObjeto, Objeto :TObject);
var
  GrupoAntigo :TGrupo;
  GrupoNovo :TGrupo;
begin
   GrupoAntigo := (AntigoObjeto as TGrupo);
   GrupoNovo   := (Objeto       as TGrupo);

   if (GrupoAntigo.descricao <> GrupoNovo.descricao) then
     Auditoria.AdicionaCampoAlterado('descricao', GrupoAntigo.descricao, GrupoNovo.descricao);

end;

procedure TRepositorioGrupo.SetCamposExcluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Grupo :TGrupo;
begin
  Grupo := (Objeto as TGrupo);
  Auditoria.AdicionaCampoExcluido('codigo'   , IntToStr(Grupo.codigo));
  Auditoria.AdicionaCampoExcluido('descricao', Grupo.descricao);
end;

procedure TRepositorioGrupo.SetCamposIncluidos(Auditoria :TAuditoria;               Objeto :TObject);
var
  Grupo :TGrupo;
begin
  Grupo := (Objeto as TGrupo);
  Auditoria.AdicionaCampoIncluido('codigo'   ,    IntToStr(Grupo.codigo));
  Auditoria.AdicionaCampoIncluido('descricao',    Grupo.descricao);
end;

procedure TRepositorioGrupo.SetIdentificador(Objeto: TObject; Identificador: Variant);
begin
  TGrupo(Objeto).Codigo := Integer(Identificador);
end;
procedure TRepositorioGrupo.SetParametros(Objeto: TObject);
var
  Grupo :TGrupo;
begin
  Grupo := (Objeto as TGrupo);

  self.FQuery.ParamByName('codigo').AsInteger    := Grupo.codigo;
  self.FQuery.ParamByName('descricao').AsString := Grupo.descricao;
end;

function TRepositorioGrupo.SQLGet: String;
begin
  result := 'select * from GRUPO where codigo = :ncod';
end;

function TRepositorioGrupo.SQLGetAll: String;
begin
  result := 'select * from GRUPO';
end;

function TRepositorioGrupo.SQLGetExiste(arrayDeCampos :array of string): String;
begin
  result := inherited;
  result := StringReplace(result, UpperCase('NOME_TABELA'), GetNomeDaTabela, [rfReplaceAll, rfIgnoreCase]);
end;

function TRepositorioGrupo.SQLRemover: String;
begin
  result := ' delete from GRUPO where codigo = :codigo ';
end;

function TRepositorioGrupo.SQLSalvar: String;
begin
  result := 'update or insert into GRUPO (CODIGO ,DESCRICAO) '+
           '                      values ( :CODIGO , :DESCRICAO) ';
end;

end.

