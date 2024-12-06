# Desafio DBC
Este repositório foi criado para armazenar os códigos do desafio encaminhado pela DBC para o cliente Sicredi.

## Problema
Digamos que você faz parte da equipe de engenharia de dados e uma empresa, chamada SiCooperative LTDA, que tem como propósito oferecer soluções financeiras de maneira justa para as 
pessoas. Porém, um grande problema estava impactando a velocidade e a assertividade na tomada de decisões por parte de gestores e diretores. Esse problema pode ser explicado, principalmente, na 
dificuldade em agregar diferentes informações em um único ponto, muito tempo estava sendo perdido em criar relatórios individuais, e após isso, tentar correlacionar eles manualmente. Além disso, uma 
nova equipe de Data Science estava sendo montada com o objetivo de criar modelos preditivos que tenham a capacidade de analisar o momento atual de cada associado(cliente), e dessa forma oferecer 
soluções mais coerentes com a realidade de cada associado. Após uma reunião estratégica, foi decidido por iniciar uma POC para criação de um Data Lake, com objetivo de resolver os problemas já citados. 
Após isso, foi feito um mapeamento inicial para definir quais eram as prioridades de ingestão, ou seja, quais seriam as primeiras informações a serem trazidas para a nova estrutura, e como resultado os 
dados de movimentações dos cartões, foi a escolhida. Ela contém informações de cada movimentação feita por cartões dos associados, com informações de valor e data da movimentação. Além disso, 
também devem ser carregadas as tabelas na qual ela faz relacionamento: a tabela de cartão que contém informações adicionais do cartão, a conta que aquele cartão e associado estão vinculados, e 
informações do associado. Um associado pode ter vários cartões e várias contas.  O diagrama dessa estrutura está organizado da seguinte forma:

**Associados**
* associado_id -> int
* nome -> varchar
* sobrenome -> varchar
* idade -> int
* email -> varchar

**Conta** 
* conta_id -> int
* tipo -> varchar
* data_criacao -> timestamp
* associado_id -> int

**Cartao**
* cartao_id -> int
* num_cartao -> int
* nom_impresso -> varchar
* conta_id -> int
* associado_id -> int

**Movimento**
* movimento_id -> int
* vlr_transacao -> decimal
* des_transacao -> varchar
* data_movimento -> timestamp
* cartao_id -> int

### Documentação extensa
Para maiores detalhes sobre o desenvolvimento do desafio, por favor referi-se à documentação dentro do arquivo 'Desafio DBC.ipynb'. Na primeira celula é possível encontrar um markdown com o passo a passo detalhado de como foi realizado o desafio.


### Utils Anonimizada
O código da classe Utils foi anonimizado para não ter problemas de exposição de dados sensíveis, caso for necessário os dados podem ser passados por e-mail ou WhatsApp.

### Design escolhido
O design escolhido foi devido ao fato de ter experiência com o Databricks e pelo poder de processamento para Big Data do mesmo. ele já consta com um ambiente pronto para desenvolver códigos para engenharia
de dados junto com o Pyspark. Também foi escolhido o Azure Database for PostgreSQL devido à familiarização com esse serviço e com a nuvem Azure. Foi escolhido também trabalhar com a arquitetura medalhão 
já que é a arquitetura mais popular dentro da engenharia de dados. Foram criadas as camadas bronze, silver e gold para os dados, os dados foram salvos como forma de persistência de dados como arquivos CSV
e como tabelas Delta dentro do Unity Catalog do Databricks Community. 

### Dificuldades encontradas
No começo do desenvolvimento tive dificuldades para configurar a conexão com o banco de dados, pois estava faltando uns dados dentro do usuário para conseguir conectar
diretamente no banco de dados, mas foi possível fazer após realizar uma leitura rápida da documentação.
