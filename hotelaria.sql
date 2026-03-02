-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/02/2026 às 20:56
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
-- Banco de dados: `hotelaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `adicionais`
--

CREATE TABLE `adicionais` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) NOT NULL,
  `preco` double(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `adicionais`
--

INSERT INTO `adicionais` (`id`, `nome`, `preco`) VALUES
(1, 'travesseiro', 20.00),
(7, 'flores', 100.00),
(8, 'cobertor', 40.00),
(9, 'toalha', 10.00),
(10, 'chocolate', 50.00),
(11, '', 0.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(0, 'cliente'),
(1, 'camareira'),
(3, 'Gerente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `telefone` varchar(225) NOT NULL,
  `cpf` varchar(225) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargo_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `telefone`, `cpf`, `senha`, `cargo_id`) VALUES
(21, 'Pamella', 'pamellapereto@gmail.com', '40028922', '1234', '', 1),
(35, 'Claudinei', 'Claudineibrito@gmail', '707070707070', '5467828420', '$2y$10$tj.YdTeK3Dym7C4OOGi2nusyYSoquiDVlbuVmorj/KMbdI4ImRHhS', 0),
(39, 'Fernanda', 'FernandaThemer@gmail.com', '123', '5367878491', '$2y$10$M00djT.nsgZU5/FxwSWbiut.EwwIlxjVQNphEJCvIIgsm/XxBVhda', 0),
(40, 'Gabriel', 'GabrielThemer@gmail.com', '333333333', '5333333333', '$2y$10$/ipWDk38EqiWmTlVdo8EXugluWtLpo9hLRIiLUT.DDPibXUl4XwRm', 0),
(41, 'Neymar', 'Neymar@gmail', '1000', '75785822101', '$2y$10$0v6u6eG/5ARa09AxLtbCg.mlywNh4WOybWh9w.t0tMBCTodPyHcXS', 0),
(42, 'teste', 'j@g.com', '15987321', '123456789', '$2y$10$MZ9EQih6LEII/DhGlawRse6E2v/tusa/9JHQRzGIrmNDtviRUn8OG', 1),
(43, 'mylord', 'lord@hihi.com', '1564', '123456', '$2y$10$u5ibejm9.nH2xcTcHK/JROf4hsrlclQcyphjUdFHSsE9WhpRpTd.a', 1),
(44, 'nomeTeste', 'teste@email.com', '157070-7070', '123456789-55', '$2b$10$2Ot3SPM2BaaB05R.nLF65ODhdp3B5LOXrz9/Qk2Hl7/w0xukeXXEK', 1),
(147, 'nomeTeste', 'teste23@email.com', '157070-7090', '123456789-85', '$2b$10$vtMK0J3xg6jy2K70L0q.EuCGcGo4zFBvZa3VSAt52/XKwB2RTPFq6', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens`
--

