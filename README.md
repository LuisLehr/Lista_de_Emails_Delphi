# Lista de Emails

Sistema desktop desenvolvido em Delphi/VCL para consulta de usuarios e geracao de listas de e-mails a partir de uma base PostgreSQL.

Este projeto nasceu como uma releitura de um sistema usado no ambiente de trabalho. A ideia foi recriar uma ferramenta do dia a dia com melhorias imaginadas durante o uso real, servindo tambem como estudo pratico de Delphi, FireDAC, banco de dados e automacao de uma rotina administrativa.

## Sobre o projeto

O Lista de Emails centraliza duas necessidades principais:

- consultar usuarios cadastrados no banco por nome de usuario ou e-mail;
- gerar arquivos `.txt` com listas de e-mails filtradas por unidade e pela inclusao ou nao da diretoria.

A aplicacao possui uma tela simples, focada no uso rapido. O usuario escolhe a unidade desejada, define se a lista deve incluir a diretoria, gera o arquivo e o sistema abre automaticamente o resultado salvo na pasta `Listas`.

## Funcionalidades

- Busca de usuarios por nome de usuario.
- Busca de usuarios por e-mail.
- Visualizacao dos resultados em uma grade.
- Geracao de lista geral de e-mails.
- Geracao de listas por unidade/filial.
- Opcao para gerar listas com ou sem diretoria.
- Criacao automatica da pasta de saida, caso ela nao exista.
- Abertura automatica do arquivo gerado apos a exportacao.

## Unidades disponiveis

A tela permite gerar listas para:

- Todas
- Matriz
- Filial 6 - Centro
- Filial 2 - Morro Reuter
- Filial 1 - Santa Maria do Herval
- Filial 8 - Amizade

Cada unidade aplica um filtro especifico sobre o campo `CESTABEL` da tabela `USUARIOS`.

## Tecnologias utilizadas

- Delphi
- VCL
- FireDAC
- PostgreSQL
- Driver PostgreSQL `libpq.dll`
- Aplicacao desktop Windows

## Estrutura do projeto

```text
Lista de Emails/
|-- ListaDeEmail.dpr          # Arquivo principal da aplicacao
|-- ListaDeEmail.dproj        # Projeto Delphi
|-- unitPrincipal.pas         # Logica da tela principal
|-- unitPrincipal.dfm         # Interface da tela principal
|-- unitDM.pas                # DataModule com componentes de banco
|-- unitDM.dfm                # Configuracao visual do DataModule
|-- Listas/                   # Pasta onde as listas geradas sao salvas
|   `-- listaTodos.txt
`-- Win32/Debug/              # Saida de compilacao em modo Debug
```

## Como funciona

Ao iniciar, o sistema define opcoes padrao para a tela:

- unidade: `Todas`;
- direcao: `Sem Direcao`;
- busca: `Usuario`.

Na busca, o sistema monta uma consulta SQL parametrizada conforme a opcao escolhida:

- por usuario: pesquisa no campo `CUSUARIO`;
- por e-mail: pesquisa no campo `EMAIL`.

Na geracao da lista, a aplicacao monta uma consulta de acordo com a unidade selecionada. O resultado e percorrido linha por linha, adicionando cada e-mail em um `TStringList`. Ao final, o conteudo e salvo em um arquivo `.txt` dentro da pasta `Listas`.

## Banco de dados

O projeto utiliza uma conexao FireDAC com PostgreSQL. A tabela principal esperada pelo sistema e:

```text
USUARIOS
```

Campos utilizados:

- `CUSUARIO`: nome/codigo do usuario;
- `EMAIL`: endereco de e-mail;
- `CESTABEL`: codigo da unidade/estabelecimento.

A configuracao atual do DataModule aponta para um banco local de estudos:

```text
Database: testeemail
Server: localhost
Driver: PostgreSQL
```

> Observacao: em um ambiente real, dados de conexao e senha devem ser mantidos fora do codigo-fonte ou substituidos por configuracoes externas.

## Arquivos gerados

Conforme a unidade selecionada, o sistema pode gerar arquivos como:

- `listaTodos.txt`
- `listaMatriz.txt`
- `listaFilial6.txt`
- `listaFilial2.txt`
- `listaFilial1.txt`
- `listaFilial8.txt`

Os e-mails sao gravados em ordem alfabetica e separados por virgula, facilitando o uso posterior em ferramentas de envio, grupos ou comunicados internos.

## Motivacao

Este projeto foi desenvolvido para estudo, a partir da experiencia diaria com uma ferramenta semelhante usada em ambiente profissional. A proposta foi repensar o fluxo, aplicar melhorias imaginadas durante o uso e transformar uma necessidade cotidiana em um exercicio pratico de desenvolvimento.

Mais do que apenas recriar uma tela, o objetivo foi entender melhor o funcionamento de uma aplicacao real: conexao com banco, consultas, filtros, exportacao de dados e organizacao de codigo em um projeto desktop.

## Possiveis evolucoes

- Mover as configuracoes de banco para um arquivo externo.
- Criar tratamento de erro para falhas de conexao ou consultas sem resultado.
- Validar quando nenhuma unidade estiver selecionada.
- Remover virgula do ultimo e-mail exportado, se necessario.
- Permitir escolha manual da pasta de destino.
- Adicionar filtros dinamicos para novas unidades.
- Criar uma tela de configuracoes.
- Melhorar a apresentacao visual da interface.
- Adicionar logs de geracao das listas.
- Incluir testes ou scripts auxiliares para montagem do banco de estudos.

## Status

Projeto funcional em ambiente local, criado para estudo e melhoria de uma rotina usada no dia a dia.
