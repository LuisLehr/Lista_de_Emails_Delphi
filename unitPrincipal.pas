unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, ShellAPI;

type
  TfrmPrincipal = class(TForm)
    radioDirecao: TRadioGroup;
    edtPesquisa: TEdit;
    lblPesquisa: TLabel;
    Panel1: TPanel;
    comboUnidades: TComboBox;
    DBGrid1: TDBGrid;
    lblUnidades: TLabel;
    btnGerarLista: TButton;
    btnBuscar: TButton;
    radioUsuarioEmail: TRadioGroup;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnGerarListaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unitDM;

procedure TfrmPrincipal.btnBuscarClick(Sender: TObject);
begin


  // DEIXANDO O GRID E A CONSULTA LIMPAS PARA CONSULTAR CONFORME ESCOLHA DO USUARIO
  DM.sqlConsulta.Close;
  DM.sqlConsulta.SQL.Clear;

  // VERIFICA A ESCOLHA DO USUARIO
  if (radioUsuarioEmail.ItemIndex = 0) then
    begin

      // QUERY DE CONSULTA NO BANCO
      DM.sqlConsulta.SQL.Add('SELECT * FROM USUARIOS WHERE UPPER (CUSUARIO) LIKE UPPER (:pConsulta)');
      DM.sqlConsulta.ParamByName('pConsulta').AsString := '%' + edtPesquisa.Text+'%';

    end;

  // VERIFICA A ESCOLHA DO USUARIO
  if (radioUsuarioEmail.ItemIndex = 1) then
  begin

    // QUERY DE CONSULTA NO BANCO
    DM.sqlConsulta.SQL.Add('SELECT * FROM USUARIOS WHERE LOWER(EMAIL) LIKE LOWER(:pConsulta)');
    DM.sqlConsulta.ParamByName('pConsulta').AsString := '%' + edtPesquisa.Text+'%';

  end;

  // ABRINDO A CONSULTA PARA EXECUTAR A CONSULTA
  DM.sqlConsulta.Open;

end;

procedure TfrmPrincipal.btnGerarListaClick(Sender: TObject);

// CRIANDO AS VARIAVEIS QUE SERAO USADAS AO LONGO DO CODIGO
var
  lista: TStringList;
  filtroDirecao: String;
  nomeArquivo: String;
  pastaListas: String;

begin

  // LIMPANDO E MONTANDO A QUERY
  DM.sqlConsulta.Close;
  DM.sqlConsulta.SQL.Clear;


  // IDENTIFICANDO O CAMINHO QUE A LISTA DE EMAILS SERA SALVA
  pastaListas := ExtractFilePath(Application.ExeName) + '..\..\Listas\';

  // CRIANDO A PASTA ONDE A LISTA SERA SALVA CASO ELA NAO EXISTA
  if not DirectoryExists(pastaListas) then
    CreateDir(pastaListas);


  // CRIANDO O FILTRO DE DIRECAO PARA USAR NAS QUERYS DA MATRIZ E DA MATRIZ
  if radioDirecao.ItemIndex = 0 then
  begin

    filtroDirecao := ' AND CUSUARIO NOT IN (''RICARDO'', ''MAURICIO'', ''LAURI'', ''SERGIO'', ''FREDERICO'')'

  end

  else
  begin

    filtroDirecao := '';

  end;

  // ADAPTANDO O NOME DE ARQUIVO E A QUERY CONFORME A FILIAL SELECIONADA PELO USUARIO
  case comboUnidades.ItemIndex of

    0: begin

        nomeArquivo := 'listaTodos.txt';
        DM.sqlConsulta.SQL.Add('SELECT EMAIL FROM USUARIOS WHERE EMAIL IS NOT NULL' + filtroDirecao + ' ORDER BY EMAIL ASC');

       end;


    1: begin

        nomeArquivo := 'listaMatriz.txt';
        DM.sqlConsulta.SQL.Add('SELECT EMAIL FROM USUARIOS WHERE CESTABEL = 1 '  + filtroDirecao + ' ORDER BY EMAIL ASC');

       end;


    2: begin

        nomeArquivo := 'listaFilial6.txt';
        DM.sqlConsulta.SQL.Add('SELECT EMAIL FROM USUARIOS WHERE CESTABEL = 10 ORDER BY EMAIL ASC');

       end;

    3: begin

        nomeArquivo := 'listaFilial2.txt';
        DM.sqlConsulta.SQL.Add('SELECT EMAIL FROM USUARIOS WHERE CESTABEL = 3 ORDER BY EMAIL ASC');

       end;

    4: begin

        nomeArquivo := 'listaFilial1.txt';
        DM.sqlConsulta.SQL.Add('SELECT EMAIL FROM USUARIOS WHERE CESTABEL = 2 ORDER BY EMAIL ASC');

       end;

    5: begin

        nomeArquivo := 'listaFilial8.txt';
        DM.sqlConsulta.SQL.Add('SELECT EMAIL FROM USUARIOS WHERE CESTABEL = 103 ORDER BY EMAIL ASC');

       end;
  end;

  DM.sqlConsulta.Open;

  // GERAR O ARQUIVO E SALVAR NA PASTA ESPEFICADA
  lista := TStringList.Create;
  try
    while not DM.sqlConsulta.EOF do
    begin

      lista.Add(DM.sqlConsulta.FieldByName('EMAIL').AsString + ',');
      DM.sqlConsulta.Next;

    end;

    lista.SavetoFile(pastaListas + nomeArquivo);
    ShowMessage('Lista gerada: ' + nomeArquivo);
    ShellExecute(0, 'open', PChar(pastaListas + nomeArquivo), nil, nil, SW_SHOWNORMAL);

  finally

    lista.Free;
    DM.sqlConsulta.Close;

  end;

end;

// DEFININDO O INDEX PADRAO DE CADA RADIO E COMBOBO AO INICIAR O EXECUTAVEL
procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  comboUnidades.ItemIndex := 0;
  radioDirecao.ItemIndex := 0;
  radioUsuarioEmail.ItemIndex := 0;

end;

end.



