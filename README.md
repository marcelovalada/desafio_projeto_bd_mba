# Sistema de Chamados - HelpDeskDB

## Contexto
Este projeto simula um sistema de chamados técnicos (help desk). O objetivo é modelar um banco de dados relacional capaz de armazenar e recuperar informações de usuários, técnicos, chamados e interações.

## Equipe
- Marcelo Valada
- Pedro Leal

## Tecnologias
- Docker
- SGBD: PostgreSQL
- pgAdmin

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
