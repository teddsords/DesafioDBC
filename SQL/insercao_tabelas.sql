-- Tabela de Associados
CREATE TABLE associados (
    associado_id serial primary key,
    nome varchar(100) not null,
    sobrenome varchar(100) not null,
    idade int not null,
    email varchar(100) not null
);

-- Tabela de Contas
CREATE TABLE contas (
    conta_id serial primary key,
    tipo varchar(100) not null, 
    data_criacao timestamp not null, 
    associado_id INT references associados(associado_id)
);

-- Tabela de Cartões
CREATE TABLE cartoes (
    cartao_id serial primary key,
    num_cartao varchar(16) unique not null,
    nom_impresso varchar (100) not null, 
    data_criacao timestamp not null,
    conta_id INT references contas(conta_id),
    id_associado int references associados(associado_id)
);

-- Tabela de Movimentações
CREATE TABLE movimentacoes (
    movimentacao_id serial primary key,
    vlr_transacao decimal(10, 2) not null, 
    des_transacao varchar(100) not null, 
    data_movimento timestamp not null, 
    cartao_id INT REFERENCES cartoes(cartao_id)
);

