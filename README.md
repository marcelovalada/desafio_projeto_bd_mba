# Sistema de Chamados - HelpDeskDB

## Contexto
Este projeto simula um sistema de chamados técnicos (help desk). O objetivo é modelar um banco de dados relacional capaz de armazenar e recuperar informações de usuários, técnicos, chamados e interações.

## Equipe
- Marcelo da Silva Valada Segundo
- Pedro Henrique Correia de Araujo Souto Leal

## Tecnologias
- Docker
- SGBD: PostgreSQL 15
- pgAdmin 4

## Estrutura
- `diagrama-er.png`: Modelo conceitual (ER)
- `1_scripts_tabelas.sql`: Criação de tabelas no banco
- `2_scripts_dados.sql`: Inserção de dados
- `3_scripts_analises.sql`: Consultas relevantes ao negócio
- `docker-compose.yml`: Arquivo de configuração do Docker

## Exemplos de Consultas para análises
- Técnicos que mais fecharam chamados
- Quantidade de chamados abertos por categoria
- Setores com usuários distintos criando chamados

## Normalização das Tabelas

O banco de dados foi estruturado seguindo os princípios de normalização:

### 1ª Forma Normal (1FN)
- Todas as tabelas possuem chaves primárias (id_categoria, id_usuario, id_tecnico, id_chamado, id_interacao)
- Não há grupos repetitivos ou colunas multivaloradas
- Todos os atributos são atômicos (contêm apenas um valor)

### 2ª Forma Normal (2FN)
- Todas as tabelas já estão na 1FN
- Todos os atributos não-chave dependem totalmente da chave primária
- Não há dependências parciais

### 3ª Forma Normal (3FN)
- Todas as tabelas estão na 2FN
- Não há dependências transitivas (atributos não-chave dependendo de outros atributos não-chave)
- Dados relacionados são adequadamente separados em tabelas distintas (ex: usuários, técnicos, chamados)

## Como usar

1. Certifique-se de ter o Docker instalado
2. Execute o comando:
```bash
docker-compose up -d
```
3. Acesse o pgAdmin em: http://localhost:5050
    - Email: admin@admin.com
    - Senha: admin
4. Conecte-se ao PostgreSQL usando as credenciais:
   - Host: postgres
   - Porta: 5432
   - Usuário: postgres
   - Senha: postgres
   - Banco de dados: postgres

## Parar os serviços

Para parar os serviços, execute:
```bash
docker-compose down
```

#Link para Hackathon - Projeto 2
[link do hackathon](https://github.com/rennegomes/hackathon_MBA)
