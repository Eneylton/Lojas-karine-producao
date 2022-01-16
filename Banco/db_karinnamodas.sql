-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Jan-2022 às 18:37
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_karinnamodas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nivel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nivel`) VALUES
(1, 'admin'),
(2, 'Assitente'),
(3, 'Coordenador'),
(4, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) DEFAULT NULL,
  `forma_pagamento_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `descricao`) VALUES
(1, 'Asssistente de Logística'),
(2, NULL),
(3, NULL),
(4, 'Supervisor de Operações Logísticas Interior'),
(5, 'Encarregada de Expedição'),
(6, 'Assistente da qualidade'),
(7, 'Auxiliar de Logística'),
(8, 'Diretora'),
(9, 'Assistente Financeiro'),
(10, 'Coordenadora de RH');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catdespesas`
--

CREATE TABLE `catdespesas` (
  `id` int(11) NOT NULL,
  `nome` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `catdespesas`
--

INSERT INTO `catdespesas` (`id`, `nome`) VALUES
(1, 'Àgua'),
(2, 'Luz'),
(3, 'Compras'),
(11, 'Telefone'),
(15, 'Vendas de produto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `foto` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `foto`) VALUES
(89, 'BLUSA', './imgs/1-12.jpg'),
(90, 'Bermuda ', './imgs/2021-06-30_11_37_06.jpg'),
(91, 'CAMISA', './imgs/001-15.jpg'),
(92, 'CALÇA MASCULINA', './imgs/01.jfif'),
(93, 'Vestido ', './imgs/2021-08-20_10_22_06.jpg'),
(95, 'MACAQUINHO', './imgs/2021-08-20_10_43_18.jpg'),
(101, 'Conjunto ', './imgs/2021-08-20_10_58_05.jpg'),
(102, 'Macacão ', './imgs/2021-08-21_12_56_42.jpg'),
(103, 'SHORT', './imgs/efa741a6-cd13-4c80-9196-0b04c00a4a98.jfif'),
(104, 'Short alfaiataria ', './imgs/2021-09-16_14_54_14.jpg'),
(105, 'CALÇA JEANS FEMININA', './imgs/2021-09-17_09_35_32.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `localidade` varchar(45) DEFAULT NULL,
  `logradouro` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `uf` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `data`, `nome`, `telefone`, `email`, `cep`, `localidade`, `logradouro`, `numero`, `bairro`, `complemento`, `uf`) VALUES
(15, '2021-09-12 15:30:02', 'Eneylton Barros', '(98) 99158-1962', 'eneylton@hotmail.com', '65054-530', 'São Luís', 'Rua 03', '12', 'Cohtrac IV', 'Proximo a praça verão', 'MA'),
(16, '2021-09-12 15:31:47', 'Livia Jansen', '(98) 99158-1962', 'eneylton@hotmail.com', '65054530', 'São luis', 'Rua Três', '12', 'Cohatrac IV', 'Proximo a praça verão', 'Maranhão'),
(17, '2021-10-17 22:19:17', 'Karina Modas', '(98) 99158-1962', 'karina@gmail.com', '65054780', 'São Luís', 'Rua Vinte e Seis', '14', 'Cohatrac IV', 'Proximo a praça verão', 'MA'),
(18, '2022-01-16 16:08:30', 'CLIENTE', '(98) 9915-8196', 'cliente@hotmail.com', '65054530', 'São Luís', 'Rua Três', '14', 'Cohatrac IV', '', 'MA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id`, `nome`) VALUES
(2, 'Dinheiro'),
(3, 'Cartão de Crédito 1x'),
(4, 'Cartão de Crédito 2x'),
(5, 'Cartão de Crédito 3x'),
(6, 'Cartão de Crédito 4x'),
(7, 'Cartão de Débito'),
(8, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `troco` decimal(10,2) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `descricao` varchar(335) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `catdespesas_id` int(11) NOT NULL,
  `forma_pagamento_id` int(11) NOT NULL,
  `caixa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mov_cat`
--

CREATE TABLE `mov_cat` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mov_cat`
--

INSERT INTO `mov_cat` (`id`, `nome`) VALUES
(1, 'Venda de produtos'),
(2, 'Alimentação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) NOT NULL,
  `barra` varchar(50) NOT NULL,
  `codigo` int(10) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `qtd` int(10) NOT NULL,
  `valor_compra` decimal(10,2) NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL,
  `estoque` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `foto` varchar(255) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `usuarios_id` int(11) NOT NULL,
  `categorias_id` int(11) NOT NULL,
  `aplicacao` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`, `aplicacao`) VALUES
(1162, '7891342013826', 0, 'Acp809/tecfil ', 1, '15.00', '35.00', 9, 0, './imgs/2021-05-19_15_53_22.jpg', '2021-05-19 18:53:22', 7, 39, 'Peugeout 308 / Citroen air cross 10 '),
(1165, '7891342007986', 0, 'Acp903/tecfil', 1, '11.00', '35.00', 13, 0, './imgs/2021-05-20_08_47_02.jpg', '2021-05-20 11:43:11', 7, 39, 'Citroen C4 1.6 2014 / Peugeot 307 2.0 2007 '),
(1166, '7798186474908', 0, 'Akx2108/wega', 1, '15.00', '35.00', 9, 0, './imgs/2021-05-20_08_52_28.jpg', '2021-05-20 11:52:28', 7, 39, 'Jeep compass diesel 2016 / jeep renegade flex 1.8 2016 / fiat toro flex e diesel '),
(1903, '7909678863463', 0, 'Blusa fem. Hering', 1, '0.00', '49.00', 3, 0, './imgs/2021-08-20_09_44_31.jpg', '2021-08-20 12:44:31', 7, 89, 'P/M/G'),
(1904, '7909678863241', 0, 'Blusa fem. Hering', 1, '0.00', '49.00', 1, 0, './imgs/2021-08-20_09_48_44.jpg', '2021-08-20 12:48:44', 7, 89, 'P'),
(1905, '7909678862701', 0, 'Blusa fem. Hering', 1, '0.00', '59.00', 1, 0, './imgs/2021-08-20_09_55_22.jpg', '2021-08-20 12:55:22', 7, 89, 'G'),
(1906, '7909678141677', 0, 'Blusa fem. Hering', 1, '0.00', '59.00', 3, 1, './imgs/2021-08-20_10_01_31.jpg', '2021-08-20 13:01:31', 4, 89, 'M/G/XG'),
(1907, '7909678862657', 0, 'Blusa fem. Hering', 1, '0.00', '59.00', 2, 0, './imgs/2021-08-20_10_05_01.jpg', '2021-08-20 13:05:01', 7, 89, 'G/XG'),
(1908, '7909678862350', 0, 'Blusa fem. Hering', 1, '0.00', '59.00', 2, 0, './imgs/2021-08-20_10_08_17.jpg', '2021-08-20 13:08:17', 7, 89, 'G/XG/XXG'),
(1910, '2408', 0, 'Vestido louise donatella', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_10_25_46.jpg', '2021-08-20 13:25:46', 4, 93, 'Cor: verde piscina'),
(1912, '2409', 0, 'Vestido louise donatella', 1, '0.00', '128.00', 2, 1, './imgs/2021-08-20_10_27_48.jpg', '2021-08-20 13:27:48', 4, 93, 'Cor: rosa bebe'),
(1913, '1475', 0, 'Vestido erica- Donatella', 1, '0.00', '128.00', 0, 0, './imgs/2021-08-20_10_32_19.jpg', '2021-08-20 13:32:19', 7, 93, 'Cor: preto'),
(1914, '2357', 0, 'Vestido erica- donatella', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_10_34_14.jpg', '2021-08-20 13:34:14', 4, 93, 'Cor: pink'),
(1915, '2356', 0, 'Vestido erica- DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_10_35_43.jpg', '2021-08-20 13:35:43', 4, 93, 'Cor: telha'),
(1916, '2366', 0, 'Vestido longo beatriz- DONATELLA ', 1, '0.00', '128.00', 1, 0, './imgs/2021-08-20_10_37_47.jpg', '2021-08-20 13:37:47', 7, 93, 'Cor: telha'),
(1917, '2410', 0, 'Macaquinho donatella', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_10_47_59.jpg', '2021-08-20 13:47:59', 4, 95, 'Cor: azul caribe'),
(1918, '2151', 0, 'Conjunto midi iara- DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_10_53_38.jpg', '2021-08-20 13:53:38', 4, 0, 'Cor: pink'),
(1919, '2151', 0, 'Conjunto midi iara- DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_10_59_27.jpg', '2021-08-20 13:59:28', 4, 101, 'Cor: PINK '),
(1920, '2359', 0, 'Conjunto midi iara- DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_11_00_42.jpg', '2021-08-20 14:00:42', 4, 101, 'Cor: azul bic'),
(1921, '2413', 0, 'Conjunto pavaneli- donatella', 1, '0.00', '128.00', 1, 0, './imgs/2021-08-20_11_03_13.jpg', '2021-08-20 14:03:13', 7, 101, 'Cir: pink'),
(1922, '1524', 0, 'Conjunto dafine- DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_11_06_00.jpg', '2021-08-20 14:06:00', 4, 101, 'Cor: telha'),
(1923, '1368', 0, 'Conjunto esmeralda- DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-20_11_07_21.jpg', '2021-08-20 14:07:22', 4, 101, 'Cor: preta'),
(1924, '2438', 0, 'Vestido Canadá- donatella', 1, '0.00', '128.00', 2, 0, './imgs/2021-08-20_11_10_16.jpg', '2021-08-20 14:10:16', 7, 93, 'Cor:preta'),
(1925, 'g1008-4', 0, 'MAURICINHO LISO PRETO', 1, '11.00', '40.00', 6, 0, './imgs/WhatsApp Image 2021-08-16 at 11.10.49 (2)-1.jpeg', '2021-08-21 12:57:39', 7, 90, ''),
(1926, '1014-3', 0, 'MAURICINHO LISTRA', 1, '11.00', '50.00', 0, 0, './imgs/WhatsApp Image 2021-08-17 at 11.55.07 (1).jpeg', '2021-08-21 13:01:35', 7, 90, ''),
(1927, 'i1011-1', 0, 'MAURICINHO AZUL', 1, '11.00', '40.00', 1, 0, './imgs/WhatsApp Image 2021-08-16 at 11.10.49 (2)-2.jpeg', '2021-08-21 13:15:52', 16, 90, ''),
(1928, 'g1004-4', 0, 'MAURICINHO  CHUMBO', 1, '10.00', '40.00', 1, 0, './imgs/Mauricinho Chumbo.png', '2021-08-21 13:19:46', 16, 90, ''),
(1929, '1050-4', 0, 'BERMUDA LISTRA PRETA', 1, '13.00', '50.00', 1, 0, './imgs/WhatsApp Image 2021-08-17 at 11.55.07.jpeg', '2021-08-21 13:24:12', 16, 90, ''),
(1930, '1051-1', 0, 'MAURICINHO VERM LIST PRETA', 1, '13.00', '50.00', 0, 0, './imgs/Mauricinho Listra Vermelha Com Preto.jpeg', '2021-08-21 13:26:14', 7, 90, ''),
(1931, 'i1003-3', 0, 'MAURICINHO VERDE TYFANY', 1, '11.00', '40.00', 1, 0, './imgs/WhatsApp Image 2021-08-16 at 11.10.49 (1).jpeg', '2021-08-21 13:28:33', 16, 90, ''),
(1932, 'g1010-3', 0, 'MAURICINHO AZUL MÉDIO', 1, '11.00', '40.00', 1, 0, './imgs/WhatsApp Image 2021-08-16 at 11.10.49 (1)-1.jpeg', '2021-08-21 13:32:43', 16, 90, ''),
(1933, ' i1001-1', 0, 'MAURICINHO LISO CINZA', 1, '11.00', '40.00', 1, 0, './imgs/WhatsApp Image 2021-08-16 at 11.10.49.jpeg', '2021-08-21 13:35:20', 16, 90, ''),
(1934, 'g1008-2', 0, 'MAURICINHO PRETO', 1, '11.00', '40.00', 1, 0, './imgs/WhatsApp Image 2021-08-16 at 11.10.49 (2)-3.jpeg', '2021-08-21 13:36:49', 16, 90, ''),
(1935, 's1050-3', 0, 'SURF FLORES AMAR F FLORES', 1, '13.00', '60.00', 2, 0, './imgs/WhatsApp Image 2021-08-17 at 11.55.07 (3).jpeg', '2021-08-21 13:43:13', 7, 90, ''),
(1936, 's1045-3', 0, 'SURF PALHA AZUL', 1, '13.00', '60.00', 2, 0, './imgs/SURF ALHA AZUL RETA.jpeg', '2021-08-21 13:44:40', 7, 90, 'T42'),
(1937, 's1003-5', 0, 'SURF FLORES AZUL E VERM', 1, '13.00', '60.00', 1, 0, './imgs/surf flores azul e vermelha.jpeg', '2021-08-21 13:47:03', 7, 90, 'T 46'),
(1938, 's1030-6', 0, 'SURF COQUEIRO F AZUL', 1, '13.00', '60.00', 1, 0, './imgs/WhatsApp Image 2021-08-17 at 11.55.07 (5).jpeg', '2021-08-21 13:48:17', 7, 90, 'T46'),
(1939, 's1005-6', 0, 'SURF VERDE FOLHAS VERDE', 1, '13.00', '60.00', 2, 0, './imgs/WhatsApp Image 2021-08-17 at 11.57.50.jpeg', '2021-08-21 13:49:40', 7, 90, 'T46\r\nT42'),
(1940, 's1055-6', 0, 'SURF VERDE AMARELO LISTRA', 1, '13.00', '60.00', 1, 0, './imgs/SURF AMARELO VERDE LISTRA.jpeg', '2021-08-21 13:50:53', 7, 90, 'T46'),
(1941, 'S21111-5', 0, 'SURF HERING CINZA', 1, '1.00', '48.00', 1, 0, './imgs/SURF CINZA HERING.jpg', '2021-08-21 14:01:02', 7, 90, 'TAM 48'),
(1942, 'S2111-6', 0, 'Surf arco beach', 1, '1.00', '48.00', 1, 1, './imgs/2021-08-21_11_21_57.jpg', '2021-08-21 14:21:57', 4, 90, ''),
(1943, 's1052-5', 0, 'SURF FLORES VERM PERNA', 1, '13.00', '60.00', 0, 0, './imgs/surf flores vermelha na erna.jpeg', '2021-08-21 14:29:31', 7, 90, 'T44'),
(1944, 's1009-1', 0, 'SURF FOLHAS VERDE E AZUL', 1, '13.00', '60.00', 0, 0, './imgs/surf folhas verdes e azul.jpeg', '2021-08-21 14:36:36', 7, 90, 'T44'),
(1945, 'S1156-4', 0, 'Board sea', 1, '1.00', '25.00', 1, 1, './imgs/2021-08-21_11_37_58.jpg', '2021-08-21 14:37:58', 4, 90, ''),
(1949, 'S1155-4', 0, 'Arco beach', 1, '1.00', '28.00', 1, 1, './imgs/2021-08-21_11_41_00.jpg', '2021-08-21 14:41:00', 4, 90, ''),
(1950, 's1021-1', 0, 'SURF COQ LISTRA AMARELO', 1, '13.00', '60.00', 1, 0, './imgs/SURF COQUEIRO LISTRA AMARELO.jpeg', '2021-08-21 14:44:37', 16, 90, 'T42'),
(1951, '048000000002', 0, 'Blusa fem. Brilhe Fashion', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_15_44_55.jpg', '2021-08-23 18:44:55', 4, 0, 'Cor: telha'),
(1952, '048000000002', 0, 'Blusa fem. brilhe fashion', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_15_48_06.jpg', '2021-08-23 18:48:06', 4, 89, 'Cor: telha'),
(1953, '3000102006860', 0, 'Blusa s/manga brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_15_55_56.jpg', '2021-08-23 18:55:56', 4, 89, 'Cor: amarela'),
(1954, '00212441', 0, 'Blusa ml elastec brilhe fashion', 1, '0.00', '80.00', 2, 0, './imgs/2021-08-23_15_59_03.jpg', '2021-08-23 18:59:03', 7, 89, 'Cor: verde musgo \r\nCor: off white'),
(1955, '3000103006623', 0, 'Cropped manga brilhe fashion', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_16_12_07.jpg', '2021-08-23 19:12:07', 4, 89, 'Cor: mostarda'),
(1956, '3000103009716', 0, 'Blusa manga longa brilhe fashion', 1, '0.00', '80.00', 1, 0, './imgs/2021-08-23_16_15_08.jpg', '2021-08-23 19:15:08', 7, 89, 'Cor: rosê '),
(1957, '873000000000', 0, 'Blusa fem. Brilhe fashion', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_16_16_52.jpg', '2021-08-23 19:16:52', 4, 89, 'Cor: verde lima'),
(1958, '757000000003', 0, 'Blusa fem. Brilhe fashion', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_16_21_37.jpg', '2021-08-23 19:21:37', 4, 89, 'Cor: verde bandeira'),
(1959, '541000000008', 0, 'Blusa fem. Brilhe fashion ', 1, '0.00', '80.00', 0, 0, './imgs/2021-08-23_16_23_59.jpg', '2021-08-23 19:23:59', 7, 89, 'Cor: mostarda'),
(1960, '3000103009594', 0, 'Blusa manga longa brilhe fashion', 1, '0.00', '80.00', 0, 0, './imgs/2021-08-23_16_31_40.jpg', '2021-08-23 19:31:40', 7, 89, 'Cor: lavanda'),
(1961, '3000103009396', 0, 'Cropped elastec brilhe fashion', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_16_51_14.jpg', '2021-08-23 19:51:14', 4, 89, 'Cor: azul bic'),
(1962, '3000102009618', 0, 'Blusa traçado brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_16_55_25.jpg', '2021-08-23 19:55:25', 4, 89, ' Cor: Azul jeans '),
(1963, '3000102007539', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_00_33.jpg', '2021-08-23 20:00:33', 4, 89, 'Cor:rosê '),
(1964, '894000000005', 0, 'BRILHE FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_01_51.jpg', '2021-08-23 20:01:51', 4, 89, 'Pink'),
(1965, '3000102009632', 0, 'BRILHE FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_03_27.jpg', '2021-08-23 20:03:27', 4, 89, 'Vinho'),
(1966, '889000000001', 0, 'Brilhe FASHION ', 1, '0.00', '0.00', 1, 1, './imgs/2021-08-23_17_05_04.jpg', '2021-08-23 20:05:04', 4, 89, 'Laranja'),
(1967, '3000102008673', 0, 'Brilhe ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_07_43.jpg', '2021-08-23 20:07:43', 4, 89, 'Marsala'),
(1968, '3000102009588', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_10_56.jpg', '2021-08-23 20:10:56', 4, 89, 'Lavanda'),
(1969, '883000000009', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_13_49.jpg', '2021-08-23 20:13:49', 4, 89, 'Rosê '),
(1970, '871000000006', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 0, 1, './imgs/2021-08-23_17_15_13.jpg', '2021-08-23 20:15:13', 4, 89, ''),
(1971, '3000102006518', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_17_28.jpg', '2021-08-23 20:17:28', 4, 89, 'Off white'),
(1972, '727000000006', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_19_07.jpg', '2021-08-23 20:19:07', 4, 89, 'Verde folha '),
(1973, '3000102009489', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_32_01.jpg', '2021-08-23 20:32:01', 4, 89, 'Vinho'),
(1974, '3000102004705', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_33_38.jpg', '2021-08-23 20:33:38', 4, 89, 'Cereja'),
(1975, '3000102009656', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_35_02.jpg', '2021-08-23 20:35:02', 4, 89, 'Lavanda'),
(1976, '4000102008863', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_36_31.jpg', '2021-08-23 20:36:31', 4, 89, 'Branco'),
(1977, '3000102009250', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_38_10.jpg', '2021-08-23 20:38:10', 4, 89, 'Azul bonde'),
(1978, '684000000002', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_39_21.jpg', '2021-08-23 20:39:21', 4, 89, 'Amarelo'),
(1979, '889000000001', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_40_47.jpg', '2021-08-23 20:40:47', 4, 89, 'Laranja '),
(1980, '3000102008673', 0, 'Brilhe FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_41_55.jpg', '2021-08-23 20:41:55', 4, 89, 'Marsala'),
(1981, '3000102009397', 0, 'BRILHE FASHION ', 1, '0.00', '80.00', 1, 1, './imgs/2021-08-23_17_43_22.jpg', '2021-08-23 20:43:22', 4, 89, 'LAVANDA '),
(1982, '2268', 0, 'Macaquinho social DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_10_11_52.jpg', '2021-08-24 13:11:52', 4, 95, 'Cor: vermelho '),
(1983, '1302', 0, 'Macaquinho social DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_10_14_42.jpg', '2021-08-24 13:14:42', 4, 95, 'Cor: preto'),
(1984, '1682', 0, 'Macaquinho social ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_10_18_19.jpg', '2021-08-24 13:18:19', 4, 95, 'COR: TELHA '),
(1985, '1510', 0, 'Vestido mullet DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_10_21_48.jpg', '2021-08-24 13:21:48', 4, 93, 'Cor: telha'),
(1986, '2371', 0, 'Vestido bela DONATELLA ', 1, '0.00', '128.00', 2, 1, './imgs/2021-08-24_10_24_19.jpg', '2021-08-24 13:24:19', 4, 93, 'COR: vinho'),
(1987, '1910', 0, 'Vestido elza DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_10_27_58.jpg', '2021-08-24 13:27:58', 4, 93, 'Cor: pink'),
(1988, '2423', 0, 'Vestido elza DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_10_29_02.jpg', '2021-08-24 13:29:02', 4, 93, 'Cor: salmao'),
(1989, '1348', 0, 'Conjunto Yasmin DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_10_35_33.jpg', '2021-08-24 13:35:33', 4, 101, 'Cor: verde bebe'),
(1990, '1944', 0, 'Conjunto yasmim DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_10_37_38.jpg', '2021-08-24 13:37:38', 4, 101, 'Cor: off white'),
(1991, '2455', 0, 'Conj. Saia longa blusa ombro a ombro DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_11_50_39.jpg', '2021-08-24 14:50:39', 4, 101, 'Estampado folha verde'),
(1992, '2456', 0, 'Conj. Saia longa blusa ombro a ombro  DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_11_51_49.jpg', '2021-08-24 14:51:49', 4, 101, 'Estampado folha azul'),
(1993, '2457', 0, 'Conj. Saia longa blusa ombro  a ombro DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_11_52_53.jpg', '2021-08-24 14:52:53', 4, 101, 'Estampado folha rosa bebe'),
(1994, '7909386417897', 0, 'Bermuda masc. HERING ', 1, '0.00', '102.00', 6, 1, './imgs/2021-08-24_14_55_44.jpg', '2021-08-24 17:55:44', 4, 90, 'Cor: vinho'),
(1995, '587600840', 0, 'Bermuda masculina young style', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_15_06_01.jpg', '2021-08-24 18:06:01', 4, 90, 'Vinho'),
(1996, '587600840', 0, 'Bermuda masculina young style', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_15_06_04.jpg', '2021-08-24 18:06:04', 4, 90, 'Vinho'),
(1997, '587600840', 0, 'Bermuda masculina young style', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_15_06_15.jpg', '2021-08-24 18:06:15', 4, 90, 'Vinho'),
(1998, '587600836', 0, 'Bermuda masc young style', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_15_10_59.jpg', '2021-08-24 18:10:59', 4, 90, 'Tam 36'),
(1999, '587600838', 0, 'Bermuda mas young style', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_15_12_54.jpg', '2021-08-24 18:12:54', 4, 90, 'Tam 38'),
(2000, '587600842', 0, 'Bermuda mas YOUNG STYLE ', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_15_14_09.jpg', '2021-08-24 18:14:09', 4, 90, 'Tam 42'),
(2001, '587600838', 0, 'Bermuda mas YOUNG STYLE ', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_15_15_32.jpg', '2021-08-24 18:15:32', 4, 90, 'Tam 38'),
(2003, '15124948', 0, 'Bermuda mas YOUNG STYLE ', 1, '0.00', '110.00', 1, 1, './imgs/2021-08-24_15_25_46.jpg', '2021-08-24 18:25:46', 4, 89, 'Jeans tam 38'),
(2004, 'BE34538', 0, 'Bermuda mas YOUNG STYLE ', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-24_15_45_44.jpg', '2021-08-24 18:45:44', 4, 90, 'Tam 38'),
(2005, 'BE34546', 0, 'Bermuda mas YOUNG ', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-24_15_55_21.jpg', '2021-08-24 18:55:21', 4, 90, 'Tam 46'),
(2006, 'BE34540', 0, 'Bermuda mas YOUNG STYLE ', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-24_15_56_55.jpg', '2021-08-24 18:56:55', 4, 90, 'Tam 40'),
(2007, '', 0, '', 1, '0.00', '0.00', 0, 1, './imgs/2021-08-24_16_00_07.jpg', '2021-08-24 19:00:07', 4, 0, ''),
(2008, 'Be34544', 0, 'Bermuda mas YOUNG STYLE ', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-24_16_01_20.jpg', '2021-08-24 19:01:20', 4, 90, 'Tam 44'),
(2010, 'BE34542', 0, 'Bermuda masc.young style', 1, '0.00', '82.00', 2, 0, './imgs/2021-08-24_16_32_32.jpg', '2021-08-24 19:32:32', 7, 90, 'Tam.42'),
(2011, 'BE34442', 0, 'Bermuda masc YOUNG STYLE ', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-24_16_40_59.jpg', '2021-08-24 19:40:59', 4, 90, 'Tam 42'),
(2012, 'BE34438', 0, 'Bermuda masc YOUNG STYLE ', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-24_16_42_18.jpg', '2021-08-24 19:42:18', 4, 90, 'Tam 38'),
(2013, 'BE34446', 0, 'Bermuda masc YOUNG STYLE ', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-24_16_43_35.jpg', '2021-08-24 19:43:35', 4, 90, 'Tam 46'),
(2014, '2402', 0, 'Vestido melissa DONATELLA ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_16_47_40.jpg', '2021-08-24 19:47:40', 4, 93, 'Rosa bebê '),
(2015, '2426', 0, 'Vestido midi manga elástico ', 1, '0.00', '128.00', 1, 1, './imgs/2021-08-24_16_49_24.jpg', '2021-08-24 19:49:24', 4, 93, 'Salmão '),
(2016, 'BE34444', 0, 'Bermuda masc. YOUNG STYLE ', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-24_17_00_24.jpg', '2021-08-24 20:00:24', 4, 90, 'Tam.44'),
(2019, '7909299006560', 0, 'Bermuda Hering masc', 1, '0.00', '103.00', 1, 1, './imgs/2021-08-24_17_03_46.jpg', '2021-08-24 20:03:46', 4, 90, 'Tam 36'),
(2020, '7909299006577', 0, 'Bermuda Hering masc', 1, '0.00', '103.00', 1, 1, './imgs/2021-08-24_17_05_48.jpg', '2021-08-24 20:05:48', 4, 90, 'Tam 38'),
(2021, '577800836', 0, 'Bermuda YOUNG STYLE masc', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_17_10_41.jpg', '2021-08-24 20:10:41', 4, 90, 'Tam 36'),
(2022, '577800840', 0, 'Bermuda YOUNG STYLE masc', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-24_17_12_49.jpg', '2021-08-24 20:12:49', 4, 90, 'Tam 40'),
(2031, 'BE37740', 0, 'Bermuda YOUNG STYLE MASC ', 1, '0.00', '118.00', 2, 1, './imgs/2021-08-24_17_19_21.jpg', '2021-08-24 20:19:21', 4, 90, 'Tam 40'),
(2053, 'BE37744', 0, 'Bermuda masc. Young style', 1, '0.00', '118.00', 4, 1, './imgs/2021-08-24_17_30_07.jpg', '2021-08-24 20:30:07', 4, 90, 'Tam. 44'),
(2054, 'BE37738', 0, 'Bermuda masc.young style', 1, '0.00', '118.00', 1, 1, './imgs/2021-08-25_09_17_07.jpg', '2021-08-25 12:17:07', 4, 90, 'Jeans/ tam.38'),
(2055, 'BE37742', 0, 'Bermuda masc. Young style', 1, '0.00', '118.00', 2, 1, './imgs/2021-08-25_09_18_18.jpg', '2021-08-25 12:18:18', 4, 90, 'Jeans/ tam.42'),
(2056, 'BE37746', 0, 'Bermuda masc. Young STYLE ', 1, '0.00', '118.00', 1, 1, './imgs/2021-08-25_09_19_50.jpg', '2021-08-25 12:19:50', 4, 90, 'Jeans/ tam.46'),
(2057, 'BE37748', 0, 'Bermuda masc. Young STYLE ', 1, '0.00', '118.00', 1, 1, './imgs/2021-08-25_09_21_29.jpg', '2021-08-25 12:21:29', 4, 90, 'Jeans/ tam.48'),
(2058, 'BE37750', 0, 'Bermuda masc. Young STYLE ', 1, '0.00', '118.00', 1, 1, './imgs/2021-08-25_09_22_22.jpg', '2021-08-25 12:22:22', 4, 90, 'Jeans/ tam.50'),
(2059, '20025', 0, 'VESTIDO TULIPS YUNICO', 1, '80.00', '199.00', 1, 0, './imgs/20025.jpg', '2021-08-25 12:48:11', 7, 93, 'TAM. 42\r\nTAM. 44'),
(2060, '20054', 0, 'VESTIDO YUNICO OPLA ', 1, '80.00', '168.00', 1, 0, './imgs/L20054-scaled.jpg', '2021-08-25 12:59:53', 7, 93, 'TAM. 42\r\n'),
(2061, '20054', 0, 'VESTIDO YUNICO OPLA ', 1, '80.00', '168.00', 1, 0, './imgs/L20054-LA-F.jpg', '2021-08-25 13:04:45', 16, 93, 'TAM. 42'),
(2062, '20045', 0, 'VESTIDO TONS TRES YUNICO', 1, '80.00', '220.00', 1, 0, './imgs/L20045-Verde-F.jpg', '2021-08-25 13:19:01', 16, 93, 'TAM.42'),
(2063, '20040', 0, 'VESTIDO LIMITES YUNICO', 1, '80.00', '220.00', 1, 0, './imgs/L20040.jpg', '2021-08-25 13:38:36', 16, 93, 'TAM.42'),
(2064, '20043', 0, 'VESTIDOMIXTRAÇOS YUNICO', 1, '80.00', '220.00', 1, 0, './imgs/L20043-laranja-F.jpg', '2021-08-25 13:40:38', 16, 93, 'TAM.42'),
(2065, '20035', 0, 'Vestido pincel text yunico', 1, '0.00', '220.00', 1, 0, './imgs/2021-08-25_10_50_43.jpg', '2021-08-25 13:50:43', 7, 93, 'Cor: estampa laranja '),
(2066, '20038', 0, 'VESTIDO LISO ESPAÇO YUNICO', 1, '80.00', '140.00', 3, 0, './imgs/L20038.jpg', '2021-08-25 14:01:27', 16, 93, 'ESTAMPA AZUL 40\r\nESTAMPA LARANJA 42\r\nESTAMPA VERDE 44'),
(2067, '20037', 0, 'VESTIDO SUNNY FORMS YUNICO', 1, '80.00', '199.00', 0, 0, './imgs/L20037 (1).jpg', '2021-08-25 14:09:32', 7, 93, 'TAM.40'),
(2068, '20030', 0, 'VESTIDO KIRIN YUNICO', 1, '80.00', '199.00', 1, 0, './imgs/L20030.jpg', '2021-08-25 14:17:57', 16, 93, 'TAM.42'),
(2069, '19117', 0, 'Vestido howmix yunico', 1, '0.00', '178.00', 4, 1, './imgs/2021-08-25_11_52_04.jpg', '2021-08-25 14:52:04', 4, 93, 'Tamanhos: (2) 40/ (2) 42 estampas: rosa, laranja, verde'),
(2070, '18066', 0, 'Vestido larger listr. Yunico', 1, '0.00', '178.00', 1, 1, './imgs/2021-08-25_11_55_46.jpg', '2021-08-25 14:55:46', 4, 93, 'Tam.42 estampa verde e azul'),
(2071, '20037', 0, 'VESTIDO SUNNY FORMS YUNICO', 1, '80.00', '199.00', 1, 0, './imgs/L20037-azul-e-amarelo-F.jpg', '2021-08-25 17:07:06', 16, 93, 'TAM.44'),
(2072, '19105', 0, 'Vestido cream leaves yunico', 1, '0.00', '168.00', 1, 0, './imgs/2021-08-25_14_13_49.jpg', '2021-08-25 17:13:49', 7, 93, 'Tam: 40/44 esrampas: azul/amarelo'),
(2073, '19098', 0, 'Vestido rosas blocos YUNICO', 1, '0.00', '189.00', 1, 0, './imgs/2021-08-25_14_19_01.jpg', '2021-08-25 17:19:01', 7, 93, 'Tam:42 estampa azul bebé '),
(2074, '19107', 0, 'Vestido pontos pink yunico', 1, '0.00', '189.00', 1, 1, './imgs/2021-08-25_14_26_10.jpg', '2021-08-25 17:26:11', 4, 93, 'Tam:40'),
(2075, '18089', 0, 'Vestido anima print yunico', 1, '0.00', '178.00', 1, 1, './imgs/2021-08-25_14_39_45.jpg', '2021-08-25 17:39:45', 4, 93, 'Tam:46'),
(2076, '18050', 0, 'Vestido yelly yunico', 1, '0.00', '178.00', 1, 1, './imgs/2021-08-25_14_41_28.jpg', '2021-08-25 17:41:28', 4, 93, 'Tam: 48'),
(2077, '19149', 0, 'Vestido ornamento ouro', 1, '0.00', '168.00', 1, 1, './imgs/2021-08-25_14_45_11.jpg', '2021-08-25 17:45:11', 4, 93, 'Tam:44'),
(2078, '19038', 0, 'Vestido yunico', 1, '0.00', '178.00', 1, 1, './imgs/2021-08-25_14_47_44.jpg', '2021-08-25 17:47:44', 4, 93, 'Tam:50'),
(2079, '18055', 0, 'Vestido na floresta yunico', 1, '0.00', '178.00', 1, 1, './imgs/2021-08-25_14_50_33.jpg', '2021-08-25 17:50:33', 4, 93, 'Tam:46'),
(2080, '19061', 0, 'Vestido floral luz yunico', 1, '0.00', '199.00', 1, 1, './imgs/2021-08-25_15_00_07.jpg', '2021-08-25 18:00:07', 4, 93, 'Tam: 42'),
(2081, '19052', 0, 'Vestido comp de flores yunico', 1, '0.00', '199.00', 2, 1, './imgs/2021-08-25_17_40_14.jpg', '2021-08-25 20:40:14', 4, 93, 'Tam: 40/42 estampas: marrom/azul'),
(2082, '19088', 0, 'Vestido tropical yunico', 1, '0.00', '168.00', 5, 0, './imgs/2021-08-25_17_58_15.jpg', '2021-08-25 20:58:15', 7, 93, 'Tam: 40/44 estampas variadas'),
(2083, '19100', 0, 'Vestido linho selva yunico', 1, '0.00', '168.00', 5, 1, './imgs/2021-08-25_18_01_56.jpg', '2021-08-25 21:01:56', 4, 93, 'Tam:40/42'),
(2084, '19090', 0, 'Vestido mistura style yunico', 1, '0.00', '168.00', 4, 1, './imgs/2021-08-25_18_04_17.jpg', '2021-08-25 21:04:17', 4, 93, 'Tam:40/44'),
(2085, '7909457135903', 0, 'Bermuda masc. Hering ktvg1gsi', 1, '0.00', '110.00', 2, 0, './imgs/2021-08-26_09_13_55.jpg', '2021-08-26 12:13:55', 7, 90, 'Cor: bege\r\nTAM.48/40'),
(2086, '7909457135903', 0, 'Bermuda masc.hering', 1, '0.00', '110.00', 1, 1, './imgs/2021-08-26_09_18_29.jpg', '2021-08-26 12:18:29', 4, 90, 'Cor: bege  tam:38'),
(2087, '7909457135675', 0, 'Bermuda masc. Hering ktvg1dsi', 1, '0.00', '110.00', 1, 1, './imgs/2021-08-26_09_24_28.jpg', '2021-08-26 12:24:28', 4, 90, 'Tam.46'),
(2088, '7909457135668', 0, 'Bermuda masc.hering ktvg1dsi', 1, '0.00', '110.00', 1, 1, './imgs/2021-08-26_09_26_33.jpg', '2021-08-26 12:26:33', 4, 90, 'Tam: 44'),
(2089, '7909386791065', 0, 'Bermuda masc. Hering', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_09_46_18.jpg', '2021-08-26 12:46:18', 4, 90, 'Tam: 50'),
(2090, '7909386791041', 0, 'Bermuda masc. Hering', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_09_47_44.jpg', '2021-08-26 12:47:44', 4, 90, 'Tam: 46'),
(2091, '7909386791010', 0, 'Bermuda masc. Hering', 1, '0.00', '99.00', 2, 1, './imgs/2021-08-26_09_48_56.jpg', '2021-08-26 12:48:56', 4, 0, 'Tam: 40'),
(2092, '7909386791072', 0, 'Bermuda masc.hering', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_09_49_49.jpg', '2021-08-26 12:49:49', 4, 90, 'Tam: 52'),
(2093, '7909386791058', 0, 'Bermuda masc.hering', 1, '0.00', '99.00', 0, 0, './imgs/2021-08-26_09_54_24.jpg', '2021-08-26 12:54:24', 7, 90, 'Tam: 48'),
(2094, '7909386791027', 0, 'Bermuda masc. Hering', 1, '0.00', '99.00', 2, 1, './imgs/2021-08-26_09_55_20.jpg', '2021-08-26 12:55:20', 4, 90, 'Tam: 42'),
(2097, '7909386272939', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_10_21_41.jpg', '2021-08-26 13:21:41', 4, 90, 'Tam:44'),
(2098, '7909386791003', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 2, 1, './imgs/2021-08-26_10_23_02.jpg', '2021-08-26 13:23:02', 4, 90, 'Tam: 38/44'),
(2099, '7909386272922', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 2, 1, './imgs/2021-08-26_10_24_33.jpg', '2021-08-26 13:24:33', 4, 90, 'Tam: 42'),
(2100, '7909386272908', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_10_25_35.jpg', '2021-08-26 13:25:35', 4, 90, 'Tam:38'),
(2101, '7909386272915', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 2, 1, './imgs/2021-08-26_10_26_43.jpg', '2021-08-26 13:26:43', 4, 90, 'Tam: 40'),
(2102, '7909386272960', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_10_28_01.jpg', '2021-08-26 13:28:01', 4, 90, 'Tam: 50'),
(2103, '7909386272953', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_10_28_53.jpg', '2021-08-26 13:28:53', 4, 90, 'Tam: 48'),
(2104, '7909386272977', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_10_30_05.jpg', '2021-08-26 13:30:05', 4, 90, 'Tam: 52'),
(2105, '7909386272946', 0, 'Bermuda MASC.HERING ', 1, '0.00', '99.00', 1, 1, './imgs/2021-08-26_10_30_57.jpg', '2021-08-26 13:30:57', 4, 90, 'Tam:46'),
(2106, 'BE39538', 0, 'Bermuda masc. Young style', 1, '0.00', '118.00', 1, 1, './imgs/2021-08-26_10_32_42.jpg', '2021-08-26 13:32:42', 4, 90, 'Tam:38'),
(2107, '587700836', 0, 'Bermuda masc. Young style', 1, '0.00', '108.00', 2, 1, './imgs/2021-08-26_10_36_41.jpg', '2021-08-26 13:36:41', 4, 90, 'Ram: 36/46'),
(2108, '574100836', 0, 'Bermuda masc. Young style', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-26_10_40_29.jpg', '2021-08-26 13:40:29', 4, 90, 'Tam: 36'),
(2109, '525400842', 0, 'Betmuda masc. Young style', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-26_10_44_14.jpg', '2021-08-26 13:44:14', 4, 90, 'Tam: 42'),
(2110, '594800840', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/Bermuda jeans masc. young style.jpg', '2021-08-26 14:42:52', 16, 90, 'TAM: 40'),
(2111, '594800838', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/Bermuda jeans masc. young style-1.jpg', '2021-08-26 14:44:07', 16, 90, 'TAM: 38'),
(2112, '594800842', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/Bermuda jeans masc. young style-2.jpg', '2021-08-26 14:45:24', 16, 90, 'TAM: 42'),
(2113, '594800848', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 0, 0, './imgs/Bermuda jeans masc. young style-3.jpg', '2021-08-26 14:46:24', 7, 90, 'TAM: 48'),
(2114, '594800844', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 3, 0, './imgs/Bermuda jeans masc. young style-4.jpg', '2021-08-26 14:47:53', 16, 90, 'TAM: 44'),
(2115, '525400844', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 3, 0, './imgs/Bermuda sarja cargo young style.webp', '2021-08-26 14:55:58', 16, 90, 'TAM: 44'),
(2116, '525400840', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 3, 0, './imgs/Bermuda sarja cargo young style-1.webp', '2021-08-26 14:57:27', 16, 90, 'TAM: 40'),
(2117, '525400848', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/Bermuda sarja cargo young style-2.webp', '2021-08-26 14:58:35', 16, 90, 'TAM: 48'),
(2118, '525400842', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 3, 0, './imgs/Bermuda sarja cargo young style-3.webp', '2021-08-26 15:00:55', 16, 90, 'TAM: 42'),
(2119, '525400846', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 2, 0, './imgs/Bermuda sarja cargo young style-4.webp', '2021-08-26 15:02:10', 16, 90, 'TAM: 46'),
(2120, '525400838', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/Bermuda sarja cargo young style-5.webp', '2021-08-26 15:03:09', 16, 90, 'TAM: 38'),
(2121, '525400850', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/Bermuda sarja cargo young style-6.webp', '2021-08-26 15:04:01', 16, 90, 'TAM: 50'),
(2122, 'BE39550', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/images.jfif', '2021-08-26 18:09:51', 16, 90, 'TAM: 50'),
(2123, 'BE39540', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/images-1.jfif', '2021-08-26 18:10:48', 16, 90, 'TAM: 40'),
(2124, 'BE39546', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 2, 0, './imgs/images-2.jfif', '2021-08-26 18:11:54', 16, 90, 'TAM: 46'),
(2125, 'BE39544', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 2, 0, './imgs/images-3.jfif', '2021-08-26 18:12:41', 16, 90, 'TAM: 44'),
(2126, '574000836', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '108.00', 1, 0, './imgs/4eeebdf8-97ad-4b7b-b198-63f38c74ba4f.jfif', '2021-08-26 18:26:35', 16, 90, 'TAM: 36'),
(2127, '582400838', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '110.00', 1, 0, './imgs/49228c5f-381a-4df6-8a78-63a112bb3ac5.jfif', '2021-08-26 18:35:42', 16, 90, 'TAM: 38'),
(2128, '582400836', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '110.00', 1, 0, './imgs/49228c5f-381a-4df6-8a78-63a112bb3ac5-1.jfif', '2021-08-26 18:36:25', 16, 90, 'TAM: 36'),
(2129, '582400840', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '110.00', 1, 0, './imgs/49228c5f-381a-4df6-8a78-63a112bb3ac5-2.jfif', '2021-08-26 18:37:32', 16, 90, 'TAM: 40'),
(2130, 'BE40448', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/13982968-f7f1-44e8-8563-8fc1dbe32fd0.jfif', '2021-08-26 18:39:20', 7, 90, 'TAM: 48'),
(2131, 'BE40438', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/13982968-f7f1-44e8-8563-8fc1dbe32fd0-1.jfif', '2021-08-26 18:40:36', 16, 90, 'TAM: 38'),
(2132, 'BE40440', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/13982968-f7f1-44e8-8563-8fc1dbe32fd0-2.jfif', '2021-08-26 18:41:37', 16, 90, 'TAM: 40'),
(2133, 'BE40442', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 2, 0, './imgs/13982968-f7f1-44e8-8563-8fc1dbe32fd0-3.jfif', '2021-08-26 18:43:03', 16, 90, 'TAM: 42'),
(2134, 'BE40444', 0, 'BERMUDA MASC. JEANS YOUNG STYLE', 1, '50.00', '118.00', 4, 0, './imgs/13982968-f7f1-44e8-8563-8fc1dbe32fd0-4.jfif', '2021-08-26 18:43:54', 16, 90, 'TAM: 44'),
(2135, 'BE39646', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 2, 0, './imgs/cbdec5b6-08bb-4eb4-a962-0151baf73f4b.jfif', '2021-08-26 18:57:06', 7, 90, 'TAM: 46'),
(2136, 'BE39640', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 2, 0, './imgs/cbdec5b6-08bb-4eb4-a962-0151baf73f4b-1.jfif', '2021-08-26 18:58:51', 16, 90, 'TAM: 40'),
(2137, 'BE39644', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 2, 0, './imgs/cbdec5b6-08bb-4eb4-a962-0151baf73f4b-2.jfif', '2021-08-26 19:00:34', 16, 90, 'TAM: 44'),
(2138, 'BE39642', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 2, 0, './imgs/cbdec5b6-08bb-4eb4-a962-0151baf73f4b-3.jfif', '2021-08-26 19:01:52', 16, 90, 'TAM: 42'),
(2139, 'BE39638', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/cbdec5b6-08bb-4eb4-a962-0151baf73f4b-4.jfif', '2021-08-26 19:02:44', 16, 90, 'TAM: 38'),
(2140, 'BE39650', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 1, 0, './imgs/cbdec5b6-08bb-4eb4-a962-0151baf73f4b-5.jfif', '2021-08-26 19:03:21', 16, 90, 'TAM: 50,00'),
(2141, 'BE39648', 0, 'BERMUDA CARGO MASC. YOUNG STYLE', 1, '50.00', '118.00', 0, 0, './imgs/cbdec5b6-08bb-4eb4-a962-0151baf73f4b-6.jfif', '2021-08-26 19:04:14', 7, 90, 'TAM: 48'),
(2142, 'BE36946', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/fd3b812b-1ff3-4823-8047-b5abb3a57d2b.jfif', '2021-08-26 19:32:36', 16, 90, 'TAM: 46'),
(2143, 'BE36940', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 2, 0, './imgs/fd3b812b-1ff3-4823-8047-b5abb3a57d2b-1.jfif', '2021-08-26 19:33:44', 7, 90, 'TAM: 40'),
(2144, 'BE36942', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 2, 0, './imgs/fd3b812b-1ff3-4823-8047-b5abb3a57d2b-2.jfif', '2021-08-26 19:35:24', 16, 90, 'TAM: 42'),
(2145, 'BE36938', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/fd3b812b-1ff3-4823-8047-b5abb3a57d2b-3.jfif', '2021-08-26 19:36:27', 16, 90, 'TAM: 38'),
(2146, 'BE36944', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 2, 0, './imgs/fd3b812b-1ff3-4823-8047-b5abb3a57d2b-4.jfif', '2021-08-26 19:37:39', 16, 90, 'TAM: 44'),
(2147, 'BE34242', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/15270fc9-04dc-4a65-8208-0036affc4863.jfif', '2021-08-26 19:41:57', 7, 90, 'TAM: 38'),
(2148, 'BE34242', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/15270fc9-04dc-4a65-8208-0036affc4863-1.jfif', '2021-08-26 19:42:52', 16, 90, 'TAM: 40'),
(2149, 'BE34242', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/15270fc9-04dc-4a65-8208-0036affc4863-2.jfif', '2021-08-26 19:43:34', 16, 90, 'TAM: 42'),
(2150, 'BE36744', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 3, 0, './imgs/cb8a9580-2cd5-4c14-bbca-9c7296f4a1e6.jfif', '2021-08-26 19:45:40', 7, 90, 'TAM: 44'),
(2151, 'BE36740', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 2, 0, './imgs/cb8a9580-2cd5-4c14-bbca-9c7296f4a1e6-1.jfif', '2021-08-26 19:46:47', 7, 90, 'TAM: 40'),
(2152, 'BE36738', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/cb8a9580-2cd5-4c14-bbca-9c7296f4a1e6-2.jfif', '2021-08-26 19:47:32', 7, 90, 'TAM: 38'),
(2153, 'BE36742', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 2, 0, './imgs/cb8a9580-2cd5-4c14-bbca-9c7296f4a1e6-3.jfif', '2021-08-26 19:48:29', 16, 90, 'TAM: 42'),
(2155, 'BE34346', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/336d343c-b855-4149-a27d-b39c463e3172.jfif', '2021-08-26 20:40:13', 16, 90, 'TAM: 46'),
(2156, 'BE34342', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/336d343c-b855-4149-a27d-b39c463e3172-1.jfif', '2021-08-26 20:40:55', 16, 90, 'TAM: 42'),
(2157, 'BE34338', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/336d343c-b855-4149-a27d-b39c463e3172-2.jfif', '2021-08-26 20:41:47', 16, 90, 'TAM: 38'),
(2158, 'BE343', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/336d343c-b855-4149-a27d-b39c463e3172-3.jfif', '2021-08-26 20:42:32', 16, 90, 'TAM: 40'),
(2159, 'BE34342', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/336d343c-b855-4149-a27d-b39c463e3172-4.jfif', '2021-08-26 20:43:29', 16, 90, 'TAM: 42'),
(2160, 'BE34138', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/1eaef0ab-9f3c-47d0-99ff-a0d2929a5d6d.jfif', '2021-08-26 20:46:45', 16, 90, 'TAM: 38'),
(2161, 'BE34144', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/1eaef0ab-9f3c-47d0-99ff-a0d2929a5d6d-1.jfif', '2021-08-26 20:47:22', 16, 90, 'TAM: 44'),
(2162, 'BE34140', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 1, 0, './imgs/1eaef0ab-9f3c-47d0-99ff-a0d2929a5d6d-2.jfif', '2021-08-26 20:48:09', 16, 90, 'TAM: 40'),
(2163, 'BE34142', 0, 'BERMUDA MASC. YOUNG STYLE LISTRA', 1, '35.00', '82.00', 2, 0, './imgs/1eaef0ab-9f3c-47d0-99ff-a0d2929a5d6d-3.jfif', '2021-08-26 20:48:50', 16, 90, 'TAM: 42'),
(2164, 'BE36244', 0, 'Bermuda masc. Hering', 1, '0.00', '82.00', 1, 1, './imgs/2021-08-27_09_10_42.jpg', '2021-08-27 12:10:42', 4, 90, 'Tam: 44'),
(2165, '574100838', 0, 'Bermuda cargo masc. Young style', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-27_09_20_20.jpg', '2021-08-27 12:20:20', 4, 90, 'Tam: 38'),
(2167, '00029959', 0, 'BERMUDA MASC. EFF\'S JEANS', 1, '40.00', '94.00', 1, 0, './imgs/d0698b10-846b-4acd-a7e7-5d9598b98c92.jfif', '2021-08-27 13:20:21', 16, 90, 'TAM: 44 AZUL'),
(2168, '00029944', 0, 'BERMUDA MASC. EFF\'S JEANS', 1, '40.00', '94.00', 1, 0, './imgs/1bc4f3e3-f54e-4b34-a315-b8b05b965a2b-1.jfif', '2021-08-27 13:21:23', 7, 90, 'TAM: 42 VERDE'),
(2169, '00029945', 0, 'BERMUDA MASC. EFF\'S JEANS', 1, '40.00', '94.00', 1, 0, './imgs/1bc4f3e3-f54e-4b34-a315-b8b05b965a2b-2.jfif', '2021-08-27 13:31:26', 16, 90, 'TAM: 44 VERDE'),
(2170, '00029538', 0, 'BERMUDA MASC. EFF\'S JEANS', 1, '40.00', '94.00', 1, 0, './imgs/6f7abb4f-fd8d-44aa-b1f6-5b8d05ce5f93.jfif', '2021-08-27 14:40:59', 16, 90, 'TAM: 44'),
(2171, 'BE32100838', 0, 'BERMUDA  MASC. YOUNG STYLE', 1, '40.00', '88.00', 1, 0, './imgs/81bb8601-74a6-4cad-8214-abbd47cdfaaf.jfif', '2021-08-27 14:42:46', 16, 90, 'TAM: 38'),
(2172, 'BE32100842', 0, 'BERMUDA  MASC. YOUNG STYLE', 1, '40.00', '88.00', 1, 0, './imgs/81bb8601-74a6-4cad-8214-abbd47cdfaaf-1.jfif', '2021-08-27 14:44:00', 16, 90, 'TAM: 42'),
(2173, 'BE34638', 0, 'BERMUDA MASC. YOUNG STYLE ', 1, '40.00', '88.00', 1, 0, './imgs/3996a0a5-a80c-449c-b218-ed7ce3b5454b (1).jfif', '2021-08-27 16:52:37', 16, 90, 'TAM: 38'),
(2174, 'BE34640', 0, 'BERMUDA MASC. YOUNG STYLE ', 1, '40.00', '88.00', 1, 0, './imgs/3996a0a5-a80c-449c-b218-ed7ce3b5454b (1)-1.jfif', '2021-08-27 16:54:42', 16, 90, 'TAM: 40'),
(2175, 'BE31840', 0, 'BERMUDA MASC. YOUNG STYLE ', 1, '40.00', '88.00', 1, 0, './imgs/3ae6e7f6-81fb-46f0-be94-9c22bbde9567.jfif', '2021-08-27 16:56:21', 16, 90, 'TAM:40'),
(2176, 'BE31844', 0, 'BERMUDA MASC. YOUNG STYLE ', 1, '40.00', '88.00', 2, 0, './imgs/3ae6e7f6-81fb-46f0-be94-9c22bbde9567-1.jfif', '2021-08-27 16:57:48', 16, 90, 'TAM: 44'),
(2177, 'BE31842', 0, 'BERMUDA MASC. YOUNG STYLE ', 1, '40.00', '88.00', 1, 0, './imgs/3ae6e7f6-81fb-46f0-be94-9c22bbde9567-2.jfif', '2021-08-27 16:58:39', 16, 90, 'TAM: 42'),
(2178, 'BE32038', 0, 'BERMUDA MASC. YOUNG STYLE ', 1, '40.00', '88.00', 1, 0, './imgs/11aaecf1-42d4-4de6-be5e-85ae4f36b5a2.jfif', '2021-08-27 17:17:45', 16, 90, 'TAM: 38'),
(2179, 'BE32046', 0, 'BERMUDA MASC. YOUNG STYLE ', 1, '40.00', '88.00', 1, 0, './imgs/11aaecf1-42d4-4de6-be5e-85ae4f36b5a2-1.jfif', '2021-08-27 17:19:37', 16, 90, 'TAM: 46'),
(2180, 'BE32042', 0, 'BERMUDA MASC. YOUNG STYLE ', 1, '40.00', '88.00', 2, 0, './imgs/11aaecf1-42d4-4de6-be5e-85ae4f36b5a2-2.jfif', '2021-08-27 17:20:27', 16, 90, 'TAM: 42'),
(2181, '7909386273097', 0, 'Bermuda masc. Hering ', 1, '55.00', '110.00', 250, 0, './imgs/a9dceb27-48da-4a8a-a145-7e35dfc9d560.jfif', '2021-10-17 22:20:00', 16, 90, 'TAM: 40'),
(2182, '7909386273110', 0, 'Bermuda masc. Hering ', 1, '55.00', '110.00', 1, 0, './imgs/a9dceb27-48da-4a8a-a145-7e35dfc9d560-1.jfif', '2021-08-27 17:25:24', 16, 90, 'TAM: 44'),
(2183, '2163300001', 0, 'Bermuda jeans biotipo masc.', 1, '0.00', '82.00', 4, 0, './imgs/2021-08-27_15_02_28.jpg', '2021-08-27 18:02:28', 7, 90, 'Tam 42-2/38-1/40-1'),
(2184, '2160700001', 0, 'Bermuda jeans bio tipo masc', 1, '0.00', '89.00', 1, 1, './imgs/2021-08-27_15_06_42.jpg', '2022-01-16 17:20:00', 4, 90, 'Tam 42-2'),
(2185, '7909299005945', 0, 'Bermuda masc. Hering ', 1, '50.00', '109.00', 1, 0, './imgs/69c353dd-5625-4e60-b5a0-37615252ba45.jfif', '2021-08-27 18:10:24', 16, 90, 'TAM: 40'),
(2186, '7909299005945', 0, 'Bermuda masc. Hering ', 1, '50.00', '109.00', 1, 0, './imgs/69c353dd-5625-4e60-b5a0-37615252ba45-1.jfif', '2021-08-27 18:12:35', 16, 90, 'TAM: 38'),
(2187, '7909299667594', 0, 'Bermuda masc. Hering ', 1, '40.00', '88.00', 1, 0, './imgs/35011857-fa0a-4958-beee-19769f93dbd6.jfif', '2021-08-27 18:30:01', 16, 90, 'TAM: 40 BRANCA'),
(2188, '7909386393207', 0, 'Bermuda masc. Hering ', 1, '50.00', '110.00', 2, 0, './imgs/24d837a8-00a0-4abd-807b-32d451c778b8.jfif', '2021-08-27 18:31:02', 16, 90, 'TAM: 44 BRANCA'),
(2189, '7909386393184', 0, 'Bermuda masc. Hering ', 1, '50.00', '110.00', 1, 0, './imgs/24d837a8-00a0-4abd-807b-32d451c778b8-1.jfif', '2021-08-27 18:31:58', 16, 90, 'TAM: 40'),
(2190, '7909386393214', 0, 'Bermuda masc. Hering ', 1, '50.00', '110.00', 3, 0, './imgs/24d837a8-00a0-4abd-807b-32d451c778b8-2.jfif', '2021-08-27 18:34:46', 7, 90, 'TAM: 46'),
(2191, '7909386393191', 0, 'Bermuda masc. Hering ', 1, '50.00', '110.00', 3, 0, './imgs/24d837a8-00a0-4abd-807b-32d451c778b8-3.jfif', '2021-08-27 18:38:27', 16, 90, 'TAM: 42 BRANCA'),
(2192, '7909386393207', 0, 'Bermuda masc. Hering ', 1, '50.00', '110.00', 2, 0, './imgs/24d837a8-00a0-4abd-807b-32d451c778b8-4.jfif', '2021-08-27 18:40:14', 16, 90, 'TAM: 44 BRANCA'),
(2193, '7891235687547', 0, 'BERMUDA MASC. Crocker', 1, '0.00', '62.00', 1, 1, './imgs/2021-08-27_15_50_54.jpg', '2021-08-27 18:50:54', 4, 90, 'Tam 38-1'),
(2194, '7909245479493', 0, 'Bermuda MASC.HERING ', 1, '0.00', '110.00', 1, 1, './imgs/2021-08-27_15_55_23.jpg', '2021-08-27 18:55:23', 4, 90, 'Tam 40-1'),
(2195, '7909173246907', 0, 'BERMUDA MASC.HERING ', 1, '0.00', '85.00', 1, 1, './imgs/2021-08-27_15_59_38.jpg', '2021-08-27 18:59:38', 4, 90, 'Tam 36-1'),
(2196, '7909021217882', 0, 'Bermuda masc hering ', 1, '0.00', '68.00', 1, 1, './imgs/2021-08-27_16_01_55.jpg', '2021-08-27 19:01:55', 4, 90, 'Tam 42-1'),
(2197, '587200838', 0, 'BERMUDA JEANS young ', 1, '0.00', '108.00', 1, 1, './imgs/2021-08-27_16_06_41.jpg', '2021-08-27 19:06:41', 4, 90, 'Tam 38-1'),
(2198, '7909386526100', 0, 'BERMUDA MASC.HERING ', 1, '0.00', '120.00', 1, 1, './imgs/2021-08-27_16_09_01.jpg', '2021-08-27 19:09:01', 4, 90, 'Tam 42-1'),
(2199, '7909386417989', 0, 'Bermuda MASC.HERING ', 1, '0.00', '98.00', 1, 1, './imgs/2021-08-27_16_11_32.jpg', '2021-08-27 19:11:32', 4, 90, 'Tam 36'),
(2200, '01621556', 0, 'Bermuda masc.puccini', 1, '0.00', '52.00', 1, 1, './imgs/2021-08-27_16_16_30.jpg', '2021-08-27 19:16:30', 4, 90, 'Tam 40 -1'),
(2201, '7909299115552', 0, 'Bermuda MASC.HERING ', 1, '0.00', '120.00', 1, 1, './imgs/2021-08-27_16_21_02.jpg', '2021-08-27 19:21:03', 4, 90, 'Tam 46-1'),
(2202, '113415279005', 0, 'BERMUDA madc.top rock', 1, '0.00', '40.00', 1, 1, './imgs/2021-08-27_16_22_37.jpg', '2021-08-27 19:22:37', 4, 90, 'Tam 44-1'),
(2203, '1075', 1075, 'Vestido yunico bordado1075', 1, '100.00', '390.00', 251, 0, './imgs/nude renda.jfif', '2021-08-28 20:23:46', 16, 93, ''),
(2204, '1301100203', 1301100203, 'longo acetinado busto', 1, '100.00', '310.00', 251, 0, './imgs/rosê cetim.jfif', '2021-08-28 20:24:45', 16, 93, ''),
(2205, '1290002703', 1290002703, 'vestido yunico1290002703', 1, '50.00', '380.00', 251, 0, './imgs/Crepe rendado.jfif', '2021-08-28 20:26:30', 16, 93, ''),
(2206, '44211', 44211, 'vestido dourado', 1, '50.00', '268.00', 251, 0, './imgs/dourado.jfif', '2021-08-28 20:55:13', 16, 93, ''),
(2207, '1263101703', 1263101703, 'longo cetim ombro a ombro', 1, '50.00', '320.00', 1, 0, './imgs/cetim verde.jfif', '2021-08-28 20:56:30', 7, 93, ''),
(2208, '1260000903', 1260000903, 'vestido ombro a ombro preto', 1, '50.00', '50.00', 1, 0, './imgs/longo preto.jfif', '2021-08-28 20:58:01', 7, 93, ''),
(2209, '7909457272295', 2147483647, 'FLORAL VERDE BRANCO', 1, '50.00', '79.00', 1, 0, './imgs/FLORAL VERDE BRANCO.jfif', '2021-08-30 13:35:07', 7, 93, 'P'),
(2210, '7909457272325', 2147483647, 'FLORAL VERDE BRANCO', 1, '50.00', '79.00', 1, 0, './imgs/FLORAL VERDE BRANCO-1.jfif', '2021-08-30 13:35:55', 7, 93, 'XG'),
(2211, '7909457272301', 2147483647, 'FLORAL VERDE BRANCO', 1, '50.00', '79.00', 1, 0, './imgs/FLORAL VERDE BRANCO-2.jfif', '2021-08-30 13:37:31', 16, 93, 'M'),
(2212, '10000128301508', 2147483647, 'TUBINHO BRANCO', 1, '50.00', '82.00', 1, 0, './imgs/COTON BRANCO.jfif', '2021-08-30 13:51:02', 7, 93, 'P'),
(2213, '10000128301948', 2147483647, 'TUBINHO AZUL', 1, '50.00', '82.00', 1, 0, './imgs/COTON AZUL.jfif', '2021-08-30 13:52:05', 16, 93, 'GG'),
(2214, '10000246358502', 2147483647, 'VESTIDO LISTRA', 1, '50.00', '78.00', 0, 0, './imgs/REGATA LISTRA.jfif', '2021-08-30 13:53:18', 7, 93, 'P'),
(2215, '10000246358589', 2147483647, 'VESTIDO LISTRA', 1, '50.00', '78.00', 1, 0, './imgs/REGATA LISTRA-1.jfif', '2021-08-30 13:54:16', 16, 93, 'M'),
(2216, '10000246358906', 2147483647, 'VESTIDO MALWEE POA', 1, '50.00', '78.00', 1, 0, './imgs/REGATA POÁ.jfif', '2021-08-30 13:55:48', 16, 93, 'GG'),
(2217, '10000246358758', 2147483647, 'VESTIDO HERING POÁ', 1, '50.00', '78.00', 0, 0, './imgs/REGATA POÁ-1.jfif', '2021-08-30 13:56:56', 7, 93, 'P'),
(2218, '7909173528324', 2147483647, 'TUBINHO HERING', 1, '50.00', '76.00', 1, 0, './imgs/TUBINHO FLORAL VERDE PINK.jfif', '2021-08-30 13:58:00', 16, 93, 'M'),
(2219, '7909173528331', 2147483647, 'TUBINHO HERING', 1, '50.00', '76.00', 1, 0, './imgs/TUBINHO FLORAL VERDE PINK-1.jfif', '2021-08-30 13:58:41', 16, 93, 'G'),
(2220, '7909457272356', 2147483647, 'FLORAL VERMELHO E BRANCO', 1, '50.00', '79.00', 1, 0, './imgs/FLORAL VERMELHO E BRANCO.jfif', '2021-08-30 13:59:56', 16, 93, 'M'),
(2221, '7909457272370', 2147483647, 'FLORAL VERMELHO E BRANCO', 1, '50.00', '79.00', 1, 0, './imgs/FLORAL VERMELHO E BRANCO-1.jfif', '2021-08-30 14:01:03', 16, 93, 'XG'),
(2222, '7909457272370', 2147483647, 'FLORAL VERMELHO E BRANCO', 1, '50.00', '79.00', 1, 0, './imgs/FLORAL VERMELHO E BRANCO-2.jfif', '2021-08-30 14:02:22', 16, 93, 'XG'),
(2223, '10000090947289', 2147483647, 'COTON EVASE', 1, '50.00', '88.00', 1, 0, './imgs/COTON EVASE.jfif', '2021-08-30 14:28:48', 16, 93, 'PP'),
(2224, '10000090947096', 2147483647, 'COTON EVASE', 1, '50.00', '88.00', 1, 0, './imgs/COTON EVASE-1.jfif', '2021-08-30 14:29:30', 16, 93, 'M'),
(2225, 'LM0009148968', 0, 'ANIMAL PRINT HERING', 1, '50.00', '80.00', 2, 0, './imgs/ZEBRA MARROM.jfif', '2021-10-18 21:04:00', 16, 93, 'M'),
(2226, '10000244503971', 2147483647, 'POA VERDE, AZUL, PRETO', 1, '50.00', '129.00', 1, 0, './imgs/POA VERDE, AZUL, PRETO.jfif', '2021-08-30 14:31:56', 16, 93, 'M'),
(2227, '7909299258662', 2147483647, 'FLOR AZUL E PRETO', 1, '50.00', '108.00', 1, 0, './imgs/BRANCO FLOR AZUL.jfif', '2021-08-30 14:33:00', 16, 93, 'G'),
(2228, '7909299258655', 0, 'FLOR AZUL E PRETO', 1, '50.00', '108.00', 1, 0, './imgs/BRANCO FLOR AZUL-1.jfif', '2021-08-30 14:33:48', 16, 93, 'M'),
(2229, '7909299258693', 2147483647, 'MARGARIDA EVASE', 1, '50.00', '108.00', 1, 0, './imgs/MARAGARIDA EVASE.jfif', '2021-08-30 14:35:10', 16, 93, 'M'),
(2230, '7909173205683', 2147483647, 'HERING ANIMAL PRINT', 1, '50.00', '98.00', 1, 0, './imgs/ANIMAL PRINT MANGA.jfif', '2021-08-30 14:37:58', 16, 93, 'P'),
(2231, 'EVASEMALWEE1234', 0, 'EVASE NEON', 1, '50.00', '120.00', 1, 0, './imgs/EVASÊ NEON.jfif', '2021-08-30 14:40:09', 16, 93, 'P'),
(2232, '7909661428563', 2147483647, 'MARGARIDA REGATA', 1, '50.00', '72.00', 1, 0, './imgs/MARGARIDA REGATA.jfif', '2021-08-30 14:41:30', 16, 93, 'GG'),
(2233, '7909661428433', 2147483647, 'POA VERDE, AZUL, PRETO', 1, '50.00', '72.00', 1, 0, './imgs/VERMELHO POA AZUL.jfif', '2021-08-30 14:42:38', 16, 93, 'G'),
(2234, '10000248722889', 2147483647, 'MARGARIDAAZUL MARINHO', 1, '50.00', '78.00', 1, 0, './imgs/FLORAL AZUL MARINHO.jfif', '2021-08-30 14:44:25', 16, 93, 'M\r\n'),
(2235, '7909482081282', 2147483647, 'VERMELHO MARROM', 1, '50.00', '78.00', 1, 0, './imgs/VERMELHO, MARROM.jfif', '2021-08-30 14:46:00', 16, 93, 'G'),
(2236, '7909661959265', 2147483647, 'LISTRA VERTICAL', 1, '50.00', '78.00', 1, 0, './imgs/LISTRA VERTICAL.jfif', '2021-08-30 14:47:17', 16, 93, 'P'),
(2237, '10000225856333', 2147483647, 'MARGARIDA MANGA', 1, '50.00', '87.00', 1, 0, './imgs/MARGARIDA MANGA.jfif', '2021-08-30 14:48:33', 16, 93, 'GG'),
(2238, '7909173528287', 2147483647, 'TUBINHO FRUTA', 1, '50.00', '82.00', 1, 0, './imgs/FRUTAS.jfif', '2021-08-30 14:50:27', 16, 93, 'M'),
(2239, '10000121540665', 2147483647, 'GATINHOS', 1, '50.00', '84.00', 1, 0, './imgs/AZUL ZOO.jfif', '2021-08-30 14:51:24', 16, 93, 'G'),
(2240, '7909218766278', 2147483647, 'VERMELHO LISO', 1, '50.00', '68.00', 1, 0, './imgs/VERMELHO TUBINHO.jfif', '2021-08-30 14:52:26', 16, 93, 'G'),
(2241, '7909442933545', 2147483647, 'FLORAL LARANJA', 1, '50.00', '90.00', 1, 0, './imgs/LARANJA FLORAL.jfif', '2021-08-30 14:53:38', 16, 93, 'G'),
(2242, '7909129125423', 2147483647, 'LISTRA LILAS', 1, '0.00', '59.00', 1, 0, './imgs/LISTRA AZUL, LILÁS.jfif', '2021-08-30 14:54:40', 16, 93, 'G'),
(2243, '10000127439551', 2147483647, 'VERMELHO POA MANGA', 1, '1.00', '84.00', 1, 0, './imgs/ROSA AZUL POA.jfif', '2021-08-30 14:55:45', 16, 93, 'G'),
(2244, '10000240377023', 2147483647, 'LANJA E ROSA', 1, '50.00', '129.00', 1, 0, './imgs/LARANJA E ROSA.jfif', '2021-08-30 14:56:28', 16, 93, 'G'),
(2245, '7909457311642', 2147483647, 'FLORAL AZUL', 1, '50.00', '79.00', 7, 0, './imgs/FLORAL AZUL MARINHO-1.jfif', '2021-08-30 15:00:24', 16, 93, 'XG'),
(2246, '01621516000203', 2147483647, 'VERDE CLARO', 1, '50.00', '85.00', 251, 0, './imgs/LISTRA VERDE CLARO.jfif', '2021-08-30 15:01:29', 16, 93, 'G'),
(2247, '7909299594289', 2147483647, 'MALHA PIQUET', 1, '50.00', '89.00', 12, 0, './imgs/MALHA PIQUET.jfif', '2021-08-30 15:02:36', 16, 93, 'G'),
(2248, '7909299594265', 2147483647, 'MALHA PIQUET', 1, '50.00', '89.00', 1, 0, './imgs/MALHA PIQUET-1.jfif', '2021-08-30 15:03:35', 16, 93, 'P'),
(2249, '7909386345558', 2147483647, 'AZUL CLARO E ESCURO', 1, '50.00', '79.00', 7, 0, './imgs/AZUL CLARO E ESCURO.jfif', '2021-08-30 15:04:46', 16, 93, 'G'),
(2250, '1080', 0, 'VESTIDO YUNIRE FESTA', 1, '100.00', '390.00', 1, 0, './imgs/MARSALA MEIO RENDA.jfif', '2021-08-30 20:24:54', 16, 93, 'TAM. G LONGO VINHO, BUSTO RENDADO'),
(2251, 'VT2020', 0, 'VESTIDO YUNIRE FESTA', 1, '100.00', '390.00', 1, 0, './imgs/MARSALA RENDA.jfif', '2021-08-30 20:27:23', 16, 93, 'TAM. GG, MARSALA LONGO RENDADO'),
(2252, 'VT2021', 0, 'VESTIDO YUNIRE FESTA', 1, '100.00', '320.00', 1, 0, './imgs/PINK OMBRO A OMBRO.jfif', '2021-08-30 20:29:28', 16, 93, 'TAM. G, LONGO PINK OMBRO A OMBRO'),
(2253, '751', 0, 'VESTIDO YUNIRE FESTA', 1, '100.00', '380.00', 1, 0, './imgs/VERDE TODO RENDA.jfif', '2021-08-30 20:35:05', 16, 93, 'TAM. G, VERDE RENDADO'),
(2254, 'C000001', 0, 'CONJUNTO JULIANA GONTIJO ', 1, '75.00', '150.00', 1, 0, './imgs/df31c9e9-a7ff-4a8f-867c-3e71afe9993b.jfif', '2021-08-31 12:00:43', 7, 101, 'TAM: M, SAIA E BLUSA JEANS');
INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`, `aplicacao`) VALUES
(2255, 'VT2022', 0, 'VESTIDO LONGO JULIANA GONTIJO', 1, '65.00', '130.00', 2, 0, './imgs/142c58ef-568b-498d-ab8a-35e3a9746195.jfif', '2021-08-31 12:11:22', 16, 93, 'TAM: M, LONGO C/BOLSO, JEANS CLARO E JEANS ESCURO'),
(2256, 'VT2023', 0, 'VESTIDO LONGO JULIANA GONTIJO', 1, '65.00', '130.00', 3, 0, './imgs/8acf455d-1e35-495f-a557-f7700f15ac81.jfif', '2021-08-31 12:14:31', 16, 93, 'TAM: M, LONGO C/ BABADO, JENAS ESCURO E JEANS CLARO'),
(2257, 'MAC2024', 0, 'MACACÃO JULIANA GONTIJO', 1, '85.00', '170.00', 2, 0, './imgs/012b67e6-2c35-43c2-956b-27387865c7af.jfif', '2021-08-31 12:18:24', 16, 102, 'TAM: M/G,JEANS ESCURO, JEANS CLARO'),
(2258, 'VT2025', 0, 'VESTIDO CURTO JEANS JULIANA GONTIJO', 1, '40.00', '80.00', 2, 0, './imgs/76ff858c-55c8-43b4-955f-8a22e0fee322.jfif', '2021-08-31 12:21:22', 16, 93, 'TAM: M, JEANS ESCURO'),
(2259, 'VT2026', 0, 'VESTIDO TUBINHO JENAS JULIANA GONTIJO', 1, '40.00', '80.00', 4, 0, './imgs/cc82d270-4ce6-4d92-9867-28a999b594ea.jfif', '2021-08-31 12:24:30', 16, 93, 'TAM: M/G, JEANS ESCURO, JEANS CLARO'),
(2260, 'VT2027', 0, 'VESTIDO CURTO JEANS JULIANA GONTIJO', 1, '45.00', '90.00', 0, 0, './imgs/92a634ca-c8b4-4b93-91a5-40cb02297e3e.jfif', '2021-08-31 12:48:09', 7, 93, 'TAM: M, JEANS ESCURO, JEANS CLARO, C/ CINTO(FAIXA)'),
(2261, 'BE100000', 0, 'Bermuda masc. Hering ', 1, '60.00', '120.00', 1, 0, './imgs/220dc08d-34e5-4f86-96c4-78c05ddb5a11.jfif', '2021-08-31 13:21:27', 16, 90, 'TAM: 42 JEANS BASICA'),
(2262, 'BE100001', 0, 'BERMUDA MASC. JEANS BIOTIPO', 1, '60.00', '120.00', 1, 0, './imgs/d447acbb-fc11-4563-8326-dcbb81371974.jfif', '2021-08-31 13:23:25', 16, 90, 'TAM: 38, BARRA DOBRADA'),
(2263, 'BE100002', 0, 'BERMUDA MASC. JEANS HERING', 1, '60.00', '120.00', 1, 0, './imgs/ef26ee16-56c0-4028-9fa3-9c4ee03aa112.jfif', '2021-08-31 13:25:27', 16, 90, 'TAM:42, BARRA DOBRADA'),
(2264, 'BE100003', 0, 'Bermuda masc. Hering ', 1, '45.00', '98.00', 1, 0, './imgs/468175eb-be81-439e-9352-b2341d9124ba.jfif', '2021-08-31 13:28:25', 16, 90, 'TAM: 46, TECIDO, COR: TELHA'),
(2265, '700396', 0, 'Bermuda masc. Hering ', 1, '45.00', '98.00', 1, 0, './imgs/4cfa68aa-bde6-4c61-80d4-52892419f460.jfif', '2021-08-31 13:31:01', 16, 90, 'TAM: M, TECIDO, COS DE ELASTICO'),
(2266, 'BE100004', 0, 'Bermuda masc. Hering ', 1, '60.00', '120.00', 1, 0, './imgs/f1dd43bb-57c9-49bd-97a2-206e67b0e671.jfif', '2021-08-31 13:34:16', 16, 90, 'TAM: 38, JEANS, CARROT'),
(2267, 'BE100005', 0, 'Bermuda masc. Hering ', 1, '55.00', '110.00', 1, 0, './imgs/3e942654-cd06-437e-b8c1-ef7b445018d6.jfif', '2021-08-31 13:36:45', 16, 90, 'TAM: 42, MODELO: CHINO, COR: TELHA'),
(2268, 'BE100006', 0, 'Bermuda masc. Hering ', 1, '50.00', '102.00', 1, 0, './imgs/3944604b-c9ea-4c35-8815-c01110a52a72.jfif', '2021-08-31 13:38:46', 16, 90, 'TAM: 44, MODELO: CHINO, COR: VERDE'),
(2269, 'BE100007', 0, 'BERMUDA MAC. CARGO HERING', 1, '40.00', '89.00', 1, 0, './imgs/6cc1f87f-5679-447b-90b1-ec5bce28ffff.jfif', '2021-08-31 13:42:23', 16, 90, 'TAM; 40, MODELO SLIM'),
(2270, 'BE100008', 0, 'Bermuda masc. Hering ', 1, '44.00', '88.00', 1, 0, './imgs/76e9d2a7-2983-49a3-9a80-80496e4ca178.jfif', '2021-08-31 13:44:05', 16, 90, 'TAM:42, TECIDO, COR: VERDE MUSGO'),
(2271, 'BE100009', 0, 'Bermuda masc. Hering ', 1, '45.00', '92.00', 1, 0, './imgs/0ad760e2-78da-4d13-aeee-d4d3fdef8e5b.jfif', '2021-08-31 13:45:50', 16, 90, 'TAM: 42, BRIM, BARRA DESFIADA'),
(2272, 'BE100010', 0, 'Bermuda masc. Hering ', 1, '55.00', '110.00', 1, 0, './imgs/e9e06c7c-771f-46c6-8bf6-a7d3afba2e84.jfif', '2021-08-31 13:47:54', 16, 90, 'TAM: 44, JEANS CLARO'),
(2273, 'BE100011', 0, 'BERMUDA MASC. JEANS SAWARY', 1, '60.00', '120.00', 1, 0, './imgs/3eebca64-d8b1-4fb1-8243-a61e22e0c33d.jfif', '2021-08-31 13:52:12', 16, 90, 'TAM: 38'),
(2274, 'BE100012', 0, 'Bermuda masc. Hering ', 1, '44.00', '88.00', 1, 0, './imgs/6cc1f87f-5679-447b-90b1-ec5bce28ffff-1.jfif', '2021-08-31 13:55:05', 16, 90, 'TAM:40, TECIDO, MODELO SLIM'),
(2275, '7895632140957', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/75f1632c-c4ea-40a5-81e2-e1e9494cc353.jfif', '2021-08-31 18:17:48', 16, 91, 'TAM: P, COR ROSA'),
(2276, '7895632140971', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/75f1632c-c4ea-40a5-81e2-e1e9494cc353-1.jfif', '2021-08-31 18:19:33', 16, 91, 'TAM: G, COR: ROSA'),
(2277, '7895632140988', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/75f1632c-c4ea-40a5-81e2-e1e9494cc353-2.jfif', '2021-08-31 18:20:46', 16, 91, 'TAM: GG, COR: ROSA'),
(2278, '7895632774770', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/75f1632c-c4ea-40a5-81e2-e1e9494cc353-3.jfif', '2021-08-31 18:21:24', 7, 91, 'TAM: GG, COR: ROSA'),
(2279, '7895632774787', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/75f1632c-c4ea-40a5-81e2-e1e9494cc353-4.jfif', '2021-08-31 18:22:40', 7, 91, 'TAM: EG, COR: ROSA'),
(2280, '7895632774947', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/43de4842-fb62-411d-857f-6091631b998b.jfif', '2021-08-31 18:27:07', 16, 91, 'TAM: P, COR: VERDE BANDEIRA'),
(2281, '7895632141053', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 3, 0, './imgs/43de4842-fb62-411d-857f-6091631b998b-1.jfif', '2021-08-31 18:28:01', 16, 91, 'TAM: P, COR: VERDE BANDEIRA'),
(2282, '7895632774954', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/43de4842-fb62-411d-857f-6091631b998b-2.jfif', '2021-08-31 18:29:49', 16, 91, 'TAM: M, COR: VERDE BANDEIRA'),
(2283, '7895632141060', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/43de4842-fb62-411d-857f-6091631b998b-3.jfif', '2021-08-31 18:30:49', 16, 91, 'TAM: M, COR: VERDE BANDEIRA'),
(2284, '7895632774985', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/43de4842-fb62-411d-857f-6091631b998b-4.jfif', '2021-08-31 18:31:46', 16, 91, 'TAM: EG, COR: VERDE BANDEIRA'),
(2285, '7895632141350', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/2b273ea5-2dc0-4d7b-91a9-528d71553710.jfif', '2021-08-31 18:35:31', 16, 91, 'TAM: P, COR: ROSA PINK'),
(2286, '7895632141374', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 5, 0, './imgs/2b273ea5-2dc0-4d7b-91a9-528d71553710-1.jfif', '2021-08-31 18:36:24', 16, 91, 'TAM: M, COR: ROSA PINK'),
(2287, '7895632141381', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/2b273ea5-2dc0-4d7b-91a9-528d71553710-2.jfif', '2021-08-31 18:37:16', 7, 91, 'TAM: GG, COR: ROSA PINK'),
(2288, '7895632141398', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/2b273ea5-2dc0-4d7b-91a9-528d71553710-3.jfif', '2021-08-31 18:38:03', 7, 91, 'TAM: EG, COR: ROSA PINK'),
(2289, '7895632774879', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/2b273ea5-2dc0-4d7b-91a9-528d71553710-4.jfif', '2021-08-31 18:38:49', 7, 91, 'TAM: GG, COR: ROSA PINK'),
(2290, '7895632141367', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 4, 0, './imgs/2b273ea5-2dc0-4d7b-91a9-528d71553710-5.jfif', '2021-08-31 18:39:53', 16, 91, 'TAM: M, COR: ROSA PINK'),
(2291, '7895632140759', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/dc9c4405-c83c-4faf-82ac-b10bc04ecaaf.jfif', '2021-08-31 18:41:54', 16, 91, 'TAM: P, COR: PRETA'),
(2292, '7895632749662', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/dc9c4405-c83c-4faf-82ac-b10bc04ecaaf-1.jfif', '2021-08-31 18:42:50', 16, 91, 'TAM: M, COR: PRETA'),
(2293, '7895632140766', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 4, 0, './imgs/dc9c4405-c83c-4faf-82ac-b10bc04ecaaf-2.jfif', '2021-08-31 18:44:07', 16, 91, 'TAM: M, COR PRETA'),
(2294, '7895632141206', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/db1a1499-e04e-46da-a350-d13ed8bc1949.jfif', '2021-08-31 18:45:22', 16, 91, 'TAM: P, COR: AMARELA'),
(2295, '7895632140704', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 3, 0, './imgs/f886b351-1069-418f-b92f-d07f73fb3651.jfif', '2021-08-31 18:46:28', 16, 91, 'TAM: P, COR: BRANCA'),
(2296, '7890698992007', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/642b2738-65cd-4dce-9949-f5264ad486bc.jfif', '2021-08-31 18:49:39', 16, 91, 'TAM: M, COR: AZUL MARINHO'),
(2297, '7890698991994', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/642b2738-65cd-4dce-9949-f5264ad486bc-1.jfif', '2021-08-31 18:50:38', 16, 91, 'TAM: P, COR: AZUL MARINHO'),
(2298, '7895632774541', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/642b2738-65cd-4dce-9949-f5264ad486bc-2.jfif', '2021-08-31 18:53:04', 16, 91, 'TAM:P, COR: AZUL MARINHO'),
(2299, '7895632774572', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/642b2738-65cd-4dce-9949-f5264ad486bc-3.jfif', '2021-08-31 18:53:56', 16, 91, 'TAM:GG, COR: AZUL MARINHO'),
(2300, '7895632774589', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/642b2738-65cd-4dce-9949-f5264ad486bc-4.jfif', '2021-08-31 18:54:43', 16, 91, 'TAM: EG, COR: AZUL MARINHO'),
(2301, '7895632774558', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/642b2738-65cd-4dce-9949-f5264ad486bc-5.jfif', '2021-08-31 18:55:45', 16, 91, 'TAM: M, COR: AZUL MARINHO'),
(2302, '7895632140919', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/af710ce5-492b-4712-9109-5c4bb89b92ab.jfif', '2021-08-31 18:57:50', 16, 91, 'TAM: M, COR: BORDO'),
(2303, '7895632140902', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/af710ce5-492b-4712-9109-5c4bb89b92ab-1.jfif', '2021-08-31 18:58:39', 16, 91, 'TAM: P, COR: BORDO'),
(2304, '7895632141022', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/2c6ae50f-a4a8-4ef2-825b-11261dc5671e.jfif', '2021-08-31 19:00:38', 16, 91, 'TAM: G, COR: VERMELHO'),
(2305, '7895632141015', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/2c6ae50f-a4a8-4ef2-825b-11261dc5671e-1.jfif', '2021-08-31 19:01:31', 16, 91, 'TAM: M, COR: VERMELHO'),
(2306, '7895632141008', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/2c6ae50f-a4a8-4ef2-825b-11261dc5671e-2.jfif', '2021-08-31 19:02:23', 16, 91, 'TAM; P, COR: VERMELHO'),
(2307, '7895632141251', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/64874616-1924-40ad-89e4-07a35949282c.jfif', '2021-08-31 19:03:27', 16, 91, 'TAM: P, COR: VERDE CLARO'),
(2308, '7895632141305', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/05596578-3b12-4b2f-837e-466ae409b444.jfif', '2021-08-31 19:04:54', 16, 91, 'TAM: P, COR: AZUL BIC'),
(2309, '7895632141343', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/05596578-3b12-4b2f-837e-466ae409b444-1.jfif', '2021-08-31 19:05:40', 16, 91, 'TAM: EG, COR: AZUL BIC'),
(2310, '7895632141329', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/05596578-3b12-4b2f-837e-466ae409b444-2.jfif', '2021-08-31 19:06:34', 16, 91, 'TAM: G, COR: AZUL BIC'),
(2311, '7895632141176', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/6c7f0f3d-3572-4848-99cb-c285690231b0.jfif', '2021-08-31 19:10:06', 16, 91, 'TAM: G, COR: AZUL'),
(2312, '7895632141183', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 1, 0, './imgs/6c7f0f3d-3572-4848-99cb-c285690231b0-1.jfif', '2021-08-31 19:10:57', 7, 91, 'TAM: GG COR: AZUL'),
(2313, '7895632141169', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 3, 0, './imgs/6c7f0f3d-3572-4848-99cb-c285690231b0-2.jfif', '2021-08-31 19:11:42', 16, 91, 'TAM: M COR: AZUL'),
(2314, '7895632141152', 0, 'CAMISA POLO MASC. POLO GUILHERME LUDWER', 1, '45.00', '92.00', 2, 0, './imgs/6c7f0f3d-3572-4848-99cb-c285690231b0-3.jfif', '2021-08-31 19:12:37', 16, 91, 'TAM: P COR; AZUL'),
(2315, '7895632907659', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/3b7d8d66-3923-4e90-a943-26f845ff56c4.jfif', '2021-08-31 19:35:14', 16, 91, 'TAM: M, COR: BRANCA'),
(2316, '7895632907697', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/37085f90-ed74-4001-872d-f5aa3c47dcff (1).jfif', '2021-08-31 19:36:44', 16, 91, 'TAM: P, COR: PRETA'),
(2317, '7895632907703', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 2, 0, './imgs/37085f90-ed74-4001-872d-f5aa3c47dcff (1)-1.jfif', '2021-08-31 19:39:58', 16, 91, 'TAM: M, COR PRETA'),
(2318, '7895632908045', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/3733878b-fa3c-4921-9e73-eb625e616542.jfif', '2021-08-31 19:41:12', 16, 91, 'TAM: P COR: VERMELHA'),
(2319, '7895632323206', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/7ff0085a-fcc1-4cfa-b1c2-0c12f8efad1a.jfif', '2021-08-31 19:42:04', 16, 91, 'TAM: M COR: BORDO'),
(2320, '7895632908175', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 2, 0, './imgs/7b6dfec2-5c32-41b5-9cbc-24dd97821c31.jfif', '2021-08-31 19:43:14', 16, 91, 'TAM: GG COR: AZUL CLARO'),
(2321, '7895632907789', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/37085f90-ed74-4001-872d-f5aa3c47dcff.jfif', '2021-08-31 20:06:41', 16, 91, 'TAM: EG COR: AZUL MARINHO'),
(2322, '7895632907741', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/37085f90-ed74-4001-872d-f5aa3c47dcff-1.jfif', '2021-08-31 20:08:13', 16, 91, 'TAM: P COR: AZUL MARINHO'),
(2323, '7895632908243', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/e1fb0156-5edf-442f-8c7d-d02c276e5e3b.jfif', '2021-08-31 20:10:36', 16, 91, 'TAM: P COR AZUL BIC'),
(2324, '7895632323398', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/46510310-0029-47d6-b90c-13de9005a6f7.jfif', '2021-08-31 20:16:13', 16, 91, 'TAM: P COR: PINK'),
(2325, '7895632323404', 0, 'CAMISA BÁSICA GUILHERME LUDWER', 1, '30.00', '68.00', 1, 0, './imgs/46510310-0029-47d6-b90c-13de9005a6f7-1.jfif', '2021-08-31 20:17:03', 16, 91, 'TAM: M COR: PINK'),
(2326, '7909386870265', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING.jfif', '2021-08-31 20:21:33', 7, 91, 'TAM: M'),
(2327, '7909386870289', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING-1.jfif', '2021-08-31 20:22:31', 7, 91, 'TAM: XG'),
(2328, '7909386870296', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING-2.jfif', '2021-08-31 20:23:27', 7, 91, 'TAM: XXG'),
(2329, '7909678990558', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING GOLA V NUDE.jfif', '2021-08-31 20:26:10', 7, 91, 'TAM: M'),
(2330, '7909678990565', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING GOLA V NUDE-1.jfif', '2021-08-31 20:28:29', 7, 91, 'TAM: G'),
(2331, '7909678877699', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING GOLA REDONDA NUDE.jfif', '2021-08-31 20:30:37', 7, 91, 'TAM: M'),
(2332, '7909678877705', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING GOLA REDONDA NUDE-1.jfif', '2021-08-31 20:31:43', 7, 91, 'TAM: G'),
(2333, '7909678877712', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING GOLA REDONDA NUDE-2.jfif', '2021-08-31 20:32:48', 7, 91, 'TAM: XG'),
(2334, '7891797321668', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA.jfif', '2021-08-31 20:34:38', 7, 91, 'TAM: P'),
(2335, '7890182271342', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 3, 0, './imgs/BASICA HERING PRETA-1.jfif', '2021-08-31 20:35:29', 7, 91, 'TAM: M\r\nCOR: PRETA\r\nGOLA REDONDA'),
(2338, '7909678894863', 0, 'CAMISA BÁSICA HERING', 1, '40.00', '79.99', 1, 0, './imgs/BASICA HERING PRETA-4.jfif', '2021-08-31 20:39:03', 7, 91, 'TAM: M'),
(2339, '7909678894870', 0, 'CAMISA BÁSICA HERING', 1, '40.00', '79.99', 2, 0, './imgs/BASICA HERING PRETA-5.jfif', '2021-08-31 20:39:58', 7, 91, 'TAM: G'),
(2340, '7909678878061', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING VERMELHA.jfif', '2021-08-31 20:43:06', 7, 91, 'TAM: XG'),
(2341, '7909678878047', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING VERMELHA-1.jfif', '2021-08-31 20:43:54', 7, 91, 'TAM: M'),
(2342, '7909678878054', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING VERMELHA-2.jfif', '2021-08-31 20:44:35', 7, 91, 'TAM: G'),
(2343, '7909678899806', 0, 'CAMISA BÁSICA HERING', 1, '20.00', '39.99', 2, 0, './imgs/BASICA HERING AZUL.jfif', '2021-09-01 11:30:18', 7, 91, 'TAM: M'),
(2344, '7909678899813', 0, 'CAMISA BÁSICA HERING', 1, '20.00', '39.99', 2, 0, './imgs/BASICA HERING AZUL-1.jfif', '2021-09-01 11:32:32', 7, 91, 'TAM: G'),
(2345, '7909678894771', 0, 'CAMISA BÁSICA HERING', 1, '40.00', '79.99', 2, 0, './imgs/BASICA HERING COM BOLSO VERDE MUSGO.jfif', '2021-09-01 11:47:24', 7, 91, 'TAM: G \r\nCOR: VERDE MUSGO\r\nCOM BOLSO'),
(2346, '7890182354571', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 2, 0, './imgs/BASICA HERING BRANCA.jfif', '2021-09-01 11:54:26', 7, 91, 'TAM: XG\r\nCOR: BRANCA\r\nGOLA REDONDA'),
(2347, '7890182354564', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 1, 0, './imgs/BASICA HERING BRANCA-1.jfif', '2021-09-01 11:55:32', 7, 91, 'TAM: G\r\nCOR: BRANCA\r\nGOLA REDONDA'),
(2348, '7890182354557', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 2, 0, './imgs/BASICA HERING BRANCA-2.jfif', '2021-09-01 11:56:20', 7, 91, 'TAM: M\r\nCOR: BRANCA\r\nGOLA REDONDA'),
(2349, '7909678878214', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING FERRUGEM CLARO.jfif', '2021-09-01 12:06:31', 7, 91, 'TAM: XXG\r\nCOR: FERRUGEM CLARO\r\nGOLA REDONDA'),
(2350, '7909678878207', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING FERRUGEM CLARO-1.jfif', '2021-09-01 12:07:28', 7, 91, 'TAM: XG\r\nCOR: FERRUGEM CLARO\r\nGOLA REDONDA'),
(2351, '7909678878191', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING FERRUGEM CLARO-2.jfif', '2021-09-01 12:08:38', 7, 91, 'TAM: G\r\nCOR: FERRUGEM CLARO\r\nGOLA REDONDA'),
(2352, '7909678878184', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING FERRUGEM CLARO-3.jfif', '2021-09-01 12:09:42', 7, 91, 'TAM: M\r\nCOR: FERRUGEM CLARO\r\nGOLA REDONDA'),
(2353, '7890685698400', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 1, 0, './imgs/BASICA HERING CINZA CLARO.jfif', '2021-09-01 12:14:52', 7, 91, 'TAM: M\r\nCOR: CINZA CLARO\r\nGOLA REDONDA'),
(2354, '7890685698417', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 2, 0, './imgs/BASICA HERING CINZA CLARO-1.jfif', '2021-09-01 12:15:50', 7, 91, 'TAM: G\r\nCOR: CINZA CLARO\r\nGOLA REDONDA'),
(2355, '7890685432820', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING CINZA CLARO-2.jfif', '2021-09-01 12:21:46', 7, 91, 'TAM: P\r\nCOR: CINZA CLARO\r\nGOLA REDONDA'),
(2356, '7890685432837', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 3, 0, './imgs/BASICA HERING CINZA CLARO-3.jfif', '2021-09-01 12:23:07', 7, 91, 'TAM: M\r\nCOR: CINZA CLARO\r\nGOLA REDONDA'),
(2357, '7890685432844', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 3, 0, './imgs/BASICA HERING CINZA CLARO-4.jfif', '2021-09-01 12:24:14', 7, 91, 'TAM: G\r\nCOR: CINZA CLARO\r\nGOLA REDONDA'),
(2358, '7890685432851', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING CINZA CLARO-5.jfif', '2021-09-01 12:25:48', 7, 91, 'TAM: XG\r\nCOR; CINZA CALRO\r\nGOLA REDONDA'),
(2359, '7890685432868', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING CINZA CLARO-6.jfif', '2021-09-01 12:26:38', 7, 91, 'TAM: XXG\r\nCOR; CINZA CALRO\r\nGOLA REDONDA'),
(2360, '7909112126185', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING CINZA ESCURO GOLA REDONDA.jfif', '2021-09-01 12:29:26', 7, 91, 'TAM: G\r\nCOR: CINZA ESCURO\r\nGOLA REDONDA'),
(2361, '7909112126178', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 3, 0, './imgs/BASICA HERING CINZA ESCURO GOLA REDONDA-1.jfif', '2021-09-01 12:30:20', 7, 91, 'TAM: M\r\nCOR: CINZA ESCURO\r\nGOLA REDONDA'),
(2362, '7891797321675', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 5, 0, './imgs/BASICA HERING PRETA-6.jfif', '2021-09-01 12:32:50', 7, 91, 'TAQM: M\r\nCOR: PRETA\r\nGOLA REDONDA'),
(2363, '7891797321682', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING PRETA-15.jfif', '2021-09-01 12:33:40', 16, 91, 'TAM: G\r\nCOR: PRETA\r\nGOLA REDONDA'),
(2364, '7891797321699', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 4, 0, './imgs/BASICA HERING PRETA-8.jfif', '2021-10-18 12:29:00', 7, 91, 'TAM: XG\r\nCOR: PRETA\r\nGOLA REDONDA'),
(2365, '7892952132327', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA-9.jfif', '2021-09-01 12:38:12', 7, 91, 'TAM: XXG\r\nCOR: PRETA\r\nGOLA REDONDA'),
(2366, '7909678878122', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING VERDE BANDEIRA GOLA REDONDA.jfif', '2021-09-01 12:41:46', 7, 91, 'TAM: G\r\nCOR: VERDE BANDEIRA\r\nGOLA REDONDA'),
(2367, '7909678878115', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING VERDE BANDEIRA GOLA REDONDA-1.jfif', '2021-09-01 12:43:00', 7, 91, 'TAM: M\r\nCOR: VERDE BANDEIRA\r\nGOLA REDONDA'),
(2368, '7890685698424', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 1, 0, './imgs/BASICA HERING CINZA CLARO-7.jfif', '2021-09-01 12:52:38', 7, 91, 'TAM: XG\r\nCOR: CINZA CLARO\r\nGOLA REDONDA'),
(2369, '7890182271366', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 1, 0, './imgs/BASICA HERING PRETA-10.jfif', '2021-09-01 12:56:48', 7, 91, 'TAM: XG\r\nCOR: PRETA\r\nGOLA REDONDA'),
(2370, '7909245740791', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING AZUL GOLA V.jfif', '2021-09-01 13:00:09', 7, 91, 'TAM: XXG\r\nCOR AZUL\r\nGOLA V'),
(2371, '7909245740432', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING AZUL GOLA REDONDA.jfif', '2021-09-01 13:01:43', 7, 91, 'TAM: XG\r\nCOR AZUL\r\nGOLA REDONDA'),
(2372, '7909112126093', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING AZUL GOLA REDONDA-1.jfif', '2021-09-01 13:03:18', 7, 91, 'TAM: XG\r\nCOR AZUL\r\nGOLA REDONDA'),
(2373, 'CM00009', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/6b882d15-c171-440b-ab1e-57a6a992ee71.jfif', '2021-09-01 13:16:20', 7, 91, 'TAM: XG\r\nGOLA REDONDA\r\nCOR AZUL CLARO'),
(2374, 'LM0009945943', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING LARANJA GOLA REDONDA.jfif', '2021-09-01 13:21:13', 7, 91, 'TAM: XG\r\nCOR LARANJA\r\nGOLA REDONDA'),
(2375, '7909112271199', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING COR TELHA GOLA REDONDA.jfif', '2021-09-01 13:26:41', 7, 91, 'TAM: M\r\nCOR TELHA\r\nGOLA REDONDA'),
(2376, '7909112271212', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING COR TELHA GOLA REDONDA-1.jfif', '2021-09-01 13:39:26', 7, 91, 'TAM: XG\r\nCOR TELHA\r\nGOLA REDONDA'),
(2377, '7909624006173', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/98a0b93c-d2d9-4995-80ca-aeecf523039f.jfif', '2021-09-01 13:44:39', 7, 91, 'TAM: G\r\nESTAMPA VIOLÃO'),
(2378, '7891702906515', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING ROSÊ.jfif', '2021-09-01 14:52:32', 7, 91, 'TAM: XG\r\nCOR ROSÊ\r\nGOLA V'),
(2379, '7909112126116', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING AZUL MARINHO GOLA REDONDA.jfif', '2021-09-01 14:56:03', 7, 91, 'TAM: P\r\nCOR AZUL MARINHO\r\nGOLA REDONDA'),
(2380, '7909112126147', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING AZUL MARINHO GOLA REDONDA-1.jfif', '2021-09-01 14:58:03', 7, 91, 'TAM: XG\r\nCOR AZUL MARINHO\r\nGOLA REDONDA'),
(2381, '7909678456894', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 1, 0, './imgs/BASICA HERING BRANCA GOLA V.jfif', '2021-09-01 15:03:23', 7, 91, 'TAM: M\r\nCOR BRANCA\r\nGOLA V'),
(2382, '7909678456900', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 1, 0, './imgs/BASICA HERING BRANCA GOLA V-1.jfif', '2021-09-01 15:04:20', 7, 91, 'TAM: G\r\nCOR BRANCA\r\nGOLA V'),
(2383, 'CM00008', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING AZUL MARINHO GOLA REDONDA-2.jfif', '2021-09-01 17:00:32', 7, 91, 'TAM: G\r\nCOR AZUL MARINHO\r\nGOLA REDONDA'),
(2384, '7909386141969', 0, 'CAMISA BÁSICA HERING', 1, '28.00', '56.99', 2, 0, './imgs/BASICA HERING PRETA-11.jfif', '2021-09-01 17:19:47', 7, 91, 'TAM: XXG\r\nCOR PRETA\r\nGOLA REDONDA'),
(2385, '7909173596552', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA-12.jfif', '2021-09-01 17:23:12', 7, 91, 'TAM: G\r\nCOR PRETA \r\nGOLA REDONDA'),
(2386, '7909173596545', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING PRETA-13.jfif', '2021-09-01 17:24:27', 7, 91, 'TAM: M\r\nCOR PRETA\r\nGOLA REDONDA'),
(2387, '7909173596538', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA-14.jfif', '2021-09-01 17:27:02', 7, 91, 'TAM: P\r\nCOR PRETA\r\nGOLA REDONDA'),
(2388, '7890999473700', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA GOLA V.jfif', '2021-09-01 17:37:02', 7, 91, 'TAM: P\r\nCOR PRETA\r\nGOLA V'),
(2389, '7890999473717', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING PRETA GOLA V-1.jfif', '2021-09-01 17:40:39', 7, 91, 'TAM: M\r\nCOR PRETA\r\nGOLA V'),
(2390, '7890999473691', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA GOLA V-2.jfif', '2021-09-01 17:43:11', 7, 91, 'TAM: XXG\r\nCOR PRETA \r\nGOLA V'),
(2391, '7894753005893', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA GOLA V-3.jfif', '2021-09-01 17:45:16', 7, 91, 'TAM: XG\r\nCOR PRETA\r\nGOLA V'),
(2392, '7894753005879', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING PRETA GOLA V-4.jfif', '2021-09-01 17:46:46', 7, 91, 'TAM: M\r\nCOR PRETA\r\nGOLA V'),
(2393, '7891702570440', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING PRETA GOLA V-5.jfif', '2021-09-01 17:53:31', 7, 91, 'TAM: G\r\nCOR PRETA\r\nGOLA V'),
(2394, '7891702570433', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA GOLA V-6.jfif', '2021-09-01 17:55:46', 7, 91, 'TAM: M\r\nCOR PRETA\r\nGOLA V'),
(2395, '7890999435166', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA GOLA V-7.jfif', '2021-09-01 17:57:21', 7, 91, 'TAM: P\r\nCOR PRETA\r\nGOLA V'),
(2396, '7890901122115', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA-16.jfif', '2021-09-01 17:59:54', 7, 91, 'TAM: G\r\nCOR PRETA\r\nGOLA REDONDA'),
(2397, '7909245623384', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING ROSA GOLA REDONDA.jfif', '2021-09-01 18:14:23', 7, 91, 'TAM: XXG\r\nCOR ROSA\r\nGOLA REDONDA'),
(2398, '7909245623377', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING ROSA GOLA REDONDA-1.jfif', '2021-09-01 18:15:55', 7, 91, 'TAM: XG\r\nCOR ROSA\r\nGOLA REDONDA'),
(2399, '7909457270840', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING AMARELA GOLA REDONDA.jfif', '2021-09-01 18:28:02', 7, 91, 'TAM: XG\r\nCOR AMARELA\r\nGOLA REDONDA'),
(2400, 'CM100010', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING VERMELHA-3.jfif', '2021-09-01 18:31:58', 7, 91, 'TAM: XG\r\nCOR VERMELHA\r\nGOLA REDONDA'),
(2401, '7909112883361', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/ccfe16d9-3d00-4b99-b727-63daec4bfdb5.jfif', '2021-09-01 18:40:38', 7, 91, 'TAM: XG\r\nGOLA V'),
(2402, '7909678990503', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/00188176-19fa-440f-94b9-35713cde2ed8.jfif', '2021-09-01 18:42:01', 7, 91, 'TAM: G\r\nGOLA V\r\nCOR AZUL CLARO'),
(2403, '7909245439602', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/64380e6f-0bbe-46bc-aee9-b1834269fc3b.jfif', '2021-09-01 18:43:51', 7, 91, 'TAM: XG\r\nGOLA REDONDA'),
(2404, '7909245482370', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/674d55b3-98bf-4284-be17-8eb737059a14.jfif', '2021-09-01 18:45:08', 7, 91, 'TAM: XXG\r\nGOLA REDONDA'),
(2405, 'LM0009882179', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/8b36e1d3-f02a-493b-b19e-8c1015f5c329.jfif', '2021-09-01 18:47:24', 7, 91, 'TAM: XG\r\nGOLA V\r\nCOR VERDE CLARO'),
(2406, '7909457598555', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/752fc877-9b06-4ac8-88e5-b114f5393182.jfif', '2021-09-01 18:49:36', 7, 91, 'TAM: XXG\r\nGOLA REDONDA'),
(2407, '7909173732851', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/02fbe243-a45b-4b1d-87a9-37ac3edce797.jfif', '2021-09-01 18:51:57', 7, 91, 'TAM: XG\r\nGOLA REDONDA\r\nCOR ROSA'),
(2408, '7909245236560', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/752fc877-9b06-4ac8-88e5-b114f5393182-1.jfif', '2021-09-01 18:54:20', 7, 91, 'TAM: XXG\r\nGOLA REDONDA'),
(2409, '7909245575898', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/44a7762c-1ee7-4481-b51a-4b7f27f710b7.jfif', '2021-09-01 18:55:48', 7, 91, 'TAM: XXG\r\nCOR VERMELHO BORDO\r\nGOLA V'),
(2410, '7909021141514', 0, 'CAMISA MASC. HERING', 1, '20.00', '38.00', 0, 0, './imgs/9717c0a6-5963-486e-8246-90e0c7c245b0.jfif', '2021-09-01 19:23:36', 7, 91, 'TAM: M\r\nROSA COM BORDADO'),
(2411, '7909386411598', 0, 'CAMISA MASC. HERING', 1, '32.00', '65.00', 1, 0, './imgs/3d1217c9-f020-4a64-bfd3-14e2e39729f5.jfif', '2021-09-01 19:25:29', 16, 91, 'TAM: XXG'),
(2412, '7909624006838', 0, 'CAMISA MASC. HERING', 1, '30.00', '49.99', 1, 0, './imgs/709bb849-7bfe-4984-bcdd-2a1253ade12f.jfif', '2021-09-01 19:27:04', 7, 91, 'TAM: G\r\nCOR PRETA\r\nESTAMPA CAVEIRA'),
(2413, '7909173441371', 0, 'CAMISA MASC. HERING', 1, '25.00', '45.00', 1, 0, './imgs/a631ada3-8cad-4706-98ea-134d2cf989c9.jfif', '2021-09-01 19:28:44', 16, 91, 'TAM: XXG\r\nCOR AZUL MARINHO'),
(2414, '7909021876348', 0, 'CAMISA MASC. HERING', 1, '19.00', '38.00', 1, 0, './imgs/cb52c7cc-2f9d-46c5-a9dd-beb69e2e79f7.jfif', '2021-09-01 19:30:15', 16, 91, 'TAM: M'),
(2415, '7909173453619', 0, 'CAMISA MASC. HERING', 1, '25.00', '56.00', 1, 0, './imgs/665d9ff6-a31e-4ccd-8774-6333d6c8d113.jfif', '2021-09-01 19:31:28', 16, 91, 'TAM: M'),
(2416, '7909457294556', 0, 'CAMISA MASC. HERING', 1, '30.00', '59.90', 1, 0, './imgs/0b40fdfd-55fa-46ad-ab33-5537edbe43b4.jfif', '2021-09-01 19:33:34', 7, 91, 'TAM: M\r\nCINZA ESTAMPADA'),
(2417, '7909457595110', 0, 'CAMISA MASC. HERING', 1, '25.00', '49.99', 1, 0, './imgs/90e11880-5410-46c6-83f4-3ce68968cf14.jfif', '2021-09-01 19:35:32', 7, 91, 'TAM: XXG'),
(2418, '7909442779051', 0, 'CAMISA MASC. MALWEE', 1, '32.00', '64.00', 1, 0, './imgs/MALWEE LISTRA FINA- GRANDES ABRAÇOS.jfif', '2021-09-01 19:38:37', 16, 91, 'TAM: G\r\nLISTRA FINA'),
(2419, '7909173441234', 0, 'CAMISA BÁSICA HERING', 1, '22.00', '44.00', 1, 0, './imgs/6982df78-17e9-496d-8b1e-de1e1851070e.jfif', '2021-09-01 19:41:33', 16, 91, 'TAM: P'),
(2420, '7909624006821', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/130d9a7d-291a-422d-9b79-4621dd5678af.jfif', '2021-09-01 19:44:12', 7, 91, 'TAM: M'),
(2421, '7909021952301', 0, 'CAMISA MASC. HERING', 1, '22.00', '45.00', 1, 0, './imgs/9c3fae21-3e23-4c6b-9fea-0ac215953417.jfif', '2021-09-01 19:45:39', 16, 91, 'TAM: XXG'),
(2422, 'CM100012', 0, 'CAMISA MASC. HERING', 1, '22.00', '45.00', 1, 0, './imgs/0b6766c8-610f-4836-9b61-c2ad4b9290bc.jfif', '2021-09-01 19:49:57', 16, 91, 'TAM: XXG'),
(2423, '7909021137654', 0, 'CAMISA BÁSICA HERING', 1, '20.00', '39.00', 1, 0, './imgs/BASICA HERING COM BOTÕES NA GOLA.jfif', '2021-09-01 19:53:13', 16, 91, 'TAM: XXG'),
(2424, '7909021085009', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.00', 1, 0, './imgs/BASICA HERING VERMELHA GOLA V.jfif', '2021-09-01 19:58:30', 16, 91, 'TAM: XXG\r\nCOR VERMELHA\r\nGOLA V'),
(2425, '7909245210638', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING VERMELHA GOLA V-1.jfif', '2021-09-01 20:00:52', 16, 91, 'TAM: XXG\r\nCOR VERMELHA\r\nGOLA V'),
(2426, '7909245210621', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING VERMELHA GOLA V-2.jfif', '2021-09-01 20:02:03', 16, 91, 'TAM: XG\r\nCOR VERMELHA\r\nGOLA V'),
(2427, '7909457045295', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.00', 1, 0, './imgs/BASICA HERING PRETA COM LISTRA BRANCA.jfif', '2021-09-01 20:04:37', 16, 91, 'TAM: XG\r\nPRETA C/LISTRA BRANCA\r\nGOLA REDONDA'),
(2428, '7909457045301', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.00', 1, 0, './imgs/BASICA HERING PRETA COM LISTRA BRANCA-1.jfif', '2021-09-01 20:05:59', 16, 91, 'TAM: XXG\r\nPRETA C/LISTRA BRANCA\r\nGOLA REDONDA'),
(2429, '7909457270291', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 1, 0, './imgs/BASICA HERING BRANCA COM LISTRA PRETA.jfif', '2021-09-01 20:10:27', 7, 91, 'TAM: XG\r\nBRANCA C/LISTRA PRETA\r\nGOLA REDONDA'),
(2430, '7909457270307', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 1, 0, './imgs/BASICA HERING BRANCA COM LISTRA PRETA-1.jfif', '2021-09-01 20:11:32', 7, 91, 'TAM: XXG\r\nBRANCA C/LISTRA PRETA\r\nGOLA REDONDA'),
(2431, '7909386850342', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '51.00', 2, 0, './imgs/130d9a7d-291a-422d-9b79-4621dd5678af-1.jfif', '2021-09-01 20:15:10', 7, 91, 'TAM: XG'),
(2432, '7909386850359', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '51.00', 1, 0, './imgs/130d9a7d-291a-422d-9b79-4621dd5678af-2.jfif', '2021-09-01 20:16:15', 16, 91, 'TAM: XXG'),
(2433, '7909661919382', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE VERDE CLARO.jfif', '2021-09-01 20:49:22', 16, 91, 'TAM: GG\r\nCOR VERDE CLARO'),
(2434, '7909661347413', 0, 'CAMISA MASC. BASICA MALWEE', 1, '25.00', '49.00', 1, 0, './imgs/BASICA MALWEE VERDE MUSGO.jfif', '2021-09-01 20:50:52', 16, 91, 'TAM: M'),
(2435, '00463096026563', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE PRETA.jfif', '2021-09-01 20:52:31', 16, 91, 'TAM: P\r\nCOR PRETA\r\nGOLA REDONDA'),
(2436, '7909400726523', 0, 'CAMISA MASC. BASICA MALWEE', 1, '25.00', '49.00', 1, 0, './imgs/BASICA MALWEE PRETA-1.jfif', '2021-09-01 20:54:31', 16, 91, 'TAM: G\r\nCOR PRETA \r\nGOLA REDONDA'),
(2437, '7909400726547', 0, 'CAMISA MASC. BASICA MALWEE', 1, '25.00', '49.00', 1, 0, './imgs/BASICA MALWEE PRETA-2.jfif', '2021-09-01 20:55:33', 16, 91, 'TAM: M\r\nCOR PRETA\r\nGOLA REDONDA'),
(2438, '7909661919337', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE VERMELHA.jfif', '2021-09-01 20:59:05', 16, 91, 'TAM: M\r\nCOR VERMELHA\r\nGOLA REDONDA'),
(2439, '7909661919320', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE VERMELHA-1.jfif', '2021-09-01 21:00:05', 16, 91, 'TAM: GG\r\nCOR VERMELHA \r\nGOLA REDONDA'),
(2440, '7909548693176', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE VERMELHA-2.jfif', '2021-09-01 21:01:22', 16, 91, 'TAM: GG\r\nCOR VERMELHA\r\nGOLA REDONDA'),
(2441, 'CM100013', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE MARROM.jfif', '2021-09-01 21:05:59', 16, 91, 'TAM: G\r\nCOR: MARRON\r\nGOLA REDONDA'),
(2442, '7909129870613', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '38.00', 1, 0, './imgs/BASICA MALWEE CREME.jfif', '2021-09-01 21:08:06', 16, 91, 'TAM: P\r\nGOLA V'),
(2443, '10000123139774', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE AZUL.jfif', '2021-09-01 21:10:08', 16, 91, 'TAM: GG\r\nCOR AZUL\r\nGOLA REDONDA'),
(2444, '7909619692381', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE ROSA.jfif', '2021-09-01 21:14:14', 16, 91, 'TAM: GG\r\nCOR: ROSA\r\nGOLA REDONDA'),
(2445, '7909593787448', 0, 'CAMISA MASC. BASICA MALWEE', 1, '20.00', '40.00', 1, 0, './imgs/BASICA MALWEE BORDO.jfif', '2021-09-01 21:16:05', 16, 91, 'TAM: M\r\nCOR BORDO\r\nGOLA REDONDA'),
(2446, '7909021952271', 0, 'CAMISA MASC. HERING', 1, '22.00', '22.00', 1, 0, './imgs/9c3fae21-3e23-4c6b-9fea-0ac215953417-1.jfif', '2021-09-01 21:19:46', 16, 91, 'TAM: M\r\nCINZA ESCURO C/BOTÕES'),
(2448, '7909173598419', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING BRANCA-4.jfif', '2021-09-02 11:22:05', 7, 91, 'TAM: XG\r\nCOR BRANCA\r\nGOLA REDONDA'),
(2449, '7909173598426', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING BRANCA-5.jfif', '2021-09-02 11:25:22', 7, 91, 'TAM: XXG\r\nCOR BRANCA \r\nGOLA V'),
(2450, 'LM0008399458', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING BRANCA-6.jfif', '2021-09-02 11:27:24', 16, 91, 'TAM: XG\r\nCOR BRANCA\r\nGOLA V'),
(2451, '7909173596620', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING BRANCA-7.jfif', '2021-09-02 11:29:19', 16, 91, 'TAM: XXG\r\nCOR BRANCA\r\nGOLA REDONDA'),
(2452, '7891797750871', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING BRANCA-8.jfif', '2021-09-02 11:31:13', 16, 91, 'TAM: G\r\nCOR BRANCA\r\nGOLA REDONDA'),
(2453, '7892952130873', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING BRANCA-9.jfif', '2021-09-02 11:32:41', 16, 91, 'TAM: XXG\r\nCOR BRANCA\r\nGOLA REDONDA'),
(2454, '7891797750888', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 4, 0, './imgs/BASICA HERING BRANCA-10.jfif', '2021-09-02 11:37:27', 7, 91, 'TAM: M/XG'),
(2455, '7909173596613', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING BRANCA-11.jfif', '2021-09-02 11:40:11', 16, 91, 'TAM: XG\r\nCOR BRANCA\r\nGOLA REDONDA'),
(2456, 'LM0002681027', 0, 'CAMISA BÁSICA HERING', 1, '15.00', '38.00', 9, 0, './imgs/BASICA HERING BRANCA-12.jfif', '2021-09-02 11:43:05', 7, 91, 'TAM: M/G/XG XXG\r\nCOR BRANCA'),
(2457, '7891612509400', 0, 'CAMISA MASC. BASICA MALWEE', 1, '22.00', '45.00', 1, 0, './imgs/30cbf227-377d-4f87-913f-509c0ba308ba.jfif', '2021-09-02 12:49:36', 16, 91, 'TAM: G\r\nGRANDES ABRAÇOS'),
(2458, '7909661577032', 0, 'CAMISA MASC. BASICA MALWEE', 1, '41.00', '82.00', 1, 0, './imgs/7c2539a4-a4d5-4329-ad2b-1da0cb732689.jfif', '2021-09-02 12:51:50', 16, 91, 'TAM: M'),
(2459, '7909129620256', 0, 'CAMISA MASC. BASICA MALWEE', 1, '25.00', '52.00', 1, 0, './imgs/9ac05f7a-3766-4ced-a533-893e87ad5d78.jfif', '2021-09-02 12:53:42', 16, 91, 'TAM: P'),
(2460, '7909619546967', 0, 'CAMISA MASC. BASICA MALWEE', 1, '30.00', '64.00', 1, 0, './imgs/e7ef8641-36f7-4342-a7d9-4f2bea881364.jfif', '2021-09-02 12:56:04', 16, 91, 'TAM: M\r\nGRANDES ABRAÇOS'),
(2461, '7909661348052', 0, 'CAMISA MASC. BASICA MALWEE', 1, '30.00', '64.00', 1, 0, './imgs/935e7cf9-1d6a-4e95-94d8-7ddadba29938.jfif', '2021-09-02 12:58:18', 16, 91, 'TAM: M\r\nGRANDES ABRAÇOS'),
(2462, '7909442987852', 0, 'CAMISA MASC. BASICA MALWEE', 1, '32.00', '65.00', 1, 0, './imgs/d393f195-d8a9-46db-9833-6d727a18c825.jfif', '2021-09-02 13:01:52', 16, 91, 'TAM: GG'),
(2463, '7909661514679', 0, 'CAMISA MASC. BASICA MALWEE', 1, '25.00', '54.00', 1, 0, './imgs/61512749-2f0e-4db7-83eb-427bd0432408.jfif', '2021-09-02 13:04:36', 16, 91, 'TAM: GG'),
(2464, '7909442987715', 0, 'CAMISA MASC. HERING', 1, '30.00', '65.00', 1, 0, './imgs/5b2fbf92-7504-4c6d-8237-ee272773ee0c.jfif', '2021-09-02 13:06:25', 16, 91, 'TAM: M'),
(2465, '7909442903425', 0, 'CAMISA MASC. BASICA MALWEE', 1, '25.00', '58.00', 1, 0, './imgs/0276944a-9e30-4989-9b08-284f09a9813f.jfif', '2021-09-02 13:08:06', 16, 91, 'TAM: P'),
(2466, '7909129620393', 0, 'CAMISA MASC. BASICA MALWEE', 1, '25.00', '58.00', 1, 0, './imgs/8dac0ecd-ed2a-413b-881d-6bbc43001a5c.jfif', '2021-09-02 13:09:36', 16, 91, 'TAM: P'),
(2467, '7909457063763', 0, 'CAMISA POLO MASC. HERING', 1, '50.00', '102.00', 1, 0, './imgs/87c03c45-7f5a-4799-9aff-af0b22df50c9.jfif', '2021-09-02 13:22:11', 16, 91, 'TAM: G\r\nGOLA POLO\r\nLISTRA LARGA BRANCA E AZUL MARINHO'),
(2468, '7909457063770', 0, 'CAMISA POLO MASC. HERING', 1, '50.00', '102.00', 1, 0, './imgs/87c03c45-7f5a-4799-9aff-af0b22df50c9-1.jfif', '2021-09-02 13:23:46', 16, 91, 'TAM: XG\r\nGOLA POLO\r\nLISTRA LARGA BRANCA E AZUL MARINHO'),
(2469, '7909457347924', 0, 'CAMISA POLO MASC. HERING', 1, '50.00', '102.00', 1, 0, './imgs/CAMISA POLO HERING.jfif', '2021-09-02 13:25:24', 16, 91, 'TAM: G\r\nGOLA POLO\r\nLISTRA LARGA VERDE E AZUL MARINHO'),
(2470, '7909457347917', 0, 'CAMISA POLO MASC. HERING', 1, '50.00', '102.00', 1, 0, './imgs/CAMISA POLO HERING-1.jfif', '2021-09-02 13:26:38', 16, 91, 'TAM: M\r\nGOLA POLO\r\nLISTRA LARGA VERDE E AZUL MARINHO'),
(2471, '7909386360827', 0, 'CAMISA POLO MASC. HERING', 1, '45.00', '98.00', 2, 0, './imgs/c1daddc1-a23d-43e9-8e47-648e9d1262bc.jfif', '2021-09-02 13:49:45', 16, 91, 'TAM: M\r\nGOLA POLO'),
(2472, '7909245407342', 0, 'CAMISA POLO MASC. HERING', 1, '44.00', '88.00', 1, 0, './imgs/29ae316b-2678-4978-bc79-53b889629493.jfif', '2021-09-02 13:52:59', 16, 91, 'TAM: P'),
(2473, '7909245407359', 0, 'CAMISA POLO MASC. HERING', 1, '44.00', '88.00', 1, 0, './imgs/29ae316b-2678-4978-bc79-53b889629493-1.jfif', '2021-09-02 13:53:50', 16, 91, 'TAM: M'),
(2474, '7909706050117', 0, 'CAMISA POLO MASC. MALWEE', 1, '38.00', '78.00', 1, 0, './imgs/5bb8249c-4ebb-4a29-922a-92a6672f3400.jfif', '2021-09-02 14:08:20', 7, 91, 'TAM: M'),
(2475, '7909706050100', 0, 'CAMISA POLO MASC. MALWEE', 1, '38.00', '78.00', 1, 0, './imgs/5bb8249c-4ebb-4a29-922a-92a6672f3400-1.jfif', '2021-09-02 14:09:38', 16, 91, 'TAM: GG'),
(2476, '7891612443568', 0, 'CAMISA POLO MASC. MALWEE', 1, '22.00', '48.00', 1, 0, './imgs/5b3052d8-ba41-41d8-85ee-9eb897fd17bf.jfif', '2021-09-02 14:10:37', 16, 91, 'TAM: G'),
(2477, '7909706050155', 0, 'CAMISA POLO MASC. MALWEE', 1, '35.00', '78.00', 0, 0, './imgs/07152441-6e5f-4ad3-822f-c0e97fb96955.jfif', '2021-09-02 14:12:07', 7, 91, 'TAM: GG'),
(2478, '7909661647681', 0, 'CAMISA POLO MASC. MALWEE', 1, '50.00', '105.00', 1, 0, './imgs/59cebb91-be5a-4b23-85bf-95dd6a838a7d.jfif', '2021-09-02 14:13:31', 16, 91, 'TAM: M\r\nGRANDES ABRAÇOS'),
(2479, '7909356221530', 0, 'CAMISA POLO MASC. MALWEE', 1, '44.00', '89.00', 1, 0, './imgs/b3c664d3-b4d7-47b1-acff-73f4a2afbf60.jfif', '2021-09-02 14:14:54', 16, 91, 'TAM: GG'),
(2480, '7909218748373', 0, 'CAMISA POLO MASC. MALWEE', 1, '44.00', '88.00', 1, 0, './imgs/d7d35fa4-195a-4420-9ebb-8317f6b45e14.jfif', '2021-09-02 14:23:54', 16, 91, 'TAM: M'),
(2481, '7909356204847', 0, 'CAMISA POLO MASC. MALWEE', 1, '44.00', '89.00', 1, 0, './imgs/84f7ce50-a4a1-4303-a441-83e9ac1bccac.jfif', '2021-09-02 14:25:08', 16, 91, 'TAM: GG'),
(2482, '7909218752332', 0, 'CAMISA POLO MASC. MALWEE', 1, '44.00', '88.00', 1, 0, './imgs/b142ac9b-55d3-4a6a-8b93-d49808ef553a.jfif', '2021-09-02 14:28:16', 16, 91, 'TAM: GG'),
(2483, '7909218752370', 0, 'CAMISA POLO MASC. MALWEE', 1, '44.00', '88.00', 1, 0, './imgs/29fb9d68-343b-47f6-9e5b-90e48acfdd59.jfif', '2021-09-02 14:30:41', 16, 91, 'TAM: GG'),
(2484, '7909661903619', 0, 'CAMISA POLO MASC. MALWEE', 1, '30.00', '62.00', 1, 0, './imgs/POLO MALWEE LISA BORDO.jfif', '2021-09-02 14:41:39', 16, 91, 'TAM: XGG\r\nGOLA POLO\r\nCOR BORDO'),
(2485, '7909263690818', 0, 'CAMISA POLO MASC. MALWEE', 1, '25.00', '58.00', 1, 0, './imgs/POLO MALWEE LISA COM BOLSO PRETA.jfif', '2021-09-02 14:43:16', 16, 91, 'TAM: M\r\nGOLA POLO C/ BOLSO\r\nCOR PRETA'),
(2486, '7909661903435', 0, 'CAMISA POLO MASC. MALWEE', 1, '30.00', '62.00', 1, 0, './imgs/POLO MALWEE LISA VERMELHA.jfif', '2021-09-02 14:44:48', 16, 91, 'TAM: XGG\r\nGOLA POLO\r\nCOR VERMELHA'),
(2487, '7909661903497', 0, 'CAMISA POLO MASC. MALWEE', 1, '30.00', '62.00', 1, 0, './imgs/POLO MALWEE LISA VERDE CLARO.jfif', '2021-09-02 14:46:16', 16, 91, 'TAM: XGG\r\nGOLA POLO\r\nCOR VERDE AGUA'),
(2488, '10000129658380', 0, 'CAMISA POLO MASC. MALWEE', 1, '25.00', '58.00', 1, 0, './imgs/POLO MALWEE LISA COM BOLSO AZUL MARINHO.jfif', '2021-09-02 14:48:22', 16, 91, 'TAM: GG\r\nGOLA POLO COM BOLSO\r\nCOR AZUL MARINHO'),
(2489, '7909400310722', 0, 'CAMISA POLO MASC. MALWEE', 1, '25.00', '58.00', 1, 0, './imgs/POLO MALWEE LISA COM BOLSO AZUL MARINHO-1.jfif', '2021-09-02 14:49:20', 16, 91, 'TAM: M\r\nGOLA POLO COM BOLSO\r\nCOR AZUL MARINHO'),
(2490, 'C242009GG', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/75148a4a-6e2e-476f-92a9-5a1fafe537d5.jfif', '2021-09-02 17:33:16', 16, 91, 'TAM: GG\r\nGOLA POLO\r\nLISTRA PINK/MESCLA'),
(2491, 'C242008GG', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/f5b7fc44-a433-494d-a067-6ccced7f53e2.jfif', '2021-09-02 17:35:11', 16, 91, 'TAM: GG\r\nGOLA POLO\r\nLISTRA AZUL/MESCLA'),
(2492, 'C257008GG', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/8324b69a-6720-4e6a-893a-16c5f0a82102.jfif', '2021-09-02 17:40:59', 16, 91, 'TAM: GG\r\nGOLA POLO\r\nLISTRA MESCLA/MARROM'),
(2493, 'C259009GG', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/c8e63cd8-3529-4467-b1ef-e34dcc50cf86.jfif', '2021-09-02 17:43:15', 16, 91, 'TAM: GG\r\nGOLA POLO\r\nLISTRA LARGA AZUL/ MARROM\r\nBOLSO'),
(2494, 'C28008G', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/3b3531e5-d5f6-4d02-8e50-87d5f194bdce.jfif', '2021-09-02 17:45:20', 16, 91, 'TAM: G\r\nGOLA POLO\r\nMESCLA/MARROM'),
(2495, 'C28008M', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/3b3531e5-d5f6-4d02-8e50-87d5f194bdce-1.jfif', '2021-09-02 17:48:46', 16, 91, 'TAM: M\r\nGOLA POLO\r\nMARROM/MESCLA'),
(2496, '7895632141084', 0, 'CAMISA POLO MASC. GUILHERME LUDWER', 1, '45.00', '92.00', 251, 0, './imgs/43de4842-fb62-411d-857f-6091631b998b-5.jfif', '2021-09-02 18:01:15', 16, 91, 'TAM: GG\r\nGOLA POLO\r\nCOR VERDE BANDEIRA'),
(2497, 'C257009M', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/c908bc62-b098-40b0-ad28-3de47212247e.jfif', '2021-09-02 18:09:31', 16, 91, 'TAM: M\r\nGOLA POLO \r\nAZUL/ MARROM/VERMELHO\r\nC/BOLSO'),
(2498, '7643008GG', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/3443837d-fd69-4c55-8d9a-74a9c0c535ca.jfif', '2021-09-02 18:14:11', 16, 91, 'TAM: GG'),
(2499, 'C256008GG', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/87c35746-ec48-4365-bc8b-7d4655e38bb4.jfif', '2021-09-02 18:15:33', 7, 91, 'TAM: GG\r\nGOLA POLO\r\nAMARELO/BRANCO\r\nC/BOLSO'),
(2500, 'C256008M', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/87c35746-ec48-4365-bc8b-7d4655e38bb4-1.jfif', '2021-09-02 18:16:51', 16, 91, 'TAM: M\r\nGOLA POLO\r\nAMARELO/BRANCO\r\nC/BOLSO'),
(2501, 'C256009GG', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/ed8931c4-5cb8-4a1c-9a85-ca236f392b58.jfif', '2021-09-02 18:19:23', 16, 91, 'TAM: GG\r\nGOLA POLO\r\nAZUL MARINHO/BRANCO\r\nC/BOLSO'),
(2502, '07654008', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/e88224cc-cb59-428a-8e8e-9376339c9ddd.jfif', '2021-09-02 18:21:42', 16, 91, 'TAM: M\r\nGOLA POLO\r\nBORDO/MESCLA'),
(2503, '07653008', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/c7dd717c-7b5a-4423-82e0-d746d3b9f32f.jfif', '2021-09-02 18:23:51', 16, 91, 'TAM: M\r\nGOLA POLO\r\nAZUL MARINHO/MARROM/MESCLA'),
(2504, 'C260008G3', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/aa1cae37-2534-4157-8674-6007e4647f98.jfif', '2021-09-02 18:30:08', 16, 91, 'TAM: G3\r\nGOLA POLO\r\nAZUL MARINHO/VERMELHO\r\nC/BOLSO'),
(2505, 'C260008G2', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/aa1cae37-2534-4157-8674-6007e4647f98-1.jfif', '2021-09-02 18:31:18', 16, 91, 'TAM: G2\r\nGOLA POLO\r\nAZUL MARINHO/VERMELHO\r\nC/BOLSO'),
(2506, 'C260009G3', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/c0aff078-5baf-4343-bb38-0d737c5ae844.jfif', '2021-09-02 18:32:59', 16, 91, 'TAM: G3\r\nGOLA POLO\r\nPRETO/AMARELO\r\nC/BOLSO'),
(2507, '7659008M', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/a5f7775d-fe43-45f3-8d5c-e3370077eae6.jfif', '2021-09-02 19:06:07', 16, 91, 'TAM: M\r\nGOLA POLO\r\n'),
(2508, '7659008P', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/a5f7775d-fe43-45f3-8d5c-e3370077eae6-1.jfif', '2021-09-02 19:37:34', 16, 91, 'TAM: P\r\nGOLA POLO'),
(2509, '7659008M', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 249, 0, './imgs/e1766822-2dae-426b-a2ff-374bcaf1de85.jfif', '2021-10-18 12:29:00', 16, 91, 'TAM: M\r\nGOLA POLO'),
(2510, '7659008P', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/e1766822-2dae-426b-a2ff-374bcaf1de85-1.jfif', '2021-09-02 19:40:33', 16, 91, 'TAM: P\r\nGOLA POLO'),
(2511, '07656008', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/7bc0a328-cae5-4ff9-a54e-5643acc16800.jfif', '2021-09-02 19:42:22', 16, 91, 'TAM: P\r\nGOLA POLO'),
(2512, '7656008G', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/7bc0a328-cae5-4ff9-a54e-5643acc16800-1.jfif', '2021-09-02 19:43:18', 16, 91, 'TAM: G\r\nGOLA POLO'),
(2513, '07653008', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/aac2bdc7-4338-47fd-b7b8-49fb8177b85f.jfif', '2021-09-02 19:45:06', 16, 91, 'TAM: P\r\nGOLA POLO\r\n'),
(2514, '07656008', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/d0d73e83-d582-47cc-b438-d8e1c4389bda.jfif', '2021-09-02 19:47:08', 16, 91, 'TAM: M\r\nGOLA POLO\r\n'),
(2515, 'C10012P', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/7e2155a8-cc59-4f05-a839-7eec57373943.jfif', '2021-09-02 19:49:22', 16, 91, 'TAM: P\r\nGOLA POLO'),
(2516, '07672008', 0, 'CAMISA POLO MASC. YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/70c9434a-3484-4427-b0b8-9ea144c90433.jfif', '2021-09-02 19:52:36', 16, 91, 'TAM: P\r\nGOLA POLO\r\n');
INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`, `aplicacao`) VALUES
(2517, '7890553226216', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 2, 0, './imgs/b945c5ff-7bdf-4f5b-9153-8513c4959ef0.jfif', '2021-09-03 12:30:46', 16, 91, 'TAM: M\r\nROSA/BRANCO\r\nGOLA POLO'),
(2518, '7890553226209', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 1, 0, './imgs/175f7432-5208-4bf9-83b4-7cad34cd85bc.jfif', '2021-09-03 12:32:12', 16, 91, 'TAM: P\r\nAZUL BIC/VERMELHO\r\nGOLA POLO'),
(2519, '7890553226216', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 1, 0, './imgs/0839ddca-12fc-4697-afca-63d785923fbe.jfif', '2021-09-03 12:34:32', 16, 91, 'TAM: M\r\nGOLA POLO\r\nPRETA'),
(2520, '7890553226209', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 1, 0, './imgs/0839ddca-12fc-4697-afca-63d785923fbe-1.jfif', '2021-09-03 12:35:48', 16, 91, 'TAM: P\r\nGOLA POLO\r\nPRETA'),
(2521, '7890553226223', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 1, 0, './imgs/3b2b1aa7-888e-479c-b688-1c226ad8d5b0.jfif', '2021-09-03 12:37:09', 16, 91, 'TAM: G\r\nGOLA POLO TECIDO\r\nPINK'),
(2522, '7890553226209', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 1, 0, './imgs/791a76d5-4439-476b-9d5c-1a14c51d32b9.jfif', '2021-09-03 12:38:51', 16, 91, 'TAM: P\r\nGOLA POLO\r\nAZUL MARINHO/BORDO'),
(2523, '7890553226209', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 2, 0, './imgs/88621b2c-f2b7-4915-b8df-44b2a36d3007.jfif', '2021-09-03 12:40:31', 16, 91, 'TAM: P\r\nGOLA POLO\r\nAZUL/ LISTRA VERDE'),
(2524, '7890553226216', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 1, 0, './imgs/b999b710-2254-4959-b56f-a0c6c71bd7c3.jfif', '2021-09-03 12:42:24', 16, 91, 'TAM: M\r\nGOLA POLO\r\nAZUL/BRANCO'),
(2525, '7890553226216', 0, 'CAMISA POLO MASC. K & F', 1, '42.00', '84.00', 1, 0, './imgs/9d2642c5-5dcc-4a9a-9bd6-a10891e6b3cf.jfif', '2021-09-03 12:44:09', 16, 91, 'TAM: M\r\nGOLA POLO TECIDO\r\nAZUL C/BORDADO'),
(2526, '7909173344917', 0, 'CAMISA MASC. HERING', 1, '35.00', '76.00', 1, 0, './imgs/CAMISA POLO HERING PRETA 03UDA3J07S.jfif', '2021-09-03 13:07:07', 7, 91, 'TAM: XXG\r\nPRETA\r\nGOLA POLO'),
(2527, '7891702516394', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '72.00', 1, 0, './imgs/CAMISA POLO HERING MESCLA COM LISTRA ROSA E VERDE.jfif', '2021-09-03 13:10:21', 16, 91, 'TAM: P\r\nGOLA POLO\r\nMESCLA C/LISTRA VERDE E ROSA'),
(2528, '7891797605430', 0, 'CAMISA MASC. HERING', 1, '30.00', '65.00', 1, 0, './imgs/CAMISA POLO HERING LISTRA LARGA BORDO E AZUL MARINHO COM BORDADO.jfif', '2021-09-03 13:14:42', 16, 91, 'TAM: P\r\nGOLA POLO\r\nLISTRA LARGA AZUL MARINHO E BORDO\r\nCOM BORDADO'),
(2529, '7909173344917', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '76.00', 1, 0, './imgs/CAMISA POLO HERING 03UDA3J07S.jfif', '2021-09-03 13:20:22', 16, 91, 'TAM: M'),
(2530, '7909112569142', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '76.00', 1, 0, './imgs/4a49275a-3cfe-4d11-8b8f-d9851886ee93.jfif', '2021-09-03 13:45:38', 16, 91, 'TAM: G\r\nGOLA POLO\r\nAZUL MARINHO COM BORDADO'),
(2531, '7909173354497', 0, 'CAMISA POLO MASC. HERING', 1, '30.00', '67.00', 1, 0, './imgs/6430b026-b21a-44a2-bf70-e4a1bc4d1e66.jfif', '2021-09-03 13:47:08', 16, 91, 'TAM: P\r\nGOLA POLO\r\nPRETA'),
(2532, '7891702840949', 0, 'CAMISA POLO MASC. HERING', 1, '30.00', '62.00', 1, 0, './imgs/ad8ba533-a554-4e75-b6f5-887b1ba07066.jfif', '2021-09-03 13:48:47', 16, 91, 'TAM: P\r\nGOLA POLO\r\nMESCLA C/LISTRA BRANCA'),
(2533, '7891702802152', 0, 'CAMISA POLO MASC. HERING', 1, '25.00', '54.00', 1, 0, './imgs/057c4666-bf13-4486-add8-5ed619a619ad.jfif', '2021-09-03 14:15:19', 16, 91, 'TAM: P\r\nGOLA POLO\r\nLISTRA LARGA\r\nAZUL MARINHO/MESCLA/VERDE MUSGO'),
(2534, '7909386409588', 0, 'CAMISA POLO MASC. HERING', 1, '30.00', '68.00', 1, 0, './imgs/b842ce1c-9c4a-4e64-a933-efeb23c67c75.jfif', '2021-09-03 14:17:35', 16, 91, 'TAM: XG\r\nGOLA POLO PRETA\r\nGOLA C/ LISTRA BRANCA'),
(2535, '7909245407397', 0, 'CAMISA POLO MASC. HERING', 1, '44.00', '88.00', 1, 0, './imgs/ae47ecd1-d2ba-4342-aca3-1a86eb0f554d (1).jfif', '2021-09-03 15:45:11', 16, 91, 'TAM: P\r\nGOLA POLO\r\nBORDO'),
(2536, '7891702839431', 0, 'CAMISA POLO MASC. HERING', 1, '33.00', '66.00', 1, 0, './imgs/93455da3-7fd9-4c0a-a791-d1d2b4389f76.jfif', '2021-09-03 15:49:56', 16, 91, 'TAM: P'),
(2537, '7891702567617', 0, 'CAMISA POLO MASC. HERING', 1, '25.00', '54.00', 1, 0, './imgs/970c6a72-08f0-43bc-a0d3-11cb3fed20c1.jfif', '2021-09-03 15:51:30', 16, 91, 'TAM: P'),
(2538, '7891702691367', 0, 'CAMISA POLO MASC. HERING', 1, '25.00', '54.00', 1, 0, './imgs/8e831d8c-6eff-40a9-affb-d076f0c27f78.jfif', '2021-09-03 15:55:17', 16, 91, 'TAM: P'),
(2539, '7891702300559', 0, 'CAMISA POLO MASC. HERING', 1, '25.00', '54.00', 1, 0, './imgs/dfbb4717-19c4-4cd7-93f5-e9ef5b308920.jfif', '2021-09-03 15:57:54', 16, 91, 'TAM: P'),
(2540, '7909021513465', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '78.00', 1, 0, './imgs/79152ff1-b1c6-438b-bc2b-f24a48e1ffd0.jfif', '2021-09-03 17:32:53', 16, 91, 'TAM: P\r\nGOLA POLO'),
(2541, '7890999995288', 0, 'CAMISA POLO MASC. HERING', 1, '25.00', '52.00', 1, 0, './imgs/21e1e07f-7112-4db0-88a6-d6c9b2141d1b.jfif', '2021-09-03 17:35:10', 16, 91, 'TAM: P'),
(2542, '7891702840840', 0, 'CAMISA POLO MASC. HERING', 1, '25.00', '52.00', 1, 0, './imgs/14753f3d-3d54-42dd-bdb4-7a624bcc92bd.jfif', '2021-09-03 17:36:52', 16, 91, 'TAM: P'),
(2543, 'CM10025', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '78.00', 1, 0, './imgs/5934c3c9-f3f8-4818-9e0a-de3051e36255.jfif', '2021-09-03 17:39:55', 16, 91, 'TAM: XXG'),
(2544, '7891702516493', 0, 'CAMISA POLO MASC. HERING', 1, '25.00', '54.00', 1, 0, './imgs/c4426ae4-4269-4e14-a70a-ab6841087f10.jfif', '2021-09-03 17:42:44', 16, 91, 'TAM: P'),
(2545, 'CM10026', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '78.00', 1, 0, './imgs/d97ffdb5-9fec-4f92-80b0-68065557b824.jfif', '2021-09-03 17:45:26', 16, 91, 'TAM: XG\r\nGOLA POLO'),
(2546, '7909173249991', 0, 'CAMISA POLO MASC. HERING', 1, '45.00', '92.00', 1, 0, './imgs/73ef8d29-0e31-406e-9500-5775af767809.jfif', '2021-09-03 17:46:33', 16, 91, 'TAM: P'),
(2547, '7909386010999', 0, 'CAMISA POLO MASC. HERING', 1, '45.00', '96.00', 1, 0, './imgs/b90e3174-3904-4831-8db6-550a5dd43232.jfif', '2021-09-03 18:16:30', 16, 91, 'TAM: P'),
(2548, '7909299751217', 0, 'CAMISA POLO MASC. HERING', 1, '45.00', '89.00', 1, 0, './imgs/ed6dedef-b2da-4057-9d8c-e4bef5ec3b5f (1).jfif', '2021-09-03 18:27:18', 16, 91, 'TAM: XXG'),
(2549, '7909021160119', 0, 'CAMISA POLO MASC. HERING', 1, '30.00', '68.00', 1, 0, './imgs/27d9d8b2-3fc9-4987-837b-461c5d90767e.jfif', '2021-09-03 18:28:41', 16, 91, 'TAM: P'),
(2550, '7890901248921', 0, 'CAMISA POLO MASC. HERING', 1, '20.00', '40.00', 1, 0, './imgs/9723619f-6f69-4622-b4cb-3301f5e8e92b.jfif', '2021-09-03 18:30:14', 16, 91, 'TAM: XG'),
(2551, '7909173032937', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '76.00', 1, 0, './imgs/7a51e895-d87c-4ea9-9c27-67ef118a9770.jfif', '2021-09-03 18:32:00', 16, 91, 'TAM: M'),
(2552, '7909386414070', 0, 'CAMISA POLO MASC. HERING', 1, '44.00', '88.00', 1, 0, './imgs/70c5739e-a471-4c93-a45c-a29f4f2f8d07.jfif', '2021-09-03 18:33:10', 16, 91, 'TAM: XG'),
(2553, '7909173026356', 0, 'CAMISA POLO MASC. HERING', 1, '25.00', '54.00', 1, 0, './imgs/9d78cf97-5f8d-4315-b13d-62d1acca07a4.jfif', '2021-09-03 18:35:28', 16, 91, 'TAM: M'),
(2554, '7909173738259', 0, 'CAMISA POLO MASC. HERING', 1, '30.00', '68.00', 1, 0, './imgs/f7103c89-98fe-48fb-bbca-cd3b3f6697e2.jfif', '2021-09-03 18:37:26', 16, 91, 'TAM: M'),
(2555, '7909245337465', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '78.00', 1, 0, './imgs/18d40b56-761f-459a-b181-c785c59a9c45.jfif', '2021-09-03 18:38:39', 16, 91, 'TAM: M'),
(2556, 'CM10030', 0, 'CAMISA POLO MASC. HERING', 1, '30.00', '62.00', 1, 0, './imgs/ead4941e-182c-4636-98ce-b81a9a062764.jfif', '2021-09-03 18:40:46', 16, 91, 'TAM: M'),
(2557, '7909678863111', 0, 'BLUSA FEM. HERING 4E0V7CEN', 1, '25.00', '49.99', 1, 0, './imgs/fcd1f500-76f2-491b-962d-6d7941382028.jfif', '2021-09-03 19:50:58', 7, 89, 'TAM: M'),
(2558, '7909678863104', 0, 'BLUSA FEM. HERING 4E0V7CEN', 1, '25.00', '49.99', 1, 0, './imgs/fcd1f500-76f2-491b-962d-6d7941382028-1.jfif', '2021-09-03 19:52:01', 16, 89, 'TAM: P'),
(2559, '7909678863128', 0, 'BLUSA FEM. HERING 4E0V7CEN', 1, '25.00', '49.99', 1, 0, './imgs/fcd1f500-76f2-491b-962d-6d7941382028-2.jfif', '2021-09-03 19:53:03', 16, 89, 'TAM: G'),
(2560, '7909678863289', 0, 'BLUSA FEM. HERING 4ENK3AEN', 1, '25.00', '49.99', 1, 0, './imgs/c57682e2-a983-434f-b3a9-15733633cba2.jfif', '2021-09-03 19:54:24', 16, 89, 'TAM: P'),
(2561, '7909678863296', 0, 'BLUSA FEM. HERING 4ENK3AEN', 1, '25.00', '49.99', 1, 0, './imgs/c57682e2-a983-434f-b3a9-15733633cba2-1.jfif', '2021-09-03 19:55:08', 16, 89, 'TAM: M'),
(2562, '7909678863302', 0, 'BLUSA FEM. HERING 4ENK3AEN', 1, '25.00', '49.99', 1, 0, './imgs/c57682e2-a983-434f-b3a9-15733633cba2-2.jfif', '2021-09-03 19:55:41', 16, 89, 'TAM: G'),
(2563, '7909588421869', 0, 'BLUSA FEM. HERING 4EZVN10EN', 1, '30.00', '59.00', 1, 0, './imgs/f24a7883-6bcb-4151-bab7-8497b2221b3d.jfif', '2021-09-03 19:57:05', 7, 89, 'TAM: G\r\nDISPONIVEL NO PRETO'),
(2564, '7909588421852', 0, 'BLUSA FEM. HERING 4EZVN10EN', 1, '25.00', '30.00', 1, 0, './imgs/f24a7883-6bcb-4151-bab7-8497b2221b3d-1.jfif', '2021-09-03 20:03:26', 16, 89, 'TAM: M\r\nDISPONIVEL NO PRETO'),
(2565, '7909588421845', 0, 'BLUSA FEM. HERING 4EZVN10EN', 1, '30.00', '59.00', 1, 0, './imgs/f24a7883-6bcb-4151-bab7-8497b2221b3d-2.jfif', '2021-09-03 20:04:51', 16, 89, 'TAM: P\r\nDISPONIVEL NO PRETO'),
(2566, '7909678862824', 0, 'BLUSA FEM. HERING 4E0V7DEN', 1, '25.00', '49.99', 1, 0, './imgs/9354d44b-edaa-411d-a005-0740e45a2706.jfif', '2021-09-03 20:06:03', 16, 89, 'TAM: G'),
(2567, '7909678862800', 0, 'BLUSA FEM. HERING 4E0V7DEN', 1, '25.00', '49.99', 1, 0, './imgs/9354d44b-edaa-411d-a005-0740e45a2706-1.jfif', '2021-09-03 20:07:33', 16, 89, 'TAM: P'),
(2568, '7909678862817', 0, 'BLUSA FEM. HERING 4E0V7DEN', 1, '25.00', '49.99', 1, 0, './imgs/9354d44b-edaa-411d-a005-0740e45a2706-2.jfif', '2021-09-03 20:08:10', 16, 89, 'TAM: M'),
(2569, '7909457168734', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 1, 0, './imgs/672245c5-aee0-4f83-9add-046619e1b9d2.jfif', '2021-09-03 20:14:52', 7, 91, 'TAM: G'),
(2570, '7909457168727', 0, 'CAMISA POLO MASC. HERING', 1, '30.00', '69.99', 1, 0, './imgs/672245c5-aee0-4f83-9add-046619e1b9d2-1.jfif', '2021-09-03 20:15:56', 7, 91, 'TAM: M'),
(2571, '7890685382385', 0, 'CAMISA BÁSICA HERING', 1, '20.00', '39.99', 2, 0, './imgs/ea9c35ee-282c-44ba-ab19-504f8023f089.jfif', '2021-09-03 20:18:00', 7, 91, 'TAM: G'),
(2572, '7890685382378', 0, 'CAMISA BÁSICA HERING', 1, '20.00', '39.99', 2, 0, './imgs/ea9c35ee-282c-44ba-ab19-504f8023f089-1.jfif', '2021-09-03 20:19:13', 7, 91, 'TAM: M'),
(2573, '7909678456849', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 2, 0, './imgs/e6609b64-3783-4fad-9822-3e3e7414b1a6.jfif', '2021-09-03 20:21:48', 7, 91, 'TAM: M\r\nCOTTON\r\nPRETA'),
(2574, '7909678456856', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 2, 0, './imgs/e6609b64-3783-4fad-9822-3e3e7414b1a6-1.jfif', '2021-09-03 20:23:25', 7, 91, 'TAM: G\r\nCOTTON\r\nPRETA'),
(2575, '7909678878566', 0, 'CAMISA BÁSICA HERING', 1, '30.00', '59.99', 2, 0, './imgs/e6609b64-3783-4fad-9822-3e3e7414b1a6-2.jfif', '2021-09-03 20:24:40', 7, 91, 'TAM: XG\r\nCOTTON\r\nDISPONIVEL NO VERDE'),
(2576, '7909386873969', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 2, 0, './imgs/BASICA HERING PRETA GOLA V-8.jfif', '2021-09-03 20:27:09', 16, 91, 'TAM: M\r\nDISPONIVEL NO VERDE MUSGO'),
(2577, '7909386873983', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA GOLA V-9.jfif', '2021-09-03 20:28:41', 7, 91, 'TAM: XG\r\nDISPONIVEL NO VERDE MUSGO'),
(2578, '7909386873976', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/BASICA HERING PRETA GOLA V-10.jfif', '2021-09-03 20:29:40', 16, 91, 'TAM: G\r\nDISPONIVEL NO VERDE MUSGO'),
(2579, '7909678904012', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 1, 0, './imgs/44e54a7f-611b-4e61-a3bc-844770fa083f.jfif', '2021-09-03 20:38:10', 7, 91, 'TAM: P'),
(2580, '7909678904029', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 1, 0, './imgs/44e54a7f-611b-4e61-a3bc-844770fa083f-1.jfif', '2021-09-03 20:39:21', 7, 91, 'TAM: M'),
(2581, '7909678904036', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 0, 0, './imgs/44e54a7f-611b-4e61-a3bc-844770fa083f-2.jfif', '2021-09-03 20:40:35', 7, 91, 'TAM: G'),
(2582, '7909678904067', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 1, 0, './imgs/f48f3b98-af2e-4e76-99bb-3477270bb58b.jfif', '2021-09-03 20:42:55', 7, 91, 'TAM: P'),
(2583, '7909678904074', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 1, 0, './imgs/f48f3b98-af2e-4e76-99bb-3477270bb58b-1.jfif', '2021-09-03 20:43:57', 7, 91, 'TAM: M'),
(2584, '7909678904081', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 1, 0, './imgs/f48f3b98-af2e-4e76-99bb-3477270bb58b-2.jfif', '2021-09-03 20:44:54', 7, 91, 'TAM: G'),
(2585, '7909299007635', 0, 'Camisa polo masc. HERING ', 1, '0.00', '89.00', 1, 1, './imgs/2021-09-06_09_19_23.jpg', '2021-09-06 12:19:23', 4, 91, 'Tam: p'),
(2586, '7890999780075', 0, 'Camisa polo masc. Hering', 1, '0.00', '52.00', 1, 1, './imgs/2021-09-06_09_22_52.jpg', '2021-09-06 12:22:52', 4, 91, 'Tam: p'),
(2587, '7890999135523', 0, 'Camisa polo masc. HERING ', 1, '0.00', '52.00', 1, 1, './imgs/2021-09-06_09_25_38.jpg', '2021-09-06 12:25:38', 4, 91, 'Tam: p'),
(2588, '7909021537461', 0, 'Camisa polo masc. HERING ', 1, '0.00', '82.00', 1, 1, './imgs/2021-09-06_09_27_16.jpg', '2021-09-06 12:27:16', 4, 91, 'Tam: P'),
(2589, '7909021833846', 0, 'Camisa polo masc. Hering', 1, '0.00', '76.00', 1, 1, './imgs/2021-09-06_09_43_26.jpg', '2021-09-06 12:43:27', 4, 91, 'Tam: p'),
(2590, '7890999853397', 0, 'Camisa polo MASC.HERING ', 1, '0.00', '54.00', 1, 1, './imgs/2021-09-06_09_45_01.jpg', '2021-09-06 12:45:01', 4, 91, 'Tam: p'),
(2591, '7909386408147', 0, '', 1, '0.00', '78.00', -2, 1, './imgs/2021-09-06_09_46_37.jpg', '2022-01-11 22:41:00', 4, 91, 'Tam: xxg'),
(2592, '7909386407997', 0, 'Camisa polo MASC.HERING ', 1, '0.00', '76.00', 1, 1, './imgs/2021-09-06_09_48_52.jpg', '2021-09-06 12:48:52', 4, 91, 'Tam: xxg'),
(2593, '7909299252875', 0, 'Camisa polo masc. Hering', 1, '0.00', '92.00', 1, 1, './imgs/2021-09-06_09_50_42.jpg', '2021-09-06 12:50:42', 4, 91, 'Tam: p'),
(2594, '7891702516295', 0, 'Camisa polo masc. Hering', 1, '0.00', '68.00', 1, 1, './imgs/2021-09-06_09_52_18.jpg', '2021-09-06 12:52:18', 4, 91, 'Tam: p'),
(2595, '7891702919201', 0, 'Camisa polo MASC.HERING ', 1, '0.00', '54.00', 1, 1, './imgs/2021-09-06_09_54_35.jpg', '2021-09-06 12:54:35', 4, 91, 'Tam: p'),
(2596, '7890901299466', 0, 'Camisa polo MASC.HERING ', 1, '0.00', '66.00', 1, 1, './imgs/2021-09-06_11_05_44.jpg', '2021-09-06 14:05:44', 4, 91, 'Tam: p'),
(2597, '7891702840246', 0, 'Camisa polo MASC.HERING ', 1, '0.00', '69.00', 1, 1, './imgs/2021-09-06_11_07_11.jpg', '2021-09-06 14:07:11', 4, 91, 'Tam: p'),
(2598, '7909173386436', 0, 'Camisa polo masc.hering', 1, '0.00', '88.00', 1, 1, './imgs/2021-09-06_11_09_13.jpg', '2021-09-06 14:09:13', 4, 91, 'Tam: g'),
(2599, '7909245631969', 0, 'Camisa polo masc. HERING ', 1, '0.00', '72.00', 1, 1, './imgs/2021-09-06_11_15_56.jpg', '2021-09-06 14:15:56', 4, 91, 'Tam: p'),
(2600, '7891702919300', 0, 'Camisa polo masc. HERING ', 1, '0.00', '54.00', 1, 1, './imgs/2021-09-06_11_17_30.jpg', '2021-09-06 14:17:30', 4, 91, 'Tam: p'),
(2601, '7891702549873', 0, 'Camisa polo masc. HERING ', 1, '0.00', '68.00', 1, 1, './imgs/2021-09-06_11_19_13.jpg', '2021-09-06 14:19:13', 4, 91, 'Tam: p'),
(2602, '7909021194749', 0, 'Camisa polo masc. HERING ', 1, '0.00', '62.00', 1, 1, './imgs/2021-09-06_11_21_23.jpg', '2021-09-06 14:21:24', 4, 91, 'Tam: p'),
(2603, 'Cm10032', 0, 'Camisa polo masc. HERING ', 1, '0.00', '66.00', 1, 1, './imgs/2021-09-06_11_27_01.jpg', '2021-09-06 14:27:01', 4, 91, 'Tam: m'),
(2604, '631620753283', 0, 'CAMISA TOMMY', 1, '45.00', '99.00', 1, 0, './imgs/CAMISA TOMMY AZUL MARINHO COM LISTRA BRANCA.jfif', '2021-09-09 12:23:11', 16, 91, 'TAM: M\r\n'),
(2605, '05535', 0, 'CAMISA TOMMY', 1, '30.00', '62.00', 0, 0, './imgs/CAMISA TOMMY AZUL MARINHO LISA.jfif', '2021-09-09 12:35:57', 7, 91, 'TAM: GG'),
(2606, 'CM05535', 0, 'CAMISA TOMMY', 1, '30.00', '62.00', 1, 0, './imgs/CAMISA TOMMY AZUL BIC.jfif', '2021-09-09 12:41:31', 16, 91, 'TAM: P\r\nCOR AZUL BIC'),
(2607, 'CM05535-1', 0, 'CAMISA TOMMY', 1, '30.00', '62.00', 1, 0, './imgs/CAMISA TOMMY PRETA.jfif', '2021-09-09 12:51:37', 16, 91, 'TAM: P'),
(2608, 'CM05535-2', 0, 'CAMISA TOMMY', 1, '30.00', '62.00', 1, 0, './imgs/CAMISA TOMMY VINHO.jfif', '2021-09-09 12:57:55', 7, 91, 'TAM: G'),
(2609, 'CM05535-3', 0, 'CAMISA RALPH LAUREN', 1, '30.00', '62.00', 1, 0, './imgs/CAMISA TOMMY ROSA PINK COM BORDADO.jfif', '2021-09-09 13:03:11', 7, 91, 'TAM: GG\r\nCOR ROSA PINK COM BORDADO'),
(2610, 'CM05535-4', 0, 'CAMISA RALPH LAUREN', 1, '30.00', '62.00', 1, 0, './imgs/CAMISA RALPH LAUREN POLO VERMELHA COM BORDADO.jfif', '2021-09-09 13:47:46', 16, 91, 'TAM: GG\r\nCOR VERMELHA COM BORDADO'),
(2611, '7898632155570', 0, 'CAMISA ABERCROMBIE', 1, '30.00', '62.00', 1, 0, './imgs/CAMISA ABERCROMBIE AZUL MARINHO COM BORDADO BRANCO.jfif', '2021-09-09 13:53:27', 16, 91, 'TAM: XL'),
(2612, 'CM05535-5', 0, 'CAMISA RALPH LAUREN', 1, '35.00', '62.00', 1, 0, './imgs/CAMISA RALPH LAUREN POLO PRETA.jfif', '2021-09-09 13:57:31', 16, 91, 'TAM: G\r\nCOR PRETA'),
(2613, 'CM05535-6', 0, 'CAMISA RALPH LAUREN', 1, '30.00', '62.00', 1, 0, './imgs/CAMISA RALPH LAUREN POLO COM BORDADO VERMELHO.jfif', '2021-09-09 14:01:05', 16, 91, 'TAM: P'),
(2614, '0000646700000000573', 0, 'CAMISA FAKINI', 1, '21.00', '42.00', 1, 0, './imgs/6e19787e-17b6-4023-8852-5702bb4a2172.jfif', '2021-09-09 14:08:40', 16, 91, 'TAM: 18 ANOS'),
(2615, '07018', 0, 'CAMISA CALVIN KLEIN', 1, '30.00', '65.00', 1, 0, './imgs/33b0a2fc-7e4c-4091-8d9f-9b2892c0394f.jfif', '2021-09-09 14:10:00', 16, 91, 'TAM: P'),
(2616, '08413', 0, 'CAMISA BASICA ABERCROMBIE', 1, '41.00', '82.00', 1, 0, './imgs/a7f614e0-5041-4bee-bc81-d119ae083c0e.jfif', '2021-09-09 14:12:00', 16, 91, 'TAM: P\r\nCOR VINHO COM BORDADO\r\nGOLA REDONDA'),
(2617, '08177', 0, 'CAMISA BASICA ADIDAS', 1, '25.00', '49.00', 1, 0, './imgs/4888fcfd-e89f-4c30-88a9-0e4ffcaf105a.jfif', '2021-09-09 14:17:54', 7, 91, 'TAM: P\r\nCOR AZUL\r\nGOLA REDONDA'),
(2618, '44411-0', 0, 'CAMISA WYTCHER', 1, '15.00', '30.00', 1, 0, './imgs/CAMISA WYTCHER.jfif', '2021-09-09 14:19:57', 16, 91, 'TAM: P'),
(2619, '05535-7', 0, 'CAMISA HOLLISTER', 1, '30.00', '62.00', 1, 0, './imgs/CAMISA HOLLISTER PINK POLO.jfif', '2021-09-09 14:21:17', 16, 91, 'TAM: XL'),
(2620, '7909457500398', 0, 'CAMISA HERING TECIDO', 1, '45.00', '92.00', 1, 0, './imgs/CAMISA HERING TECIDO ESTAMPADA.jfif', '2021-09-09 14:26:45', 16, 91, 'TAM: P\r\nTECIDO ESTAMPADO'),
(2621, '7890708956876', 0, 'CAMISA HOLLISTER', 1, '35.00', '72.00', 1, 0, './imgs/CAMISA HOLLISTER AZUL MARINHO POLO.jfif', '2021-09-09 14:28:11', 16, 91, 'TAM: M\r\nCOR AZUL MARINHO\r\nGOLA POLO'),
(2622, '08177', 0, 'CAMISA BASICA FERRARI', 1, '15.00', '30.00', 1, 0, './imgs/64eed1f0-eefb-4bf6-83ec-8f3506011653.jfif', '2021-09-09 14:29:22', 16, 91, 'TAM: GG\r\nCOR VERDE\r\nGOLA REDONDA'),
(2623, 'CM05535-8', 0, 'CAMISA BRASIL', 1, '20.00', '45.00', 6, 0, './imgs/8f78763f-bc5a-418c-8042-f446a61198a6.jfif', '2021-09-09 14:36:02', 16, 91, 'TAM: \r\n3-M\r\n3-GG'),
(2624, 'SH0001', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 6, 0, './imgs/566d098f-59d0-40f3-9537-0663ae8a3302.jfif', '2021-09-10 20:02:39', 16, 103, 'TAM: 36/38/42/44'),
(2625, 'SH0002', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 8, 0, './imgs/SHORT LOOLA PALOOZA 02.jfif', '2021-09-10 20:08:58', 16, 103, 'TAM: 36/38/40/42/46'),
(2626, 'SH00003', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 13, 0, './imgs/SHORT LOOLA PALOOZA 03.jfif', '2021-09-10 20:17:46', 7, 103, 'TAM: 36/38/42/44/46'),
(2627, 'SH0005', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 3, 0, './imgs/SHORT LOOLA PALOOZA 05.jfif', '2021-09-10 20:22:08', 16, 103, 'TAM: 36/38/42'),
(2628, 'SH0004', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 1, 0, './imgs/SHORT LOOLA PALOOZA 04.jfif', '2021-09-10 20:23:47', 16, 103, 'TAM: 36'),
(2629, '9901141001424', 0, 'SHORT BAGZL', 1, '40.00', '85.00', 1, 0, './imgs/SHORT BAGZL.jfif', '2021-09-10 20:26:07', 16, 103, 'TAM: 42\r\nCOR PRETA'),
(2630, '9901141001462', 0, 'SHORT BAGZL', 1, '40.00', '85.00', 2, 0, './imgs/SHORT BAGZL-1.jfif', '2021-09-10 20:27:14', 16, 103, 'TAM: 46\r\nCOR PRETA'),
(2631, '9901131001403', 0, 'SHORT BAGZL', 1, '40.00', '85.00', 1, 0, './imgs/SHORT BAGZL-2.jfif', '2021-09-10 20:28:35', 16, 103, 'TAM: 40\r\nCOR JEANS'),
(2632, '9901131001441', 0, 'SHORT BAGZL', 1, '40.00', '85.00', 1, 0, './imgs/SHORT BAGZL-3.jfif', '2021-09-10 20:29:15', 16, 103, 'TAM: 44\r\nCOR JEANS'),
(2633, 'SH0006', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 5, 0, './imgs/SHORT LOOLA PALOOZA 06.jfif', '2021-09-10 20:32:16', 16, 103, 'TAM: 36/38/46'),
(2634, 'SH0007', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 2, 0, './imgs/SHORT LOOLA PALOOZA 07.jfif', '2021-09-10 20:33:51', 16, 103, 'TAM: 36/44'),
(2635, 'SH0008', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 4, 0, './imgs/SHORT LOOLA PALOOZA 08.jfif', '2021-09-10 20:35:46', 16, 103, 'TAM: 40/44/46'),
(2636, 'SH0009', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 5, 0, './imgs/SHORT LOOLA PALOOZA 09.jfif', '2021-09-10 20:38:14', 16, 103, 'TAM: 36/42/44/46'),
(2637, 'SH00010', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 5, 0, './imgs/SHORT LOOLA PALLOZA 10.jfif', '2021-09-10 20:40:42', 7, 103, 'TAM: 40/46'),
(2638, 'SH00011', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 7, 0, './imgs/SHORT LOOLA PALOOZA 11.jfif', '2021-09-10 20:44:46', 16, 103, 'TAM: 36/38/42/44'),
(2639, 'SH00012', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 1, 0, './imgs/SHORT LOOLA PALOOZA 12.jfif', '2021-09-10 21:05:43', 16, 103, 'TAM: 42'),
(2640, 'SH00013', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 7, 0, './imgs/SHORT LOOLA PALOOZA 13.jfif', '2021-09-10 21:30:21', 7, 103, 'TAM:36/42/44'),
(2641, 'SH00014', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 2, 0, './imgs/SHORT LOOLA PALOOZA 14.jfif', '2021-09-10 21:43:06', 16, 103, 'TAM: 38'),
(2642, 'SH00015', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 14, 0, './imgs/SHORT LOOLA PALOOZA 15.jfif', '2021-09-10 21:45:09', 7, 103, 'TAM: 36/44/46'),
(2643, 'SH00016', 0, 'SHORT LOOLA PALOOZA', 1, '35.00', '72.00', 1, 0, './imgs/SHORT LOOLA PALLOZA 16.jfif', '2021-09-10 21:55:31', 16, 103, 'TAM: 42'),
(2645, '2152900001', 0, 'short bio tipo', 1, '0.00', '88.00', 8, 0, './imgs/WhatsApp Image 2021-09-11 at 10.27.43-1.jpeg', '2021-10-17 22:28:00', 7, 103, 'short feminino'),
(2646, '03969470000620', 0, 'short fem sawary', 1, '0.00', '89.00', 1, 0, './imgs/WhatsApp Image 2021-09-11 at 10.27.22.jpeg', '2021-09-11 13:50:26', 16, 103, 'short sawary'),
(2648, '05155010001040', 0, 'SHORT FEM SAWARY', 1, '0.00', '89.00', 3, 0, './imgs/WhatsApp Image 2021-09-11 at 10.27.02-1.jpeg', '2021-09-11 14:27:39', 7, 103, 'SHORT FEM SAWARY'),
(2649, '010624400001', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '116.00', 2, 0, './imgs/SHORT.jfif', '2021-09-11 14:34:42', 7, 90, 'BERMUDA FEM VIA GRAFIT'),
(2650, '402199', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '116.00', 2, 0, './imgs/SHORT-1.jfif', '2021-09-11 14:36:57', 7, 90, 'BERMUDA FEM VIA GRAFIT'),
(2651, '010624200007', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '116.00', 3, 0, './imgs/SHORT-2.jfif', '2021-09-11 14:38:23', 7, 90, 'BERMUDA FEM VIA GRAFIT'),
(2652, '0004943410001060', 0, 'BERMUDA FEM SAWARY', 1, '0.00', '92.00', 2, 0, './imgs/SHORT-3.jfif', '2021-09-11 14:46:27', 7, 90, 'BERMUDA FEMI SAWARY'),
(2653, '1676900001', 0, 'BERMUDA FEM BIO TIPO', 1, '0.00', '45.00', 3, 0, './imgs/dc8ef692-0fa7-4c3d-8e04-3bf3925ead10 (1).jfif', '2021-10-18 12:29:00', 7, 90, 'BERMUDA FEMI BIO TIPO'),
(2654, '7895783234864', 0, 'BERMUDA FEMI  SAWARY', 1, '0.00', '96.00', 1, 0, './imgs/a569c2cf-5f29-4383-b1c0-f8f7209403b7 (1).jfif', '2021-09-11 14:55:23', 7, 90, 'BERMUDA FEMI SAWARY'),
(2655, '2149100001', 0, 'SHORT FEM BIO TIPO', 1, '0.00', '89.00', 3, 0, './imgs/1dca1c16-73a7-44f4-8654-ed5957c4979e.jfif', '2021-09-11 15:02:14', 7, 103, 'SHORT FEM BIO TIPO'),
(2656, '909340000280', 0, 'BERMUDA FEM SAWARY', 1, '0.00', '92.00', 3, 0, './imgs/450de507-b941-46e9-b857-76a3b9606c30.jfif', '2021-09-11 15:04:11', 7, 90, 'BERMUDA FEM SAWARY'),
(2657, '1979500001', 0, 'SHORT FEM BIO TIPO', 1, '0.00', '89.00', 2, 0, './imgs/fb2e9190-5baa-4036-9bd0-80dcc7a72c84.jfif', '2021-09-11 15:14:47', 7, 103, 'SHORT FEM BIO TIPO'),
(2658, '7909173220815', 0, 'SHORT FEM HERING', 1, '0.00', '65.00', 1, 0, './imgs/c498bf92-ebcd-4ac8-b2b1-1c60286021b8.jfif', '2021-09-11 15:21:57', 7, 103, 'SHORT FEM HERING'),
(2659, '7909173220822', 0, 'SHORT HERING FEM', 1, '0.00', '65.00', 2, 0, './imgs/c498bf92-ebcd-4ac8-b2b1-1c60286021b8-1.jfif', '2021-09-11 15:24:16', 7, 103, 'SHORT FEM HERING'),
(2660, '0003895310000750', 0, 'SHORT SAWARY FEM ', 1, '0.00', '89.00', 2, 0, './imgs/6808770c-1acf-481b-8394-30736584b439.jfif', '2021-09-11 15:28:21', 7, 103, 'SHORT FEM SAWARY'),
(2661, '2150300001', 0, 'SHORT FEM BIO TIPO', 1, '44.00', '88.00', 7, 0, './imgs/3fa8d851-1d7d-479f-bb53-820f4f34fb0a.jfif', '2021-09-11 16:08:36', 7, 103, 'SHORT FEM BIO TIPO'),
(2662, '010614200000', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 2, 0, './imgs/6e506080-c0e7-4c0c-8a7c-05e8c1f3c747.jfif', '2021-09-11 16:12:20', 7, 90, 'BERMUDA FEM VIA GRAFIT'),
(2663, '010614600008', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 2, 0, './imgs/6e506080-c0e7-4c0c-8a7c-05e8c1f3c747-1.jfif', '2021-09-11 16:14:46', 7, 90, 'BERMUDA FEMININA VIA GRAFIT'),
(2664, '010614000006', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 2, 0, './imgs/6e506080-c0e7-4c0c-8a7c-05e8c1f3c747-2.jfif', '2021-09-11 16:16:27', 7, 90, 'BERMUDA FEM VIA GRAFIT'),
(2665, ' 0010614400004                     ', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 2, 0, './imgs/6e506080-c0e7-4c0c-8a7c-05e8c1f3c747-3.jfif', '2021-09-11 16:20:09', 7, 90, 'BERMUDA FEM VIA GRAFIT'),
(2666, '010613800003', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 1, 0, './imgs/6e506080-c0e7-4c0c-8a7c-05e8c1f3c747-4.jfif', '2021-09-11 16:21:43', 7, 90, 'BERMUDA FEM VIA GRAFIT'),
(2667, 'BLU0001', 0, 'BLUSAFEM TRICO', 1, '0.00', '40.00', 3, 0, './imgs/ec3240bd-5988-49b5-a248-4e52f6c6fa7d.jfif', '2021-09-11 17:09:47', 7, 89, 'BLUSA FEM TRICO '),
(2669, 'BLU0002', 0, 'BLUSA FEM TRICO', 1, '0.00', '40.00', 1, 0, './imgs/54f127e0-08d7-43bf-bd7c-f324a966018f.jfif', '2021-09-11 17:14:23', 7, 89, 'BLUSA TRICO COLORIDA'),
(2670, '0004620660000040', 0, 'short fem sawary', 1, '0.00', '88.00', 2, 0, './imgs/fc9c9240-fd01-45ca-a8c2-3d8f8e881acf.jfif', '2021-09-11 17:22:10', 7, 103, 'SHORT FEM SAWARY'),
(2671, '04620690000280', 0, 'short fem sawary', 1, '0.00', '88.00', 2, 0, './imgs/fc9c9240-fd01-45ca-a8c2-3d8f8e881acf-1.jfif', '2021-09-11 17:24:16', 7, 103, 'SHORT FEM SAWARY '),
(2672, 'SH00044', 0, 'SHORT FEM SAWARY ', 1, '0.00', '88.00', 1, 0, './imgs/fc9c9240-fd01-45ca-a8c2-3d8f8e881acf-2.jfif', '2021-09-11 17:26:21', 7, 103, 'SHORT FEM SAWARY'),
(2673, '7909173220693', 0, 'SHORT HERING FEM', 1, '0.00', '88.00', 5, 0, './imgs/2d80130a-c42c-4e53-8a6e-3a2070940221.jfif', '2021-09-11 17:34:06', 7, 103, 'SHORT FEM HERING'),
(2674, 'BER0001', 0, 'BERMUDA FEM LOLA PALOOZA', 1, '0.00', '82.00', 4, 0, './imgs/4d880725-38ff-484d-9c7e-b035436bc3b2.jfif', '2021-09-11 17:38:33', 7, 90, 'BERMUDA FEM LOLA PALOOZA JEANS'),
(2675, '2163000001', 0, 'SHORT FEM BIO TIPO', 1, '0.00', '85.00', 4, 0, './imgs/11b7fe5d-7a6b-4769-a98a-dc06cd935460.jfif', '2021-09-11 17:59:26', 7, 103, 'SHORT FEM BIO TIPO ROSA '),
(2676, '7909112903786', 0, 'SHORT FEM HERING', 1, '0.00', '85.00', 4, 0, './imgs/7410900c-cc31-4ede-9935-007e175802e4.jfif', '2021-09-11 18:02:11', 7, 103, 'SHORT FEM HERING VERDE'),
(2677, '010604000009', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 1, 0, './imgs/4ba9135c-215c-4ee5-86dc-4340183133ce.jfif', '2021-09-11 18:07:30', 7, 90, 'BERMUDA FEM VIA GRAFIT CICLO MEDIO '),
(2678, '010604600001', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 1, 0, './imgs/4ba9135c-215c-4ee5-86dc-4340183133ce-1.jfif', '2021-09-11 18:09:16', 7, 90, 'BERMUDA FEM VIA GRAFIT CICLO MEDIO '),
(2679, '010603800006', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 1, 0, './imgs/4ba9135c-215c-4ee5-86dc-4340183133ce-2.jfif', '2021-09-11 18:11:12', 7, 90, 'BERMUDA FEM VIA GRAFIT CICLO MEDIO-38'),
(2680, '010604200003', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 1, 0, './imgs/4ba9135c-215c-4ee5-86dc-4340183133ce-3.jfif', '2021-09-11 18:12:33', 7, 90, 'BERMUDA FEM VIA GRAFIT CICLO MEDIO -42'),
(2681, '010604400007', 0, 'BERMUDA FEM VIA GRAFIT', 1, '0.00', '106.00', 2, 0, './imgs/4ba9135c-215c-4ee5-86dc-4340183133ce-4.jfif', '2021-09-11 18:14:25', 7, 90, 'BERMUDA FEM VIA GRAFIT CICLO MEDIO-44'),
(2682, 'BER00044', 0, 'BERMUDA FEM BIO TIPO', 1, '0.00', '65.00', 2, 0, './imgs/99a3c0d9-0463-4039-ba12-b83bd717819a.jfif', '2021-09-11 18:19:05', 7, 90, 'BERMUDA FEM BIO TIPO BOTÃO'),
(2683, '7909173494629', 0, 'SHORT FEM HERING', 1, '0.00', '65.00', 1, 0, './imgs/88d71b53-754b-44d3-95d3-a5a9e3beced7.jfif', '2021-09-11 18:23:00', 7, 103, 'SHORT FEM HERING -46'),
(2684, '7909173494582', 0, 'SHORT FEM HERING', 1, '0.00', '65.00', 1, 0, './imgs/88d71b53-754b-44d3-95d3-a5a9e3beced7-1.jfif', '2021-09-11 18:24:29', 7, 103, 'SHORT FEM HERING -38'),
(2685, '7909173494568', 0, 'SHORT FEM HERING', 1, '0.00', '65.00', 1, 0, './imgs/88d71b53-754b-44d3-95d3-a5a9e3beced7-2.jfif', '2021-09-11 18:26:55', 7, 103, 'SHORT FEM HERING -34'),
(2686, '7909173494599', 0, 'SHORT FEM HERING', 1, '0.00', '65.00', 2, 0, './imgs/88d71b53-754b-44d3-95d3-a5a9e3beced7-3.jfif', '2021-09-11 18:28:38', 7, 103, 'SHORT FEM HERING -40 '),
(2687, '2149900001', 0, 'SHORT FEM BIO TIPO', 1, '0.00', '88.00', 8, 0, './imgs/c97efe43-e646-4b1a-9b9a-e11da6a8eb3d.jfif', '2021-09-11 19:28:07', 7, 103, 'SHORT  BIO TIPO SHO INDIGO '),
(2688, 'SH023230', 0, 'BERMUDA BIO TIPOFEM', 1, '0.00', '65.00', 2, 0, './imgs/d1a0abda-47a2-46b2-b0ae-51d39a79f2b6.jfif', '2021-09-11 19:31:36', 7, 90, 'BERMUDA FEMININA BIO TIPO-36'),
(2689, 'SH04556', 0, 'SHORT FEM CANONI', 1, '0.00', '65.00', 2, 0, './imgs/673d1c2e-ae76-45e7-8931-130d696ef8d0.jfif', '2021-09-11 19:35:11', 7, 103, 'SHORT  FEM CANONI  POLIESTER'),
(2690, 'BERL00046', 0, 'BERMUDA FEM LOLA PALOOZA', 1, '0.00', '72.00', 2, 0, './imgs/91a7672a-5afe-4025-9acd-4c2d2792a216.jfif', '2021-09-11 19:38:27', 7, 90, 'BERMUDA FEM LOLA PALOOZA 40-46'),
(2691, '7909245101929', 0, 'SHORT FEM HERING', 1, '0.00', '65.00', 1, 0, './imgs/65f6b1f5-95fc-4d21-ae0b-6a6192974148.jfif', '2021-09-11 19:40:58', 7, 103, 'SHORT FEM HERING VINHO -36'),
(2692, '7909173219848', 0, 'SHORT FEM HERING', 1, '0.00', '65.00', 2, 0, './imgs/f23e4365-a193-4a2b-97cc-1318946a5c0c.jfif', '2021-09-11 19:44:39', 7, 103, 'SHORT FEM HERING 34-36'),
(2693, 'SH00017', 0, 'SHORT HERING FEM', 1, '44.00', '88.00', 2, 0, './imgs/7eba793f-2147-4a63-ad74-9d7d643847fd (1).jfif', '2021-09-13 12:38:04', 16, 103, 'TAM: 34/36'),
(2694, '7898120600056', 0, 'SHORT EAGLE ROCK', 1, '25.00', '48.00', 1, 0, './imgs/SHORT EAGLE ROCK.jfif', '2021-09-13 12:45:32', 16, 103, 'TAM: G'),
(2695, 'SH00018', 0, 'SHORT HERING FEM', 1, '44.00', '88.00', 2, 0, './imgs/SHORT HERING FEM ROSA.jfif', '2021-09-13 12:47:08', 16, 103, 'TAM: 36/42'),
(2696, '0004013470001080', 0, 'SHORT SAWARY FEM ', 1, '45.00', '89.00', 1, 0, './imgs/SHORT SAWARY PRETO COM BOTOES.jfif', '2021-09-13 12:50:01', 16, 103, 'TAM: 34\r\nPRETO COM BOTOES'),
(2697, '04013510001980', 0, 'SHORT SAWARY FEM ', 1, '45.00', '89.00', 1, 0, './imgs/SHORT SAWARY PRETO COM BOTOES-1.jfif', '2021-09-13 12:51:22', 16, 103, 'TAM: 42\r\nPRETO COM BOTOES'),
(2698, '0004013500002940', 0, 'SHORT SAWARY FEM ', 1, '45.00', '89.00', 1, 0, './imgs/SHORT SAWARY PRETO COM BOTOES-2.jfif', '2021-09-13 12:55:04', 16, 103, 'TAM: 40\r\nPRETO COM BOTOES'),
(2699, '7909173546465', 0, 'SHORT FEM HERING', 1, '45.00', '89.00', 1, 0, './imgs/3a44c4b3-5716-4cf0-b803-7920da08e1aa.jfif', '2021-09-13 13:15:59', 16, 103, 'TAM: 34\r\nTECIDO\r\nESTAMPADO FLORIDO'),
(2700, '546440', 0, 'SHORT FEM CVL JEANS', 1, '43.00', '86.00', 1, 0, './imgs/SHORT CVL JEANS COR CEREJA.jfif', '2021-09-13 13:19:02', 16, 103, 'TAM: 40\r\nCOR CEREJA\r\nCOM BOTOES'),
(2701, '7909299213104', 0, 'BERMUDA FEM. HERING', 1, '45.00', '89.00', 1, 0, './imgs/BERMUDA FEM. HERING VERMELHA.jfif', '2021-09-13 13:21:11', 16, 90, 'TAM: 36\r\nCOR VERMELHA'),
(2702, 'SH00019', 0, 'SHORT FEM HERING', 1, '45.00', '89.00', 1, 0, './imgs/fd8109a4-16d1-4552-913c-1ad71335c2b6.jfif', '2021-09-13 13:23:41', 16, 103, 'TAM: 36\r\nCOR AMARELA'),
(2703, '7909299825826', 0, 'BERMUDA FEM HERING', 1, '0.00', '108.00', 1, 0, './imgs/d48767d2-554f-4f40-b733-99ecd37b2292.jfif', '2021-09-13 18:25:39', 16, 90, 'BERMUDA HERING FEM '),
(2704, '7909299825758', 0, 'SHORT FEM HERING', 1, '0.00', '88.00', 1, 0, './imgs/d48767d2-554f-4f40-b733-99ecd37b2292-1.jfif', '2021-09-13 18:27:27', 16, 103, 'SHORT FEM HERING '),
(2705, '7909299825796', 0, 'SHORT FEM HERING', 1, '0.00', '88.00', 1, 0, './imgs/d48767d2-554f-4f40-b733-99ecd37b2292-2.jfif', '2021-09-13 18:29:20', 16, 103, 'SHORT FEM HERING '),
(2706, '7909299918931', 0, 'BERMUDA FEM HERING', 1, '0.00', '99.00', 2, 0, './imgs/21463e88-a39d-44ea-9f15-f047aa0694d4.jfif', '2021-09-13 18:33:19', 16, 90, 'BERMUDA FEM HERING TELHA'),
(2707, '7909386268796', 0, 'BERMUDA FEM HERING', 1, '0.00', '99.00', 3, 0, './imgs/5e63be8c-4315-49e0-89db-28022e09493d.jfif', '2021-09-13 18:37:48', 16, 90, 'BERMUDA FEM HERING PRETA'),
(2708, '7909386268529', 0, 'BERMUDA FEM HERING', 1, '0.00', '88.00', 2, 0, './imgs/5e63be8c-4315-49e0-89db-28022e09493d-1.jfif', '2021-09-13 18:42:31', 16, 90, 'BERMUDA FEM HERING'),
(2709, '0002836130005590', 0, 'SHORT FEM SAWARY', 1, '0.00', '89.00', 1, 0, './imgs/01d1e7bc-b297-4421-9e16-a4c947d34e60.jfif', '2021-09-13 18:46:48', 16, 103, 'SHORT FEM SAWARY '),
(2710, 'HER0001', 0, 'BERMUDA FEM HERING', 1, '0.00', '88.00', 3, 0, './imgs/a2d2fd63-cfcf-49cb-a9ef-c318c42d4636.jfif', '2021-09-13 18:50:33', 7, 90, 'BERMUDA FEM HERING'),
(2711, '7909457125393', 0, 'BERMUDA FEM HERING ', 1, '0.00', '98.00', 1, 0, './imgs/d3f28800-ca11-43ef-8ec0-903d5149a410.jfif', '2021-09-13 18:54:48', 16, 90, 'BERMUDA FEM HERING CINZA'),
(2712, '7909457125263', 0, 'BERMUDA HERING', 1, '0.00', '89.00', 1, 0, './imgs/d3f28800-ca11-43ef-8ec0-903d5149a410-1.jfif', '2021-09-13 18:56:20', 16, 90, 'BERMUDA FEM HERING CINZA'),
(2713, '7909457125232', 0, 'SHORT FEM HERING', 1, '0.00', '88.00', 1, 0, './imgs/d3f28800-ca11-43ef-8ec0-903d5149a410-2.jfif', '2021-09-13 18:58:36', 16, 103, 'SHORT FEM HERING CINZA '),
(2714, 'HER0002', 0, 'BERMUDA FEM HERING', 1, '0.00', '88.00', 2, 0, './imgs/d3f28800-ca11-43ef-8ec0-903d5149a410-3.jfif', '2021-09-13 19:01:57', 16, 90, 'BERMUDA HERING FEM CINZA  TAM 36,46'),
(2715, 'SH00020', 0, 'SHORT FEM HERING', 1, '44.00', '88.00', 2, 0, './imgs/SHORT HERING AZUL RASGADO.jfif', '2021-09-13 19:06:13', 16, 103, 'TAM: 40/46'),
(2716, '7909173218973', 0, 'SHORT FEM HERING', 1, '44.00', '88.00', 3, 0, './imgs/SHORT HERING ROSA.jfif', '2021-09-13 19:07:36', 7, 103, 'TAM: 34/40/42'),
(2717, '7909173995195', 0, 'SHORT FEM HERING', 1, '40.00', '80.00', 3, 0, './imgs/SHORT HERING LINHA AZUL.jfif', '2021-09-13 19:09:25', 7, 103, 'TAM: 46/36'),
(2718, '7909173995263', 0, 'SHORT FEM HERING', 1, '40.00', '80.00', 3, 0, './imgs/SHORT HERING LINHA CINZA.jfif', '2021-09-13 19:15:00', 16, 103, 'TAM: 36/38/46'),
(2719, 'SH00021', 0, 'SHORT FEM HERING', 1, '44.00', '88.00', 1, 0, './imgs/SHORT HERING LINHO.jfif', '2021-09-13 19:18:16', 16, 103, 'TAM: 38\r\nLINHO VERMELHO'),
(2720, '7891797614012', 0, 'SHORT FEM HERING', 1, '35.00', '68.00', 1, 0, './imgs/SHORT HERING VERDE MILITAR.jfif', '2021-09-13 19:19:46', 16, 103, 'TAM: 40\r\nVERDE MILITAR'),
(2721, '7909245131605', 0, 'SHORT FEM HERING', 1, '40.00', '85.00', 1, 0, './imgs/SHORT HERING ROSA COM LAVAGEM.jfif', '2021-09-13 19:21:21', 16, 103, 'TAM: 38'),
(2722, 'SH00022', 0, 'SHORT FEM HERING', 1, '40.00', '85.00', 1, 0, './imgs/SHORT HERING VINHO JEANS DESFIADO.jfif', '2021-09-13 19:23:43', 16, 103, 'TAM: 36'),
(2723, 'HER0003', 0, 'SHORT FEM HERING', 1, '0.00', '88.00', 2, 0, './imgs/dc876150-99a1-4d6d-8945-04161ea24253.jfif', '2021-09-13 19:31:39', 16, 90, 'BERMUDA HERING FEM'),
(2724, '7909173219086', 0, 'SHORT HERING FEM ', 1, '0.00', '65.00', 1, 0, './imgs/80ff9f2d-62f4-4e18-97fb-d99898cb0cd4.jfif', '2021-09-13 19:33:36', 16, 103, 'SHORT FEM HERING'),
(2725, '7909112509865', 0, 'SHORT FEM HERING', 1, '0.00', '65.00', 1, 0, './imgs/80ff9f2d-62f4-4e18-97fb-d99898cb0cd4-1.jfif', '2021-09-13 19:35:09', 16, 103, 'SHORT FEM HERING'),
(2726, '7909386268758', 0, 'BERMUDA FEM HERING', 1, '0.00', '88.00', 1, 0, './imgs/3508d156-a66a-4a58-8e9f-9a7bca58662e.jfif', '2021-09-13 19:36:50', 16, 90, 'BERMUDA FEM HERING '),
(2727, 'HER0004', 0, 'SHORT FEM HERING', 1, '0.00', '88.00', 1, 0, './imgs/14203596-7055-4954-bfb5-1faa038b1932.jfif', '2021-09-13 19:39:35', 7, 103, 'SHORT FEM HERING'),
(2728, '7909457125140', 0, 'BERMUDA FEM HERING', 1, '0.00', '92.00', 1, 0, './imgs/d34a4ac6-9e5d-4f95-83be-8e961f0bb6f5.jfif', '2021-09-13 19:41:30', 16, 90, 'BERMUDA FEM HERING'),
(2729, '7909457125096', 0, 'BERMUDA FEM HERING', 1, '0.00', '92.00', 1, 0, './imgs/d34a4ac6-9e5d-4f95-83be-8e961f0bb6f5-1.jfif', '2021-09-13 19:42:30', 7, 90, 'BERMUDA FEM HERING'),
(2730, 'HER0005', 0, 'BERMUDA FEM HERING', 1, '0.00', '92.00', 1, 0, './imgs/26fb97d6-a7c1-4aa4-816e-591fc80c8b47.jfif', '2021-09-13 19:44:38', 16, 90, 'BERMUDA FEM HERING AMARELO '),
(2731, '7909245131643', 0, 'SHORT FEM HERING', 1, '0.00', '85.00', 1, 0, './imgs/SHORT HERING ROSA COM LAVAGEM-1.jfif', '2021-09-13 19:48:57', 7, 103, 'SHORT FEM HERING'),
(2732, '7909299015876', 0, 'SHORT FEM HERING', 1, '0.00', '88.00', 1, 0, './imgs/29abc0b9-7163-458b-b0c8-f024a130b69e.jfif', '2021-09-13 19:52:23', 7, 103, 'SHORTE FEM HERING -LINHO AZUL MARINHO'),
(2733, 'SH00023', 0, 'SHORT FEM HERING ', 1, '0.00', '88.00', 1, 0, './imgs/b9b82bb5-8549-4bd8-940b-e3c929546a98.jfif', '2021-09-13 19:54:31', 16, 103, 'SHORT HERING FEM'),
(2734, '7909299349100', 0, 'BERMUDA FEM HERING', 1, '0.00', '88.00', 1, 0, './imgs/d3f28800-ca11-43ef-8ec0-903d5149a410-4.jfif', '2021-09-13 19:56:31', 16, 90, 'BERMUDA FEM HERING'),
(2735, '7909299818231', 0, 'SHORT FEM HERING ', 1, '0.00', '98.00', 2, 0, './imgs/dae4f181-f7e4-497a-88df-36ddad7d51ed.jfif', '2021-09-13 19:58:25', 16, 103, 'SHORT FEM HERING'),
(2736, 'SHO00024', 0, 'BERMUDA FEM HERING ', 1, '0.00', '88.00', 1, 0, './imgs/c34beb88-01c1-4207-9a7f-dbb7d9860861.jfif', '2021-09-13 20:00:02', 16, 90, 'BERMUDA FEM HERING'),
(2737, '7909386095279', 0, 'BERMUDA FEM HERING', 1, '0.00', '98.00', 1, 0, './imgs/dc876150-99a1-4d6d-8945-04161ea24253-1.jfif', '2021-09-13 20:01:26', 16, 90, 'BERMUDA FEM HERING'),
(2738, '7909299057357', 0, 'BERMUDA FEM HERING', 1, '0.00', '89.00', 1, 0, './imgs/0563a7bb-2960-47a5-9cfc-6637f427a081.jfif', '2021-09-13 20:02:48', 16, 90, 'BERMUDA FEM HERING'),
(2739, 'SH000025', 0, 'SHORT FEM HERING ', 1, '44.00', '88.00', 2, 0, './imgs/bb403ef9-a2fc-4f6e-9c82-7c295cf030d1.jfif', '2021-09-13 20:05:11', 7, 103, 'SHORT FEM HERING'),
(2740, '7909112155406', 0, 'SHORT FEM HERING', 1, '0.00', '88.00', 3, 0, './imgs/29abc0b9-7163-458b-b0c8-f024a130b69e-1.jfif', '2021-09-13 20:07:48', 16, 103, 'SHORT FEM HERING'),
(2741, 'SH00026', 0, 'SHORT FEM HERING', 1, '0.00', '88.00', 3, 0, './imgs/51cd61d3-1978-47bb-bd77-074c6110968d.jfif', '2021-09-13 20:09:38', 16, 103, 'SHORT FEM HERING'),
(2742, 'SH00030', 0, 'SHORT GIRRAZ', 1, '30.00', '65.00', 1, 0, './imgs/SHORT GIRRAZ.jfif', '2021-09-14 14:14:55', 16, 103, 'TAM: 36'),
(2743, 'SH00031', 0, 'SHORT GIRRAZ', 1, '30.00', '65.00', 1, 0, './imgs/SHORT GIRRAZ BARRA DOBRADA.jfif', '2021-09-14 14:16:55', 16, 103, 'TAM: 36'),
(2744, 'SH00032', 0, 'SHORT FEM BIOTIPO', 1, '44.00', '88.00', 1, 0, './imgs/SHORT BIOTIPO BARRA DESFIADA.jfif', '2021-09-14 14:23:47', 16, 103, 'TAM: 36'),
(2745, 'SH00033', 0, 'SHORT GAZOZ', 1, '30.00', '65.00', 1, 0, './imgs/SHORT GAZOZ.jfif', '2021-09-14 14:26:25', 16, 103, 'TAM: 42'),
(2746, '07256', 0, 'BERMUDA DINHOS', 1, '35.00', '78.00', 1, 0, './imgs/d1578949-5972-4287-8e70-2ce4b62ed5c4.jfif', '2021-09-14 14:28:26', 16, 90, 'TAM: 38'),
(2747, 'SH00034', 0, 'SHORT CROCKER', 1, '30.00', '65.00', 1, 0, './imgs/SHORT CROCKER BORDADO.jfif', '2021-09-14 14:35:03', 16, 103, 'TAM: 40'),
(2748, 'SH00035', 0, 'SHORT CVL', 1, '30.00', '65.00', 1, 0, './imgs/affb9e9e-4e72-4199-99c3-e4fc71e13e7f.jfif', '2021-09-14 14:37:19', 16, 103, 'TAM: 36\r\nCOR AMARELA'),
(2749, '7909112685613', 0, 'SHORT FEM HERING', 1, '44.00', '88.00', 1, 0, './imgs/c34beb88-01c1-4207-9a7f-dbb7d9860861-1.jfif', '2021-09-14 14:40:13', 16, 103, 'TAM: 36\r\nAZUL BIC'),
(2750, 'SH00036', 0, 'SHORT FEM HERING', 1, '44.00', '89.00', 1, 0, './imgs/SHORT HERING AZUL BIC.jfif', '2021-09-14 14:49:54', 16, 103, 'TAM:36\r\nAZUL BIC'),
(2751, '7909299180413', 0, 'SHORT FEM HERING', 1, '45.00', '92.00', 1, 0, './imgs/SHORT HERING BRANCO.jfif', '2021-09-14 14:51:55', 16, 103, 'TAM: 36\r\nBRANCO'),
(2752, 'SH00037', 0, 'SHORT  GALATAS', 1, '40.00', '80.00', 1, 0, './imgs/SHORT GALATAS.jfif', '2021-09-14 14:57:12', 16, 103, 'TAM: 36'),
(2753, 'SH00038', 0, 'SHORT GALATAS', 1, '40.00', '80.00', 1, 0, './imgs/fad09a7a-6589-41bf-adbe-33962d287feb.jfif', '2021-09-14 14:59:20', 16, 103, 'TAM: 38'),
(2754, '7891235718586', 0, 'SHORT CROCKER', 1, '44.00', '88.00', 1, 0, './imgs/81636eff-6c80-4ef0-9e40-836001793bd1.jfif', '2021-09-14 15:04:54', 7, 103, 'TAM: 44\r\nESTAMPADO'),
(2755, 'SH60842', 0, 'SHORT YOUNG STYLE', 1, '44.00', '88.00', 1, 0, './imgs/SHORT YOUNG STYLE.jfif', '2021-09-14 17:12:50', 16, 103, 'TAM: 42'),
(2756, 'SH00038', 0, 'BERMUDA FEM. TOP ROCK', 1, '30.00', '68.00', 1, 0, './imgs/BERMUDA FEM TOP ROCK.jfif', '2021-09-14 17:15:12', 16, 90, 'TAM: 38'),
(2757, 'SH00039', 0, 'SHORT TOP ROCK', 1, '30.00', '65.00', 1, 0, './imgs/SHORT TOP ROCK COM TACHAS.jfif', '2021-09-14 17:17:19', 16, 103, 'TAM: 40'),
(2758, 'SH00040', 0, 'SHORT TOP ROCK', 1, '30.00', '65.00', 1, 0, './imgs/SHORT TOP ROCK.jfif', '2021-09-14 17:19:14', 16, 103, 'TAM: 36'),
(2759, '7891235700918', 0, 'SHORT CROCKER', 1, '89.00', '45.00', 1, 0, './imgs/SHORT CROCKER COM APLICAÇÃO.jfif', '2021-09-14 17:30:26', 16, 103, 'TAM: 42'),
(2760, '7891235701687', 0, 'SHORT CROCKER ', 1, '44.00', '88.00', 1, 0, './imgs/SHORT CROCKER COM BOLSO BORDADO.jfif', '2021-09-14 17:33:41', 16, 103, 'TAM: 38'),
(2761, 'SH00041', 0, 'SHORT CROCKER', 1, '30.00', '68.00', 1, 0, './imgs/SHORT CROCKER COM BOLSO LISTRADO.jfif', '2021-09-14 17:38:38', 16, 91, 'TAM: 42'),
(2762, '00036295', 0, 'BERMUDA FEM EFFS', 1, '40.00', '89.00', 1, 0, './imgs/BERMUDA FEM EFFS.jfif', '2021-09-14 17:56:29', 7, 90, 'TAM: 38'),
(2763, '00036294', 0, 'BERMUDA FEM EFFS', 1, '40.00', '89.00', 1, 0, './imgs/BERMUDA FEM EFFS-1.jfif', '2021-09-14 18:08:52', 16, 90, 'TAM: 36'),
(2764, 'SH00042', 0, 'SHORT EFFS', 1, '44.00', '88.00', 1, 0, './imgs/SHORT EFFS COM TRES BOTOES.jfif', '2021-09-14 18:25:18', 16, 103, 'TAM: 42'),
(2765, '00035270', 0, 'BERMUDA FEM EFFS', 1, '45.00', '94.00', 1, 0, './imgs/BERMUDA FEM EFFS DETALHE BOLSO.jfif', '2021-09-14 18:27:25', 16, 90, 'TAM: 42'),
(2766, '00035473', 0, 'SHORT EFFS', 1, '45.00', '98.00', 1, 0, './imgs/50ab6396-7cd7-4321-87b6-ec7f55c1c224.jfif', '2021-09-14 18:28:29', 16, 103, 'TAM: 42'),
(2767, '00037817', 0, 'SHORT EFFS', 1, '45.00', '89.00', 1, 0, './imgs/SHORT EFFS ROSA CLARO.jfif', '2021-09-14 18:29:35', 16, 103, 'TAM: 42'),
(2768, '00035337', 0, 'SHORT EFFS', 1, '45.00', '98.00', 1, 0, './imgs/SHORT EFFS COS LARGO.jfif', '2021-09-14 18:31:07', 16, 103, 'TAM: 40'),
(2769, '530', 0, 'SHORT VERDE VENENO', 1, '45.00', '89.00', 1, 0, './imgs/SHORT VERDE VENENO.jfif', '2021-09-14 18:34:10', 16, 103, 'TAM: 46'),
(2770, 'SH00043', 0, 'BERMUDA FEM LOOLA PALOZZA', 1, '35.00', '78.00', 2, 0, './imgs/BERMUDA FEM LOOLA PALLOZA BARRA DESFIADA.jfif', '2021-09-14 18:37:10', 16, 90, 'TAM: 38'),
(2771, '1629700001', 0, 'BERMUDA FEM BIOTIPO', 1, '45.00', '45.00', 1, 0, './imgs/BERMUDA FEM BIOTIPO.jfif', '2021-09-14 18:41:28', 16, 90, 'TAM: 38'),
(2772, '3306', 0, 'BERMUDA FEM KEAMS', 1, '44.00', '88.00', 1, 0, './imgs/BERMUDA FEM KEAMS.jfif', '2021-09-14 18:43:33', 16, 90, 'TAM: 46'),
(2773, 'SH00044', 0, 'BERMUDA FEM CROCKER', 1, '30.00', '68.00', 1, 0, './imgs/BERMUDA FEM CROCKER COS LARGO.jfif', '2021-09-14 18:46:19', 16, 90, 'TAM: 44'),
(2774, '01085', 0, 'BERMUDA FEM BIOTIPO', 1, '45.00', '45.00', 1, 0, './imgs/BERMUDA FEM BIOTIPO COS LARGO.jfif', '2021-09-14 18:48:06', 16, 90, 'TAM: 40'),
(2775, 'SH00045', 0, 'BERMUDA FEM BIOTIPO', 1, '45.00', '45.00', 1, 0, './imgs/BERMUDA FEM BIOTIPO COS DE ELASTICO.jfif', '2021-09-14 18:51:04', 16, 90, 'TAM: 42'),
(2776, '7895783310674', 0, 'BERMUDA FEM SAWARY', 1, '45.00', '45.00', 2, 0, './imgs/BERMUDA FEM SAWARY COS LARGO COM ELASTICO.jfif', '2021-09-14 18:53:23', 7, 90, 'TAM: 44'),
(2777, 'SH00046', 0, 'SHORT ZARPS', 1, '30.00', '60.00', 1, 0, './imgs/SHORT ZARPS.jfif', '2021-09-14 18:58:40', 16, 103, 'TAM: 48'),
(2778, 'SH00047', 0, 'BERMUDA FEM CROCKER', 1, '30.00', '68.00', 1, 0, './imgs/BERMUDA FEM CROCKER ENFEITE NO BOLSO.jfif', '2021-09-14 19:10:16', 16, 90, 'TAM: 40'),
(2779, '00035257', 0, 'SHORT EFFS', 1, '44.00', '88.00', 1, 0, './imgs/SHORT EFFS BOTOES NO COS.jfif', '2021-09-14 19:12:15', 16, 103, 'TAM: 36'),
(2780, '0003870680000140', 0, 'short fem sawary', 1, '0.00', '89.00', 2, 0, './imgs/7439ba24-5b8b-40e8-b9d3-431f9613e383.jfif', '2021-09-14 19:17:10', 16, 103, 'SHORT FEM SAWARY'),
(2781, 'BER0002', 0, 'BERMUDA FEM SAWARY', 1, '0.00', '88.00', 1, 0, './imgs/6ab18393-e812-447d-885d-e2578a3e1349.jfif', '2021-09-14 19:22:30', 16, 90, 'BERMUDA FEM SAWARY'),
(2782, 'BER0003', 0, 'BERMUDA FEM SAWARY', 1, '0.00', '88.00', 1, 0, './imgs/BER FEM SAWARY.jfif', '2021-09-14 19:25:38', 16, 90, 'BERMUDA FEM SAWARY'),
(2783, '0003122870002050', 0, 'BERMUDA FEM SAWARY', 1, '0.00', '89.00', 1, 0, './imgs/BERM FEM SAWARY 2.jfif', '2021-09-14 19:27:47', 16, 90, 'BERMUDA FEM SAWARY'),
(2784, 'SH00020', 0, 'short fem sawary', 1, '0.00', '89.00', 1, 0, './imgs/SHORT SAW 2.jfif', '2021-09-14 19:32:54', 16, 103, 'SHORT FEM SAWARY'),
(2785, 'SH00024', 0, 'short fem sawary', 1, '0.00', '89.00', 1, 0, './imgs/SHORT SAW 3.jfif', '2021-09-14 19:35:16', 16, 103, 'SHORT FEM SAWARY'),
(2786, '0004620800000740', 0, 'short fem sawary', 1, '0.00', '88.00', 1, 0, './imgs/SHORT SAWARY 4.jfif', '2021-09-14 19:37:50', 7, 103, 'SHORT FEM SAWARY'),
(2787, 'SH00049', 0, 'SHORT FEM SAWARY', 1, '0.00', '89.00', 1, 0, './imgs/SHORT FEM 5.jfif', '2021-09-14 19:40:53', 16, 103, 'SHORT FEM SAWAERY'),
(2788, 'SH00050', 0, 'short fem sawary', 1, '0.00', '45.00', 1, 0, './imgs/SHORT FEM 6.jfif', '2021-09-14 19:43:18', 16, 103, 'SHORT FEM SAWARY'),
(2789, 'SH00051', 0, 'short fem sawary', 1, '0.00', '72.00', 1, 0, './imgs/SHORT FEM SAWARY 7.jfif', '2021-09-14 19:48:33', 16, 103, 'SHORT FEMININO SAWARY'),
(2790, 'SH00052', 0, 'short fem sawary', 1, '0.00', '88.00', 1, 0, './imgs/SHORT FEM 8.jfif', '2021-09-14 19:50:40', 16, 103, 'SHORT FEMININO SAWARY'),
(2791, 'SH00053', 0, 'BERMUDA FEM SAWARY', 1, '0.00', '45.00', 1, 0, './imgs/BER FEM 9.jfif', '2021-09-14 19:53:21', 16, 90, 'BERMUDA FEMININA SAWARY'),
(2792, 'SH00054', 0, 'BERMUDA FEM BIO TIPO', 1, '0.00', '89.00', 1, 0, './imgs/BERMUDA FEM 10.jfif', '2021-09-14 19:55:50', 16, 90, 'BERMUDA FEMININA BIO TIPO'),
(2793, 'SH00055', 0, 'BERMUDA FEM BIO TIPO', 1, '0.00', '88.00', 1, 0, './imgs/BERM BIO TIPO.jfif', '2021-09-14 19:57:39', 16, 90, 'BERMUDA FEMININA BIO TIPO'),
(2794, 'SH00056', 0, 'BERMUDA FEM BIO TIPO', 1, '0.00', '45.00', 1, 0, './imgs/BER BIO TIPO.jfif', '2021-09-14 19:59:26', 16, 90, 'BERMUDA FEMININA BIO TIPO'),
(2795, 'SH00057', 0, 'BERMUDA FEM SAWARY', 1, '0.00', '45.00', 1, 0, './imgs/BER SAWARY.jfif', '2021-09-14 20:01:27', 16, 90, 'BERMUDA FEMININA SAWARY'),
(2796, '7909457168741', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 1, 0, './imgs/44e54a7f-611b-4e61-a3bc-844770fa083f-3.jfif', '2021-09-15 13:02:03', 7, 91, 'TAM: XG\r\nDISPONIVEL NO PRETO'),
(2797, '7909457168727', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 1, 0, './imgs/44e54a7f-611b-4e61-a3bc-844770fa083f-4.jfif', '2021-09-15 13:02:53', 7, 91, 'TAM: M\r\nDISPONIVEL NO PRETO'),
(2798, '7909457168734', 0, 'CAMISA POLO MASC. HERING', 1, '35.00', '69.99', 0, 0, './imgs/44e54a7f-611b-4e61-a3bc-844770fa083f-5.jfif', '2021-09-15 13:05:01', 7, 91, 'TAM: G\r\nDISPONIVEL NO PRETO'),
(2799, '7909678299019', 0, 'Blusa fem. Hering', 1, '30.00', '59.99', 1, 0, './imgs/f24a7883-6bcb-4151-bab7-8497b2221b3d-3.jfif', '2021-09-15 13:48:43', 7, 89, 'TAM: G\r\nDISPONIVEL NO OFF WHITE'),
(2800, '7909678298999', 0, 'Blusa fem. Hering', 1, '30.00', '69.00', 1, 0, './imgs/f24a7883-6bcb-4151-bab7-8497b2221b3d-4.jfif', '2021-09-15 13:50:12', 16, 89, 'TAM: P\r\nDISPONIVEL NO OFF WHITE'),
(2801, '7909678299002', 0, 'Blusa fem. Hering', 1, '30.00', '59.99', 0, 0, './imgs/f24a7883-6bcb-4151-bab7-8497b2221b3d-5.jfif', '2021-09-15 13:51:13', 7, 89, 'TAM: M\r\nDISPONIVEL NO OFF WHITE'),
(2802, 'SH00050', 0, 'SHORT FEM HERING', 1, '45.00', '89.00', 1, 0, './imgs/2845ae8a-b2c0-4761-ad56-e75371ea4aca.jfif', '2021-09-15 17:31:49', 16, 103, 'TAM: 36'),
(2803, '7909112252914', 0, 'SHORT FEM HERING', 1, '45.00', '89.00', 1, 0, './imgs/8b283dc6-ce63-498b-8903-8730e60b45df.jfif', '2021-09-15 17:33:56', 16, 103, 'TAM: 46'),
(2804, 'SH00051', 0, 'SHORT FEM HERING', 1, '35.00', '78.00', 1, 0, './imgs/8b283dc6-ce63-498b-8903-8730e60b45df-1.jfif', '2021-09-15 17:37:59', 16, 103, 'TAM: 42'),
(2805, 'SH00051', 0, 'SHORT FEM HERING', 1, '45.00', '89.00', 1, 0, './imgs/f626e4c6-82cb-4b7c-a224-e13e2148a284.jfif', '2021-09-15 18:27:08', 16, 103, 'TAM: 40'),
(2806, 'SH00052', 0, 'SHORT FEM HERING', 1, '44.00', '88.00', 1, 0, './imgs/38ba7afa-96c7-49d1-b3ad-9c2d084b3315.jfif', '2021-09-15 18:35:33', 16, 103, 'TAM: 36'),
(2807, '7909245052511', 0, 'SHORT FEM HERING', 1, '45.00', '94.00', 2, 0, './imgs/a6e110b8-303b-40dd-9f82-9ddd1a67d11e.jfif', '2021-09-15 18:39:01', 7, 103, 'TAM: 36/46'),
(2808, '7909299473126', 0, 'SHORT FEM HERING', 1, '45.00', '99.00', 1, 0, './imgs/6986328f-ee75-4187-b2f8-61beeea5471a.jfif', '2021-09-15 18:45:43', 16, 103, 'TAM: 46');
INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`, `aplicacao`) VALUES
(2809, '7909299168244', 0, 'SHORT FEM HERING', 1, '50.00', '108.00', 1, 0, './imgs/283d8ead-1eec-4203-8ed0-d0d8dadc43e0.jfif', '2021-09-15 18:48:08', 16, 103, 'TAM: 46'),
(2810, 'SH00053', 0, 'SHORT FEM HERING', 1, '45.00', '92.00', 1, 0, './imgs/342d10ff-908f-4bdf-87b6-9a2bd9cd436a.jfif', '2021-09-15 18:52:58', 16, 103, 'TAM: 46'),
(2811, 'SH00054', 0, 'SHORT FEM HERING', 1, '45.00', '89.00', 1, 0, './imgs/27118a24-87e4-4794-81cc-5409bc24a8cf.jfif', '2021-09-15 18:56:38', 16, 103, 'TAM: 46'),
(2812, '7909112126161', 0, 'CAMISA BÁSICA HERING', 1, '25.00', '49.99', 1, 0, './imgs/13d69fad-8902-48fc-9385-27cb66aa8248.jfif', '2021-09-15 19:48:10', 7, 91, 'TAM: P'),
(2814, '7909678899875', 0, 'CAMISA MASC. BASICA HERING ', 1, '20.00', '39.99', 2, 0, './imgs/2021-09-16_11_08_51.jpg', '2021-09-16 14:08:51', 7, 91, 'TAM: G\r\nVERDE CLARO'),
(2815, '7909678899868', 0, 'Camisa masc. Basica hering ', 1, '20.00', '39.99', 2, 0, './imgs/2021-09-16_11_12_30.jpg', '2021-09-16 14:12:30', 7, 91, 'TAM: M'),
(2816, '7909173385248', 0, 'Bermuda fem hering ', 1, '45.00', '92.00', 1, 1, './imgs/2021-09-16_14_30_30.jpg', '2021-09-16 17:30:30', 4, 90, 'Tam: 48'),
(2817, '3226', 0, 'BERMUDA fem keams', 1, '44.00', '88.00', 1, 1, './imgs/2021-09-16_14_32_11.jpg', '2021-09-16 17:32:11', 4, 90, 'Tam: 48'),
(2818, 'Sh00055', 0, 'Short fem zarps', 1, '48.00', '48.00', 1, 1, './imgs/2021-09-16_14_34_50.jpg', '2021-09-16 17:34:50', 4, 103, 'Tam: 48'),
(2819, '02211017', 0, 'Bermuda fem Sawary ', 1, '45.00', '89.00', 1, 1, './imgs/2021-09-16_14_35_50.jpg', '2021-09-16 17:35:50', 4, 90, 'Tam 48'),
(2820, '0004943420000300', 0, 'BERMUDA FEM Sawary ', 1, '45.00', '92.00', 1, 1, './imgs/2021-09-16_14_37_06.jpg', '2021-09-16 17:37:06', 4, 90, 'Tam: 48'),
(2821, '010614800002', 0, 'BERMUDA FEM viagrafit', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-16_14_38_33.jpg', '2021-09-16 17:38:33', 4, 90, 'Tam:48'),
(2822, '910615000008', 0, 'BERMUDA FEM viagrafit', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-16_14_39_26.jpg', '2021-09-16 17:39:26', 4, 90, 'Tam: 50'),
(2823, '000510', 0, 'Short fem dinhos', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-16_14_59_37.jpg', '2021-09-16 17:59:37', 4, 103, 'Tam: 54'),
(2824, '3303202801', 0, 'Short alfaiataria primoris', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-16_15_02_44.jpg', '2021-09-16 18:02:44', 4, 104, 'Tam: p rosa c/listras de brilho '),
(2825, '3303202803', 0, 'Short alfaiataria primoris', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-16_15_08_17.jpg', '2021-09-16 18:08:18', 4, 104, 'Tam: g rosa c/listras de brilho '),
(2826, '3303200301', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-16_15_10_31.jpg', '2021-09-16 18:10:31', 4, 104, 'Tam: p cinza c/listras de brilho '),
(2827, '03200303', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-16_15_12_09.jpg', '2021-09-16 18:12:09', 4, 104, 'Tam: g cinza c/listras de brilho '),
(2828, '200304', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-16_15_13_44.jpg', '2021-09-16 18:13:44', 4, 104, 'Tam: gg cinza c/listras de brilho '),
(2829, '3303202804', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-16_15_15_14.jpg', '2021-09-16 18:15:14', 4, 104, 'Tam: gg rosa c/listras de brilho'),
(2830, '3303202802', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-16_15_19_21.jpg', '2021-09-16 18:19:21', 4, 104, 'Tam: m rosa c/listras de brilho '),
(2831, '3303200203', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 0, './imgs/2021-09-16_15_22_02.jpg', '2021-09-16 18:22:02', 7, 104, 'Tam: g verde c/LISTRAS de brilho '),
(2832, '3303200204', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 0, './imgs/2021-09-16_15_24_10.jpg', '2021-09-16 18:24:10', 7, 104, 'Tam:gg verde c/listras de brilho '),
(2833, '3303200202', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 0, './imgs/2021-09-17_09_09_26.jpg', '2021-09-17 12:09:26', 7, 104, 'Tam: m verde c/listras de brilho'),
(2834, '7890007250033', 0, 'Short alfaiataria lisa fi fashion', 1, '40.00', '40.00', 2, 1, './imgs/2021-09-17_09_14_48.jpg', '2021-09-17 12:14:48', 4, 104, 'Tam: m/g preto'),
(2835, '7890007250033', 0, 'Short alfaiataria lisa fi FASHION ', 1, '40.00', '40.00', 3, 1, './imgs/2021-09-17_09_18_07.jpg', '2021-09-17 12:18:07', 4, 104, 'Tam: p/m branco'),
(2836, '7890685437573', 0, 'Camisa basica masc. hering MAnga longa', 1, '30.00', '59.00', 1, 1, './imgs/2021-09-17_09_27_56.jpg', '2021-09-17 12:27:56', 4, 91, 'Tam: g/ cinza/ gola v'),
(2837, '7909386871323', 0, 'Camisa basica masc. HERING manga longa', 1, '30.00', '59.00', 1, 1, './imgs/2021-09-17_09_29_46.jpg', '2021-09-17 12:29:46', 4, 91, 'Tam: g/ mescla/ gola v'),
(2838, '7909588498779', 0, 'Calça fem. HERING flare', 1, '60.00', '130.00', 1, 1, './imgs/2021-09-17_09_38_21.jpg', '2021-09-17 12:38:21', 4, 105, 'Tam: 38/ jeans'),
(2839, 'Sh00056', 0, 'Short alfaiataria canoni', 1, '35.00', '78.00', 1, 1, './imgs/2021-09-17_09_42_51.jpg', '2021-09-17 12:42:51', 4, 104, 'Tam: g vinho c/ listra branca'),
(2840, '3339B', 0, 'SHORT ALFAIATARIA PRIMORIS ', 1, '30.00', '59.00', 4, 1, './imgs/2021-09-17_10_02_19.jpg', '2021-09-17 13:02:19', 4, 104, 'Tam: m/g/gg cores: amarelo/laranja'),
(2841, 'Sh00057', 0, 'Short alfaiataria linalu', 1, '30.00', '65.00', 6, 0, './imgs/2021-09-17_10_07_45.jpg', '2021-09-17 13:07:45', 7, 104, 'Tam: P/ m/g/gg cores: verde e rosa'),
(2842, 'Sh00058', 0, 'Short alfaiataria gurgling', 1, '30.00', '65.00', 2, 1, './imgs/2021-09-17_10_22_43.jpg', '2021-09-17 13:22:43', 4, 104, 'Tam: p/m preto'),
(2843, '2884', 0, 'Short alfaiataria job', 1, '40.00', '82.00', 3, 1, './imgs/2021-09-17_10_26_13.jpg', '2021-09-17 13:26:13', 4, 104, 'Tam: m/g xadrez'),
(2844, '4548', 0, 'Short alfaiataria canoni', 1, '30.00', '68.00', 2, 1, './imgs/2021-09-17_10_35_32.jpg', '2021-09-17 13:35:32', 4, 104, 'Tam: p/m xadrez c/zíper frontal '),
(2845, 'Sh00059', 0, 'Short alfaiataria clarineta', 1, '45.00', '89.00', 4, 0, './imgs/2021-09-17_10_46_08.jpg', '2021-09-17 13:46:08', 7, 104, 'Tam: p/g cores: rosa/cru'),
(2846, '005863', 0, 'Short meia coxa sarja eunice', 1, '35.00', '78.00', 3, 1, './imgs/2021-09-17_11_03_35.jpg', '2021-09-17 14:03:35', 4, 104, 'Tam: 44/46/48 cores: azul marinho/azul bic'),
(2847, '5161', 0, 'Short alfaiataria meia coxa arary', 1, '30.00', '65.00', 4, 1, './imgs/2021-09-17_11_07_41.jpg', '2021-09-17 14:07:41', 4, 104, 'Tam: m/g cores: preto/bege/marrom'),
(2848, '2956', 0, 'Bermuda alfaiataria lavita', 1, '30.00', '68.00', 0, 0, './imgs/2021-09-17_14_13_39.jpg', '2021-09-17 17:13:39', 7, 90, 'Tam: m preta'),
(2849, '005876040006', 0, 'Short alfaiataria sunnydays', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-17_14_19_19.jpg', '2021-09-17 17:19:19', 4, 104, 'Tam: gg branco '),
(2850, '005876035309', 0, 'Short alfaiataria  sunnydays', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-17_14_20_21.jpg', '2021-09-17 17:20:21', 4, 104, 'Tam: g verde militar'),
(2851, '005876034609', 0, 'Short alfaiataria sunnydays', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-17_14_21_32.jpg', '2021-09-17 17:21:32', 4, 104, 'Tam: g azul marinho'),
(2852, '2632', 0, 'Short alfaiataria wi-fi', 1, '44.00', '88.00', 3, 1, './imgs/2021-09-17_14_25_43.jpg', '2021-09-17 17:25:43', 4, 104, 'Tam: p/g cores: rosa e preto de linho'),
(2853, 'Sh00060', 0, 'Short tropical', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-17_14_29_06.jpg', '2021-09-17 17:29:06', 4, 104, 'Tam: m preto'),
(2854, '19204', 0, 'Short alfaiataria cocci modas', 1, '30.00', '62.00', 1, 1, './imgs/2021-09-17_14_31_54.jpg', '2021-09-17 17:31:54', 4, 104, 'Tam: m estampado'),
(2855, '005877032802', 0, 'Short alfaiataria sunnydays', 1, '30.00', '68.00', 2, 1, './imgs/2021-09-17_14_35_56.jpg', '2021-09-17 17:35:56', 4, 104, 'Tam: g'),
(2856, 'Sh00061', 0, 'Short alfaiataria espaço virtual ', 1, '30.00', '30.00', 2, 1, './imgs/2021-09-17_14_39_39.jpg', '2021-09-17 17:39:39', 4, 104, 'Tam: p/g off White '),
(2857, '07847', 0, 'Short saia dom.ltda', 1, '30.00', '65.00', 2, 1, './imgs/2021-09-17_14_42_59.jpg', '2021-09-17 17:42:59', 4, 104, 'Tam: g'),
(2858, '51215828', 0, 'Short saia rock house', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-17_14_46_19.jpg', '2021-09-17 17:46:19', 4, 104, 'Tam: g'),
(2859, '2077', 0, 'Short alfaiataria espaço virtual ', 1, '25.00', '58.00', 1, 1, './imgs/2021-09-17_15_02_30.jpg', '2021-09-17 18:02:30', 4, 104, 'Tam: g'),
(2860, '', 0, '', 1, '0.00', '0.00', 0, 1, './imgs/2021-09-17_15_04_12.jpg', '2021-09-17 18:04:12', 4, 0, ''),
(2861, '7890000096720', 0, 'Short tropical', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-17_15_04_56.jpg', '2021-09-17 18:04:56', 4, 104, 'Tam: g'),
(2862, 'Sh00062', 0, 'Short youse ', 1, '44.00', '88.00', 1, 1, './imgs/2021-09-17_15_09_02.jpg', '2021-09-17 18:09:02', 4, 104, 'Tam: 48'),
(2863, 'Sh00063', 0, 'Short alfaiataria espaço virtual ', 1, '30.00', '60.00', 1, 0, './imgs/2021-09-17_15_14_46.jpg', '2021-09-17 18:14:46', 7, 104, 'Tam: g'),
(2864, '4562', 0, 'Short alfaiataria linho', 1, '30.00', '65.00', 1, 1, './imgs/2021-09-17_15_18_14.jpg', '2021-09-17 18:18:14', 4, 104, 'Tam: g rose'),
(2865, 'Sh00064', 0, 'Short alfaiataria espaço virtual ', 1, '30.00', '65.00', 1, 1, './imgs/2021-09-17_15_47_56.jpg', '2021-09-17 18:47:56', 4, 104, 'Tam: p'),
(2866, '77007575', 0, 'Short maru fashion', 1, '35.00', '78.00', 1, 1, './imgs/2021-09-17_15_57_42.jpg', '2021-09-17 18:57:42', 4, 104, 'Tam: p'),
(2867, 'Sh00065', 0, 'Short alfaiataria ', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-17_16_04_21.jpg', '2021-09-17 19:04:21', 4, 104, 'Tam: p'),
(2868, 'Shooo66', 0, 'Short alfaiataria ', 1, '25.00', '25.00', 1, 1, './imgs/2021-09-17_16_06_21.jpg', '2021-09-17 19:06:21', 4, 104, 'Tam: m'),
(2869, '13313', 0, 'Short alfaiataria ', 1, '44.00', '88.00', 1, 1, './imgs/2021-09-17_16_08_11.jpg', '2021-09-17 19:08:11', 4, 104, 'Tam: p'),
(2870, 'Sh00067', 0, 'Short saia alfaiataria ', 1, '30.00', '65.00', 1, 1, './imgs/2021-09-17_16_10_52.jpg', '2021-09-17 19:10:52', 4, 104, 'Tam: p'),
(2871, '7909678477806', 0, 'Camisa masc. HERING ', 1, '40.00', '79.00', 1, 1, './imgs/2021-09-17_16_36_21.jpg', '2021-09-17 19:36:21', 4, 91, 'Tam: p'),
(2872, '7909678477813', 0, 'Camisa masc. HERING ', 1, '40.00', '79.00', 1, 1, './imgs/2021-09-17_16_37_07.jpg', '2021-09-17 19:37:07', 4, 91, 'Tam: m'),
(2873, '7909678477820', 0, 'Camisa masc. HERING ', 1, '40.00', '79.00', 1, 1, './imgs/2021-09-17_16_37_52.jpg', '2021-09-17 19:37:52', 4, 91, 'Tam: g'),
(2874, 'Sh00074', 0, 'Short alfaiataria ', 1, '27.00', '68.00', 5, 1, './imgs/2021-09-20_16_23_56.jpg', '2021-09-20 19:23:56', 4, 104, 'Tam único cores: azul marinho e verde '),
(2875, 'Sh00072', 0, 'Short alfaiataria cinto duplo', 1, '27.00', '68.00', 6, 1, './imgs/2021-09-20_16_30_47.jpg', '2021-09-20 19:30:47', 4, 104, 'Tam único  cores: preto, branco, rosê e azul marinho '),
(2876, 'Sh00073', 0, 'Short alfaiataria cos folho', 1, '27.00', '68.00', 5, 1, './imgs/2021-09-20_16_32_56.jpg', '2021-09-20 19:32:56', 4, 104, 'Tam: unico cores: preto, branco e azul marinho '),
(2877, 'Sh00071', 0, 'Short saia alfaiataria c/cinto', 1, '27.00', '68.00', 5, 1, './imgs/2021-09-20_16_38_39.jpg', '2021-09-20 19:38:39', 4, 104, 'Tam: UNICO cores: rosê, vermelho, amarelo, branco e preto'),
(2878, 'Sh00070', 0, 'Short alfaiataria ', 1, '22.00', '65.00', 4, 1, './imgs/2021-09-20_16_40_40.jpg', '2021-09-20 19:40:40', 4, 104, 'Tam: único cores: vermelho, rosê, branco e azul marinho '),
(2879, 'Sh00069', 0, 'Short alfaiataria cinto trança ', 1, '22.00', '65.00', 6, 1, './imgs/2021-09-20_16_44_09.jpg', '2021-09-20 19:44:09', 4, 104, 'Tam: único cores: preto, rosê, vermelho, mostarda, amarelo e azul marinho '),
(2880, 'Sh00068', 0, 'Short alfaiataria c/cinto ', 1, '22.00', '65.00', 5, 0, './imgs/2021-09-20_16_48_31.jpg', '2021-09-20 19:48:31', 7, 104, 'Tam: unico cores: mostarda, preto, azul marinho, ROSÊ e branco '),
(2881, 'LM0012565688', 0, 'Short hering fem', 1, '45.00', '92.00', 1, 0, './imgs/2021-09-20_17_12_10.jpg', '2021-09-20 20:12:10', 7, 103, 'Tam: 38 DISPONIVEL NO PINK'),
(2882, '7909457125249', 0, 'Short fem hering ', 1, '45.00', '92.00', 1, 1, './imgs/2021-09-20_17_16_44.jpg', '2021-09-20 20:16:44', 4, 103, 'Tam: 38'),
(2883, '3303200201', 0, 'Short alfaiataria prímoris ', 1, '30.00', '68.00', 1, 1, './imgs/2021-09-20_17_19_03.jpg', '2021-09-20 20:19:03', 4, 104, 'Tam: p'),
(2884, 'Sh00075', 0, 'Short loola paloozza', 1, '35.00', '72.00', 1, 1, './imgs/2021-09-21_11_16_29.jpg', '2021-09-21 14:16:29', 4, 103, 'Tam: 40'),
(2885, 'Sh00076', 0, 'SHORT FEM HERING ', 1, '45.00', '92.00', 1, 1, './imgs/2021-09-21_11_17_44.jpg', '2021-09-21 14:17:44', 4, 103, 'Tam: 38 preto'),
(2886, '1141-2', 0, 'Bermuda mauricinho stella artois-azil', 1, '0.00', '50.00', 1, 1, './imgs/2021-09-22_17_19_43.jpg', '2021-09-22 20:19:43', 4, 90, 'Estampado'),
(2887, '1141-4', 0, 'BERMUDA mauricinho stella artois-azul', 1, '0.00', '50.00', 1, 1, './imgs/2021-09-22_17_21_29.jpg', '2021-09-22 20:21:29', 4, 90, 'Estampado '),
(2888, 'g1008-3', 0, 'Bermuda mauricinho preto ', 1, '0.00', '40.00', 2, 1, './imgs/2021-09-22_17_23_01.jpg', '2021-09-22 20:23:01', 4, 90, 'Liso'),
(2889, '1326-3', 0, 'Bermuda MAURICINHO folhas verde ', 1, '0.00', '50.00', 1, 1, './imgs/2021-09-22_17_24_52.jpg', '2021-09-22 20:24:52', 4, 90, 'Estampado '),
(2890, '1121-2', 0, 'BERMUDA MAURICINHO listras reggae', 1, '0.00', '50.00', 1, 1, './imgs/2021-09-22_17_26_49.jpg', '2021-09-22 20:26:49', 4, 90, 'Estampado '),
(2891, '1377-2', 0, 'BERMUDA MAURICINHO ', 1, '25.00', '50.00', 1, 1, './imgs/2021-09-22_17_40_30.jpg', '2021-09-22 20:40:30', 4, 90, 'Listra azul marinho- M'),
(2892, '1106-4', 0, 'BERMUDA MAURICINHO ', 1, '25.00', '50.00', 1, 1, './imgs/2021-09-22_17_41_42.jpg', '2021-09-22 20:41:42', 4, 90, 'Liso dois tons roxo- g'),
(2893, '1140-2', 0, 'BERMUDA MAURICINHO bebida dominó ', 1, '25.00', '50.00', 1, 1, './imgs/2021-09-22_17_43_39.jpg', '2021-09-22 20:43:39', 4, 90, 'Marfim- m'),
(2894, '1140-3', 0, 'BERMUDA MAURICINHO bebida dominó ', 1, '25.00', '50.00', 1, 1, './imgs/2021-09-22_17_45_08.jpg', '2021-09-22 20:45:08', 4, 90, 'Marfim- G'),
(2895, '1192-3', 0, 'Bermuda MAURICINHO tucano', 1, '25.00', '50.00', 1, 1, './imgs/2021-09-22_17_46_04.jpg', '2021-09-22 20:46:04', 4, 90, 'Branco- G'),
(2896, 'i1002-3', 0, 'BERMUDA MAURICINHO chumbo', 1, '20.00', '40.00', 2, 1, './imgs/2021-09-22_17_47_28.jpg', '2021-09-22 20:47:28', 4, 90, 'M'),
(2897, 's1101-3', 0, 'BERMUDA surf', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-22_17_51_10.jpg', '2021-09-22 20:51:10', 4, 90, 'Tam: 40 liso preto'),
(2898, 's1101-4', 0, 'Bermuda surf', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-22_17_52_20.jpg', '2021-09-22 20:52:20', 4, 90, 'Tam 42 liso preto'),
(2899, '15511294', 0, 'Bermuda surf', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-22_17_54_24.jpg', '2021-09-22 20:54:24', 4, 90, 'Tam 44 liso preto'),
(2900, 's1101-6', 0, 'Bermuda surf', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-22_17_56_51.jpg', '2021-09-22 20:56:51', 4, 90, 'Tam 46 preto liso'),
(2901, '1171-4', 0, 'Bermuda MAURICINHO ', 1, '25.00', '50.00', 1, 1, './imgs/2021-09-22_18_00_29.jpg', '2021-09-22 21:00:30', 4, 90, 'Listra preta azul- g'),
(2902, 'Ber2020', 0, 'BERMUDA surf', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-22_18_03_08.jpg', '2021-09-22 21:03:08', 4, 90, '42 azul liso cos preto '),
(2904, 'Ber2021', 0, 'BERMUDA SURF ', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-22_18_04_39.jpg', '2021-09-22 21:04:39', 4, 90, '40 azul liso cos branco '),
(2905, 'Ber2022', 0, 'BERMUDA SURF ', 1, '30.00', '60.00', 1, 1, './imgs/2021-09-22_18_06_02.jpg', '2021-09-22 21:06:02', 4, 90, '42 azul liso cos preto '),
(2906, 'Ber2023', 0, 'BERMUDA SURF ', 1, '30.00', '60.00', 3, 0, './imgs/2021-09-22_18_07_31.jpg', '2021-09-22 21:07:31', 7, 90, '40/42/44 cinza chumbo liso cos preto '),
(2907, '7909588709349', 0, 'Short fem hering komq/1esi', 1, '57.00', '115.00', 2, 1, './imgs/2021-09-24_17_40_40.jpg', '2021-09-24 20:40:40', 4, 103, 'Tam: 38 bege'),
(2909, '7909588709356', 0, 'Short fem hering komq/1esi', 1, '57.00', '115.00', 2, 1, './imgs/2021-09-24_17_42_36.jpg', '2021-09-24 20:42:36', 4, 103, 'Tam: 40 begr'),
(2910, '7909588709363', 0, 'Short fem hering komq/1esi', 1, '57.00', '115.00', 2, 1, './imgs/2021-09-24_17_43_53.jpg', '2021-09-24 20:43:53', 4, 103, 'Tam: 42 bege'),
(2911, '7909588709431', 0, 'Short feminino hering komq/1fsi', 1, '57.00', '115.00', 2, 1, './imgs/2021-09-24_17_46_43.jpg', '2021-09-24 20:46:43', 4, 103, 'Tam: 42 caqui'),
(2912, '7909588709417', 0, 'Short fem hering komq/1fsi', 1, '57.00', '115.00', 1, 1, './imgs/2021-09-24_17_48_05.jpg', '2021-09-24 20:48:05', 4, 103, 'Tam: 38 caqui'),
(2913, '7909588709424', 0, 'Short fem hering komq/1fsi', 1, '57.00', '115.00', 2, 1, './imgs/2021-09-24_17_49_34.jpg', '2021-09-24 20:49:34', 4, 103, 'Tam:40 caqui'),
(2914, '7909386268482', 0, 'SHORT FEM HERING komq/n10si', 1, '57.00', '115.00', 2, 1, './imgs/2021-09-24_17_56_21.jpg', '2021-09-24 20:56:21', 4, 103, 'Tam: 38 preto'),
(2915, '7909386268499', 0, 'SHORT FEM HERING komq/n1osi', 1, '57.00', '115.00', 2, 1, './imgs/2021-09-24_17_57_43.jpg', '2021-09-24 20:57:43', 4, 103, 'Tam: 4o preto '),
(2916, '7909386268505', 0, 'SHORT fem hering komq/n10si', 1, '57.00', '115.00', 2, 1, './imgs/2021-09-24_17_58_46.jpg', '2021-09-24 20:58:46', 4, 103, 'Tam: 42 preto'),
(2917, '7909678120320', 0, 'SHORT JEANS COLEGIAL FEM 40', 1, '57.00', '115.00', 2, 0, './imgs/short hering 2.jpg', '2021-09-25 13:14:55', 7, 103, ''),
(2918, '7909678120559', 0, 'BERMUDA JEANS COLEGIAL HERING 38', 1, '68.00', '138.00', 2, 0, './imgs/BERMUDA hering.jpg', '2021-09-25 13:25:19', 7, 90, ''),
(2919, '7909678120566', 0, 'BERMUDA JEANS COLEGIAL HERING 40', 1, '68.00', '138.00', 2, 0, './imgs/BERMUDA hering-1.jpg', '2021-09-25 13:30:41', 7, 90, ''),
(2920, '7909678120597', 0, 'BERMUDA JEANS COLEGIAL HERING 46', 1, '69.00', '138.00', 1, 0, './imgs/BERMUDA hering-2.jpg', '2021-09-25 13:32:40', 7, 90, ''),
(2921, '7909678120603', 0, 'BERMUDA JEANS COLEGIAL HERING 48', 1, '69.00', '138.00', 1, 0, './imgs/BERMUDA hering-3.jpg', '2021-09-25 13:34:32', 7, 90, ''),
(2922, '7909678120573', 0, 'BERMUDA JEANS COLEGIAL HERING 42', 1, '68.00', '138.00', 2, 0, './imgs/BERMUDA hering-4.jpg', '2021-09-25 13:36:27', 7, 90, ''),
(2923, '7909678780746', 0, 'BERMUDA SARJA LARANJA HERING 44', 1, '69.00', '138.00', 2, 0, './imgs/BERMUDA FEM. HERING LARANJA 1.jfif', '2021-09-25 14:01:34', 7, 90, ''),
(2924, '7909678780753', 0, 'BERMUDA SARJA LARANJA HERING 46', 1, '69.00', '138.00', 1, 0, './imgs/BERMUDA FEM. HERING LARANJA 1-1.jfif', '2021-09-25 14:03:28', 16, 90, ''),
(2925, '7909678780739', 0, 'BERMUDA SARJA LARANJA HERING 42', 1, '69.00', '138.00', 2, 0, './imgs/BERMUDA FEM. HERING LARANJA 1-2.jfif', '2021-09-25 14:04:55', 7, 90, ''),
(2926, '7909678780722', 0, 'BERMUDA SARJA LARANJA HERING 40', 1, '69.00', '138.00', 2, 0, './imgs/BERMUDA FEM. HERING LARANJA 1-3.jfif', '2021-09-25 14:07:13', 7, 90, ''),
(2927, '7909588570666', 0, 'CALÇA SKINY PRETA 38', 1, '80.00', '162.00', 2, 0, './imgs/SUPER SKINY HERING.jpg', '2021-09-25 14:18:14', 7, 105, ''),
(2928, '7909588570680', 0, 'CALÇA SKINY PRETA 42', 1, '80.00', '162.00', 2, 0, './imgs/SUPER SKINY HERING-1.jpg', '2021-09-25 14:19:51', 7, 105, ''),
(2929, '7909588570673', 0, 'CALÇA SKINY PRETA  40', 1, '80.00', '162.00', 2, 0, './imgs/SUPER SKINY HERING-2.jpg', '2021-09-25 14:20:48', 7, 105, ''),
(2930, '7909588570697', 0, 'CALÇA SKINY PRETA  44', 1, '80.00', '162.00', 1, 0, './imgs/SUPER SKINY HERING-4.jpg', '2021-09-25 14:22:22', 16, 105, ''),
(2931, '7909678120313', 0, 'SHORT JEANS COLEGIAL FEM 38', 1, '57.00', '115.00', 1, 0, './imgs/short hering 2-1.jpg', '2021-09-25 14:31:42', 16, 103, ''),
(2932, '7891702072609', 0, 'Calça masc. Jeans hering ', 1, '60.00', '120.00', 2, 1, './imgs/2021-09-28_09_24_01.jpg', '2021-09-28 12:24:01', 4, 92, 'Tam: 38/44'),
(2933, '578100842', 0, 'Calça masc. Young style ', 1, '50.00', '108.00', 1, 1, './imgs/2021-09-28_09_30_12.jpg', '2021-09-28 12:30:12', 4, 92, 'Tam: 42 sarja'),
(2934, '7909245138710', 0, 'Calça masc. Hering', 1, '65.00', '138.00', 1, 1, './imgs/2021-09-28_09_51_49.jpg', '2021-09-28 12:51:49', 4, 92, 'Tam: 38 jeans '),
(2935, '7909173638641', 0, 'Calça masc. Hering', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_09_57_29.jpg', '2021-09-28 12:57:29', 4, 92, 'Tam: 38 jeans'),
(2936, '7909112579851', 0, 'Calça masc. HERING ', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_10_01_31.jpg', '2021-09-28 13:01:31', 4, 92, 'Tam: 38 jeans'),
(2937, 'Cl1010', 0, 'Calça masc. Hering', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_10_06_55.jpg', '2021-09-28 13:06:55', 4, 92, 'Tam: 40 jeans skinny'),
(2938, '7909386413622', 0, 'Calça masc. Hering', 1, '70.00', '140.00', 42, 1, './imgs/2021-09-28_10_27_49.jpg', '2021-10-17 22:28:00', 4, 92, 'Tam: 44/46'),
(2939, 'Cl1011', 0, 'Calça masc. young style', 1, '50.00', '110.00', 1, 1, './imgs/2021-09-28_10_36_25.jpg', '2021-09-28 13:36:25', 4, 92, 'Tam: 46 jeans '),
(2940, '536900842', 0, 'Calça masc.young style', 1, '45.00', '98.00', 2, 1, './imgs/2021-09-28_10_43_28.jpg', '2021-09-28 13:43:28', 4, 92, 'Tam: 42 sarja preta'),
(2941, '410000244', 0, 'Calça masc. Young style', 1, '40.00', '83.00', 1, 1, './imgs/2021-09-28_10_45_27.jpg', '2021-09-28 13:45:27', 4, 92, 'Tam: 44 brim preto'),
(2942, '410000246', 0, 'Calça masc. Young STYLE ', 1, '40.00', '83.00', 1, 1, './imgs/2021-09-28_10_47_15.jpg', '2021-09-28 13:47:15', 4, 92, 'Tam: 46 brim preto'),
(2943, '7890001186413', 0, 'Calça masc. top rock ', 1, '35.00', '69.00', 1, 1, './imgs/2021-09-28_10_56_37.jpg', '2021-09-28 13:56:37', 4, 92, 'Tam: 38 básica '),
(2944, '7891235461611', 0, 'Calça masc. Crocker ref: 39153', 1, '55.00', '110.00', 1, 1, './imgs/2021-09-28_11_01_12.jpg', '2021-09-28 14:01:12', 4, 92, 'Tam: 38 jeans claro'),
(2945, 'Cl1012', 0, 'Calça  masc. CROCKER new basic', 1, '45.00', '98.00', 2, 0, './imgs/2021-09-28_11_08_56.jpg', '2021-09-28 14:08:56', 7, 92, 'Tam: 38 jenas'),
(2946, '1095', 0, 'Calça masc. CROCKER ', 1, '40.00', '85.00', 1, 1, './imgs/2021-09-28_11_18_30.jpg', '2021-09-28 14:18:30', 4, 92, 'Tam: 38 lavagem preta'),
(2947, 'Cl1013', 0, 'Calça masc. HERING ', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_11_25_12.jpg', '2021-09-28 14:25:12', 4, 92, 'Tam: 40'),
(2948, '7909112581427', 0, 'Calça masc. HERING ', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_11_28_35.jpg', '2021-09-28 14:28:35', 4, 92, 'Tam: 36 jeans '),
(2949, 'Cl1014', 0, 'Calça masc. Biotipo', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_11_32_15.jpg', '2021-09-28 14:32:15', 4, 92, 'Tam: 40'),
(2950, 'Cl1015', 0, 'Calça masc. Hering', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_11_36_44.jpg', '2021-09-28 14:36:44', 4, 92, 'Tam: 38'),
(2951, '7909021812964', 0, 'Calça masc. HERING ', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_11_39_55.jpg', '2021-09-28 14:39:55', 4, 92, 'Tam: 36 carrot'),
(2952, '7909173228033', 0, ' Calça masc. HERING ', 1, '60.00', '120.00', 2, 1, './imgs/2021-09-28_15_51_09.jpg', '2022-01-11 22:58:00', 4, 92, 'Tam: 36/38 jeans'),
(2953, '7909112764196', 0, 'Calça masc. HERING ', 1, '60.00', '120.00', 2, 1, './imgs/2021-09-28_15_53_07.jpg', '2021-09-28 18:53:07', 4, 92, 'Tam: 36 jeans'),
(2954, 'Cl1016', 0, 'Calça MASC.HERING ', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-28_15_57_57.jpg', '2021-09-28 18:57:57', 4, 92, 'Tam: 36 jeans azul basica '),
(2955, 'Cl1017', 0, 'Calça masc. HERING ', 1, '60.00', '120.00', 2, 1, './imgs/2021-09-28_16_00_58.jpg', '2021-09-28 19:00:58', 4, 92, 'Tam: 38'),
(2956, '00027261', 0, 'CALÇA MASC. EFF\'S', 1, '55.00', '110.00', 3, 0, './imgs/CALÇA MASCULINA.jfif', '2021-09-29 13:03:02', 16, 92, 'TAM: 42 JEANS'),
(2957, '00027262', 0, 'CALÇA MASC. EFF\'S', 1, '55.00', '110.00', 2, 0, './imgs/CALÇA MASCULINA-1.jfif', '2021-09-29 13:05:53', 16, 92, 'TAM: 44 JEANS'),
(2958, '41465', 0, 'CALÇA MASC. EFF\'S', 1, '55.00', '110.00', 1, 0, './imgs/d5171964-9aa4-4acb-b41b-3a4f5d1e7b6c.jfif', '2021-09-29 13:11:20', 16, 92, 'TAM: 36'),
(2959, '00031539', 0, 'CALÇA MASC. EFF\'S', 1, '50.00', '102.00', 1, 0, './imgs/5d4ceb11-35d1-443e-a163-e8e7c5e1c051.jfif', '2021-09-29 13:15:59', 16, 92, 'TAM: 44 JENAS PRETA'),
(2960, '00021780', 0, 'CALÇA MASC. EFF\'S', 1, '50.00', '108.00', 1, 0, './imgs/0a6446ff-1e1d-4699-a6f0-5b3532db3ea8.jfif', '2021-09-29 13:18:15', 16, 92, 'TAM: 44'),
(2961, '00031532', 0, 'CALÇA MASC. EFF\'S', 1, '55.00', '110.00', 1, 0, './imgs/47cb2557-f8d7-4532-82cc-8d6b46df88a0.jfif', '2021-09-29 13:20:19', 16, 92, 'TAM: 44'),
(2962, '7909588460103', 0, 'CALÇA MASC. HERING', 1, '70.00', '140.00', 1, 0, './imgs/CALÇA MASC. HERING BASICA.jfif', '2021-09-29 13:32:51', 16, 92, 'TAM: 36'),
(2963, '7909588460110', 0, 'CALÇA MASC. HERING', 1, '70.00', '140.00', 1, 0, './imgs/CALÇA MASC. HERING BASICA-1.jfif', '2021-09-29 13:34:08', 16, 92, 'TAM: 38'),
(2964, '7909588460127', 0, 'CALÇA MASC. HERING', 1, '70.00', '140.00', 1, 0, './imgs/CALÇA MASC. HERING BASICA-2.jfif', '2021-09-29 13:37:32', 16, 92, 'TAM: 40'),
(2965, '7909588460134', 0, 'CALÇA MASC. HERING', 1, '70.00', '140.00', 2, 0, './imgs/CALÇA MASC. HERING BASICA-3.jfif', '2021-09-29 13:38:41', 16, 92, 'TAM: 42'),
(2966, '7909588460141', 0, 'CALÇA MASC. HERING', 1, '70.00', '140.00', 1, 0, './imgs/CALÇA MASC. HERING BASICA-4.jfif', '2021-09-29 13:39:45', 16, 92, 'TAM: 44'),
(2967, '7909588460158', 0, 'CALÇA MASC. HERING', 1, '70.00', '140.00', 2, 0, './imgs/CALÇA MASC. HERING BASICA-5.jfif', '2021-09-29 13:40:43', 16, 92, 'TAM: 46'),
(2968, '7909588763921', 0, 'CALÇA MASC. HERING', 1, '70.00', '140.00', 1, 0, './imgs/CALÇA MASC. HERING BASICA-6.jfif', '2021-09-29 13:41:34', 16, 92, 'TAM: 50'),
(2969, '7909588763938', 0, 'CALÇA  MASC. HERING', 1, '70.00', '140.00', 1, 0, './imgs/CALÇA MASC. HERING BASICA-7.jfif', '2021-09-29 13:42:29', 16, 92, 'TAM: 52'),
(2970, '7891992159592', 0, 'CALÇA MASC. KNT', 1, '50.00', '118.00', 1, 0, './imgs/de3df970-2dc9-49b8-b8b4-04138f2b643a.jfif', '2021-09-29 13:48:28', 16, 92, 'TAM: 40'),
(2971, 'CL1018', 0, 'CALÇA MASC. KNT', 1, '40.00', '80.00', 1, 0, './imgs/725a231a-7358-465c-9190-00fa49a3b5e5.jfif', '2021-09-29 13:51:39', 16, 92, 'TAM: 40'),
(2972, 'CL1019', 0, 'CALÇA MASC. KNT', 1, '40.00', '80.00', 1, 0, './imgs/9adbbc07-8916-4ec6-9363-696483bb7076.jfif', '2021-09-29 13:54:05', 16, 92, 'TAM: 40'),
(2973, '0002554860000680', 0, 'CALÇA MASC. SAWARY', 1, '55.00', '115.00', 1, 0, './imgs/2ad6ac3e-19e4-41b5-90ed-22a0e52dbbf8.jfif', '2021-09-29 14:01:09', 16, 92, 'TAM: 38'),
(2974, '0003127500000260', 0, 'CALÇA MASC. SAWARY', 1, '60.00', '120.00', 1, 0, './imgs/e126233f-eb97-497d-bf43-72e81de62afb.jfif', '2021-09-29 14:35:35', 16, 92, 'TAM: 36'),
(2975, '0003127520000310', 0, 'CALÇA MASC. SAWARY', 1, '60.00', '120.00', 3, 0, './imgs/e126233f-eb97-497d-bf43-72e81de62afb-1.jfif', '2021-09-29 14:36:56', 16, 92, 'TAM: 40'),
(2976, '000610', 0, 'CALÇA  MASC. SAWARY', 1, '70.00', '140.00', 1, 0, './imgs/8711178a-2f52-49f9-8f84-589d4bd4ca23.jfif', '2021-09-29 14:39:20', 16, 92, 'TAM: 42'),
(2977, '7510000050', 0, 'CALÇA MASC. SAWARY', 1, '60.00', '120.00', 1, 0, './imgs/e126233f-eb97-497d-bf43-72e81de62afb-2.jfif', '2021-09-29 14:42:59', 16, 92, 'TAM: 38'),
(2978, '0003256920000560', 0, 'CALÇA MASC. SAWARY', 1, '60.00', '120.00', 2, 0, './imgs/a316d1b1-fb86-4614-aac8-f24430f38e8a.jfif', '2021-09-29 14:46:38', 16, 92, 'TAM: 36/38'),
(2979, '2500459606061', 0, 'CALÇA fem. Handara', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-29_16_00_23.jpg', '2021-09-29 19:00:23', 4, 105, 'Tam: 50'),
(2980, 'CL1020', 0, 'CALÇA MASC. CROCKER ', 1, '65.00', '130.00', 1, 0, './imgs/213e6816-2161-4344-88a7-888847d8db46.jfif', '2021-09-29 19:36:47', 16, 105, 'TAM: 38 \r\nSKINNY COS MEDIO'),
(2981, '00035038', 0, 'CALÇA FEM. EFF\'S', 1, '65.00', '130.00', 1, 0, './imgs/a46b012f-1f38-498d-87c1-6ab046527dfa.jfif', '2021-09-29 19:38:29', 16, 105, 'TAM: 48'),
(2982, '00035037', 0, 'CALÇA FEM. EFF\'S', 1, '65.00', '130.00', 1, 0, './imgs/a46b012f-1f38-498d-87c1-6ab046527dfa-1.jfif', '2021-09-29 19:39:27', 16, 105, 'TAM: 46'),
(2983, '008654200005', 0, 'CALÇA FEM. VIAGRAFIT', 1, '70.00', '140.00', 1, 0, './imgs/167b778c-f8a8-466a-bfe3-c98f6e23711e.jfif', '2021-09-29 19:49:29', 16, 105, 'TAM: 42\r\nFLARE'),
(2984, '008654000001', 0, 'CALÇA FEM. VIAGRAFIT', 1, '70.00', '140.00', 1, 0, './imgs/167b778c-f8a8-466a-bfe3-c98f6e23711e-1.jfif', '2021-09-29 19:50:51', 16, 105, 'TAM: 40\r\nFLARE'),
(2985, 'CL1021', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 1, 0, './imgs/47a3c599-6e15-4ae9-b317-75dd20c36021.jfif', '2021-09-29 20:05:53', 16, 105, 'TAM: 40\r\nLIPO'),
(2986, 'CL1022', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 1, 0, './imgs/87d2d6e1-4830-4203-8b76-c0ad7b73d8d5.jfif', '2021-09-29 20:08:33', 16, 105, 'TAM: 40\r\nLIPO'),
(2987, 'CL1023', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 1, 0, './imgs/8a89d547-3417-4dc2-88f1-de643b3d4f4b.jfif', '2021-09-29 20:13:24', 16, 105, 'TAM: 40\r\nLIPO'),
(2988, 'CL1024', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 1, 0, './imgs/43fd34f7-45eb-4636-bd7d-f03d0ae75a06.jfif', '2021-09-29 20:16:18', 16, 105, 'TAM: 42\r\nLIPO'),
(2989, 'CL1025', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 1, 0, './imgs/13b296ea-0b68-4568-ae17-73c1344d408b.jfif', '2021-09-29 20:19:02', 16, 105, 'TAM: 42\r\nLIPO'),
(2990, 'CL1026', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 1, 0, './imgs/e672a744-e09d-4589-aed3-0eaa5f76175b.jfif', '2021-09-29 21:11:35', 16, 105, 'TAM: 42\r\nLIPO'),
(2991, 'CL1027', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 1, 0, './imgs/48fb0d02-1275-4b62-aa4d-cdc79efbc548.jfif', '2021-09-29 21:14:12', 16, 105, 'TAM: 44\r\nLIPO'),
(2992, '114400', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 1, 0, './imgs/235ff650-1d56-4280-a937-5943994510bd.jfif', '2021-09-29 21:16:18', 16, 105, 'TAM: 46\r\nLIPO'),
(2993, 'CL1028', 0, 'CALÇA FEM. FROZINI', 1, '70.00', '140.00', 2, 0, './imgs/4bf36398-ed4b-4030-b843-d874326cdb70.jfif', '2021-09-29 21:18:55', 16, 105, 'TAM: 44/46\r\nLIPO'),
(2994, 'Cl1029', 0, 'Calça fem. Loola paloozza', 1, '45.00', '92.00', 5, 0, './imgs/2021-09-30_10_45_01.jpg', '2021-09-30 13:45:01', 7, 105, 'Tam: 38/40/44'),
(2995, 'CL1030', 0, 'CALÇA  FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 2, 0, './imgs/c031fce2-5a29-4fa1-9ba2-9ccecb091c05.jfif', '2021-09-30 13:51:07', 16, 105, 'TAM: 42\r\nBARRA DESFIADA COM LASCA'),
(2996, 'CL1031', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 0, 0, './imgs/ce794eb4-7266-4d9f-b9be-2cd6aab15760.jfif', '2021-09-30 13:52:43', 7, 105, 'TAM: 42\r\nJEANS AZUL BASICA'),
(2997, 'CL1032', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '44.00', '88.00', 3, 0, './imgs/8ad401b4-6e8f-4bb0-8702-2ae52f2fd16b.jfif', '2021-09-30 13:56:19', 16, 105, 'TAM: 38/40\r\nPRETA C/ELASTICO NO COS'),
(2998, 'CL1033', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 2, 0, './imgs/65330001-5835-4e2c-8e9a-44eae1062fed.jfif', '2021-09-30 13:58:57', 16, 105, 'TAM: 42/46'),
(2999, 'CL1034', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 1, 0, './imgs/0d5fcde2-f501-40a8-862c-268c5b1a02ca.jfif', '2021-09-30 14:01:35', 16, 105, 'TAM: 36'),
(3000, 'CL1035', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 1, 0, './imgs/c4da6783-2783-42de-b261-41816767d2ac.jfif', '2021-09-30 14:04:02', 16, 105, 'TAM: 38\r\nCAPRI JEANS CLARO'),
(3001, 'CL1036', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 2, 0, './imgs/9b2b26b2-caa4-4bf5-9122-f627e6c26ada.jfif', '2021-09-30 14:06:13', 16, 105, 'TAM: 38\r\nCAPRI JEANS ESCURO'),
(3002, 'CL1037', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 2, 0, './imgs/ead7754f-4c57-4b55-a24e-1d643ae08b49.jfif', '2021-09-30 14:10:02', 16, 105, 'TAM: 44/46\r\nBARRA DESFIADA  C/ LASCA JEANS CLARO'),
(3003, 'CL1038', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 2, 0, './imgs/e9db4393-31f3-42fb-9b1f-d152a0063d4c.jfif', '2021-09-30 14:20:49', 16, 105, 'TAM: 38/42'),
(3004, 'CL1039', 0, 'CALÇA FEM. LOOLA PALOOZZA', 1, '45.00', '92.00', 3, 0, './imgs/2c659e71-0827-4524-82c8-e86ccee2a249.jfif', '2021-09-30 14:28:58', 16, 105, 'TAM: 42/44/46'),
(3005, 'CL1040', 0, 'CALÇA FEM. LA ROSSI', 1, '60.00', '120.00', 1, 0, './imgs/d2ff4424-2576-41a2-8195-dd5746cd6a50.jfif', '2021-09-30 14:35:01', 16, 105, 'TAM: 36'),
(3006, '690142', 0, 'CALÇA FEM. LA ROSSI', 1, '60.00', '124.00', 1, 0, './imgs/cdf0faa7-b56f-446d-9498-c5ff32dce7d3.jfif', '2021-09-30 14:36:49', 16, 105, 'TAM: 42'),
(3007, 'CL1041', 0, 'CALÇA FEM. LA ROSSI', 1, '70.00', '140.00', 1, 0, './imgs/c6b4e505-e3e1-4a65-abb7-e2785a74c615.jfif', '2021-09-30 14:40:12', 16, 105, 'TAM: 42'),
(3008, '2220909298256', 0, 'CALÇA FEM. LA ROSSI', 1, '65.00', '138.00', 1, 0, './imgs/3b2fad2e-a8c1-4a41-ae3b-cc1641ab2fe0.jfif', '2021-09-30 14:43:00', 16, 105, 'TAM: 48'),
(3009, 'CL1042', 0, 'CALÇA FEM. LA ROSSI', 1, '65.00', '138.00', 1, 0, './imgs/3e6a44a3-155a-4d82-bad9-8c295451f86e.jfif', '2021-09-30 14:45:22', 7, 105, 'TAM: 48'),
(3010, '006487602008990142', 0, 'CALÇA FEM. LA ROSSI', 1, '60.00', '128.00', 1, 0, './imgs/64e4881b-a98c-4cf1-9354-f985abadabc0.jfif', '2021-09-30 14:49:06', 16, 105, 'TAM: 42'),
(3011, '694300836', 0, 'Calça fem. Young style', 1, '70.00', '140.00', 1, 1, './imgs/2021-09-30_14_54_15.jpg', '2021-09-30 17:54:15', 4, 105, 'Tam: 36'),
(3012, '10197752', 0, 'Calça fem. Young STYLE ', 1, '70.00', '140.00', 1, 1, './imgs/2021-09-30_14_55_25.jpg', '2021-09-30 17:55:25', 4, 105, 'Tam: 38'),
(3013, '694300848', 0, 'Calça Fem. YOUNG STYLE ', 1, '70.00', '140.00', 2, 1, './imgs/2021-09-30_14_57_11.jpg', '2021-09-30 17:57:11', 4, 105, 'Tam: 48'),
(3014, '694900842', 0, 'Calça fem. YOUNG STYLE ', 1, '70.00', '140.00', 1, 1, './imgs/2021-09-30_14_59_22.jpg', '2021-09-30 17:59:22', 4, 105, 'Tam: 42'),
(3015, '694900844', 0, 'Calça fem. YOUNG STYLE ', 1, '70.00', '140.00', 2, 1, './imgs/2021-09-30_15_00_12.jpg', '2021-09-30 18:00:12', 4, 105, 'Tam: 44'),
(3016, '694900846', 0, 'Calça fem. YOUNG STYLE ', 1, '70.00', '140.00', 1, 1, './imgs/2021-09-30_15_01_19.jpg', '2021-09-30 18:01:19', 4, 105, 'Tam: 46'),
(3017, '2254400001', 0, 'Calça fem. Biotipo', 1, '45.00', '99.00', 2, 1, './imgs/2021-09-30_15_12_14.jpg', '2021-09-30 18:12:14', 4, 105, 'Tam: 40/42'),
(3018, '2335900001', 0, '', 1, '0.00', '0.00', 0, 1, './imgs/2021-09-30_15_15_10.jpg', '2021-09-30 18:15:10', 4, 0, ''),
(3019, '2335900001', 0, 'Calça fem. Biotipo', 1, '45.00', '99.00', 2, 1, './imgs/2021-09-30_15_15_44.jpg', '2021-09-30 18:15:44', 4, 105, 'Tam: 36/44'),
(3020, '1967900001', 0, 'Calça fem. Biotipo', 1, '65.00', '130.00', 1, 1, './imgs/2021-09-30_16_03_01.jpg', '2021-09-30 19:03:01', 4, 105, 'Tam: 46'),
(3021, 'Cl1045', 0, 'CALÇA fem. Biotipo', 1, '65.00', '130.00', 1, 1, './imgs/2021-09-30_16_06_35.jpg', '2021-09-30 19:06:35', 4, 105, 'Tam: 46'),
(3022, '1859200001', 0, 'Calça fem. BIOTIPO ', 1, '70.00', '140.00', 1, 1, './imgs/2021-09-30_16_10_24.jpg', '2021-09-30 19:10:24', 4, 105, 'Tam: 46'),
(3023, '2254300001', 0, 'Calça fem. BIOTIPO ', 1, '45.00', '99.00', 1, 1, './imgs/2021-09-30_16_13_18.jpg', '2021-09-30 19:13:18', 4, 105, 'Tam: 36'),
(3024, '2332700001', 0, ' Calça fem. Biotipo', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-30_16_17_16.jpg', '2022-01-16 16:49:00', 4, 105, 'Tam: 40/42 jeans claro'),
(3025, '2337400001', 0, 'Calça fem. BIOTIPO ', 1, '60.00', '120.00', 1, 1, './imgs/2021-09-30_16_25_41.jpg', '2021-09-30 19:25:41', 4, 105, 'Tam: 46'),
(3026, '2338000001', 0, 'Calça fem. BIOTIPO ', 1, '60.00', '120.00', 2, 1, './imgs/2021-09-30_16_28_26.jpg', '2021-09-30 19:28:26', 4, 105, 'Tam: 44/46'),
(3027, '2251400001', 0, 'Calça fem. BIOTIPO ', 1, '65.00', '130.00', 3, 1, './imgs/2021-09-30_16_33_48.jpg', '2021-09-30 19:33:48', 4, 105, 'Tam: 42/46'),
(3028, '2167400001', 0, 'Calça fem. BIOTIPO ', 1, '45.00', '98.00', 5, 1, './imgs/2021-09-30_16_43_33.jpg', '2021-09-30 19:43:33', 4, 105, 'Tam: 36/40/44/46'),
(3029, '2322600001', 0, 'Calça fem. BIOTIPO ', 1, '65.00', '130.00', 2, 1, './imgs/2021-09-30_17_20_49.jpg', '2021-09-30 20:20:49', 4, 105, 'Tam: 46'),
(3030, '2154700001', 0, 'Calça fem. BIOTIPO ', 1, '70.00', '140.00', 3, 1, './imgs/2021-09-30_17_23_21.jpg', '2021-09-30 20:23:21', 4, 105, 'Tam: 40/42/44'),
(3031, '7909588308429', 0, 'Calça masc. Hering H1B41BSI', 1, '80.00', '159.00', 1, 1, './imgs/2021-09-30_17_30_27.jpg', '2021-09-30 20:30:27', 4, 92, 'Tam: 40'),
(3032, '7909588308351', 0, 'Calça masc. HERING H1B41ASI', 1, '80.00', '159.00', 1, 1, './imgs/2021-09-30_17_34_44.jpg', '2021-09-30 20:34:44', 4, 92, 'Tam: 40'),
(3033, '7909588308412', 0, 'Calça masc. HERING H1B41BSI', 1, '80.00', '159.00', 1, 1, './imgs/2021-09-30_17_37_12.jpg', '2021-09-30 20:37:12', 4, 92, 'Tam: 38'),
(3034, '', 0, 'Calça masc. HERING  H1B41ASI', 1, '80.00', '159.00', 1, 0, './imgs/2021-09-30_17_38_50.jpg', '2021-09-30 20:38:50', 4, 92, 'Tam: 38'),
(3035, '7909588308450', 0, 'CALÇA MASC. HERING ', 1, '80.00', '159.00', 1, 1, './imgs/2021-09-30_17_41_10.jpg', '2021-09-30 20:41:10', 4, 92, 'Tam: 46'),
(3036, '7909588308382', 0, 'Calça masc. HERING ', 1, '80.00', '159.00', 1, 1, './imgs/2021-09-30_17_42_15.jpg', '2021-09-30 20:42:15', 4, 92, 'Tam: 46'),
(3037, '7909588308344', 0, 'Calça masc. HERING ', 1, '80.00', '159.00', 1, 1, './imgs/2021-09-30_17_49_16.jpg', '2021-09-30 20:49:16', 4, 92, 'Tam: 38'),
(3038, '7909588308443', 0, 'Calça masc. HERING ', 1, '80.00', '159.00', 1, 1, './imgs/2021-09-30_17_50_42.jpg', '2021-09-30 20:50:42', 4, 92, 'Tam: 44'),
(3039, '7909588308375', 0, 'Calça masc. HERING ', 1, '80.00', '159.00', 0, 0, './imgs/2021-09-30_17_51_26.jpg', '2021-09-30 20:51:26', 7, 92, 'Tam: 44'),
(3040, '7909588308436', 0, 'Calça masc. HERING ', 1, '80.00', '159.00', 0, 0, './imgs/2021-09-30_17_53_27.jpg', '2021-09-30 20:53:27', 7, 92, 'Tam: 42'),
(3041, '7909588308368', 0, 'Calça masc. HERING ', 1, '80.00', '159.00', 2, 1, './imgs/2021-09-30_17_54_03.jpg', '2021-09-30 20:54:03', 4, 92, 'Tam: 42'),
(3042, '', 0, '', 1, '0.00', '0.00', 0, 1, './imgs/2021-09-30_17_54_14.jpg', '2021-09-30 20:54:14', 4, 0, ''),
(3043, '7909588308399', 0, 'Calça masc. HERING ', 1, '80.00', '159.00', 0, 0, './imgs/2021-09-30_17_54_51.jpg', '2021-09-30 20:54:51', 7, 92, 'Tam: 48'),
(3044, 'Cl1043', 0, 'Calça fem. R.19', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_09_54_22.jpg', '2021-10-01 12:54:22', 4, 105, 'Tam: 46'),
(3045, '7899269834418', 0, 'Calça fem. R.19', 1, '80.00', '160.00', 2, 1, './imgs/2021-10-01_09_56_40.jpg', '2021-10-01 12:56:40', 4, 105, 'Tam: 36/46'),
(3046, '7899269834562', 0, 'Calça fem. R.19', 1, '70.00', '140.00', 2, 1, './imgs/2021-10-01_09_58_42.jpg', '2021-10-01 12:58:42', 4, 105, 'Tam: 44/46'),
(3047, '7899615834246', 0, 'Calça fem. R.19', 1, '70.00', '140.00', 2, 1, './imgs/2021-10-01_10_01_09.jpg', '2021-10-01 13:01:09', 4, 105, 'Tam: 44/46'),
(3048, 'Cl1044', 0, 'Calça fem. R.19', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_10_08_54.jpg', '2021-10-01 13:08:54', 4, 105, 'Tam: 46'),
(3049, 'Cl1046', 0, 'Calça fem. R.19', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_10_10_41.jpg', '2021-10-01 13:10:41', 4, 105, 'Tam: 46'),
(3050, 'Cl1047', 0, 'Calça fem. R.19', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_10_13_26.jpg', '2021-10-01 13:13:26', 4, 105, 'Tam: 44'),
(3051, '7899269796921', 0, 'Calça fem. R.19', 1, '70.00', '140.00', 2, 1, './imgs/2021-10-01_10_16_10.jpg', '2021-10-01 13:16:10', 4, 105, 'Tam: 42/44'),
(3052, 'Cl1048', 0, 'Calça fem. R.19', 1, '65.00', '130.00', 2, 1, './imgs/2021-10-01_10_18_45.jpg', '2021-10-01 13:18:45', 4, 105, 'Tam: 36/42'),
(3053, '7899269819279', 0, 'CALÇA fem. R.19', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_10_20_47.jpg', '2021-10-01 13:20:47', 4, 105, 'Tam: 42'),
(3054, 'Cl1049', 0, 'CALÇA fem. R.19', 1, '70.00', '140.00', 1, 1, './imgs/2021-10-01_10_22_24.jpg', '2021-10-01 13:22:24', 4, 105, 'Tam: 38'),
(3055, '7055115789121', 0, 'CALÇA fem. R.19', 1, '70.00', '140.00', 1, 1, './imgs/2021-10-01_10_23_59.jpg', '2021-10-01 13:23:59', 4, 105, 'Tam: 36'),
(3056, '', 0, 'CALÇA fem. R.19', 1, '54.00', '108.00', 1, 1, './imgs/2021-10-01_10_25_31.jpg', '2021-10-01 13:25:31', 4, 105, 'Tam: 36'),
(3057, '7899269818555', 0, 'CALÇA fem. R.19', 1, '70.00', '140.00', 1, 1, './imgs/2021-10-01_10_27_01.jpg', '2021-10-01 13:27:01', 4, 105, 'Tam: 36'),
(3058, 'Cl1050', 0, 'Calça fem. HERING ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_10_36_02.jpg', '2021-10-01 13:36:02', 4, 105, 'Tam: 42'),
(3059, '2948112705759', 0, 'CALÇA FEM. HERING ', 1, '50.00', '50.00', 1, 1, './imgs/2021-10-01_10_38_27.jpg', '2021-10-01 13:38:27', 4, 105, 'Tam: 42'),
(3060, 'Cl1052', 0, 'CALÇA FEM. HERING ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_10_47_58.jpg', '2021-10-01 13:47:58', 4, 105, 'Tam: 44'),
(3061, '7909245345026', 0, 'Calça fem. HERING ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_10_50_16.jpg', '2021-10-01 13:50:17', 4, 105, 'Tam: 44'),
(3062, '7909173480660', 0, 'CALÇA FEM. HERING ', 1, '60.00', '120.00', 2, 1, './imgs/2021-10-01_10_52_59.jpg', '2021-10-01 13:52:59', 4, 105, 'Tam: 38/44'),
(3063, 'Cl1053', 0, 'CALÇA FEM. HERING ', 1, '65.00', '130.00', 3, 1, './imgs/2021-10-01_10_56_14.jpg', '2021-10-01 13:56:14', 4, 105, 'Tam: 36/42'),
(3064, 'Cl1054', 0, 'CALÇA FEM. HERING ', 1, '70.00', '140.00', 1, 1, './imgs/2021-10-01_11_00_11.jpg', '2021-10-01 14:00:11', 4, 105, 'Tam: 38'),
(3065, '7909245514149', 0, 'CALÇA FEM. HERING ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_11_07_29.jpg', '2021-10-01 14:07:29', 4, 105, 'Tam: 38'),
(3066, 'Cl1051', 0, 'CALÇA FEM. HERING ', 1, '50.00', '108.00', 1, 1, './imgs/2021-10-01_11_11_32.jpg', '2021-10-01 14:11:32', 4, 105, 'Tam:38'),
(3067, 'Cl1052', 0, 'CALÇA FEM. HERING ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_11_13_49.jpg', '2021-10-01 14:13:49', 4, 105, 'Tam: 38'),
(3068, '7909112584053', 0, 'CALÇA fem. HERING ', 1, '60.00', '126.00', 1, 1, './imgs/2021-10-01_11_16_33.jpg', '2021-10-01 14:16:33', 4, 105, 'Tam: 36'),
(3069, '7909173480806', 0, 'CALÇA FEM. HERING ', 1, '70.00', '139.00', 1, 1, './imgs/2021-10-01_11_19_47.jpg', '2021-10-01 14:19:48', 4, 105, 'Tam: 44'),
(3070, '7909173480813', 0, 'CALÇA FEM. HERING ', 1, '70.00', '139.00', 1, 1, './imgs/2021-10-01_11_21_14.jpg', '2021-10-01 14:21:14', 4, 105, 'Tam: 46'),
(3071, '7909173584597', 0, 'CALÇA FEM. HERING ', 1, '75.00', '148.00', 1, 1, './imgs/2021-10-01_11_23_57.jpg', '2021-10-01 14:23:57', 4, 105, 'Tam: 44'),
(3072, '7891992622133', 0, 'CALÇA fem. Knt', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_15_03_56.jpg', '2021-10-01 18:03:56', 4, 105, 'Tam: 44'),
(3073, '382', 0, 'CALÇA fem. Knt', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_15_10_59.jpg', '2021-10-01 18:10:59', 4, 105, 'Tam: 36'),
(3074, '0500', 0, 'CALÇA FEM. KNT ', 1, '75.00', '154.00', 1, 1, './imgs/2021-10-01_15_16_44.jpg', '2021-10-01 18:16:44', 4, 105, 'Tam: 46'),
(3075, '7891992805932', 0, 'CALÇA FEM. Knt', 1, '100.00', '198.00', 1, 1, './imgs/2021-10-01_15_19_24.jpg', '2021-10-01 18:19:24', 4, 105, 'Tam: 198,00'),
(3076, '7891992805949', 0, 'Calça fem. Knt', 1, '88.00', '88.00', 1, 1, './imgs/2021-10-01_15_21_35.jpg', '2021-10-01 18:21:35', 4, 105, 'Tam: 44'),
(3077, '7895784082327', 0, 'CALÇA FEM. Sawary ', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_15_36_52.jpg', '2021-10-01 18:36:52', 4, 105, 'Tam: 46'),
(3078, 'Cl1053', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_15_40_53.jpg', '2021-10-01 18:40:53', 4, 105, 'Tam: 36'),
(3079, '0004972590001010', 0, 'CALÇA FEM SAWARY ', 1, '50.00', '108.00', 1, 1, './imgs/2021-10-01_15_43_41.jpg', '2021-10-01 18:43:41', 4, 105, 'Tam: 44'),
(3080, '05770960', 0, 'CALÇA FEM SAWARY ', 1, '60.00', '120.00', 2, 1, './imgs/2021-10-01_15_46_57.jpg', '2021-10-01 18:46:57', 4, 105, 'Tam: 40'),
(3081, 'Cl1054', 0, 'CALÇA FEM SAWARY ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_15_50_00.jpg', '2021-10-01 18:50:00', 4, 105, 'Tam: 40'),
(3082, '831363036340', 0, 'CALÇA FEM SAWARY ', 1, '60.00', '60.00', 1, 1, './imgs/2021-10-01_15_52_52.jpg', '2021-10-01 18:52:52', 4, 0, '120,00'),
(3083, '6669857760001020', 0, 'CALÇA FEM SAWARY ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_15_54_46.jpg', '2021-10-01 18:54:46', 4, 105, 'Tam: 38'),
(3084, '0004967770001420', 0, 'CALÇA FEM SAWARY ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_15_55_34.jpg', '2021-10-01 18:55:34', 4, 105, 'Tam: 40'),
(3085, '0004967800000250', 0, 'CALÇA FEM SAWARY ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_15_56_17.jpg', '2021-10-01 18:56:17', 4, 105, 'Tam: 46'),
(3086, '0003864800000780', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_15_59_28.jpg', '2021-10-01 18:59:28', 4, 105, 'Tam: 46'),
(3087, '03950790002290', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_16_02_01.jpg', '2021-10-01 19:02:01', 4, 105, 'Tam: 46'),
(3088, '0003702410000720', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '65.00', 1, 1, './imgs/2021-10-01_16_05_28.jpg', '2021-10-01 19:05:28', 4, 105, 'Tam: 36'),
(3089, 'Cl1058', 0, 'CALÇA FEM SAWARY ', 1, '80.00', '160.00', 1, 1, './imgs/2021-10-01_16_07_53.jpg', '2021-10-01 19:07:53', 4, 105, 'Tam: 42'),
(3090, '0005140350000750', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_16_10_59.jpg', '2021-10-01 19:10:59', 4, 105, 'Tam: 46'),
(3091, '05106440000750', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_16_12_30.jpg', '2021-10-01 19:12:30', 4, 105, 'Tam: 42'),
(3092, '7895783950771', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_16_14_14.jpg', '2021-10-01 19:14:14', 4, 105, 'Tam: 42'),
(3093, '0002886680000140', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_16_17_39.jpg', '2021-10-01 19:17:39', 4, 105, 'Tam: 42'),
(3094, '21544804', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_16_19_56.jpg', '2021-10-01 19:19:56', 4, 105, 'Tam: 38'),
(3095, 'Cl1061', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_16_20_48.jpg', '2021-10-01 19:20:48', 4, 105, 'Tam: 42'),
(3096, '0005140770000960', 0, 'Calça fem Sawary ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_17_12_28.jpg', '2021-10-01 20:12:28', 4, 105, 'Tam: 46'),
(3097, '140730002840', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_17_14_22.jpg', '2021-10-01 20:14:22', 4, 105, 'Tam: 38'),
(3098, 'Cl1064', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_17_16_19.jpg', '2021-10-01 20:16:19', 4, 105, 'Tam: 44'),
(3099, '04967770001570', 0, 'CALÇA FEM SAWARY ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_17_19_16.jpg', '2021-10-01 20:19:16', 4, 105, 'Tam: 40'),
(3100, '04967780000840', 0, 'CALÇA FEM SAWARY ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-01_17_20_02.jpg', '2021-10-01 20:20:02', 4, 105, 'Tam: 42'),
(3101, '0004555200000030', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_17_23_02.jpg', '2021-10-01 20:23:02', 4, 105, 'Tam: 42'),
(3102, 'Cl1068', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_17_25_12.jpg', '2021-10-01 20:25:12', 4, 105, 'Tam: 46'),
(3103, 'Cl1070', 0, 'CALÇA FEM SAWARY ', 1, '65.00', '130.00', 1, 1, './imgs/2021-10-01_17_27_53.jpg', '2021-10-01 20:27:53', 4, 105, 'Tam: 38'),
(3104, 'Cl1071', 0, 'CALÇA FEM SAWARY ', 1, '50.00', '108.00', 1, 1, './imgs/2021-10-01_17_30_25.jpg', '2021-10-01 20:30:25', 4, 105, 'Tam: 46'),
(3105, 's1105-5', 0, 'BERMUDA MASC. Surf', 1, '30.00', '60.00', 1, 1, './imgs/2021-10-04_16_40_56.jpg', '2021-10-04 19:40:56', 4, 90, 'Tam: 44 azul royal cos preto'),
(3106, 'Cl8022', 0, 'CALÇA fem. SAWARY ', 1, '35.00', '70.00', 1, 1, './imgs/2021-10-04_16_46_44.jpg', '2021-10-04 19:46:44', 4, 105, 'Tam: 44 lipo'),
(3107, '7909588990419', 0, 'Bermuda masc. Hering ', 1, '60.00', '120.00', 1, 1, './imgs/2021-10-05_09_06_43.jpg', '2021-10-05 12:06:43', 4, 90, 'Tam: 42 preta'),
(3108, '180050', 0, 'Blusa lírikos ', 1, '44.00', '88.00', 1, 1, './imgs/2021-10-05_10_09_33.jpg', '2021-10-05 13:09:33', 4, 89, 'Tam: G preta c/ amarração na manga'),
(3109, '7129', 0, 'Blusa la muse', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-05_10_13_00.jpg', '2021-10-05 13:13:00', 4, 89, 'Tam: P '),
(3110, 'Bl501', 0, 'Blusa feminisces', 1, '30.00', '58.00', 1, 1, './imgs/2021-10-05_10_16_46.jpg', '2021-10-05 13:16:46', 4, 89, 'TAM: xgg preta'),
(3111, '2937', 0, 'Blusa lavita', 1, '35.00', '78.00', 3, 1, './imgs/2021-10-05_10_23_48.jpg', '2021-10-05 13:23:48', 4, 89, 'Tam: P- preta M/G- rosa'),
(3112, '315', 0, 'Regata clarineta', 1, '30.00', '65.00', 7, 1, './imgs/2021-10-05_10_33_19.jpg', '2021-10-05 13:33:20', 4, 89, 'Tam: 46 verde, rosa, branca, preta, azul'),
(3113, '2465', 0, 'Regata jqb', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-05_10_41_16.jpg', '2021-10-05 13:41:16', 4, 89, 'Tam: P'),
(3114, 'Bl502', 0, 'Blusa mc confecções ', 1, '30.00', '68.00', 1, 1, './imgs/2021-10-05_11_21_46.jpg', '2021-10-05 14:21:46', 4, 89, 'Tam: p preta'),
(3119, '15345', 0, 'Blusa midri', 1, '44.00', '88.00', 1, 1, './imgs/2021-10-05_11_27_38.jpg', '2021-10-05 14:27:38', 4, 89, 'Tam: gg preta'),
(3120, '', 0, 'Blusa lírikos ', 1, '41.00', '82.00', 6, 1, './imgs/2021-10-05_11_50_05.jpg', '2021-10-05 14:50:05', 4, 89, 'Tam: m-preta   G- branca'),
(3121, '2392', 0, 'Blusa jo&b', 1, '44.00', '88.00', 1, 1, './imgs/2021-10-05_11_53_45.jpg', '2021-10-05 14:53:45', 4, 89, 'Tam: 40 preta'),
(3122, '00120449', 0, 'Blusa vb girls', 1, '30.00', '62.00', 1, 1, './imgs/2021-10-05_11_56_26.jpg', '2021-10-05 14:56:26', 4, 89, 'Tam: M'),
(3123, '5416-1', 0, 'Blusa wanabee', 1, '40.00', '79.00', 4, 1, './imgs/2021-10-05_14_08_55.jpg', '2021-10-05 17:08:55', 4, 89, 'Tam: p- branca gg- preta P/M- amarela'),
(3124, '7909173653347', 0, 'Blusa hering', 1, '30.00', '58.00', 1, 1, './imgs/2021-10-05_14_10_40.jpg', '2021-10-05 17:10:40', 4, 89, 'Tam: g'),
(3125, '7909173653354', 0, 'Blusa hering', 1, '30.00', '58.00', 1, 1, './imgs/2021-10-05_14_11_14.jpg', '2021-10-05 17:11:14', 4, 89, 'Ram: xg'),
(3126, '2949', 0, 'Blusa lavita', 1, '35.00', '78.00', 1, 1, './imgs/2021-10-05_14_14_06.jpg', '2021-10-05 17:14:06', 4, 89, 'Tam: p preta'),
(3127, '10285710', 0, 'Blusa PRIMORIS ', 1, '35.00', '68.00', 1, 1, './imgs/2021-10-05_14_18_15.jpg', '2021-10-05 17:18:15', 4, 89, 'Tam: gg preta'),
(3128, '3794101502', 0, 'Blusa prímoris ', 1, '35.00', '68.00', 1, 1, './imgs/2021-10-05_14_19_54.jpg', '2021-10-05 17:19:54', 4, 89, 'Tam: m rosê ');
INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`, `aplicacao`) VALUES
(3129, '200006', 0, 'Blusa lírikos ', 1, '41.00', '82.00', 5, 1, './imgs/2021-10-05_14_27_48.jpg', '2021-10-05 17:27:48', 4, 89, 'Tam: m/G/GG preta'),
(3130, '2333', 0, 'Blusa jo&b', 1, '45.00', '89.00', 1, 1, './imgs/2021-10-05_14_29_15.jpg', '2021-10-05 17:29:15', 4, 89, 'Tam: 42'),
(3131, '200009', 0, 'Blusa lírikos ', 1, '41.00', '82.00', 4, 1, './imgs/2021-10-05_14_36_36.jpg', '2021-10-05 17:36:36', 4, 89, 'Tam: m-preta g-telha gg- branca '),
(3132, '313', 0, 'Blusa clarineta', 1, '40.00', '78.00', 10, 1, './imgs/2021-10-05_15_58_27.jpg', '2021-10-05 18:58:27', 4, 89, 'Tam: p/g- laranja m-branca p/m/g- verde'),
(3133, '4000102008863', 0, 'Blusa brilhe fashion', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-05_16_00_55.jpg', '2021-10-05 19:00:55', 4, 89, 'Tam: g branca'),
(3134, '2860A', 0, 'Blusa regata primoris', 1, '40.00', '40.00', 2, 1, './imgs/2021-10-05_16_03_42.jpg', '2021-10-05 19:03:42', 4, 89, 'Tam: m branca'),
(3135, '19187', 0, 'Blusa cocci', 1, '41.00', '82.00', 1, 1, './imgs/2021-10-05_16_11_19.jpg', '2021-10-05 19:11:19', 4, 89, 'Tam: gg bicolor Branco e preto'),
(3137, '005938022803', 0, 'Blusa sunnydays', 1, '41.00', '82.00', 1, 1, './imgs/2021-10-05_16_42_39.jpg', '2021-10-05 19:42:39', 4, 89, 'Tam: m rosa'),
(3138, '005938032802', 0, 'Blusa sunnydays', 1, '41.00', '82.00', 1, 1, './imgs/2021-10-05_16_43_30.jpg', '2021-10-05 19:43:30', 4, 89, 'Tam: g'),
(3139, '005938019988', 0, 'Blusa sunnydays', 1, '41.00', '82.00', 1, 1, './imgs/2021-10-05_16_45_50.jpg', '2021-10-05 19:45:50', 4, 89, 'Tam: p preta'),
(3140, '005938011708', 0, 'Blusa sunnydays', 1, '41.00', '82.00', 1, 1, './imgs/2021-10-05_16_49_16.jpg', '2021-10-05 19:49:16', 4, 89, 'Tam: p ferragem '),
(3141, '3000103006715', 0, 'Blusa brilhe FASHION ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-05_16_52_07.jpg', '2021-10-05 19:52:07', 4, 89, 'Tam: m off white manga longa'),
(3142, 'Bl504', 0, 'Blusa wanabee', 1, '30.00', '59.00', 1, 1, './imgs/2021-10-05_16_57_54.jpg', '2021-10-05 19:57:54', 4, 89, 'Tam: gg vermelha'),
(3143, 'Bl505', 0, 'Usa mc confecções ', 1, '35.00', '68.00', 1, 1, './imgs/2021-10-05_17_00_56.jpg', '2021-10-05 20:00:56', 4, 89, 'Tam: m vermelha '),
(3144, '19193', 0, 'Blusa cocci', 1, '41.00', '82.00', 1, 1, './imgs/2021-10-05_17_08_01.jpg', '2021-10-05 20:08:01', 4, 89, 'Tam: p'),
(3145, 'Cm01', 0, 'Camisa basica malwee ', 1, '25.00', '50.00', 1, 1, './imgs/2021-10-06_09_03_29.jpg', '2021-10-06 12:03:29', 4, 91, 'Tam: gg bordo'),
(3146, '889000000001', 0, 'Blusa brilhe fashion', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_09_09_27.jpg', '2021-10-06 12:09:27', 4, 89, 'TAM: unico cor: laranja'),
(3147, '048000000002', 0, 'Blusa brilhe FASHION ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_09_28_37.jpg', '2021-10-06 12:28:37', 4, 89, 'Tam: ÚNICO cor: telha'),
(3148, '2966', 0, 'Blusa lavita', 1, '35.00', '68.00', 2, 1, './imgs/2021-10-06_09_31_46.jpg', '2021-10-06 12:31:46', 4, 89, 'Tam: p-laranja m-azul bic'),
(3149, '20003', 0, 'Blusa yunico', 1, '35.00', '72.00', 3, 1, './imgs/2021-10-06_09_34_52.jpg', '2021-10-06 12:34:52', 4, 89, 'Tam: 42/44 laise cor telha'),
(3150, '1989', 0, 'Blusa espaço virtual ', 1, '40.00', '40.00', 2, 1, './imgs/2021-10-06_09_42_39.jpg', '2021-10-06 12:42:39', 4, 89, 'Tam: g'),
(3151, '3642', 0, 'Blusa prímoris ', 1, '40.00', '79.00', 2, 1, './imgs/2021-10-06_09_46_13.jpg', '2021-10-06 12:46:13', 4, 89, 'Tam: P azul marinho '),
(3152, '19174', 0, 'Blusa cocci', 1, '40.00', '79.00', 1, 1, './imgs/2021-10-06_09_49_39.jpg', '2021-10-06 12:49:39', 4, 89, 'Tam: p frontal com pregas'),
(3153, '6479', 0, 'Blusa etonnant', 1, '44.00', '88.00', 1, 1, './imgs/2021-10-06_09_52_26.jpg', '2021-10-06 12:52:26', 4, 89, 'Tam: m'),
(3154, '5261', 0, 'Blusa wanabee', 1, '50.00', '50.00', 3, 1, './imgs/2021-10-06_09_59_43.jpg', '2021-10-06 12:59:43', 4, 89, 'Tam: m-rosa G-nude Gg- verde'),
(3155, '005976045703', 0, 'Blusa regata sunnydays', 1, '35.00', '69.00', 2, 1, './imgs/2021-10-06_10_10_41.jpg', '2021-10-06 13:10:41', 4, 89, 'Tam: gg vinho'),
(3156, '005976035704', 0, 'Blusa regata SUNNYDAYS ', 1, '35.00', '69.00', 3, 1, './imgs/2021-10-06_10_11_37.jpg', '2021-10-06 13:11:37', 4, 89, 'Tam: g vinho'),
(3157, '005976042801', 0, 'Blusa regata SUNNYDAYS ', 1, '35.00', '69.00', 2, 1, './imgs/2021-10-06_10_14_09.jpg', '2021-10-06 13:14:09', 4, 89, 'Tam: gg rosa'),
(3158, '005976032802', 0, 'Blusa regata SUNNYDAYS ', 1, '35.00', '69.00', 3, 1, './imgs/2021-10-06_10_15_14.jpg', '2021-10-06 13:15:14', 4, 89, 'Tam: G rosa'),
(3159, '3851100103', 0, 'Blusa prímoris ', 1, '35.00', '68.00', 1, 1, './imgs/2021-10-06_11_21_50.jpg', '2021-10-06 14:21:50', 4, 89, 'Tam: g azul'),
(3160, '3851102302', 0, 'Blusa prímoris ', 1, '35.00', '68.00', 1, 1, './imgs/2021-10-06_11_23_01.jpg', '2021-10-06 14:23:01', 4, 89, 'Tam: m '),
(3161, '3851100604', 0, 'Blusa prímoris ', 1, '35.00', '68.00', 1, 1, './imgs/2021-10-06_11_24_28.jpg', '2021-10-06 14:24:28', 4, 89, 'Tam: gg azul marinho '),
(3162, 'Wk803', 0, 'Blusa w.key FASHION ', 1, '28.00', '28.00', 1, 1, './imgs/2021-10-06_11_35_05.jpg', '2021-10-06 14:35:05', 4, 89, 'Tam: g verde'),
(3163, 'Bl508', 0, 'Blusa hering ', 1, '50.00', '50.00', 1, 1, './imgs/2021-10-06_16_05_17.jpg', '2021-10-06 19:05:17', 4, 89, 'Tam: g branca'),
(3164, '011575034901', 0, 'Blusa SUNNYDAYS ', 1, '25.00', '54.00', 1, 0, './imgs/2021-10-06_16_06_16.jpg', '2021-10-06 19:06:16', 7, 89, 'Tam: g verde'),
(3165, '011575020805', 0, 'Blusa SUNNYDAYS ', 1, '25.00', '54.00', 1, 1, './imgs/2021-10-06_16_07_57.jpg', '2021-10-06 19:07:57', 4, 89, 'Tam: m amarela'),
(3166, '011575022304', 0, 'Blusa SUNNYDAYS ', 1, '25.00', '54.00', 1, 1, './imgs/2021-10-06_16_08_54.jpg', '2021-10-06 19:08:54', 4, 89, 'Tam: m rosa'),
(3167, '3000102006860', 0, 'Blusa brilhe FASHION ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_16_11_50.jpg', '2021-10-06 19:11:50', 4, 89, 'Tam: m amarela'),
(3168, '170134', 0, 'Blusa lírikos ', 1, '41.00', '82.00', 1, 1, './imgs/2021-10-06_16_13_58.jpg', '2021-10-06 19:13:58', 4, 89, 'Tam: m verde'),
(3169, '011575014903', 0, 'Blusa SUNNYDAYS ', 1, '25.00', '54.00', 1, 1, './imgs/2021-10-06_16_16_41.jpg', '2021-10-06 19:16:41', 4, 89, 'Tam: p verde'),
(3170, '011575012107', 0, 'Blusa SUNNYDAYS ', 1, '25.00', '54.00', 1, 1, './imgs/2021-10-06_16_28_16.jpg', '2021-10-06 19:28:16', 4, 89, 'Tam: p laranja'),
(3171, '3000102009250', 0, 'Blusa brilhe fashion ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_16_32_11.jpg', '2021-10-06 19:32:11', 4, 89, 'Tam: m azul'),
(3172, '3000102009618', 0, 'Blusa brilhe FASHION ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_16_36_25.jpg', '2021-10-06 19:36:25', 4, 89, 'Tam: m azul jeans'),
(3173, '40310', 0, 'Blusa glam', 1, '45.00', '45.00', 1, 1, './imgs/2021-10-06_16_39_47.jpg', '2021-10-06 19:39:47', 4, 89, 'Tam: p'),
(3174, '3000102008673', 0, 'Blusa brilhe FASHION ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_16_44_15.jpg', '2021-10-06 19:44:15', 4, 89, 'Tam: m marsala'),
(3175, '3000102009632', 0, 'Blusa brilhe FASHION ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_17_32_22.jpg', '2021-10-06 20:32:22', 4, 89, 'Tam: m vinho'),
(3176, '6030', 0, 'Blusa wanabee', 1, '35.00', '72.00', 1, 1, './imgs/2021-10-06_17_36_26.jpg', '2021-10-06 20:36:26', 4, 89, 'Tam: p marrom '),
(3177, '19162', 0, 'Blusa cocci', 1, '30.00', '59.00', 4, 1, './imgs/2021-10-06_17_44_29.jpg', '2021-10-06 20:44:29', 4, 89, 'Tam: p/g- azul m- branca g- verde'),
(3178, '3000102009588', 0, 'Blusa brilhe fashion', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_17_47_20.jpg', '2021-10-06 20:47:20', 4, 89, 'TAM: lavanda'),
(3179, '3000102009656', 0, 'Blusa brilhe FASHION ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_17_48_35.jpg', '2021-10-06 20:48:35', 4, 89, 'Tam: m'),
(3180, 'Bl510', 0, 'Blusa cocci', 1, '30.00', '62.00', 1, 1, './imgs/2021-10-06_17_52_53.jpg', '2021-10-06 20:52:53', 4, 89, 'Tam: g nude'),
(3181, '140', 0, 'Blusa clarineta', 1, '45.00', '89.00', 1, 1, './imgs/2021-10-06_17_58_24.jpg', '2021-10-06 20:58:24', 4, 89, 'Tam: m vinho'),
(3182, '000180', 0, 'Blusa dress code', 1, '30.00', '58.00', 1, 1, './imgs/2021-10-06_18_01_29.jpg', '2021-10-06 21:01:29', 4, 89, 'Tam: g vinho'),
(3183, '3000102009489', 0, 'Blusa BRILHE  FASHION ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-06_18_03_45.jpg', '2021-10-06 21:03:45', 4, 89, 'Tam: m vinho'),
(3184, '7162', 0, 'Blusa la muse', 1, '40.00', '40.00', 3, 1, './imgs/2021-10-06_18_15_48.jpg', '2021-10-06 21:15:48', 4, 89, 'Tam: m-preta  p/m- rosa'),
(3185, 'Bl506', 0, 'Blusa etonnant', 1, '40.00', '40.00', 1, 1, './imgs/2021-10-08_10_28_58.jpg', '2021-10-08 13:28:58', 4, 89, 'Tam: g nude'),
(3186, '3233', 0, 'Blusa prímoris ', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-08_10_40_15.jpg', '2021-10-08 13:40:15', 4, 89, 'Tam: P'),
(3187, 'Bl507', 0, 'Blusa etonnant', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-08_10_43_29.jpg', '2021-10-08 13:43:29', 4, 89, 'Tam: g'),
(3188, '18121', 0, 'Blusa cocci', 1, '40.00', '40.00', 1, 1, './imgs/2021-10-08_10_45_19.jpg', '2021-10-08 13:45:19', 4, 89, 'Tam: g'),
(3189, 'Bl509', 0, 'Blusa eunice', 1, '50.00', '50.00', 1, 1, './imgs/2021-10-08_10_49_52.jpg', '2021-10-08 13:49:52', 4, 89, 'Tam: gg '),
(3190, 'Bl511', 0, 'Blusa eunice', 1, '50.00', '50.00', 1, 1, './imgs/2021-10-08_10_51_00.jpg', '2021-10-08 13:51:00', 4, 89, 'Tam: 46 verde'),
(3191, '3689', 0, 'Blusa prímoris ', 1, '41.00', '82.00', 3, 1, './imgs/2021-10-08_11_03_58.jpg', '2021-10-08 14:03:58', 4, 89, 'Tam: m-azul marinho G/Gg- verde'),
(3192, '6426', 0, 'Blusa etonnant', 1, '30.00', '62.00', 1, 1, './imgs/2021-10-08_11_08_57.jpg', '2021-10-08 14:08:57', 4, 89, 'Tam: GG cinza'),
(3193, '3700', 0, 'Blusa prímoris ', 1, '41.00', '82.00', 11, 1, './imgs/2021-10-08_11_25_03.jpg', '2021-10-08 14:25:03', 4, 89, 'Tam: 44 ao 46 azul, rosa, amarelo, ROSÊ '),
(3195, '5502', 0, 'Blusa wanabee', 1, '44.00', '88.00', 2, 1, './imgs/2021-10-08_11_33_10.jpg', '2021-10-08 14:33:10', 4, 89, 'Tam: g'),
(3196, '3938101101', 0, 'Bluss prímoris ', 1, '34.00', '68.00', 1, 1, './imgs/2021-10-08_11_36_32.jpg', '2021-10-08 14:36:32', 4, 89, 'Tam: p telha'),
(3197, '15345', 0, 'Blusa midri', 1, '35.00', '79.00', 2, 1, './imgs/2021-10-08_16_45_18.jpg', '2021-10-08 19:45:18', 4, 89, 'Tam: m -azul MArinho g-vinho'),
(3198, '190170', 0, 'Blusa regata lirikos', 1, '41.00', '82.00', 4, 1, './imgs/2021-10-08_16_49_50.jpg', '2021-10-08 19:49:50', 4, 89, 'Tam: m-vermelho g-azul bic m-rosê'),
(3199, '2970', 0, 'Blusa lavita', 1, '35.00', '68.00', 2, 1, './imgs/2021-10-08_16_53_12.jpg', '2021-10-08 19:53:12', 4, 89, 'Tam: p/m'),
(3200, '190291', 0, 'Blusa lírikos ', 1, '41.00', '82.00', 3, 1, './imgs/2021-10-08_18_26_23.jpg', '2021-10-08 21:26:23', 4, 89, 'Tam: g-preta m-azul g-branca'),
(3201, '3000102006518', 0, 'Blusa brilhe FASHION ', 1, '40.00', '80.00', 1, 0, './imgs/2021-10-11_10_47_56.jpg', '2021-10-11 13:47:57', 7, 89, 'Tam: m off white'),
(3202, '883000000009', 0, 'Blusa brilhe fashion ', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-11_10_50_09.jpg', '2021-10-11 13:50:09', 4, 89, 'Tam: m rosê '),
(3203, '3000103006623', 0, 'Blusa brilhe fashion', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-11_10_53_47.jpg', '2021-10-11 13:53:47', 4, 89, 'Tqm: m mostarda'),
(3204, '3000103006623', 0, 'Blusa brilhe fashion', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-11_10_53_50.jpg', '2021-10-11 13:53:50', 4, 89, 'Tqm: m mostarda'),
(3205, '684000000002', 0, 'Blusa brilhe fashion', 1, '40.00', '80.00', 1, 1, './imgs/2021-10-11_11_09_25.jpg', '2021-10-11 14:09:25', 4, 89, 'Tam: m amarelo'),
(3207, 'Bl512', 0, 'Blusa cocci', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-11_11_30_59.jpg', '2021-10-11 14:30:59', 4, 89, 'Tam: m branca'),
(3208, 'Gl22', 0, 'Blusa cropped lili fashion', 1, '45.00', '45.00', 1, 1, './imgs/2021-10-11_11_45_37.jpg', '2021-10-11 14:45:38', 4, 89, 'Tam: p branca'),
(3209, 'Gl22', 0, 'Blusa cropped lili fashion', 1, '45.00', '45.00', 1, 1, './imgs/2021-10-11_11_45_43.jpg', '2021-10-11 14:45:43', 4, 89, 'Tam: p branca'),
(3210, 'Gl22', 0, 'Blusa cropped lili fashion', 1, '45.00', '45.00', 1, 1, './imgs/2021-10-11_11_55_47.jpg', '2021-10-11 14:55:47', 4, 89, 'Tam: p branca'),
(3211, '18108', 0, 'Blusa cocci', 1, '59.00', '59.00', 3, 1, './imgs/2021-10-11_14_03_17.jpg', '2021-10-11 17:03:17', 4, 89, 'Tam: p/m/g'),
(3212, 'Bl513', 0, 'Blusa regata hering', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-11_14_06_31.jpg', '2021-10-11 17:06:31', 4, 89, 'Tam: m off white'),
(3213, 'Bl514', 0, 'Blusa 12 step', 1, '25.00', '52.00', 1, 1, './imgs/2021-10-11_14_09_06.jpg', '2021-10-11 17:09:06', 4, 89, 'Tam: p preta'),
(3214, '1323', 0, 'Blusa wi fi', 1, '30.00', '68.00', 1, 1, './imgs/2021-10-11_14_16_03.jpg', '2021-10-11 17:16:03', 4, 89, 'Tam: m linho laranja'),
(3215, 'Bl516', 0, 'Blusa manga bufante ', 1, '30.00', '58.00', 1, 1, './imgs/2021-10-11_17_12_35.jpg', '2021-10-11 20:12:35', 4, 89, 'Tam: xg preta'),
(3216, 'Bl516', 0, 'Blusa manga bufante ', 1, '30.00', '58.00', 1, 1, './imgs/2021-10-11_17_12_37.jpg', '2021-10-11 20:12:37', 4, 89, 'Tam: xg preta'),
(3217, 'Bl517', 0, 'Blusa manga bufante renda', 1, '30.00', '58.00', 1, 1, './imgs/2021-10-11_17_14_30.jpg', '2021-10-11 20:14:30', 4, 89, 'Tam: xg azul marinho'),
(3218, 'Bl518', 0, 'Blusa feminicisces', 1, '25.00', '52.00', 2, 1, './imgs/2021-10-11_17_17_16.jpg', '2021-10-11 20:17:16', 4, 89, 'Tam: unico verde/telha'),
(3219, '7909173400897', 0, 'Blusa regata hering ', 1, '40.00', '40.00', 1, 1, './imgs/2021-10-11_17_18_47.jpg', '2021-10-11 20:18:47', 4, 89, 'Tam: m'),
(3220, 'Bl518', 0, 'Blusa cropped ciganinha', 1, '30.00', '58.00', 2, 1, './imgs/2021-10-11_17_21_27.jpg', '2021-10-11 20:21:27', 4, 89, 'Tam: m- rosê  xg- estampada'),
(3221, 'Bl519', 0, 'Blusa job', 1, '30.00', '30.00', 2, 1, './imgs/2021-10-11_17_23_08.jpg', '2021-10-11 20:23:08', 4, 89, 'Tam: p-preta m- nude'),
(3222, '170188', 0, 'Blusa lírikos ', 1, '25.00', '50.00', 4, 1, './imgs/2021-10-11_17_26_30.jpg', '2021-10-11 20:26:30', 4, 89, 'Tam: p/m/g- rosa m-azul'),
(3223, '1432', 0, 'Blusa eslee', 1, '20.00', '20.00', 1, 1, './imgs/2021-10-11_17_27_47.jpg', '2021-10-11 20:27:47', 4, 0, 'Tam: g verde'),
(3224, 'Bl520', 0, 'Blusa cocci', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-11_17_29_29.jpg', '2021-10-11 20:29:29', 4, 89, 'Tam: p'),
(3225, 'Bl521', 0, 'Blusa dorinda', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-11_17_30_38.jpg', '2021-10-11 20:30:38', 4, 89, 'Tam: p'),
(3226, '6120', 0, 'Blusa la muse', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-11_17_32_32.jpg', '2021-10-11 20:32:32', 4, 89, 'Tam: m'),
(3227, '15185', 0, 'Blusa regata canoni', 1, '30.00', '30.00', 6, 1, './imgs/2021-10-13_15_06_43.jpg', '2021-10-13 18:06:43', 4, 89, 'Tam: m/g-nude p/m-telha g-azul marinho'),
(3228, 'Bl522', 0, 'Blusa arte miss', 1, '25.00', '45.00', 1, 1, './imgs/2021-10-13_15_38_30.jpg', '2021-10-13 18:38:30', 4, 0, 'Tam: m'),
(3229, 'Bl522', 0, 'Blusa arte miss', 1, '45.00', '45.00', 1, 1, './imgs/2021-10-13_15_58_44.jpg', '2021-10-13 18:58:44', 4, 89, 'Tam: m'),
(3230, 'Bl523', 0, 'Blusa cocci', 1, '45.00', '45.00', 1, 1, './imgs/2021-10-13_16_00_07.jpg', '2021-10-13 19:00:07', 4, 89, 'Tam: m'),
(3231, '000113', 0, 'Blusa regata CONFissima', 1, '40.00', '40.00', 2, 1, './imgs/2021-10-13_16_05_36.jpg', '2021-10-13 19:05:36', 4, 89, 'Tam: p-pink m-off white'),
(3232, '5155.6', 0, 'Blusa enois', 1, '0.00', '40.00', 1, 0, './imgs/2021-10-13_16_20_27.jpg', '2021-10-13 19:20:27', 7, 89, '78,00'),
(3234, '510', 0, 'Blusa regata', 1, '32.00', '32.00', 2, 1, './imgs/2021-10-13_16_30_45.jpg', '2021-10-13 19:30:45', 4, 89, 'Tam: p/m'),
(3235, '11758', 0, 'Blusa ellen', 1, '30.00', '30.00', 1, 1, './imgs/2021-10-13_16_33_49.jpg', '2021-10-13 19:33:49', 4, 89, 'Tam: m'),
(3236, '0068213980000010', 0, 'Blusa presage', 1, '45.00', '45.00', 1, 1, './imgs/2021-10-13_16_40_21.jpg', '2021-10-13 19:40:21', 4, 0, 'Tam: p'),
(3237, '0068213980000010', 0, 'Blusa regata presage', 1, '45.00', '45.00', 1, 1, './imgs/2021-10-13_16_46_08.jpg', '2021-10-13 19:46:08', 4, 89, 'Tam: p'),
(3238, 'Bl524', 0, 'Blusa etonnant', 1, '40.00', '40.00', 1, 1, './imgs/2021-10-13_16_50_47.jpg', '2021-10-13 19:50:47', 4, 89, 'Tam: m'),
(3239, 'Bl526', 0, 'Blusa etonnant', 1, '25.00', '50.00', 1, 1, './imgs/2021-10-13_16_54_40.jpg', '2021-10-13 19:54:40', 4, 89, 'Tam: gg'),
(3240, '1455', 0, 'Blusa regata espaço virtal', 1, '40.00', '40.00', 1, 1, './imgs/2021-10-13_17_00_48.jpg', '2021-10-13 20:00:48', 4, 89, 'Tam: g preta'),
(3241, 'Bl525', 0, 'Blusa modsva', 1, '25.00', '25.00', 1, 1, './imgs/2021-10-13_17_09_42.jpg', '2021-10-13 20:09:42', 4, 89, 'Tam: p preta'),
(3242, '1559', 0, 'Blusa espaço  virtual ', 1, '58.00', '58.00', 2, 1, './imgs/2021-10-13_17_32_05.jpg', '2021-10-13 20:32:05', 4, 89, 'Tam: p-vinho g-verde'),
(3243, '82098', 0, 'Blusa regata osiris', 1, '48.00', '48.00', 3, 1, './imgs/2021-10-13_17_45_12.jpg', '2021-10-13 20:45:12', 4, 89, 'Tam: 38/40/42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_venda`
--

CREATE TABLE `produto_venda` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `codigo` int(11) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `produtos_id` int(10) NOT NULL,
  `clientes_id` int(11) NOT NULL,
  `forma_pagamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto_venda`
--

INSERT INTO `produto_venda` (`id`, `data`, `codigo`, `qtd`, `valor`, `produtos_id`, `clientes_id`, `forma_pagamento_id`) VALUES
(10, '2022-01-11 22:41:41', 709441, 3, '234.00', 2591, 15, 8),
(11, '2022-01-11 22:49:06', 925470, 1, '120.00', 3024, 15, 2),
(12, '2022-01-11 22:58:40', 191347, 1, '120.00', 2952, 15, 2),
(13, '2022-01-16 16:49:46', 142233, 1, '120.00', 3024, 18, 2),
(14, '2022-01-16 17:20:32', 163352, 1, '89.00', 2184, 18, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`id`, `nome`) VALUES
(1, 'Venda'),
(2, 'Orçamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargos_id` int(11) NOT NULL,
  `acessos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cargos_id`, `acessos_id`) VALUES
(4, 'admin', 'admin@eneylton.com', '$2y$10$mZ.QuTVOWHefiG58kSk2K.BW3VDnDFu/l1fhYaBmRhQ5eJTJImThm', 1, 1),
(7, 'Eneylton Barros', 'eneylton@hotmail.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 2),
(13, 'ene', 'enex@gmail.com.br', '202cb962ac59075b964b07152d234b70', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `codigo` int(11) DEFAULT NULL,
  `recebido` decimal(10,2) DEFAULT NULL,
  `troco` decimal(10,2) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `clientes_id` int(11) NOT NULL,
  `forma_pagamento_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `mov_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `data`, `codigo`, `recebido`, `troco`, `usuarios_id`, `clientes_id`, `forma_pagamento_id`, `tipo_id`, `mov_cat_id`) VALUES
(115, NULL, 163352, '89.00', '0.00', 4, 18, 2, 1, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_caixa_forma_pagamento1_idx` (`forma_pagamento_id`),
  ADD KEY `fk_caixa_usuarios1_idx` (`usuarios_id`);

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `catdespesas`
--
ALTER TABLE `catdespesas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movimentacoes_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_movimentacoes_catdespesas1_idx` (`catdespesas_id`),
  ADD KEY `fk_movimentacoes_forma_pagamento1_idx` (`forma_pagamento_id`),
  ADD KEY `fk_movimentacoes_caixa1_idx` (`caixa_id`);

--
-- Índices para tabela `mov_cat`
--
ALTER TABLE `mov_cat`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produtos_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_produtos_categorias1_idx` (`categorias_id`);

--
-- Índices para tabela `produto_venda`
--
ALTER TABLE `produto_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produto_venda_produtos1_idx` (`produtos_id`),
  ADD KEY `fk_produto_venda_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_produto_venda_forma_pagamento1_idx` (`forma_pagamento_id`);

--
-- Índices para tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_usuarios_cargos_idx` (`cargos_id`),
  ADD KEY `fk_usuarios_acessos1_idx` (`acessos_id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vendas_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_vendas_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_vendas_forma_pagamento1_idx` (`forma_pagamento_id`),
  ADD KEY `fk_vendas_tipo1_idx` (`tipo_id`),
  ADD KEY `fk_vendas_mov_cat1_idx` (`mov_cat_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `catdespesas`
--
ALTER TABLE `catdespesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `mov_cat`
--
ALTER TABLE `mov_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3244;

--
-- AUTO_INCREMENT de tabela `produto_venda`
--
ALTER TABLE `produto_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `fk_caixa_forma_pagamento1` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_caixa_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD CONSTRAINT `fk_movimentacoes_caixa1` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimentacoes_catdespesas1` FOREIGN KEY (`catdespesas_id`) REFERENCES `catdespesas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimentacoes_forma_pagamento1` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimentacoes_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto_venda`
--
ALTER TABLE `produto_venda`
  ADD CONSTRAINT `fk_produto_venda_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produto_venda_forma_pagamento1` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produto_venda_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_acessos1` FOREIGN KEY (`acessos_id`) REFERENCES `acessos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_cargos` FOREIGN KEY (`cargos_id`) REFERENCES `cargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_vendas_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_forma_pagamento1` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_mov_cat1` FOREIGN KEY (`mov_cat_id`) REFERENCES `mov_cat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_tipo1` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