CREATE TABLE `imagens` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `caminho` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens_quartos`
--

CREATE TABLE `imagens_quartos` (
  `id` int(11) NOT NULL,
  `imagem_id` int(11) NOT NULL,
  `quarto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `pagamento` enum('PIX','Dinheiro','Debito','Credito') NOT NULL CHECK (`pagamento` in ('PIX','Dinheiro','Debito','Credito'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `cliente_id`, `data`, `pagamento`) VALUES
(4, 5, 35, '2025-09-24 20:09:54', 'PIX'),
(6, 5, 35, '2025-09-24 20:07:00', 'PIX'),
(7, 5, 35, '2025-09-24 20:07:00', 'PIX'),
(8, 5, 35, '2025-09-24 20:07:01', 'PIX'),
(9, 5, 35, '2025-09-24 20:07:01', 'PIX'),
(10, 5, 35, '2025-09-24 20:07:01', 'PIX'),
(11, 5, 35, '2025-09-24 20:07:01', 'PIX'),
(12, 5, 35, '2025-09-24 20:07:01', 'PIX'),
(13, 5, 35, '2025-09-24 20:07:01', 'PIX'),
(19, 5, 21, '2025-10-15 16:58:46', 'PIX'),
(85, 5, 41, '2026-02-26 14:04:17', 'PIX'),
(86, 5, 41, '2026-02-26 14:05:18', 'PIX'),
(87, 5, 41, '2026-02-26 14:05:29', 'PIX'),
(88, 5, 41, '2026-02-26 14:05:32', 'PIX'),
(89, 5, 41, '2026-02-26 14:05:57', 'PIX'),
(90, 5, 41, '2026-02-26 14:06:55', 'PIX'),
(91, 5, 41, '2026-02-26 14:06:58', 'PIX'),
(92, 5, 41, '2026-02-26 15:08:32', 'PIX'),
(93, 5, 41, '2026-02-26 15:08:33', 'PIX');

-- --------------------------------------------------------

--
-- Estrutura para tabela `quartos`
--

CREATE TABLE `quartos` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) NOT NULL,
  `numero` varchar(225) NOT NULL,
  `qnt_cama_casal` int(11) NOT NULL,
  `qnt_cama_solteiro` int(11) NOT NULL,
  `preco` double(6,2) NOT NULL,
  `disponivel` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quartos`
--

INSERT INTO `quartos` (`id`, `nome`, `numero`, `qnt_cama_casal`, `qnt_cama_solteiro`, `preco`, `disponivel`) VALUES
(31, 'Quarterao', '10', 2, 2, 500.00, 1),
(33, 'Quartao', '20', 2, 2, 700.00, 1),
(34, 'Quartiao', '100', 3, 2, 600.00, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `quarto_id` int(11) NOT NULL,
  `adicional_id` int(11) NOT NULL DEFAULT 11,
  `fim` datetime NOT NULL DEFAULT current_timestamp(),
  `inicio` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Despejando dados para a tabela `reservas`
--

INSERT INTO `reservas` (`id`, `pedido_id`, `quarto_id`, `adicional_id`, `fim`, `inicio`) VALUES
(2, 4, 34, 11, '2025-10-07 12:00:00', '2025-10-01 14:00:00'),
(3, 4, 33, 7, '2025-10-17 12:00:00', '2025-10-11 14:00:00'),
(4, 4, 31, 7, '2025-10-27 12:00:00', '2025-10-21 14:00:00'),
(5, 4, 34, 7, '2025-11-06 12:00:00', '2025-10-31 14:00:00'),
(6, 4, 33, 7, '2025-11-16 12:00:00', '2025-11-10 14:00:00'),
(7, 4, 31, 7, '2025-11-26 12:00:00', '2025-11-20 14:00:00'),
(17, 19, 33, 11, '2025-10-07 12:00:00', '2025-10-01 14:00:00'),
(18, 85, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 85, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 86, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 86, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 87, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 87, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 88, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 88, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 89, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 89, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 90, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 90, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 91, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 91, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 92, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 92, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 93, 31, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 93, 33, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `senha` varchar(225) NOT NULL,
  `cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cargo_id`) VALUES
(5, 'Pamella', 'pamellapereto@gmail.com', '$2y$10$pa1c.sE65/hXgcfDKUIbLOBkpK56o8QG2zEJZIDyv2bhZKUd0sTEO', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `adicionais`
--
ALTER TABLE `adicionais`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefone` (`telefone`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `fk_cargo` (`cargo_id`);

--
-- Índices de tabela `imagens`
--
ALTER TABLE `imagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `imagens_quartos`
--
ALTER TABLE `imagens_quartos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `imagem_id` (`imagem_id`,`quarto_id`),
  ADD KEY `quarto_id` (`quarto_id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `quartos`
--
ALTER TABLE `quartos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Índices de tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `quarto_id` (`quarto_id`),
  ADD KEY `adicional_id` (`adicional_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `cargo_id` (`cargo_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adicionais`
--
ALTER TABLE `adicionais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de tabela `imagens`
--
ALTER TABLE `imagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagens_quartos`
--
ALTER TABLE `imagens_quartos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de tabela `quartos`
--
ALTER TABLE `quartos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_cargo` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`);

--
-- Restrições para tabelas `imagens_quartos`
--
ALTER TABLE `imagens_quartos`
  ADD CONSTRAINT `imagens_quartos_ibfk_1` FOREIGN KEY (`imagem_id`) REFERENCES `imagens` (`id`),
  ADD CONSTRAINT `imagens_quartos_ibfk_2` FOREIGN KEY (`quarto_id`) REFERENCES `quartos` (`id`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Restrições para tabelas `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`quarto_id`) REFERENCES `quartos` (`id`),
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`adicional_id`) REFERENCES `adicionais` (`id`);

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
