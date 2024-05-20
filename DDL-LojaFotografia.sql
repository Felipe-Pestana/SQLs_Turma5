CREATE TABLE Endereco (
    CodEnd INT,
    Cep VARCHAR(10),
    Uf CHAR(2),
    Cidade VARCHAR(100),
    Bairro VARCHAR(100),
    Rua VARCHAR(100),
    CONSTRAINT pkEndereco Primary Key(CodEnd)
);

CREATE TABLE Cliente (
    Id BIGINT,
    Nome VARCHAR(100),
    CodEnd int, 
   	Numero VARCHAR(10),
	Complemento VARCHAR(30),
    TelefoneResidencial VARCHAR(15),
    TelefoneComercial VARCHAR(15),
    TelefoneCelular VARCHAR(15),
    CPF VARCHAR(14) UNIQUE,
    RG VARCHAR(20)UNIQUE,
    DataNascimento DATE,
    Sexo CHAR(1),
    CNPJ VARCHAR(18)UNIQUE,
    InscEstadual VARCHAR(20)UNIQUE,
    Responsavel VARCHAR(100),
    Tipo CHAR(1), 
    CONSTRAINT pkCliente Primary Key(Id),
	Constraint FKEndereco Foreign Key (CodEnd) references Endereco(CodEnd)
);

CREATE TABLE FUNCIONARIO 
(	
	CODIGO INTEGER IDENTITY(100,5) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	CODEND integer, 
	COMPLEMENTO VARCHAR(50) NOT NULL,
	NUMERO INT NOT NULL,
	TELEFONE VARCHAR(11) NOT NULL,
	TELEFONECONTATO VARCHAR(50) NOT NULL,
	FUNCAO VARCHAR(20) NOT NULL,
	DEPARTAMENTO VARCHAR(30) NOT NULL,
	CPF VARCHAR(11) NOT NULL
	CONSTRAINT PKFUNCIONARIO PRIMARY KEY (CODIGO),
	CONSTRAINT UKFUNCIONARIO UNIQUE (CPF),
	Constraint FKEndereco_Funcionario Foreign Key (CodEnd) references Endereco(CodEnd)
)



CREATE TABLE Venda (
	Codigo int identity(1,1),
	Preco numeric (10,2),
	DataVenda date,
	CodFuncionario int, 
	CodCliente bigint,
	CONSTRAINT pk_venda primary key (Codigo),
	CONSTRAINT fk_func_venda foreign key (CodFuncionario) references Funcionario (codigo),
	CONSTRAINT fk_client_venda foreign key (CodCLiente) references Cliente (Id)
 
);

CREATE TABLE PRODUTO (
	Codigo int identity (1,1),
	Descricao varchar(100),
	Preco_Venda Numeric (10,2),
	Preco_Custo Numeric (10,2),
	Qtd_Min Numeric(10,2),
	Qtd Numeric (10,2),
	Tipo varchar(25),
	Constraint pk_produto primary key (Codigo)
 
);
 
CREATE TABLE ItemVenda (
	codigoVenda int,
	codigoProduto int,
	qtd numeric (10,2),
	preco_venda numeric (10,2),
	total_unit numeric (14,2),
	CONSTRAINT pk_itemVenda primary key(codigoVenda,codigoProduto),
	CONSTRAINT fk_produto_item foreign key (codigoProduto) references Produto (codigo),
	CONSTRAINT fk_venda_item foreign key (codigoVenda) references Venda (codigo)
);
