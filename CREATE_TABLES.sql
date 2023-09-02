CREATE TABLE Usuarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(100),
    Senha VARCHAR(50),
    Cargo VARCHAR(50)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2)
);

-- Tabela de Compras
CREATE TABLE Compras (
    ID INT PRIMARY KEY,
    IDProduto INT,
    IDUsuarioComprador INT,
    DataCompra DATE,
    QuantidadeComprada INT,
    FOREIGN KEY (IDProduto) REFERENCES Produtos(ID),
    FOREIGN KEY (IDUsuarioComprador) REFERENCES Usuarios(ID)
);

-- Tabela de Vendas
CREATE TABLE Vendas (
    ID INT PRIMARY KEY,
    IDProduto INT,
    IDUsuarioVendedor INT,
    DataVenda DATE,
    QuantidadeVendida INT,
    FOREIGN KEY (IDProduto) REFERENCES Produtos(ID),
    FOREIGN KEY (IDUsuarioVendedor) REFERENCES Usuarios(ID)
);

-- Tabela de Pessoas
CREATE TABLE Pessoas (
    ID INT PRIMARY KEY,
    Tipo VARCHAR(20), -- Física ou Jurídica
    Nome VARCHAR(100),
    CPF VARCHAR(14), -- Pessoas Físicas
    CNPJ VARCHAR(18), -- Pessoas Jurídicas
    Endereco VARCHAR(200),
    Contato VARCHAR(100)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    QuantidadeEstoque INT,
    PrecoVenda DECIMAL(10, 2)
);

-- Tabela de Movimentos
CREATE TABLE Movimentos (
    ID INT PRIMARY KEY,
    Tipo VARCHAR(10), -- 'Compra' ou 'Venda'
    IDProduto INT,
    IDPessoa INT,
    DataMovimento DATE,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (IDProduto) REFERENCES Produtos(ID),
    FOREIGN KEY (IDPessoa) REFERENCES Pessoas(ID)
);

CREATE TABLE sequence_table (
    sequence_name VARCHAR(50) PRIMARY KEY,
    next_value INT
);


 CREATE FUNCTION get_next_value (seq_name VARCHAR(50))
 RETURNS INT BEGIN
    DECLARE next_val INT;
    UPDATE sequence_table
    SET next_value = next_value + 1
    WHERE sequence_name = seq_name;
    SELECT next_value INTO next_val FROM sequence_table WHERE sequence_name = seq_name;
    RETURN next_val;
END;


