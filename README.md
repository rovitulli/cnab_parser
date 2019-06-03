# CNAB parser

A aplicação tem o objetivo de realizar o 'parse' de um arquivo '.txt' que contenha um código CNAB válido, tal qual como exemplificado no arquivo `CNAB.txt` (dentro de app/public/CNAB.txt)

Para realizar o upload, basta selecionar o arquivo requerido no campo de upload na página principal. Após a confirmação, a aplicação transformará os dados no arquivo em uma tabela com as transações das lojas referentes.

## 1. Como rodar a aplicação:

Utilize preferencialmente Docker para subir os containers referente ao servidor web e ao banco de dados (Postgres). Usar a ferramenta Docker Compose é o jeito mais simples de montar as images e subir o serviço.

A partir da raíz da aplicação, execute o comando:

```
docker-compose up --build
```
O comando '--build' é necessário apenas da primeira vez, ou quando o Dockerfile for modificado. 

A partir desse momento, Docker irá baixar as imagens necessárias para rodar o ambiente de desenvolvimento. Ao término do processo, um servidor estará escutando a porta 3000 do host (seu computador)

Acesse:

```
localhost:3000
```

A aplicação se conectará no database usando as configuracões básicas da images do Postgress.

## 2. Como rodar sem Docker (não recomendado):

Caso deseje rodar a aplicacão sem Docker, basta executar bundle a partir da pasta /app contida no diretório. Para isso, é necessário a versão de Ruby 2.6.3 instalada do sistema, junstamente com as ferramentas de desenvolvimento necessário para compilar as gems e outras dependências.

Também é necessário um servidor de Postgres para iniciar. Configure em qual banco de dados a aplicação iniciará no arquivo config/database.yml.

`IMPORTANTE`: remova o diretório '.bundle' dentro de app. Ele indica o caminho do Bundle no container e não é necessário nesse caso.

Uma vez conectado, utilize os seguintes comandos para criar as tabelas de banco necessárias:

```
bundle exec rake db:create
```

```
bundle exec rake db:migrate
```

Inicie a aplicação:

```
bundle exec rackup -o 0.0.0.0 -p 3000
```

## 3. Estrutura da aplicacão:

Para realizar o parse do arquivo CNAB a aplicação utiliza o pattern da gem [Interactor] (https://github.com/collectiveidea/interactor), que consisiste em sequenciar cada etapa do processo em sua respectiva classe,  que por sua vez é gerenciada por outra classe chamada Organizer. Cada interactor executa sua funcão ou levanta mensagem de erro em caso de falha.

As etapadas do processo são:

- Validação do arquivo TXT.
- Armazenamento do arquivo em filesystem local.
- Parseamento das informações do arquivo.
- Validação do conteúdo do arquivo.
- Sanitização dos nomes das lojas e respectivos proprietários.
- Salvamento das informações das Lojas no banco de dados.
- Fetch das informações das lojas no contexto da request.
- Normalização do valor da transação.
- Normalização das datas das transações.
- Converte tipo da transação para formato legível.
- Converte comportamento da transação (soma ou subtração).
- Salva informações da transação no banco.

## 4. Framework

Foi utilizado o frawork Sinatra em modo `modular` para facilitar o reuso das classes de cada Interactor.

## 5. Testes

Todos os módulos da aplicação, bem como os interactors estão testados com Rspec. Para executar os teste:

```
docker-compose run --rm cnab_parser bundle exec rspec
```

Ou, sem docker,

```
bundle exec rspec
```

## 6.Rubocop

Para manter a boa leitura do código, a aplicação, mantém, na medida do possível, as práticas recomendadas pela comunidade Ruby. Rode o comando do Rubocop na raiz da apliação para ter uma métrica do que está fora dos padrões:

```
docker-compose run --rm cnab_parser bundle rubocop
```


Ou, sem docker,

```
bundle exec rubocop
```

## 7. Lidando com Migrations

Caso seja necessário criar um modelo ou fazer alguma alteração no banco de dados, será necessário criar um novo arquivo de migração. Siga a documentação do [Sinatra](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?) e combine com o comando docker como no exemplo a seguir:

```
docker run --rm cnab_parser rake db:create_migration NAME=create_stores
```

Ou, sem docker:

```
bundle exec rake db:create_migration NAME=create_articles
```

## 8. TODOs

- adicionar mais cenários de teste
- input de dados CNAB via texto
- autenticação
- 'zerar' ofensas do Rubocop (exige tempo, mas está em constante atualização )
- CI no repositório para execução dos teste
- Unicorn como servidor da aplicação
- uso de filas para gerenciar a importação
- tradução da aplicação e mensagens de erro.

## OBS:
A aplicação considera o valor do transação do arquivo CNAB como sendo literal. Ex: 0000015232 > 152.32. 

A instrução não deixa claro se o número respeita alguma outra regra, como a Octagonal, por exemplo.