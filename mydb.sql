-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 25/04/2018 às 15:41
-- Versão do servidor: 5.7.20-0ubuntu0.16.04.1
-- Versão do PHP: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mydb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Carro`
--

CREATE TABLE `Carro` (
  `placa` varchar(8) NOT NULL,
  `Pessoa_id_Pessoa` int(10) UNSIGNED NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `fabricante` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `Carro`
--

INSERT INTO `Carro` (`placa`, `Pessoa_id_Pessoa`, `modelo`, `fabricante`) VALUES
('ghn-7093', 1, 'fusca', 'volkswagen'),
('qwe-3456', 3, 'celta', 'chevrolet'),
('rgh-4765', 2, 'punto', 'fiat'),
('uil-3421', 8, 'hilux', 'toyota'),
('uzd-7003', 6, 'uno', 'fiat');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Multa`
--

CREATE TABLE `Multa` (
  `id_Multa` int(10) UNSIGNED NOT NULL,
  `Carro_placa` varchar(8) NOT NULL,
  `data_Infrassao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `Multa`
--

INSERT INTO `Multa` (`id_Multa`, `Carro_placa`, `data_Infrassao`) VALUES
(2, 'rgh-4765', '2018-04-05 00:00:00'),
(4, 'uil-3421', '2018-02-06 00:00:00'),
(5, 'uil-3421', '2018-04-02 00:00:00'),
(6, 'uzd-7003', '2018-01-01 00:00:00'),
(7, 'qwe-3456', '2018-02-09 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pessoa`
--

CREATE TABLE `Pessoa` (
  `id_Pessoa` int(10) UNSIGNED NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `Pessoa`
--

INSERT INTO `Pessoa` (`id_Pessoa`, `nome`, `sobrenome`) VALUES
(1, 'Godofredo', 'Batista'),
(2, 'Maria', 'Cordeiro'),
(3, 'Marco', 'Aurelio'),
(6, 'Antonio', 'Neto'),
(8, 'Ana', 'Carolina');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `Carro`
--
ALTER TABLE `Carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `fk_Carro_Pessoa_idx` (`Pessoa_id_Pessoa`);

--
-- Índices de tabela `Multa`
--
ALTER TABLE `Multa`
  ADD PRIMARY KEY (`id_Multa`),
  ADD KEY `fk_Multa_Carro1_idx` (`Carro_placa`);

--
-- Índices de tabela `Pessoa`
--
ALTER TABLE `Pessoa`
  ADD PRIMARY KEY (`id_Pessoa`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `Multa`
--
ALTER TABLE `Multa`
  MODIFY `id_Multa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `Pessoa`
--
ALTER TABLE `Pessoa`
  MODIFY `id_Pessoa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `Carro`
--
ALTER TABLE `Carro`
  ADD CONSTRAINT `fk_Carro_Pessoa` FOREIGN KEY (`Pessoa_id_Pessoa`) REFERENCES `Pessoa` (`id_Pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `Multa`
--
ALTER TABLE `Multa`
  ADD CONSTRAINT `fk_Multa_Carro1` FOREIGN KEY (`Carro_placa`) REFERENCES `Carro` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
