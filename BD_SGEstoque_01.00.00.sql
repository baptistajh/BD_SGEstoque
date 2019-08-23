/* ModeloLogicoBanco: */

CREATE TABLE Fornecedores (
    PK_ForCodigo INTEGER NOT NULL PRIMARY KEY,
    ForNome VARCHAR,
    ForTipo CHARACTER,
    ForDocumento VARCHAR,
    ForRGIE VARCHAR,
    ForEndereço VARCHAR,
    ForCEP INTEGER,
    ForCidade VARCHAR,
    FK_ForEstados INTEGER,
    ForFone VARCHAR,
    UNIQUE (PK_ForCodigo, ForDocumento, ForRGIE)
);

CREATE TABLE Produtos (
    PK_ProCodigo INTEGER PRIMARY KEY UNIQUE,
    ProNome VARCHAR,
    ProPrecoCompra NUMERIC,
    ProPrecoVenda NUMERIC,
    ProDataVencimento VARCHAR,
    ProQuantidadeMinima NUMERIC,
    ProQuantidadeEstoque NUMERIC,
    ProQuantidadeMaxima NUMERIC,
    ProDescricao VARCHAR,
    FK_ProCategoria INTEGER
);

CREATE TABLE Estados (
    PK_EstCodigo INTEGER PRIMARY KEY UNIQUE,
    EstUF VARCHAR,
    EstNome VARCHAR
);

CREATE TABLE Servicos (
    PK_SerCodigo INTEGER PRIMARY KEY UNIQUE,
    SerTitulo VARCHAR,
    SerValor DOUBLE,
    SerDataInicio VARCHAR,
    SerTempoEntrega INTEGER,
    SerDataFim VARCHAR,
    SerDescricao VARCHAR
);

CREATE TABLE Categorias (
    PK_CatCodigo INTEGER PRIMARY KEY UNIQUE,
    CatTitulo VARCHAR,
    CatDescricao VARCHAR,
    FK_CatSubCategoria INTEGER
);

CREATE TABLE SubCategorias (
    PK_SubCodigo INTEGER PRIMARY KEY UNIQUE,
    SubTitulo VARCHAR,
    SubtDescricao VARCHAR
);

CREATE TABLE Usuarios (
    PK_UsuCodigo INTEGER PRIMARY KEY,
    UsuNome VARCHAR,
    UsuLogin VARCHAR,
    UsuSenha VARCHAR,
    UsuCargo VARCHAR,
    UNIQUE (PK_UsuCodigo, UsuLogin)
);

CREATE TABLE Lancamentos (
    PK_LanCodigo INTEGER PRIMARY KEY,
    LanTipoLancamento CHARACTER,
    LanDataLancamento DATE,
    LanQuantidade NUMERIC,
    FK_LanCodigoProduto INTEGER
);
 
ALTER TABLE Fornecedores ADD CONSTRAINT FK_Fornecedores_3
    FOREIGN KEY (FK_ForEstados???)
    REFERENCES ??? (???);
 
ALTER TABLE Produtos ADD CONSTRAINT FK_Produtos_3
    FOREIGN KEY (FK_ProCategoria???)
    REFERENCES ??? (???);
 
ALTER TABLE Categorias ADD CONSTRAINT FK_Categorias_3
    FOREIGN KEY (FK_CatSubCategoria???)
    REFERENCES ??? (???);
 
ALTER TABLE SubCategorias ADD CONSTRAINT FK_SubCategorias_3
    FOREIGN KEY (????)
    REFERENCES ??? (???);
 
ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_3
    FOREIGN KEY (UsuTipo???)
    REFERENCES ??? (???);
 
ALTER TABLE Lancamentos ADD CONSTRAINT FK_Lancamentos_2
    FOREIGN KEY (FK_LanCodigoProduto???)
    REFERENCES ??? (???);