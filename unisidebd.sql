-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 04/11/2023 às 16:28
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `unisidebd`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `AVALIACAO_ID` int(11) NOT NULL,
  `AVALIACAO` decimal(4,2) DEFAULT NULL,
  `RA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carteira`
--

CREATE TABLE `carteira` (
  `CARTEIRA_ID` int(11) NOT NULL,
  `RA` int(11) DEFAULT NULL,
  `SALDO` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `PROJETO_ID` int(11) DEFAULT NULL,
  `COMENTARIO` varchar(300) DEFAULT NULL,
  `RA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `CURSO_ID` int(11) NOT NULL,
  `NOME` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `EVENTO_ID` int(11) NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `RECOMPENSA` decimal(4,2) DEFAULT NULL,
  `DATA_EVENTOS` date DEFAULT NULL,
  `CURSO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento_participados`
--

CREATE TABLE `evento_participados` (
  `RA` int(11) DEFAULT NULL,
  `EVENTO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos`
--

CREATE TABLE `projetos` (
  `PROJETO_ID` int(11) NOT NULL,
  `DESCRICAO` varchar(300) DEFAULT NULL,
  `NOME` varchar(60) DEFAULT NULL,
  `AVALIACAO_ID` int(11) DEFAULT NULL,
  `CURSO_ID` int(11) DEFAULT NULL,
  `RA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `RA` int(11) NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `SENHA` varchar(18) DEFAULT NULL,
  `CARTEIRA_ID` int(11) DEFAULT NULL,
  `CURSO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`AVALIACAO_ID`),
  ADD KEY `RA` (`RA`);

--
-- Índices de tabela `carteira`
--
ALTER TABLE `carteira`
  ADD PRIMARY KEY (`CARTEIRA_ID`);

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD KEY `PROJETO_ID` (`PROJETO_ID`),
  ADD KEY `RA` (`RA`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`CURSO_ID`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`EVENTO_ID`),
  ADD KEY `CURSO_ID` (`CURSO_ID`);

--
-- Índices de tabela `evento_participados`
--
ALTER TABLE `evento_participados`
  ADD KEY `RA` (`RA`),
  ADD KEY `EVENTO_ID` (`EVENTO_ID`);

--
-- Índices de tabela `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`PROJETO_ID`),
  ADD KEY `AVALIACAO_ID` (`AVALIACAO_ID`),
  ADD KEY `CURSO_ID` (`CURSO_ID`),
  ADD KEY `RA` (`RA`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`RA`),
  ADD KEY `CARTEIRA_ID` (`CARTEIRA_ID`),
  ADD KEY `CURSO_ID` (`CURSO_ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `AVALIACAO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carteira`
--
ALTER TABLE `carteira`
  MODIFY `CARTEIRA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `CURSO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `EVENTO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `projetos`
--
ALTER TABLE `projetos`
  MODIFY `PROJETO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`RA`) REFERENCES `users` (`RA`);

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`PROJETO_ID`) REFERENCES `projetos` (`PROJETO_ID`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`PROJETO_ID`) REFERENCES `projetos` (`PROJETO_ID`),
  ADD CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`RA`) REFERENCES `users` (`RA`);

--
-- Restrições para tabelas `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`CURSO_ID`) REFERENCES `cursos` (`CURSO_ID`);

--
-- Restrições para tabelas `evento_participados`
--
ALTER TABLE `evento_participados`
  ADD CONSTRAINT `evento_participados_ibfk_1` FOREIGN KEY (`RA`) REFERENCES `users` (`RA`),
  ADD CONSTRAINT `evento_participados_ibfk_2` FOREIGN KEY (`EVENTO_ID`) REFERENCES `eventos` (`EVENTO_ID`);

--
-- Restrições para tabelas `projetos`
--
ALTER TABLE `projetos`
  ADD CONSTRAINT `projetos_ibfk_1` FOREIGN KEY (`AVALIACAO_ID`) REFERENCES `avaliacao` (`AVALIACAO_ID`),
  ADD CONSTRAINT `projetos_ibfk_2` FOREIGN KEY (`CURSO_ID`) REFERENCES `cursos` (`CURSO_ID`),
  ADD CONSTRAINT `projetos_ibfk_3` FOREIGN KEY (`AVALIACAO_ID`) REFERENCES `avaliacao` (`AVALIACAO_ID`),
  ADD CONSTRAINT `projetos_ibfk_4` FOREIGN KEY (`CURSO_ID`) REFERENCES `cursos` (`CURSO_ID`),
  ADD CONSTRAINT `projetos_ibfk_5` FOREIGN KEY (`RA`) REFERENCES `users` (`RA`);

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`CARTEIRA_ID`) REFERENCES `carteira` (`CARTEIRA_ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`CARTEIRA_ID`) REFERENCES `carteira` (`CARTEIRA_ID`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`CURSO_ID`) REFERENCES `cursos` (`CURSO_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
