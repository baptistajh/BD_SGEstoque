/* ModeloLogicoBanco: */

CREATE TABLE Fornecedores (
    PK_ForCodigo INTEGER NOT NULL PRIMARY KEY,
    ForNome VARCHAR(50),
    ForTipo CHARACTER,
    ForDocumento VARCHAR(13) UNIQUE,
    ForRGIE VARCHAR(10) UNIQUE,
    ForEndereco VARCHAR(50),
    ForCEP VARCHAR(8),
    ForCidade VARCHAR(50),
    FK_ForEstados INTEGER,
    ForFone VARCHAR(11)
);

CREATE TABLE Produtos (
    PK_ProCodigo INTEGER NOT NULL PRIMARY KEY,
    ProNome VARCHAR(50),
    ProPrecoCompra NUMERIC(10,4),
    ProPrecoVenda NUMERIC(10,4),
    ProDataVencimento DATE,
    ProQuantidadeMinima NUMERIC(10,4),
    ProQuantidadeEstoque NUMERIC(10,4),
    ProQuantidadeMaxima NUMERIC(10,4),
    ProDescricao VARCHAR(50),
    FK_ProCategoria INTEGER
);

CREATE TABLE Estados (
    PK_EstCodigo INTEGER NOT NULL PRIMARY KEY,
    EstUF VARCHAR(2),
    EstNome VARCHAR(50)
);

CREATE TABLE Servicos (
    PK_SerCodigo INTEGER NOT NULL PRIMARY KEY,
    SerTitulo VARCHAR(50),
    SerValor NUMERIC(10,4),
    SerDataInicio DATE,
    SerTempoEntrega INTEGER,
    SerDataFim DATE,
    SerDescricao VARCHAR(50)
);

CREATE TABLE Categorias (
    PK_CatCodigo INTEGER NOT NULL PRIMARY KEY,
    CatTitulo VARCHAR(50),
    CatDescricao VARCHAR(50),
    FK_CatSubCategoria INTEGER
);

CREATE TABLE SubCategorias (
    PK_SubCodigo INTEGER NOT NULL PRIMARY KEY,
    SubTitulo VARCHAR(50),
    SubtDescricao VARCHAR(50)
);

CREATE TABLE Usuarios (
    PK_UsuCodigo INTEGER NOT NULL PRIMARY KEY,
    UsuNome VARCHAR(50),
    UsuLogin VARCHAR(50) UNIQUE,
    UsuSenha VARCHAR(50),
    UsuCargo VARCHAR(50)
);

CREATE TABLE Lancamentos (
    PK_LanCodigo INTEGER NOT NULL PRIMARY KEY,
    LanTipoLancamento CHARACTER,
    LanDataLancamento DATE,
    LanQuantidade NUMERIC(10,4),
    FK_LanCodigoProduto INTEGER
);
 
ALTER TABLE Fornecedores ADD CONSTRAINT FK_ForEstados
    FOREIGN KEY (FK_ForEstados)
    REFERENCES Estados (PK_EstCodigo);
 
ALTER TABLE Produtos ADD CONSTRAINT FK_ProCategoria
    FOREIGN KEY (FK_ProCategoria)
    REFERENCES Categorias (PK_CatCodigo);
 
ALTER TABLE Categorias ADD CONSTRAINT FK_CatSubCategoria
    FOREIGN KEY (FK_CatSubCategoria)
    REFERENCES SubCategorias (PK_SubCodigo);
 
ALTER TABLE Lancamentos ADD CONSTRAINT FK_LanCodigoProduto
    FOREIGN KEY (FK_LanCodigoProduto)
    REFERENCES Produtos (PK_ProCodigo);