create database db_sistema_supermercado;
use db_sistema_supermercado;

create table tbl_cliente(
	id int primary key not null auto_increment,
	nome varchar(45) not null,
	cpf varchar(45) not null,
    data_nascimento varchar(15) not null,
    unique index (id)
);

create table tbl_colaborador(
	id int primary key not null auto_increment,
	nome_colaborador varchar(45) not null,
    funcao varchar(45) not null,
    setor varchar(45) not null,
    data_admissao date not null,
    unique index (id)
);

create table tbl_contato(
	id int primary key not null auto_increment,
    contato varchar(15) not null,
    id_colaborador int not null,
    id_cliente int not null,
    
    constraint fk_cliente_contato
    foreign key(id_cliente)
    references tbl_cliente (id),
    
    constraint fk_colaborador_contato
    foreign key (id_colaborador)
    references tbl_colaborador (id),
    unique index (id)
);

create table tbl_endereco(
	id int primary key not null auto_increment,
	cep varchar(45) not null,
	logradouro varchar(45) not null,
	numero varchar(45) not null,
	bairro varchar(45) not null,
	cidade varchar(45) not null,
	id_cliente int,

	constraint fk_cliente_endereco
	foreign key (id_cliente)
	references tbl_cliente (id),
	unique index (id)

);

create table tbl_venda(
	id int primary key not null auto_increment,
	data_venda varchar(45) not null,
	unique index (id)
);

create table tbl_colaborador_venda(
	id int primary key not null auto_increment,
	colaborador_responsavel varchar(45) not null,
	id_venda int,
	id_colaborador int,

	constraint fk_venda_colaborador_venda
	foreign key (id_venda)
	references tbl_venda (id),

	constraint fk_colaborador_colaborador_venda
    foreign key(id_colaborador)
    references tbl_colaborador (id),
    
    unique index (id)
);

create table tbl_cliente_venda(
	id int not null primary key auto_increment,
    total_pago varchar(45) not null,
    id_cliente int,
    id_venda int,
    
    constraint fk_cliente_cliente_venda
    foreign key (id_cliente)
    references tbl_cliente (id),
    
    constraint fk_venda_cliente_venda
    foreign key (id_venda)
    references tbl_venda (id),
    
    unique index (ind)
);

create table tbl_produto(
	id int primary key not null auto_increment,
	nome_produto varchar(45) not null,
	estoque varchar(45) not null,
	valor_unitario decimal(45) not null,
	descricao varchar(100),
    
    unique index (id)
);

create table tbl_venda_produto(
	id int primary key not null auto_increment,
    qtd_vendida decimal(15) not null,
    id_produto int,
    id_venda int,
    
    constraint fk_produto_venda_produto
    foreign key (id_produto)
    references tbl_produto (id),
    
    constraint fk_venda_venda_produto
    foreign key (id_venda)
    references tbl_venda (id),
    
    unique index (id)
);



