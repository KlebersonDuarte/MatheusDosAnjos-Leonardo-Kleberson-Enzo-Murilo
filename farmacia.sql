-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 24/11/2025 às 22:25
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `farmacia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_carrinho`
--

DROP TABLE IF EXISTS `tb_carrinho`;
CREATE TABLE IF NOT EXISTS `tb_carrinho` (
  `ID_CARRINHO` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int NOT NULL,
  `CRIADO_CARRINHO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_CARRINHO`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_carrinho`
--

INSERT INTO `tb_carrinho` (`ID_CARRINHO`, `ID_USUARIO`, `CRIADO_CARRINHO`) VALUES
(1, 0, '2025-11-22 16:36:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_item_carrinho`
--

DROP TABLE IF EXISTS `tb_item_carrinho`;
CREATE TABLE IF NOT EXISTS `tb_item_carrinho` (
  `ID_ITEM_CARRINHO` int NOT NULL AUTO_INCREMENT,
  `ID_CARRINHO` int NOT NULL,
  `ID_PRODUTO` int NOT NULL,
  `QUANTIDADE_ITEM` int NOT NULL,
  `PRECO_UNITARIO` decimal(10,2) NOT NULL,
  `TOTAL_ITEM` decimal(10,2) NOT NULL,
  `ADICIONADO_EM` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_ITEM_CARRINHO`),
  KEY `ID_CARRINHO` (`ID_CARRINHO`),
  KEY `ID_PRODUTO` (`ID_PRODUTO`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_item_carrinho`
--

INSERT INTO `tb_item_carrinho` (`ID_ITEM_CARRINHO`, `ID_CARRINHO`, `ID_PRODUTO`, `QUANTIDADE_ITEM`, `PRECO_UNITARIO`, `TOTAL_ITEM`, `ADICIONADO_EM`) VALUES
(3, 1, 3, 1, 16.99, 16.99, '2025-11-22 16:41:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
CREATE TABLE IF NOT EXISTS `tb_produto` (
  `ID_PRODUTO` int NOT NULL AUTO_INCREMENT,
  `NOME_PRODUTO` varchar(80) NOT NULL,
  `PRECO_PRODUTO` decimal(5,2) NOT NULL,
  `CATEGORIA_PRODUTO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DESCRICAO_PRODUTO` text NOT NULL,
  `FABRI_PRODUTO` date NOT NULL,
  `VALIDADE_PRODUTO` date NOT NULL,
  PRIMARY KEY (`ID_PRODUTO`)
) ENGINE=MyISAM AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_produto`
--

INSERT INTO `tb_produto` (`ID_PRODUTO`, `NOME_PRODUTO`, `PRECO_PRODUTO`, `CATEGORIA_PRODUTO`, `DESCRICAO_PRODUTO`, `FABRI_PRODUTO`, `VALIDADE_PRODUTO`) VALUES
(1, 'Paracetamol 750mg', 12.90, 'Remédios', 'Alívio de febre e dores leves.', '2025-01-10', '2027-01-10'),
(2, 'Dipirona Sódica 500mg', 8.50, 'Remédios', 'Analgesia rápida para dores diversas.', '2025-02-01', '2027-02-01'),
(3, 'Ibuprofeno 400mg', 16.99, 'Remédios', 'Anti-inflamatório para dores e febre.', '2025-03-15', '2027-03-15'),
(4, 'Amoxicilina 500mg', 32.40, 'Remédios', 'Antibiótico para infecções bacterianas.', '2025-02-10', '2026-02-10'),
(5, 'Loratadina 10mg', 14.20, 'Remédios', 'Antialérgico de ação prolongada.', '2025-01-30', '2027-01-30'),
(6, 'Omeprazol 20mg', 22.00, 'Remédios', 'Reduz a acidez do estômago.', '2025-03-20', '2027-03-20'),
(7, 'Carbonato de Cálcio', 18.90, 'Remédios', 'Suplemento para fortalecimento ósseo.', '2025-03-01', '2027-03-01'),
(8, 'Losartana 50mg', 21.70, 'Remédios', 'Controle da pressão arterial.', '2025-02-15', '2027-02-15'),
(9, 'Enalapril 10mg', 17.50, 'Remédios', 'Tratamento de hipertensão.', '2025-01-25', '2027-01-25'),
(10, 'Buscopan', 28.40, 'Remédios', 'Alívio de dores abdominais e cólicas.', '2025-01-12', '2027-01-12'),
(11, 'Dramin', 18.99, 'Remédios', 'Previna enjôos e náuseas.', '2025-03-01', '2027-03-01'),
(12, 'Metformina 850mg', 24.50, 'Remédios', 'Controle da glicemia em diabéticos.', '2025-02-05', '2027-02-05'),
(13, 'Sinvastatina 20mg', 26.90, 'Remédios', 'Redução do colesterol.', '2025-01-20', '2027-01-20'),
(14, 'Sertralina 50mg', 39.90, 'Remédios', 'Antidepressivo para ansiedade/depressão.', '2025-03-18', '2027-03-18'),
(15, 'Cetoprofeno 100mg', 19.40, 'Remédios', 'Anti-inflamatório para dores musculares.', '2025-03-10', '2027-03-10'),
(16, 'Diazepam 5mg', 42.00, 'Remédios', 'Ansiolítico e relaxante muscular.', '2025-02-22', '2027-02-22'),
(17, 'Prednisona 20mg', 15.80, 'Remédios', 'Corticoide para alergias e inflamações.', '2025-03-05', '2027-03-05'),
(18, 'Claritromicina 500mg', 34.90, 'Remédios', 'Antibiótico de largo espectro.', '2025-01-14', '2026-01-14'),
(19, 'Diclofenaco Sódico 50mg', 12.60, 'Remédios', 'Anti-inflamatório e analgésico.', '2025-03-10', '2027-03-10'),
(20, 'Ranitidina 150mg', 19.80, 'Remédios', 'Reduz acidez e queimação.', '2025-02-08', '2027-02-08'),
(21, 'Ambroxol Xarope', 13.99, 'Remédios', 'Expectorante para tosse.', '2025-03-12', '2027-03-12'),
(22, 'Nimesulida 100mg', 16.40, 'Remédios', 'Anti-inflamatório para diversas dores.', '2025-02-28', '2027-02-28'),
(23, 'Benzetacil Ampola', 29.50, 'Remédios', 'Antibiótico injetável.', '2025-01-10', '2026-01-10'),
(24, 'Polaramine', 17.90, 'Remédios', 'Antialérgico de ação moderada.', '2025-03-22', '2027-03-22'),
(25, 'Aspirina 500mg', 11.90, 'Remédios', 'Analgésico e antitérmico.', '2025-02-10', '2027-02-10'),
(26, 'Neosaldina', 18.00, 'Remédios', 'Analgésico para dor de cabeça intensa.', '2025-02-25', '2027-02-25'),
(27, 'Vitamina B12 Injetável', 22.40, 'Remédios', 'Reposição de B12 para anemia.', '2025-01-18', '2027-01-18'),
(28, 'Gliconato de Magnésio', 15.70, 'Remédios', 'Repositor mineral.', '2025-03-14', '2027-03-14'),
(29, 'Fluconazol 150mg', 19.90, 'Remédios', 'Tratamento contra fungos.', '2025-01-27', '2027-01-27'),
(30, 'Desloratadina 5mg', 20.90, 'Remédios', 'Antialérgico de ação prolongada.', '2025-03-03', '2027-03-03'),
(31, 'Hidratante Corporal Nivea Soft', 19.90, 'Cosméticos', 'Hidratação leve para uso diário.', '2025-01-12', '2027-01-12'),
(32, 'Creme Nívea da Latinha Azul', 16.50, 'Cosméticos', 'Hidratante clássico para pele seca.', '2025-02-01', '2028-02-01'),
(33, 'Protetor Solar Sundown FPS 50', 42.90, 'Cosméticos', 'Proteção contra raios UVA/UVB.', '2025-01-20', '2026-01-20'),
(34, 'Protetor Solar La Roche FPS 60', 96.00, 'Cosméticos', 'Alta proteção solar e toque seco.', '2025-03-02', '2026-03-02'),
(35, 'Shampoo Dove Reconstrução', 14.99, 'Cosméticos', 'Fortalece cabelos danificados.', '2025-03-10', '2027-03-10'),
(36, 'Condicionador Dove Reconstrução', 15.99, 'Cosméticos', 'Maciez e reparação dos fios.', '2025-03-10', '2027-03-10'),
(37, 'Shampoo Pantene Brilho Extremo', 17.50, 'Cosméticos', 'Realça brilho e maciez.', '2025-02-22', '2027-02-22'),
(38, 'Máscara Capilar Skala Babosa', 9.90, 'Cosméticos', 'Hidratação profunda para todos os tipos de cabelo.', '2025-01-15', '2027-01-15'),
(39, 'Sabonete Dove Original', 4.50, 'Cosméticos', 'Sabonete hidratante suave.', '2025-03-08', '2027-03-08'),
(40, 'Sabonete Líquido Lux Rosas', 9.20, 'Cosméticos', 'Limpeza perfumada para pele.', '2025-01-28', '2027-01-28'),
(41, 'Base Líquida Ruby Rose', 18.90, 'Cosméticos', 'Cobertura média com acabamento matte.', '2025-02-12', '2027-02-12'),
(42, 'Pó Compacto Vult', 24.90, 'Cosméticos', 'Acabamento leve e natural.', '2025-01-14', '2027-01-14'),
(43, 'Batom Matte Vult Vermelho', 15.60, 'Cosméticos', 'Batom matte de longa duração.', '2025-01-22', '2027-01-22'),
(44, 'Gloss Incolor Ruby Rose', 12.90, 'Cosméticos', 'Brilho suave e hidratante.', '2025-03-03', '2027-03-03'),
(45, 'Rímel Maybelline Colossal', 39.90, 'Cosméticos', 'Volume extremo para os cílios.', '2025-01-10', '2026-01-10'),
(46, 'Esfoliante Corporal Nativa Spa', 49.90, 'Cosméticos', 'Remove células mortas e renova a pele.', '2025-03-18', '2027-03-18'),
(47, 'Água Micelar L’Oréal', 34.90, 'Cosméticos', 'Limpeza facial multifuncional.', '2025-02-02', '2027-02-02'),
(48, 'Lenços Demaquilantes Neutrogena', 29.90, 'Cosméticos', 'Remove maquiagem e impurezas.', '2025-01-29', '2027-01-29'),
(49, 'Hidratante Facial Facial Clinical', 32.50, 'Cosméticos', 'Hidratação leve para o rosto.', '2025-03-11', '2027-03-11'),
(50, 'Tônico Facial Nivea', 27.00, 'Cosméticos', 'Controle de oleosidade e limpeza profunda.', '2025-02-14', '2027-02-14'),
(51, 'Spray Capilar Karina Forte', 18.90, 'Cosméticos', 'Fixação prolongada para penteados.', '2025-03-02', '2027-03-02'),
(52, 'Óleo Corporal Natura Sève', 49.99, 'Cosméticos', 'Hidratação intensa com fragrância suave.', '2025-01-20', '2027-01-20'),
(53, 'Esmalte Impala Nude', 6.90, 'Cosméticos', 'Longa duração e secagem rápida.', '2025-01-30', '2027-01-30'),
(54, 'Removedor de Esmalte Farmax', 7.50, 'Cosméticos', 'Remove esmalte sem ressecar.', '2025-02-25', '2027-02-25'),
(55, 'Creme para Mãos Nivea', 14.40, 'Cosméticos', 'Hidratação para mãos ressecadas.', '2025-01-10', '2027-01-10'),
(56, 'Desodorante Rexona Antibac', 12.70, 'Cosméticos', 'Proteção contra suor por 48h.', '2025-03-05', '2027-03-05'),
(57, 'Desodorante Roll-On Dove', 10.50, 'Cosméticos', 'Suavidade e hidratação para a pele.', '2025-02-03', '2027-02-03'),
(58, 'Gel Fixador Bozzano', 15.99, 'Cosméticos', 'Fixação forte para penteados.', '2025-03-14', '2027-03-14'),
(59, 'Perfume Corporal Giovanna Baby', 21.99, 'Cosméticos', 'Fragrância suave para o dia a dia.', '2025-02-08', '2027-02-08'),
(60, 'Creme de Barbear Gillette', 16.90, 'Cosméticos', 'Facilita o deslizamento da lâmina.', '2025-01-17', '2027-01-17'),
(61, 'Sabonete Líquido Antibacteriano Lifebuoy', 9.90, 'Higiene Pessoal', 'Limpeza profunda com ação antibacteriana.', '2025-01-05', '2027-01-05'),
(62, 'Sabonete em Barra Dove Karité', 4.20, 'Higiene Pessoal', 'Hidratação intensa com manteiga de karité.', '2025-02-10', '2027-02-10'),
(63, 'Desodorante Rexona Men V8 Aerosol', 15.90, 'Higiene Pessoal', 'Proteção seca por até 72h.', '2025-01-29', '2027-01-29'),
(64, 'Desodorante Dove Original Roll-on', 10.50, 'Higiene Pessoal', 'Proteção suave com hidratação.', '2025-03-04', '2027-03-04'),
(65, 'Shampoo Clear Anticaspa', 18.99, 'Higiene Pessoal', 'Combate a caspa desde o primeiro uso.', '2025-03-11', '2027-03-11'),
(66, 'Shampoo Palmolive Naturals', 12.00, 'Higiene Pessoal', 'Ação hidratante com extratos naturais.', '2025-02-18', '2027-02-18'),
(67, 'Condicionador Palmolive Naturals', 12.50, 'Higiene Pessoal', 'Desembaraço e maciez profunda.', '2025-02-18', '2027-02-18'),
(68, 'Creme Dental Colgate Total 12', 9.90, 'Higiene Pessoal', 'Proteção completa contra bactérias.', '2025-01-22', '2027-01-22'),
(69, 'Creme Dental Sorriso Dentes Brancos', 6.99, 'Higiene Pessoal', 'Clareamento suave e refrescância.', '2025-02-15', '2027-02-15'),
(70, 'Escova Dental Oral-B Macia', 7.50, 'Higiene Pessoal', 'Cerdas macias que limpam sem agredir.', '2025-03-01', '2027-03-01'),
(71, 'Escova Dental Colgate Média', 6.80, 'Higiene Pessoal', 'Cabo anatômico e limpeza eficiente.', '2025-01-19', '2027-01-19'),
(72, 'Enxaguante Bucal Listerine Cool Mint', 19.90, 'Higiene Pessoal', 'Reduz 99% das bactérias bucais.', '2025-02-01', '2027-02-01'),
(73, 'Fio Dental Colgate 25m', 7.99, 'Higiene Pessoal', 'Limpeza profunda entre os dentes.', '2025-03-13', '2027-03-13'),
(74, 'Lenços Umedecidos Johnson’s Baby', 14.90, 'Higiene Pessoal', 'Lenços suaves para pele sensível.', '2025-03-10', '2027-03-10'),
(75, 'Lenços Umedecidos Adulto FeelClean', 11.90, 'Higiene Pessoal', 'Refrescância com ação antibacteriana.', '2025-01-28', '2027-01-28'),
(76, 'Sabonete Íntimo Dermacyd', 22.90, 'Higiene Pessoal', 'pH balanceado e proteção íntima.', '2025-01-17', '2027-01-17'),
(77, 'Talco Antisséptico Tenys Pé', 9.49, 'Higiene Pessoal', 'Combate odores e suor nos pés.', '2025-02-20', '2027-02-20'),
(78, 'Álcool em Gel 70% Asseptgel 500ml', 10.90, 'Higiene Pessoal', 'Higieniza e hidrata as mãos.', '2025-01-25', '2027-01-25'),
(79, 'Sabonete de Enxofre Granado', 7.29, 'Higiene Pessoal', 'Controle de oleosidade e acne.', '2025-03-09', '2027-03-09'),
(80, 'Sabonete Glicerinado Granado', 4.49, 'Higiene Pessoal', 'Suave e ideal para peles sensíveis.', '2025-02-05', '2027-02-05'),
(81, 'Shampoo Infantil Johnson’s', 13.50, 'Higiene Pessoal', 'Fórmula suave que não arde os olhos.', '2025-02-22', '2027-02-22'),
(82, 'Condicionador Infantil Johnson’s', 14.50, 'Higiene Pessoal', 'Desembaraça sem irritar.', '2025-02-22', '2027-02-22'),
(83, 'Sabonete Líquido Infantil Huggies', 12.40, 'Higiene Pessoal', 'Proteção e hidratação para bebês.', '2025-03-06', '2027-03-06'),
(84, 'Hidratante Corporal Johnson’s Pele Macia', 17.99, 'Higiene Pessoal', 'Hidratação suave para uso diário.', '2025-03-04', '2027-03-04'),
(85, 'Desodorante Sem Perfume Granado', 14.49, 'Higiene Pessoal', 'Ideal para peles sensíveis.', '2025-01-30', '2027-01-30'),
(86, 'Antisséptico Bucal Periogard', 29.90, 'Higiene Pessoal', 'Combate gengivite e placa bacteriana.', '2025-02-08', '2027-02-08'),
(87, 'Sabonete Líquido Lux Lavanda', 9.20, 'Higiene Pessoal', 'Limpeza suave com fragrância floral.', '2025-01-23', '2027-01-23'),
(88, 'Creme Hidratante Pés Footner', 22.99, 'Higiene Pessoal', 'Hidratação intensa e reparação.', '2025-02-09', '2027-02-09'),
(89, 'Sabonete Esfoliante Nativa Spa', 24.99, 'Higiene Pessoal', 'Remove células mortas e renova a pele.', '2025-02-27', '2027-02-27'),
(90, 'Fralda Pampers Confort Sec M', 49.90, 'Bebês', 'Até 12h de proteção e conforto.', '2025-01-10', '2027-01-10'),
(91, 'Fralda Pampers Confort Sec G', 52.90, 'Bebês', 'Absorção rápida para noites tranquilas.', '2025-01-12', '2027-01-12'),
(92, 'Fralda Huggies Tripla Proteção M', 46.80, 'Bebês', 'Evita vazamentos por até 12h.', '2025-02-01', '2027-02-01'),
(93, 'Fralda Huggies Tripla Proteção G', 48.60, 'Bebês', 'Toque macio e proteção reforçada.', '2025-02-03', '2027-02-03'),
(94, 'Lenços Umedecidos Huggies', 14.90, 'Bebês', 'Textura suave e hipoalergênica.', '2025-03-01', '2027-03-01'),
(95, 'Ibuprofeno 400mg', 16.99, 'Remédios', 'Anti-inflamatório para dores e febre.', '2025-03-15', '2027-03-15'),
(96, 'Amoxicilina 500mg', 32.40, 'Remédios', 'Antibiótico para infecções bacterianas.', '2025-02-10', '2026-02-10'),
(97, 'Loratadina 10mg', 14.20, 'Remédios', 'Antialérgico de ação prolongada.', '2025-01-30', '2027-01-30'),
(98, 'Omeprazol 20mg', 22.00, 'Remédios', 'Reduz a acidez do estômago.', '2025-03-20', '2027-03-20'),
(99, 'Carbonato de Cálcio', 18.90, 'Remédios', 'Suplemento para fortalecimento ósseo.', '2025-03-01', '2027-03-01'),
(100, 'Losartana 50mg', 21.70, 'Remédios', 'Controle da pressão arterial.', '2025-02-15', '2027-02-15'),
(101, 'Enalapril 10mg', 17.50, 'Remédios', 'Tratamento de hipertensão.', '2025-01-25', '2027-01-25'),
(102, 'Buscopan', 28.40, 'Remédios', 'Alívio de dores abdominais e cólicas.', '2025-01-12', '2027-01-12'),
(103, 'Dramin', 18.99, 'Remédios', 'Previna enjôos e náuseas.', '2025-03-01', '2027-03-01'),
(104, 'Metformina 850mg', 24.50, 'Remédios', 'Controle da glicemia em diabéticos.', '2025-02-05', '2027-02-05'),
(105, 'Sinvastatina 20mg', 26.90, 'Remédios', 'Redução do colesterol.', '2025-01-20', '2027-01-20'),
(106, 'Sertralina 50mg', 39.90, 'Remédios', 'Antidepressivo para ansiedade/depressão.', '2025-03-18', '2027-03-18'),
(107, 'Cetoprofeno 100mg', 19.40, 'Remédios', 'Anti-inflamatório para dores musculares.', '2025-03-10', '2027-03-10'),
(108, 'Diazepam 5mg', 42.00, 'Remédios', 'Ansiolítico e relaxante muscular.', '2025-02-22', '2027-02-22'),
(109, 'Prednisona 20mg', 15.80, 'Remédios', 'Corticoide para alergias e inflamações.', '2025-03-05', '2027-03-05'),
(110, 'Claritromicina 500mg', 34.90, 'Remédios', 'Antibiótico de largo espectro.', '2025-01-14', '2026-01-14'),
(111, 'Diclofenaco Sódico 50mg', 12.60, 'Remédios', 'Anti-inflamatório e analgésico.', '2025-03-10', '2027-03-10'),
(112, 'Ranitidina 150mg', 19.80, 'Remédios', 'Reduz acidez e queimação.', '2025-02-08', '2027-02-08'),
(113, 'Ambroxol Xarope', 13.99, 'Remédios', 'Expectorante para tosse.', '2025-03-12', '2027-03-12'),
(114, 'Nimesulida 100mg', 16.40, 'Remédios', 'Anti-inflamatório para diversas dores.', '2025-02-28', '2027-02-28'),
(115, 'Benzetacil Ampola', 29.50, 'Remédios', 'Antibiótico injetável.', '2025-01-10', '2026-01-10'),
(116, 'Polaramine', 17.90, 'Remédios', 'Antialérgico de ação moderada.', '2025-03-22', '2027-03-22'),
(117, 'Aspirina 500mg', 11.90, 'Remédios', 'Analgésico e antitérmico.', '2025-02-10', '2027-02-10'),
(118, 'Neosaldina', 18.00, 'Remédios', 'Analgésico para dor de cabeça intensa.', '2025-02-25', '2027-02-25'),
(119, 'Vitamina B12 Injetável', 22.40, 'Remédios', 'Reposição de B12 para anemia.', '2025-01-18', '2027-01-18'),
(120, 'Gliconato de Magnésio', 15.70, 'Remédios', 'Repositor mineral.', '2025-03-14', '2027-03-14'),
(121, 'Fluconazol 150mg', 19.90, 'Remédios', 'Tratamento contra fungos.', '2025-01-27', '2027-01-27'),
(122, 'Desloratadina 5mg', 20.90, 'Remédios', 'Antialérgico de ação prolongada.', '2025-03-03', '2027-03-03'),
(123, 'Hidratante Corporal Nivea Soft', 19.90, 'Cosméticos', 'Hidratação leve para uso diário.', '2025-01-12', '2027-01-12'),
(124, 'Creme Nívea da Latinha Azul', 16.50, 'Cosméticos', 'Hidratante clássico para pele seca.', '2025-02-01', '2028-02-01'),
(125, 'Protetor Solar Sundown FPS 50', 42.90, 'Cosméticos', 'Proteção contra raios UVA/UVB.', '2025-01-20', '2026-01-20'),
(126, 'Protetor Solar La Roche FPS 60', 96.00, 'Cosméticos', 'Alta proteção solar e toque seco.', '2025-03-02', '2026-03-02'),
(127, 'Shampoo Dove Reconstrução', 14.99, 'Cosméticos', 'Fortalece cabelos danificados.', '2025-03-10', '2027-03-10'),
(128, 'Condicionador Dove Reconstrução', 15.99, 'Cosméticos', 'Maciez e reparação dos fios.', '2025-03-10', '2027-03-10'),
(129, 'Shampoo Pantene Brilho Extremo', 17.50, 'Cosméticos', 'Realça brilho e maciez.', '2025-02-22', '2027-02-22'),
(130, 'Máscara Capilar Skala Babosa', 9.90, 'Cosméticos', 'Hidratação profunda para todos os tipos de cabelo.', '2025-01-15', '2027-01-15'),
(131, 'Sabonete Dove Original', 4.50, 'Cosméticos', 'Sabonete hidratante suave.', '2025-03-08', '2027-03-08'),
(132, 'Sabonete Líquido Lux Rosas', 9.20, 'Cosméticos', 'Limpeza perfumada para pele.', '2025-01-28', '2027-01-28'),
(133, 'Base Líquida Ruby Rose', 18.90, 'Cosméticos', 'Cobertura média com acabamento matte.', '2025-02-12', '2027-02-12'),
(134, 'Pó Compacto Vult', 24.90, 'Cosméticos', 'Acabamento leve e natural.', '2025-01-14', '2027-01-14'),
(135, 'Batom Matte Vult Vermelho', 15.60, 'Cosméticos', 'Batom matte de longa duração.', '2025-01-22', '2027-01-22'),
(136, 'Gloss Incolor Ruby Rose', 12.90, 'Cosméticos', 'Brilho suave e hidratante.', '2025-03-03', '2027-03-03'),
(137, 'Rímel Maybelline Colossal', 39.90, 'Cosméticos', 'Volume extremo para os cílios.', '2025-01-10', '2026-01-10'),
(138, 'Esfoliante Corporal Nativa Spa', 49.90, 'Cosméticos', 'Remove células mortas e renova a pele.', '2025-03-18', '2027-03-18'),
(139, 'Água Micelar L’Oréal', 34.90, 'Cosméticos', 'Limpeza facial multifuncional.', '2025-02-02', '2027-02-02'),
(140, 'Lenços Demaquilantes Neutrogena', 29.90, 'Cosméticos', 'Remove maquiagem e impurezas.', '2025-01-29', '2027-01-29'),
(141, 'Hidratante Facial Facial Clinical', 32.50, 'Cosméticos', 'Hidratação leve para o rosto.', '2025-03-11', '2027-03-11'),
(142, 'Tônico Facial Nivea', 27.00, 'Cosméticos', 'Controle de oleosidade e limpeza profunda.', '2025-02-14', '2027-02-14'),
(143, 'Spray Capilar Karina Forte', 18.90, 'Cosméticos', 'Fixação prolongada para penteados.', '2025-03-02', '2027-03-02'),
(144, 'Óleo Corporal Natura Sève', 49.99, 'Cosméticos', 'Hidratação intensa com fragrância suave.', '2025-01-20', '2027-01-20'),
(145, 'Esmalte Impala Nude', 6.90, 'Cosméticos', 'Longa duração e secagem rápida.', '2025-01-30', '2027-01-30'),
(146, 'Removedor de Esmalte Farmax', 7.50, 'Cosméticos', 'Remove esmalte sem ressecar.', '2025-02-25', '2027-02-25'),
(147, 'Creme para Mãos Nivea', 14.40, 'Cosméticos', 'Hidratação para mãos ressecadas.', '2025-01-10', '2027-01-10'),
(148, 'Desodorante Rexona Antibac', 12.70, 'Cosméticos', 'Proteção contra suor por 48h.', '2025-03-05', '2027-03-05'),
(149, 'Desodorante Roll-On Dove', 10.50, 'Cosméticos', 'Suavidade e hidratação para a pele.', '2025-02-03', '2027-02-03'),
(150, 'Gel Fixador Bozzano', 15.99, 'Cosméticos', 'Fixação forte para penteados.', '2025-03-14', '2027-03-14'),
(151, 'Perfume Corporal Giovanna Baby', 21.99, 'Cosméticos', 'Fragrância suave para o dia a dia.', '2025-02-08', '2027-02-08'),
(152, 'Creme de Barbear Gillette', 16.90, 'Cosméticos', 'Facilita o deslizamento da lâmina.', '2025-01-17', '2027-01-17'),
(153, 'Sabonete Líquido Antibacteriano Lifebuoy', 9.90, 'Higiene Pessoal', 'Limpeza profunda com ação antibacteriana.', '2025-01-05', '2027-01-05'),
(154, 'Sabonete em Barra Dove Karité', 4.20, 'Higiene Pessoal', 'Hidratação intensa com manteiga de karité.', '2025-02-10', '2027-02-10'),
(155, 'Desodorante Rexona Men V8 Aerosol', 15.90, 'Higiene Pessoal', 'Proteção seca por até 72h.', '2025-01-29', '2027-01-29'),
(156, 'Desodorante Dove Original Roll-on', 10.50, 'Higiene Pessoal', 'Proteção suave com hidratação.', '2025-03-04', '2027-03-04'),
(157, 'Shampoo Clear Anticaspa', 18.99, 'Higiene Pessoal', 'Combate a caspa desde o primeiro uso.', '2025-03-11', '2027-03-11'),
(158, 'Shampoo Palmolive Naturals', 12.00, 'Higiene Pessoal', 'Ação hidratante com extratos naturais.', '2025-02-18', '2027-02-18'),
(159, 'Condicionador Palmolive Naturals', 12.50, 'Higiene Pessoal', 'Desembaraço e maciez profunda.', '2025-02-18', '2027-02-18'),
(160, 'Creme Dental Colgate Total 12', 9.90, 'Higiene Pessoal', 'Proteção completa contra bactérias.', '2025-01-22', '2027-01-22'),
(161, 'Creme Dental Sorriso Dentes Brancos', 6.99, 'Higiene Pessoal', 'Clareamento suave e refrescância.', '2025-02-15', '2027-02-15'),
(162, 'Escova Dental Oral-B Macia', 7.50, 'Higiene Pessoal', 'Cerdas macias que limpam sem agredir.', '2025-03-01', '2027-03-01'),
(163, 'Escova Dental Colgate Média', 6.80, 'Higiene Pessoal', 'Cabo anatômico e limpeza eficiente.', '2025-01-19', '2027-01-19'),
(164, 'Enxaguante Bucal Listerine Cool Mint', 19.90, 'Higiene Pessoal', 'Reduz 99% das bactérias bucais.', '2025-02-01', '2027-02-01'),
(165, 'Fio Dental Colgate 25m', 7.99, 'Higiene Pessoal', 'Limpeza profunda entre os dentes.', '2025-03-13', '2027-03-13'),
(166, 'Lenços Umedecidos Johnson’s Baby', 14.90, 'Higiene Pessoal', 'Lenços suaves para pele sensível.', '2025-03-10', '2027-03-10'),
(167, 'Lenços Umedecidos Adulto FeelClean', 11.90, 'Higiene Pessoal', 'Refrescância com ação antibacteriana.', '2025-01-28', '2027-01-28'),
(168, 'Sabonete Íntimo Dermacyd', 22.90, 'Higiene Pessoal', 'pH balanceado e proteção íntima.', '2025-01-17', '2027-01-17'),
(169, 'Talco Antisséptico Tenys Pé', 9.49, 'Higiene Pessoal', 'Combate odores e suor nos pés.', '2025-02-20', '2027-02-20'),
(170, 'Álcool em Gel 70% Asseptgel 500ml', 10.90, 'Higiene Pessoal', 'Higieniza e hidrata as mãos.', '2025-01-25', '2027-01-25'),
(171, 'Sabonete de Enxofre Granado', 7.29, 'Higiene Pessoal', 'Controle de oleosidade e acne.', '2025-03-09', '2027-03-09'),
(172, 'Sabonete Glicerinado Granado', 4.49, 'Higiene Pessoal', 'Suave e ideal para peles sensíveis.', '2025-02-05', '2027-02-05'),
(173, 'Shampoo Infantil Johnson’s', 13.50, 'Higiene Pessoal', 'Fórmula suave que não arde os olhos.', '2025-02-22', '2027-02-22'),
(174, 'Condicionador Infantil Johnson’s', 14.50, 'Higiene Pessoal', 'Desembaraça sem irritar.', '2025-02-22', '2027-02-22'),
(175, 'Sabonete Líquido Infantil Huggies', 12.40, 'Higiene Pessoal', 'Proteção e hidratação para bebês.', '2025-03-06', '2027-03-06'),
(176, 'Hidratante Corporal Johnson’s Pele Macia', 17.99, 'Higiene Pessoal', 'Hidratação suave para uso diário.', '2025-03-04', '2027-03-04'),
(177, 'Desodorante Sem Perfume Granado', 14.49, 'Higiene Pessoal', 'Ideal para peles sensíveis.', '2025-01-30', '2027-01-30'),
(178, 'Antisséptico Bucal Periogard', 29.90, 'Higiene Pessoal', 'Combate gengivite e placa bacteriana.', '2025-02-08', '2027-02-08'),
(179, 'Sabonete Líquido Lux Lavanda', 9.20, 'Higiene Pessoal', 'Limpeza suave com fragrância floral.', '2025-01-23', '2027-01-23'),
(180, 'Creme Hidratante Pés Footner', 22.99, 'Higiene Pessoal', 'Hidratação intensa e reparação.', '2025-02-09', '2027-02-09'),
(181, 'Sabonete Esfoliante Nativa Spa', 24.99, 'Higiene Pessoal', 'Remove células mortas e renova a pele.', '2025-02-27', '2027-02-27'),
(182, 'Fralda Pampers Confort Sec M', 49.90, 'Bebês', 'Até 12h de proteção e conforto.', '2025-01-10', '2027-01-10'),
(183, 'Fralda Pampers Confort Sec G', 52.90, 'Bebês', 'Absorção rápida para noites tranquilas.', '2025-01-12', '2027-01-12'),
(184, 'Fralda Huggies Tripla Proteção M', 46.80, 'Bebês', 'Evita vazamentos por até 12h.', '2025-02-01', '2027-02-01'),
(185, 'Fralda Huggies Tripla Proteção G', 48.60, 'Bebês', 'Toque macio e proteção reforçada.', '2025-02-03', '2027-02-03'),
(186, 'Lenços Umedecidos Huggies', 14.90, 'Bebês', 'Textura suave e hipoalergênica.', '2025-03-01', '2027-03-01'),
(187, 'Lenços Umedecidos Johnson’s Baby', 15.99, 'Bebês', 'Limpeza delicada e sem álcool.', '2025-02-18', '2027-02-18'),
(188, 'Shampoo Johnson’s Baby Sem Lágrimas', 13.50, 'Bebês', 'Fórmula suave que não irrita os olhos.', '2025-01-28', '2027-01-28'),
(189, 'Condicionador Johnson’s Baby', 14.20, 'Bebês', 'Facilita o desembaraço dos fios.', '2025-01-30', '2027-01-30'),
(190, 'Sabonete Líquido Johnson’s Recém-Nascido', 17.99, 'Bebês', 'Hipoalergênico e sem fragrância.', '2025-03-04', '2027-03-04'),
(191, 'Sabonete em Barra Granado Bebê', 4.70, 'Bebês', 'Glicerinado e suave para a pele.', '2025-02-25', '2027-02-25'),
(192, 'Talco Johnson’s Baby', 10.50, 'Bebês', 'Mantém a pele seca e protegida.', '2025-02-17', '2027-02-17'),
(193, 'Óleo Johnson’s Baby Hidratante', 16.99, 'Bebês', 'Hidratação profunda e segura.', '2025-01-20', '2027-01-20'),
(194, 'Creme de Assaduras Hipoglós', 18.50, 'Bebês', 'Protege e trata assaduras.', '2025-03-12', '2027-03-12'),
(195, 'Creme de Assaduras Bepantol Baby', 27.90, 'Bebês', 'Previne irritações e vermelhidões.', '2025-02-06', '2027-02-06'),
(196, 'Colônia Johnson’s Baby Tradicional', 21.50, 'Bebês', 'Fragrância suave e delicada.', '2025-01-15', '2027-01-15'),
(197, 'Colônia Granado Bebê Lavanda', 22.90, 'Bebês', 'Aroma leve para uso diário.', '2025-03-02', '2027-03-02'),
(198, 'Cotonetes Johnson’s Baby', 8.50, 'Bebês', 'Ponta delicada para higiene segura.', '2025-02-28', '2027-02-28'),
(199, 'Pomada Desitin Roxa', 34.99, 'Bebês', 'Alívio rápido contra assaduras.', '2025-01-18', '2027-01-18'),
(200, 'Lenços Umedecidos Pom Pom', 12.40, 'Bebês', 'Textura macia e hidratante.', '2025-03-07', '2027-03-07'),
(201, 'Sabonete Líquido Huggies Extra Suave', 13.90, 'Bebês', 'Protege e hidrata a pele sensível.', '2025-02-14', '2027-02-14'),
(202, 'Shampoo Huggies Extra Suave', 12.99, 'Bebês', 'Fórmula antialérgica e suave.', '2025-01-23', '2027-01-23'),
(203, 'Toalha Umedecida Baby Dove', 15.30, 'Bebês', 'Hidratação e maciez superior.', '2025-01-29', '2027-01-29'),
(204, 'Sabonete Dove Baby', 5.99, 'Bebês', 'Hipoalergênico e dermatologicamente testado.', '2025-03-09', '2027-03-09'),
(205, 'Escova de Cabelo Infantil Chicco', 18.70, 'Bebês', 'Cerdas macias para couro cabeludo sensível.', '2025-03-03', '2027-03-03'),
(206, 'Pente Infantil Chicco', 12.80, 'Bebês', 'Dentes finos e seguros para bebês.', '2025-02-09', '2027-02-09'),
(207, 'Sabonete Líquido Granado Bebê', 15.90, 'Bebês', 'Fórmula delicada com glicerina vegetal.', '2025-01-18', '2027-01-18'),
(208, 'Lenço Umedecido Baby Dove Hidratação', 14.99, 'Bebês', 'Limpa sem irritar a pele.', '2025-03-10', '2027-03-10'),
(209, 'Creme Antiassaduras Baby Dove', 19.50, 'Bebês', 'Cria camada protetora na pele.', '2025-02-21', '2027-02-21'),
(210, 'Kit Higiene Bebê (tesoura + pente + escova)', 32.90, 'Bebês', 'Itens essenciais para cuidados diários.', '2025-01-27', '2027-01-27'),
(211, 'Atadura Crepe 10cm', 7.90, 'Primeiros Socorros', 'Ideal para imobilização e curativos.', '2025-01-12', '2027-01-12'),
(212, 'Atadura Crepe 5cm', 5.50, 'Primeiros Socorros', 'Suporte para curativos menores.', '2025-01-15', '2027-01-15'),
(213, 'Curativo Band-Aid Pequeno', 6.99, 'Primeiros Socorros', 'Proteção rápida para pequenos cortes.', '2025-02-01', '2027-02-01'),
(214, 'Curativo Band-Aid Grande', 8.50, 'Primeiros Socorros', 'Ideal para machucados maiores.', '2025-02-03', '2027-02-03'),
(215, 'Gaze Estéril 7,5cm', 9.90, 'Primeiros Socorros', 'Usado em curativos e ferimentos.', '2025-03-10', '2027-03-10'),
(216, 'Gaze Estéril 10cm', 12.70, 'Primeiros Socorros', 'Absorção e proteção em feridas.', '2025-03-14', '2027-03-14'),
(217, 'Esparadrapo 2,5cm', 5.20, 'Primeiros Socorros', 'Fixação de curativos.', '2025-02-28', '2027-02-28'),
(218, 'Esparadrapo 5cm', 8.30, 'Primeiros Socorros', 'Fixação reforçada.', '2025-03-04', '2027-03-04'),
(219, 'Álcool 70% 100ml', 4.90, 'Primeiros Socorros', 'Desinfecção de superfícies e objetos.', '2025-01-22', '2027-01-22'),
(220, 'Álcool 70% Spray', 7.40, 'Primeiros Socorros', 'Prático para pequenas limpezas.', '2025-02-05', '2027-02-05'),
(221, 'Soro Fisiológico 500ml', 8.90, 'Primeiros Socorros', 'Lavagem de ferimentos e narinas.', '2025-03-01', '2027-03-01'),
(222, 'Soro Fisiológico 100ml', 4.50, 'Primeiros Socorros', 'Higienização rápida.', '2025-02-14', '2027-02-14'),
(223, 'Algodão Hidrófilo 50g', 7.20, 'Primeiros Socorros', 'Limpeza e curativos.', '2025-01-18', '2027-01-18'),
(224, 'Algodão Bola', 6.50, 'Primeiros Socorros', 'Aplicação de medicamentos.', '2025-02-22', '2027-02-22'),
(225, 'Soro Ringer 500ml', 11.90, 'Primeiros Socorros', 'Reposição e limpeza médica.', '2025-03-16', '2027-03-16'),
(226, 'Água Oxigenada 10v', 5.99, 'Primeiros Socorros', 'Limpeza de ferimentos.', '2025-01-27', '2027-01-27'),
(227, 'Merthiolate Spray', 12.90, 'Primeiros Socorros', 'Antisséptico para cortes leves.', '2025-01-30', '2027-01-30'),
(228, 'Iodo 30ml', 9.40, 'Primeiros Socorros', 'Antisséptico para machucados.', '2025-03-02', '2027-03-02'),
(229, 'Clorexidina 100ml', 11.60, 'Primeiros Socorros', 'Antisséptico hospitalar.', '2025-02-11', '2027-02-11'),
(230, 'Luva Descartável (par)', 1.90, 'Primeiros Socorros', 'Proteção em atendimentos.', '2025-01-19', '2027-01-19'),
(231, 'Máscara Descartável Tripla', 0.99, 'Primeiros Socorros', 'Proteção respiratória básica.', '2025-02-09', '2027-02-09'),
(232, 'Kit Curativo Simples', 14.90, 'Primeiros Socorros', 'Inclui gaze, esparadrapo e álcool.', '2025-01-26', '2027-01-26'),
(233, 'Kit Primeiros Socorros Completo', 49.90, 'Primeiros Socorros', 'Itens essenciais para emergências.', '2025-02-15', '2027-02-15'),
(234, 'Faixa Elástica Ortopédica', 24.90, 'Primeiros Socorros', 'Suporte para lesões musculares.', '2025-03-06', '2027-03-06'),
(235, 'Sling de Imobilização', 39.90, 'Primeiros Socorros', 'Imobilização do braço.', '2025-01-10', '2027-01-10'),
(236, 'Bolsa Térmica Quente/Frio', 29.90, 'Primeiros Socorros', 'Alívio para dores e inflamações.', '2025-01-14', '2027-01-14'),
(237, 'Termômetro Digital', 22.50, 'Primeiros Socorros', 'Medição rápida de temperatura.', '2025-02-20', '2027-02-20'),
(238, 'Termômetro Infravermelho', 69.90, 'Primeiros Socorros', 'Medição sem contato.', '2025-03-03', '2027-03-03'),
(239, 'Tesoura Sem Ponta Hospitalar', 12.80, 'Primeiros Socorros', 'Corte seguro para curativos.', '2025-01-28', '2027-01-28'),
(240, 'Pinça Hospitalar Inox', 18.50, 'Primeiros Socorros', 'Manipulação de gaze e curativos.', '2025-02-12', '2027-02-12'),
(241, 'Vitamina C 500mg', 14.90, 'Vitaminas e Suplementos', 'Fortalece o sistema imunológico.', '2025-01-12', '2027-01-12'),
(242, 'Vitamina D3 2000UI', 24.90, 'Vitaminas e Suplementos', 'Suporte ósseo e imunidade.', '2025-02-01', '2027-02-01'),
(243, 'Ômega 3 1000mg', 32.90, 'Vitaminas e Suplementos', 'Saúde cardiovascular e cerebral.', '2025-01-20', '2027-01-20'),
(244, 'Colágeno Hidrolisado 120g', 39.50, 'Vitaminas e Suplementos', 'Fortalece pele, unhas e cabelos.', '2025-03-01', '2027-03-01'),
(245, 'Multivitamínico Centrum', 49.90, 'Vitaminas e Suplementos', 'Suplemento completo diário.', '2025-01-28', '2027-01-28'),
(246, 'Biotina 5mg', 18.99, 'Vitaminas e Suplementos', 'Melhora cabelo e unhas.', '2025-03-12', '2027-03-12'),
(247, 'Magnésio Dimalato', 29.90, 'Vitaminas e Suplementos', 'Suporte muscular e energético.', '2025-01-15', '2027-01-15'),
(248, 'Magnésio Cloreto', 22.50, 'Vitaminas e Suplementos', 'Melhora funções neuromusculares.', '2025-02-14', '2027-02-14'),
(249, 'Creatina 100g', 39.90, 'Vitaminas e Suplementos', 'Aumenta força e desempenho físico.', '2025-03-10', '2027-03-10'),
(250, 'Whey Protein 450g', 89.90, 'Vitaminas e Suplementos', 'Auxilia no ganho de massa muscular.', '2025-02-03', '2027-02-03'),
(251, 'Vitamina A 10.000UI', 12.90, 'Vitaminas e Suplementos', 'Auxilia visão e pele.', '2025-03-18', '2027-03-18'),
(252, 'Vitamina E 400UI', 26.90, 'Vitaminas e Suplementos', 'Ação antioxidante.', '2025-01-22', '2027-01-22'),
(253, 'Zinco Quelato 29mg', 21.90, 'Vitaminas e Suplementos', 'Reforça imunidade.', '2025-02-09', '2027-02-09'),
(254, 'Selênio 50mcg', 16.40, 'Vitaminas e Suplementos', 'Antioxidante potente.', '2025-03-03', '2027-03-03'),
(255, 'Cálcio + Vitamina D', 28.90, 'Vitaminas e Suplementos', 'Fortalecimento ósseo.', '2025-02-11', '2027-02-11'),
(256, 'Vitamina B12 2000mcg', 19.90, 'Vitaminas e Suplementos', 'Energia e saúde neurológica.', '2025-01-10', '2027-01-10'),
(257, 'Vitamina B6 50mg', 17.99, 'Vitaminas e Suplementos', 'Metabolismo energético.', '2025-02-25', '2027-02-25'),
(258, 'Vitamina B Complexo', 14.99, 'Vitaminas e Suplementos', 'Energia e metabolismo.', '2025-03-05', '2027-03-05'),
(259, 'Coenzima Q10 100mg', 59.90, 'Vitaminas e Suplementos', 'Saúde cardíaca e energia.', '2025-01-30', '2027-01-30'),
(260, 'Vitamina K2 MK-7', 42.90, 'Vitaminas e Suplementos', 'Suporte ósseo e vascular.', '2025-02-12', '2027-02-12'),
(261, 'Probiótico 10 bilhões', 49.90, 'Vitaminas e Suplementos', 'Regulação intestinal.', '2025-03-14', '2027-03-14'),
(262, 'Pré-treino 150g', 44.90, 'Vitaminas e Suplementos', 'Energia e foco para treinos.', '2025-02-08', '2027-02-08'),
(263, 'Glutamina 150g', 36.90, 'Vitaminas e Suplementos', 'Saúde intestinal e imunidade.', '2025-01-18', '2027-01-18'),
(264, 'Isotônico em Pó', 12.50, 'Vitaminas e Suplementos', 'Reposição de sais minerais.', '2025-03-07', '2027-03-07'),
(265, 'Vitamina C Efervescente', 11.90, 'Vitaminas e Suplementos', 'Reforço rápido da imunidade.', '2025-02-21', '2027-02-21'),
(266, 'Ômega 3 Infantil', 27.90, 'Vitaminas e Suplementos', 'Desenvolvimento cognitivo.', '2025-01-17', '2027-01-17'),
(267, 'Ginkgo Biloba 80mg', 20.90, 'Vitaminas e Suplementos', 'Melhora circulação e memória.', '2025-02-02', '2027-02-02'),
(268, 'Cafeína 210mg', 14.90, 'Vitaminas e Suplementos', 'Energia e foco.', '2025-03-04', '2027-03-04'),
(269, 'Cromo Picolinato', 16.70, 'Vitaminas e Suplementos', 'Controle da glicemia.', '2025-02-27', '2027-02-27'),
(270, 'Spirulina 500mg', 22.90, 'Vitaminas e Suplementos', 'Fonte natural de nutrientes.', '2025-01-26', '2027-01-26'),
(271, 'Vitamina C 500mg', 14.90, 'Vitaminas e Minerais', 'Fortalece o sistema imunológico.', '2025-01-12', '2027-01-12'),
(272, 'Vitamina D3 2000UI', 24.90, 'Vitaminas e Minerais', 'Suporte ósseo e imunidade.', '2025-02-01', '2027-02-01'),
(273, 'Vitamina B12 2000mcg', 19.90, 'Vitaminas e Minerais', 'Energia e saúde neurológica.', '2025-01-10', '2027-01-10'),
(274, 'Vitamina B6 50mg', 17.99, 'Vitaminas e Minerais', 'Metabolismo energético.', '2025-02-25', '2027-02-25'),
(275, 'Vitamina A 10.000UI', 12.90, 'Vitaminas e Minerais', 'Auxilia visão e pele.', '2025-03-18', '2027-03-18'),
(276, 'Vitamina E 400UI', 26.90, 'Vitaminas e Minerais', 'Ação antioxidante.', '2025-01-22', '2027-01-22'),
(277, 'Vitamina K2 MK-7', 42.90, 'Vitaminas e Minerais', 'Suporte ósseo e vascular.', '2025-02-12', '2027-02-12'),
(278, 'Complexo B', 14.99, 'Vitaminas e Minerais', 'Energia e metabolismo.', '2025-03-05', '2027-03-05'),
(279, 'Multivitamínico Centrum', 49.90, 'Vitaminas e Minerais', 'Suplemento vitamínico completo.', '2025-01-28', '2027-01-28'),
(280, 'Vitamina C Efervescente', 11.90, 'Vitaminas e Minerais', 'Reforço rápido da imunidade.', '2025-02-21', '2027-02-21'),
(281, 'Vitamina D 1000UI', 16.90, 'Vitaminas e Minerais', 'Fortalecimento ósseo.', '2025-02-10', '2027-02-10'),
(282, 'Vitamina B2 100mg', 13.90, 'Vitaminas e Minerais', 'Ação antioxidante.', '2025-01-29', '2027-01-29'),
(283, 'Vitamina B3 500mg', 15.70, 'Vitaminas e Minerais', 'Saúde da pele e metabolismo.', '2025-03-04', '2027-03-04'),
(284, 'Vitamina B5 500mg', 16.40, 'Vitaminas e Minerais', 'Melhora saúde da pele e cabelos.', '2025-02-07', '2027-02-07'),
(285, 'Vitamina B7 (Biotina) 5mg', 18.99, 'Vitaminas e Minerais', 'Melhora cabelo e unhas.', '2025-03-12', '2027-03-12'),
(286, 'Vitamina H 5000mcg', 22.90, 'Vitaminas e Minerais', 'Fortalecimento capilar.', '2025-01-30', '2027-01-30'),
(287, 'Cálcio 500mg', 20.90, 'Vitaminas e Minerais', 'Saúde óssea.', '2025-02-02', '2027-02-02'),
(288, 'Cálcio + Vitamina D3', 28.90, 'Vitaminas e Minerais', 'Fortalecimento ósseo.', '2025-02-11', '2027-02-11'),
(289, 'Magnésio Dimalato', 29.90, 'Vitaminas e Minerais', 'Suporte muscular e energético.', '2025-01-15', '2027-01-15'),
(290, 'Magnésio Cloreto', 22.50, 'Vitaminas e Minerais', 'Funções neuromusculares.', '2025-02-14', '2027-02-14'),
(291, 'Zinco Quelato 29mg', 21.90, 'Vitaminas e Minerais', 'Reforça imunidade.', '2025-02-09', '2027-02-09'),
(292, 'Selênio 50mcg', 16.40, 'Vitaminas e Minerais', 'Antioxidante potente.', '2025-03-03', '2027-03-03'),
(293, 'Cromo Picolinato', 16.70, 'Vitaminas e Minerais', 'Controle da glicemia.', '2025-02-27', '2027-02-27'),
(294, 'Ferro Quelato 30mg', 19.90, 'Vitaminas e Minerais', 'Combate anemia.', '2025-01-21', '2027-01-21'),
(295, 'Iodo 150mcg', 13.50, 'Vitaminas e Minerais', 'Suporte tireoidiano.', '2025-03-09', '2027-03-09'),
(296, 'Potássio 99mg', 17.40, 'Vitaminas e Minerais', 'Função muscular e cardíaca.', '2025-02-17', '2027-02-17'),
(297, 'Cobre Quelato', 14.30, 'Vitaminas e Minerais', 'Saúde óssea e celular.', '2025-03-02', '2027-03-02'),
(298, 'Manganês Quelato', 15.90, 'Vitaminas e Minerais', 'Metabolismo de carboidratos.', '2025-02-13', '2027-02-13'),
(299, 'Fósforo 500mg', 18.60, 'Vitaminas e Minerais', 'Energia e saúde óssea.', '2025-01-27', '2027-01-27'),
(300, 'Ômega 3 Infantil', 27.90, 'Vitaminas e Minerais', 'Desenvolvimento cognitivo.', '2025-01-17', '2027-01-17'),
(301, 'Preservativo Jontex Lubrificado', 14.90, 'Saúde Sexual', 'Camisinha masculina lubrificada.', '2025-01-12', '2027-01-12'),
(302, 'Preservativo Olla Sensitive', 12.50, 'Saúde Sexual', 'Mais sensibilidade e conforto.', '2025-02-01', '2027-02-01'),
(303, 'Preservativo Prudence Morango', 10.90, 'Saúde Sexual', 'Camisinha com sabor de morango.', '2025-01-20', '2027-01-20'),
(304, 'Preservativo Prudence Extra Grande', 16.00, 'Saúde Sexual', 'Tamanho especial para conforto.', '2025-03-02', '2027-03-02'),
(305, 'Preservativo Jontex Texturizado', 15.50, 'Saúde Sexual', 'Texturas para mais estímulo.', '2025-03-10', '2027-03-10'),
(306, 'Preservativo Olla Ultra Fino', 18.90, 'Saúde Sexual', 'Maior sensibilidade ao toque.', '2025-02-22', '2027-02-22'),
(319, 'Suplemento Libido Feminina', 39.90, 'Saúde Sexual', 'Aumenta disposição sexual.', '2025-01-13', '2027-01-13'),
(320, 'Suplemento Libido Masculina', 42.50, 'Saúde Sexual', 'Auxilia na performance.', '2025-02-27', '2027-02-27'),
(321, 'Analgésico Pós-Atividade Íntima', 14.60, 'Saúde Sexual', 'Alívio de desconforto.', '2025-01-09', '2027-01-09'),
(328, 'Preservativo Skyn Sem Látex', 22.90, 'Saúde Sexual', 'Ideal para alérgicos.', '2025-02-17', '2027-02-17'),
(329, 'Preservativo Prudence Cores', 11.20, 'Saúde Sexual', 'Camisinhas coloridas.', '2025-01-25', '2027-01-25'),
(331, 'Colônia Floral Rosa', 129.90, 'Perfumes', 'Fragrância suave de rosas para o dia a dia.', '2025-01-10', '2028-01-10'),
(332, 'Perfume Amadeirado Masculino', 149.90, 'Perfumes', 'Notas de madeira e especiarias, masculino intenso.', '2025-02-05', '2027-02-05'),
(333, 'Body Splash Baunilha', 99.90, 'Perfumes', 'Perfume corporal doce e confortável.', '2025-03-12', '2027-03-12'),
(334, 'Colônia Cítrica Limão', 119.90, 'Perfumes', 'Aroma refrescante e vibrante de limão.', '2025-01-20', '2027-01-20'),
(335, 'Perfume Feminino Oriental', 159.90, 'Perfumes', 'Mistura envolvente de âmbar e especiarias.', '2025-02-15', '2027-02-15'),
(336, 'Eau de Toilette Masculino Sport', 139.90, 'Perfumes', 'Fragrância esportiva e energética.', '2025-01-30', '2027-01-30'),
(337, 'Colônia Infantil Suave', 89.90, 'Perfumes', 'Perfume leve e seguro para crianças.', '2025-01-17', '2027-01-17'),
(338, 'Perfume Gourmet Doce', 119.90, 'Perfumes', 'Notas de caramelo e baunilha.', '2025-03-05', '2027-03-05'),
(339, 'Perfume Floral Doce', 129.90, 'Perfumes', 'Mistura de flores e frutas doces.', '2025-02-22', '2027-02-22'),
(340, 'Colônia Lavanda Relax', 109.90, 'Perfumes', 'Aroma calmante de lavanda.', '2025-01-25', '2027-01-25'),
(341, 'Perfume Ambarado Noturno', 149.90, 'Perfumes', 'Fragrância quente para a noite.', '2025-03-02', '2027-03-02'),
(342, 'Body Mist Morango', 99.00, 'Perfumes', 'Brilho frutado para aplicar no corpo.', '2025-02-12', '2027-02-12'),
(343, 'Eau de Parfum Jasmim', 159.90, 'Perfumes', 'Elegância floral de jasmim puro.', '2025-01-13', '2027-01-13'),
(344, 'Eau de Parfum Premium Masculino', 179.90, 'Perfumes', 'Fragrância sofisticada para ocasiões especiais.', '2025-02-28', '2027-02-28'),
(345, 'Perfume Oceânico Masculino', 139.90, 'Perfumes', 'Notas marinhas e frescas para o dia.', '2025-01-19', '2027-01-19'),
(346, 'Colônia Musk Suave', 124.90, 'Perfumes', 'Aroma almíscarado leve para todo dia.', '2025-03-08', '2027-03-08'),
(347, 'Eau de Cologne Clássica', 129.90, 'Perfumes', 'Fragrância tradicional e atemporal.', '2025-02-09', '2027-02-09'),
(348, 'Perfume Frutas Vermelhas', 134.90, 'Perfumes', 'Mistura doce de frutas vermelhas.', '2025-01-23', '2027-01-23'),
(349, 'Perfume Noite Intensa | R$x 149.90 | Aroma profundo e marcante para a noite. | P', 119.90, 'Perfumes', 'Sensação fresca de limão e tangerina.', '2025-01-21', '2027-01-21'),
(350, 'Perfume Floral Vibrante', 149.90, 'Perfumes', 'Flores exuberantes para quem ama perfume intenso.', '2025-03-09', '2027-03-09'),
(351, 'Body Splash Coco', 99.90, 'Perfumes', 'Fragrância tropical de coco.', '2025-02-03', '2027-02-03'),
(352, 'Perfume Amadeirado Suave', 139.90, 'Perfumes', 'Madeiras suaves para um aroma sofisticado.', '2025-01-27', '2027-01-27'),
(353, 'Perfume Floral Noturno', 159.90, 'Perfumes', 'Mistura sofisticada de flores à noite.', '2025-03-11', '2027-03-11'),
(354, 'Perfume de Rosas Clássico', 129.90, 'Perfumes', 'Rosa tradicional, elegante e romântica.', '2025-02-19', '2027-02-19'),
(355, 'Eau de Parfum Gourmand', 169.90, 'Perfumes', 'Notas doces como baunilha e chocolate.', '2025-01-31', '2027-01-31'),
(356, 'Perfume Floral Citrus', 134.90, 'Perfumes', 'Mistura de flores e frutas cítricas.', '2025-02-06', '2027-02-06'),
(357, 'Colônia Musk Intenso', 144.90, 'Perfumes', 'Almíscar forte e marcante.', '2025-03-04', '2027-03-04'),
(358, 'Perfume Especiado Masculino', 149.90, 'Perfumes', 'Notas de especiarias e madeiras.', '2025-01-11', '2027-01-11'),
(359, 'Colônia Powder Floral', 119.90, 'Perfumes', 'Aroma suave de talco floral.', '2025-03-07', '2027-03-07'),
(360, 'teste', 0.00, 'teste', 'teste de vencimento', '2025-11-01', '2025-11-24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `ID_USUARIO` int NOT NULL AUTO_INCREMENT,
  `NOME_USUARIO` varchar(80) NOT NULL,
  `EMAIL_USUARIO` varchar(80) NOT NULL,
  `SENHA_USUARIO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CRIADO_USUARIO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CPF_USUARIO` char(14) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `EMAIL_USUARIO` (`EMAIL_USUARIO`),
  UNIQUE KEY `CPF_USUARIO` (`CPF_USUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`ID_USUARIO`, `NOME_USUARIO`, `EMAIL_USUARIO`, `SENHA_USUARIO`, `CRIADO_USUARIO`, `CPF_USUARIO`) VALUES
(1, 'Kleber', 'klebersonduartesantos39@gmail.com', '$2y$10$mbS/.jtnWQM8x4LnjC9XKuiK3uZWN39JYs90PfUH/YcNiXV.XNPuy', '2025-11-20 18:40:48', '846.068.046-04'),
(2, 'Adm', 'admpatriotafoda@gmail.com', '$2y$10$XEzb3mOfbBl87V8OPQEbQOcqlGgQ/.7DQuo3Y0ghdK1twXDv.ov.S', '2025-11-20 23:09:06', '044.148.495-45'),
(3, 'Igor', 'igor@gmail.com', '$2y$10$H1LQn.DvXm/1bSw/ggeShuBasELJ4CCTTr/UovRst6.LWvR19CERC', '2025-11-20 23:15:30', '508.498.440-40');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
