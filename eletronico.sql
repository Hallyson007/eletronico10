-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/02/2024 às 06:39
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `eletronico`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `idclientes` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `datacadastro` date DEFAULT NULL,
  `cpfcnpj` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `logradouro` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(45) DEFAULT NULL,
  `imagem` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`idclientes`, `nome`, `email`, `telefone`, `datacadastro`, `cpfcnpj`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `uf`, `imagem`) VALUES
(9, 'hallyson', 'abc@abc.com', '(11) 11111-1111', '2024-02-02', '11.111.111/1111-11', '60011000', 'Rua Boa Viagem', '222', '222', 'Farias Brito', 'Fortaleza', 'CE', '51bddd3418f861ea5aa94efa44b1c481.jpg'),
(10, 'abc', 'abc@abc.com', '(11) 11111-1111', '2024-02-03', '11.111.111/1111-11', '60011000', 'Rua Boa Viagem', '2222', '222', 'Farias Brito', 'Fortaleza', 'CE', 'b149b1c0f794a011e1f2ee39dff06df9.jpg');

--
-- Acionadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `set_datacadastro` BEFORE INSERT ON `clientes` FOR EACH ROW BEGIN
  SET NEW.`datacadastro` = CURDATE();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `idestoque` int(11) NOT NULL,
  `idprodutos` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `dataatualizacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `idprodutos` int(11) NOT NULL,
  `produto` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `preco` decimal(10,0) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `idclientes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`idprodutos`, `produto`, `descricao`, `preco`, `categoria`, `estoque`, `idclientes`) VALUES
(1, 'nome do produto', 'descrição do produto', 10, 'categoria do produto', 10, NULL),
(2, 'casa', 'casa', 2, 'eletronicos', 1250, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idclientes`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`idestoque`),
  ADD KEY `idprodutos` (`idprodutos`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idprodutos`),
  ADD KEY `idclientes` (`idclientes`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idclientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `idestoque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idprodutos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `idprodutos` FOREIGN KEY (`idprodutos`) REFERENCES `produtos` (`idprodutos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `idclientes` FOREIGN KEY (`idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idclientes`) REFERENCES `clientes` (`idclientes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
