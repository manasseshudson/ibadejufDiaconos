-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 12/06/2025 às 22:37
-- Versão do servidor: 8.0.36
-- Versão do PHP: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `igrej3682_ibadejuf`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acessos`
--

CREATE TABLE `tb_acessos` (
  `id_acessos` int NOT NULL,
  `Usuario` varchar(999) DEFAULT NULL,
  `Senha` varchar(999) DEFAULT NULL,
  `Sistema` varchar(999) DEFAULT NULL,
  `Data` varchar(999) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Hora` varchar(999) DEFAULT NULL,
  `Nome` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Estrutura para tabela `tb_aluno`
--

CREATE TABLE `tb_aluno` (
  `id_aluno` int NOT NULL,
  `nome` varchar(999) DEFAULT NULL,
  `email` varchar(999) DEFAULT NULL,
  `cpf` varchar(500) DEFAULT NULL,
  `rg` varchar(60) DEFAULT NULL,
  `data_nascimento` varchar(60) DEFAULT NULL,
  `nome_pai` varchar(999) DEFAULT NULL,
  `nome_mae` varchar(999) DEFAULT NULL,
  `natural` varchar(999) DEFAULT NULL,
  `escolaridade` varchar(250) DEFAULT NULL,
  `profissao` varchar(250) DEFAULT NULL,
  `denominacao` varchar(700) DEFAULT NULL,
  `batismo_aguas` varchar(100) DEFAULT NULL,
  `endereco_cep` varchar(999) DEFAULT NULL,
  `endereco_rua` varchar(999) DEFAULT NULL,
  `endereco_numero` varchar(45) DEFAULT NULL,
  `endereco_complemento` varchar(250) DEFAULT NULL,
  `endereco_bairro` varchar(250) DEFAULT NULL,
  `endereco_cidade` varchar(250) DEFAULT NULL,
  `endereco_uf` varchar(250) DEFAULT NULL,
  `endereco_telefone` varchar(150) DEFAULT NULL,
  `endereco_celular` varchar(150) DEFAULT NULL,
  `observacao` varchar(999) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `id_modulo` int DEFAULT NULL,
  `id_aluno_hash` varchar(300) DEFAULT NULL,
  `id_modalidade` int DEFAULT NULL,
  `cpf_hash` varchar(100) DEFAULT NULL,
  `id_nucleo` int DEFAULT NULL,
  `data_nascimento_banco` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_aluno`
--

INSERT INTO `tb_aluno` (`id_aluno`, `nome`, `email`, `cpf`, `rg`, `data_nascimento`, `nome_pai`, `nome_mae`, `natural`, `escolaridade`, `profissao`, `denominacao`, `batismo_aguas`, `endereco_cep`, `endereco_rua`, `endereco_numero`, `endereco_complemento`, `endereco_bairro`, `endereco_cidade`, `endereco_uf`, `endereco_telefone`, `endereco_celular`, `observacao`, `status`, `id_modulo`, `id_aluno_hash`, `id_modalidade`, `cpf_hash`, `id_nucleo`, `data_nascimento_banco`) VALUES
(1, 'Administrador', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_aulas`
--

CREATE TABLE `tb_aulas` (
  `id_aulas` int NOT NULL,
  `descricao` varchar(9999) DEFAULT NULL,
  `link` varchar(9999) DEFAULT NULL,
  `id_modulo` int DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `ordem` int DEFAULT '0',
  `exibir` int DEFAULT '1',
  `eventos` int DEFAULT '1',
  `id_materia` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Estrutura para tabela `tb_contas`
--

CREATE TABLE `tb_contas` (
  `id_contas` int NOT NULL,
  `descricao` varchar(999) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contas_pagar`
--

CREATE TABLE `tb_contas_pagar` (
  `id_contas_pagar` int NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `documento` varchar(150) DEFAULT NULL,
  `id_fornecedor` int NOT NULL,
  `id_conta` int NOT NULL,
  `data_documento` datetime DEFAULT NULL,
  `data_vencimento` datetime DEFAULT NULL,
  `data_pagamento` datetime DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `valor_multa` decimal(12,2) DEFAULT NULL,
  `valor_juros` decimal(12,2) DEFAULT NULL,
  `valor_total` decimal(12,2) DEFAULT NULL,
  `observacao` varchar(999) DEFAULT NULL,
  `uid_usuario` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contas_receber`
--

CREATE TABLE `tb_contas_receber` (
  `id_contas_receber` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_fornecedor`
--

CREATE TABLE `tb_fornecedor` (
  `id_fornecedor` int NOT NULL,
  `nome` varchar(999) DEFAULT NULL,
  `email` varchar(999) DEFAULT NULL,
  `cpf` varchar(500) DEFAULT NULL,
  `endereco_cep` varchar(999) DEFAULT NULL,
  `endereco_rua` varchar(999) DEFAULT NULL,
  `endereco_numero` varchar(45) DEFAULT NULL,
  `endereco_complemento` varchar(250) DEFAULT NULL,
  `endereco_bairro` varchar(250) DEFAULT NULL,
  `endereco_cidade` varchar(250) DEFAULT NULL,
  `endereco_uf` varchar(250) DEFAULT NULL,
  `endereco_telefone` varchar(150) DEFAULT NULL,
  `endereco_celular` varchar(150) DEFAULT NULL,
  `observacao` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_fornecedor`
--

INSERT INTO `tb_fornecedor` (`id_fornecedor`, `nome`, `email`, `cpf`, `endereco_cep`, `endereco_rua`, `endereco_numero`, `endereco_complemento`, `endereco_bairro`, `endereco_cidade`, `endereco_uf`, `endereco_telefone`, `endereco_celular`, `observacao`) VALUES
(1, 'PADRAO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'GRAFICA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'CESAMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'NADIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Nadia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_log_acessos`
--

CREATE TABLE `tb_log_acessos` (
  `id_log_acessos` int NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `id_aluno` int DEFAULT NULL,
  `hora` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_log_acessos`
-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_materia`
--

CREATE TABLE `tb_materia` (
  `id_materia` int NOT NULL,
  `descricao` varchar(999) DEFAULT NULL,
  `id_modulo` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_materia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_modalidade`
--

CREATE TABLE `tb_modalidade` (
  `id_modalidade` int NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_modalidade`
--

INSERT INTO `tb_modalidade` (`id_modalidade`, `descricao`) VALUES
(1, 'Bolsa 100%');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_modulo`
--

CREATE TABLE `tb_modulo` (
  `id_modulo` int NOT NULL,
  `descricao` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_modulo`
--

INSERT INTO `tb_modulo` (`id_modulo`, `descricao`) VALUES
(1, '1º Basico');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_nivel`
--

CREATE TABLE `tb_nivel` (
  `id_nivel` int NOT NULL,
  `descricao` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_nivel`
--

INSERT INTO `tb_nivel` (`id_nivel`, `descricao`) VALUES
(1, 'Master'),
(2, 'Administrador'),
(3, 'Aluno'),
(4, 'Diaconos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_nota_aluno`
--

CREATE TABLE `tb_nota_aluno` (
  `id_nota_aluno` int NOT NULL,
  `id_aluno` int NOT NULL,
  `nota` decimal(10,2) DEFAULT NULL,
  `observacao` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_nucleo`
--

CREATE TABLE `tb_nucleo` (
  `id_nucleo` int NOT NULL,
  `descricao` varchar(999) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_nucleo`
--

INSERT INTO `tb_nucleo` (`id_nucleo`, `descricao`) VALUES
(1, 'Sede');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_plano_contas`
--

CREATE TABLE `tb_plano_contas` (
  `id_plano_contas` int NOT NULL,
  `descricao` varchar(999) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_plano_contas`
--

INSERT INTO `tb_plano_contas` (`id_plano_contas`, `descricao`) VALUES
(1, 'Despesas Internas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_presenca`
--

CREATE TABLE `tb_presenca` (
  `id_presenca` int NOT NULL,
  `id_aulas` int DEFAULT NULL,
  `id_aluno` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_presenca_aula_aluno`
--

CREATE TABLE `tb_presenca_aula_aluno` (
  `id_presenca_aula_aluno` int NOT NULL,
  `id_aluno` int DEFAULT NULL,
  `id_aula` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_presenca_aula_aluno`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_provas`
--

CREATE TABLE `tb_provas` (
  `id_provas` int NOT NULL,
  `descricao` varchar(999) DEFAULT NULL,
  `link` varchar(9999) DEFAULT NULL,
  `id_materia` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipo_pagamento`
--

CREATE TABLE `tb_tipo_pagamento` (
  `id_tipo_pagamento` int NOT NULL,
  `descricao` varchar(999) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_tipo_pagamento`
--

INSERT INTO `tb_tipo_pagamento` (`id_tipo_pagamento`, `descricao`) VALUES
(1, 'Pix'),
(2, 'Dinheiro'),
(3, 'Boleto'),
(4, 'Cartao de Credito'),
(5, 'Cartao de Debito'),
(6, 'Cheque');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `id_nivel` int DEFAULT '0',
  `id_aluno` int DEFAULT NULL,
  `uid_usuario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `usuario`, `senha`, `descricao`, `email`, `id_nivel`, `id_aluno`, `uid_usuario`) VALUES
(1, 'OTk5Ljk5OS45OTktOTk=', 'MTIz', 'Administrador', 'manasseshudson@gmail.com', 1, 1, 'ZSEqDDLL_f');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwdadosaluno`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwdadosaluno` (
`celular` varchar(150)
,`id_aluno` int
,`modulo` varchar(600)
,`nome` varchar(999)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_contas_pagar`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_contas_pagar` (
`contas` varchar(999)
,`data_documento` varchar(10)
,`data_pagamento` varchar(10)
,`data_vencimento` varchar(10)
,`descricao` varchar(100)
,`documento` varchar(150)
,`fornecedor` varchar(999)
,`id_contas_pagar` int
,`status` varchar(100)
,`valor` decimal(12,2)
,`valor_juros` decimal(12,2)
,`valor_multa` decimal(12,2)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_logs_acessos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_logs_acessos` (
`data` varchar(50)
,`hora` varchar(100)
,`nome` varchar(999)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_materias_modulos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_materias_modulos` (
`id_materia` int
,`id_modulo` int
,`materia` varchar(999)
,`modulo` varchar(600)
,`qtde` bigint
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_presenca`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_presenca` (
`aluno` varchar(999)
,`aula` varchar(9999)
,`id_aluno` int
,`id_aulas` int
,`id_materia` int
,`id_modulo` int
,`materia` varchar(999)
,`modulo` varchar(600)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_presenca_aulas_aluno`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_presenca_aulas_aluno` (
`descricao` varchar(9999)
,`id_aluno` int
,`id_aula` int
,`modulo` varchar(600)
,`nome` varchar(999)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_principal_user`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_principal_user` (
`aula` varchar(9999)
,`eventos` int
,`exibir` int
,`id_aula` int
,`id_aulas` int
,`id_modulo` int
,`img` varchar(500)
,`link` varchar(9999)
,`modulo` varchar(600)
,`presenca` int
);

-- --------------------------------------------------------

--
-- Estrutura para view `vwdadosaluno`
--
DROP TABLE IF EXISTS `vwdadosaluno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`igrej3682_ibadejuf`@`%` SQL SECURITY DEFINER VIEW `vwdadosaluno`  AS SELECT `ta`.`id_aluno` AS `id_aluno`, `ta`.`nome` AS `nome`, `ta`.`endereco_celular` AS `celular`, `tm`.`descricao` AS `modulo` FROM (`tb_aluno` `ta` join `tb_modulo` `tm` on((`tm`.`id_modulo` = `ta`.`id_modulo`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_contas_pagar`
--
DROP TABLE IF EXISTS `vw_contas_pagar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`igrej3682_ibadejuf`@`%` SQL SECURITY DEFINER VIEW `vw_contas_pagar`  AS SELECT `tb_contas_pagar`.`id_contas_pagar` AS `id_contas_pagar`, `tb_contas_pagar`.`descricao` AS `descricao`, `tb_contas_pagar`.`documento` AS `documento`, `tb_fornecedor`.`nome` AS `fornecedor`, `tb_contas`.`descricao` AS `contas`, date_format(`tb_contas_pagar`.`data_documento`,'%d/%m/%Y') AS `data_documento`, date_format(`tb_contas_pagar`.`data_vencimento`,'%d/%m/%Y') AS `data_vencimento`, (case when (`tb_contas_pagar`.`data_pagamento` = '19020101') then '' else date_format(`tb_contas_pagar`.`data_pagamento`,'%d/%m/%Y') end) AS `data_pagamento`, `tb_contas_pagar`.`valor` AS `valor`, `tb_contas_pagar`.`valor_multa` AS `valor_multa`, `tb_contas_pagar`.`valor_juros` AS `valor_juros`, `tb_contas_pagar`.`status` AS `status` FROM ((`tb_contas_pagar` join `tb_fornecedor` on((`tb_fornecedor`.`id_fornecedor` = `tb_contas_pagar`.`id_fornecedor`))) join `tb_contas` on((`tb_contas`.`id_contas` = `tb_contas_pagar`.`id_conta`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_logs_acessos`
--
DROP TABLE IF EXISTS `vw_logs_acessos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`igrej3682_ibadejuf`@`%` SQL SECURITY DEFINER VIEW `vw_logs_acessos`  AS SELECT `ta`.`nome` AS `nome`, `tla`.`data` AS `data`, `tla`.`hora` AS `hora` FROM (`tb_log_acessos` `tla` join `tb_aluno` `ta` on((`ta`.`id_aluno` = `tla`.`id_aluno`))) ORDER BY `tla`.`data` DESC LIMIT 0, 5 ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_materias_modulos`
--
DROP TABLE IF EXISTS `vw_materias_modulos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`igrej3682_ibadejuf`@`%` SQL SECURITY DEFINER VIEW `vw_materias_modulos`  AS SELECT count(`ta`.`id_aulas`) AS `qtde`, `tm`.`id_materia` AS `id_materia`, `tm`.`descricao` AS `materia`, `tm2`.`id_modulo` AS `id_modulo`, `tm2`.`descricao` AS `modulo` FROM ((`tb_aulas` `ta` left join `tb_materia` `tm` on((`tm`.`id_materia` = `ta`.`id_materia`))) left join `tb_modulo` `tm2` on((`tm2`.`id_modulo` = `tm`.`id_modulo`))) WHERE (`tm`.`id_materia` is not null) GROUP BY `tm`.`id_materia`, `tm`.`descricao`, `tm2`.`id_modulo`, `tm2`.`descricao` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_presenca`
--
DROP TABLE IF EXISTS `vw_presenca`;

CREATE ALGORITHM=UNDEFINED DEFINER=`igrej3682_ibadejuf`@`%` SQL SECURITY DEFINER VIEW `vw_presenca`  AS SELECT `ta2`.`id_aulas` AS `id_aulas`, `ta2`.`descricao` AS `aula`, `ta`.`id_aluno` AS `id_aluno`, `ta`.`nome` AS `aluno`, `tb_modulo`.`id_modulo` AS `id_modulo`, `tb_modulo`.`descricao` AS `modulo`, `tm`.`id_materia` AS `id_materia`, `tm`.`descricao` AS `materia` FROM ((((`tb_presenca_aula_aluno` `tpaa` join `tb_aluno` `ta` on((`ta`.`id_aluno` = `tpaa`.`id_aluno`))) join `tb_aulas` `ta2` on((`ta2`.`id_aulas` = `tpaa`.`id_aula`))) join `tb_modulo` on((`tb_modulo`.`id_modulo` = `ta2`.`id_modulo`))) join `tb_materia` `tm` on((`tm`.`id_materia` = `ta2`.`id_materia`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_presenca_aulas_aluno`
--
DROP TABLE IF EXISTS `vw_presenca_aulas_aluno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`igrej3682_ibadejuf`@`%` SQL SECURITY DEFINER VIEW `vw_presenca_aulas_aluno`  AS SELECT `tpaa`.`id_aluno` AS `id_aluno`, `ta2`.`nome` AS `nome`, `tpaa`.`id_aula` AS `id_aula`, `ta`.`descricao` AS `descricao`, `tm`.`descricao` AS `modulo` FROM (((`tb_presenca_aula_aluno` `tpaa` join `tb_aulas` `ta` on((`ta`.`id_aulas` = `tpaa`.`id_aula`))) join `tb_aluno` `ta2` on((`ta2`.`id_aluno` = `tpaa`.`id_aluno`))) join `tb_modulo` `tm` on((`tm`.`id_modulo` = `ta`.`id_modulo`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_principal_user`
--
DROP TABLE IF EXISTS `vw_principal_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`igrej3682_ibadejuf`@`%` SQL SECURITY DEFINER VIEW `vw_principal_user`  AS SELECT `tb_aulas`.`id_aulas` AS `id_aulas`, `tb_aulas`.`descricao` AS `aula`, `tb_aulas`.`link` AS `link`, `tb_aulas`.`img` AS `img`, `tb_modulo`.`id_modulo` AS `id_modulo`, `tb_modulo`.`descricao` AS `modulo`, `tb_presenca_aula_aluno`.`id_aula` AS `id_aula`, (case when (`tb_presenca_aula_aluno`.`id_aluno` is not null) then 1 else 0 end) AS `presenca`, `tb_aulas`.`exibir` AS `exibir`, `tb_aulas`.`eventos` AS `eventos` FROM (((`tb_aulas` join `tb_modulo` on((`tb_modulo`.`id_modulo` = `tb_aulas`.`id_modulo`))) left join `tb_presenca` on((`tb_presenca`.`id_aulas` = `tb_aulas`.`id_aulas`))) left join `tb_presenca_aula_aluno` on((`tb_presenca_aula_aluno`.`id_aula` = `tb_aulas`.`id_aulas`))) GROUP BY `tb_aulas`.`id_aulas`, `tb_aulas`.`descricao`, `tb_aulas`.`link`, `tb_aulas`.`img`, `tb_modulo`.`id_modulo`, `tb_modulo`.`descricao`, `tb_presenca_aula_aluno`.`id_aula`, `tb_aulas`.`exibir`, `tb_aulas`.`eventos` ORDER BY `tb_aulas`.`id_aulas` ASC ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_acessos`
--
ALTER TABLE `tb_acessos`
  ADD PRIMARY KEY (`id_acessos`);

--
-- Índices de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  ADD PRIMARY KEY (`id_aluno`);

--
-- Índices de tabela `tb_aulas`
--
ALTER TABLE `tb_aulas`
  ADD PRIMARY KEY (`id_aulas`);

--
-- Índices de tabela `tb_aulas_diaconos`
--
ALTER TABLE `tb_aulas_diaconos`
  ADD PRIMARY KEY (`id_aulas_diaconos`);

--
-- Índices de tabela `tb_aulas_novas`
--
ALTER TABLE `tb_aulas_novas`
  ADD PRIMARY KEY (`id_aulas`);

--
-- Índices de tabela `tb_contas`
--
ALTER TABLE `tb_contas`
  ADD PRIMARY KEY (`id_contas`);

--
-- Índices de tabela `tb_contas_pagar`
--
ALTER TABLE `tb_contas_pagar`
  ADD PRIMARY KEY (`id_contas_pagar`);

--
-- Índices de tabela `tb_contas_receber`
--
ALTER TABLE `tb_contas_receber`
  ADD PRIMARY KEY (`id_contas_receber`);

--
-- Índices de tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `tb_log_acessos`
--
ALTER TABLE `tb_log_acessos`
  ADD PRIMARY KEY (`id_log_acessos`);

--
-- Índices de tabela `tb_materia`
--
ALTER TABLE `tb_materia`
  ADD PRIMARY KEY (`id_materia`);

--
-- Índices de tabela `tb_materia_diaconos`
--
ALTER TABLE `tb_materia_diaconos`
  ADD PRIMARY KEY (`id_materia_diaconos`);

--
-- Índices de tabela `tb_modalidade`
--
ALTER TABLE `tb_modalidade`
  ADD PRIMARY KEY (`id_modalidade`);

--
-- Índices de tabela `tb_modulo`
--
ALTER TABLE `tb_modulo`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Índices de tabela `tb_nivel`
--
ALTER TABLE `tb_nivel`
  ADD PRIMARY KEY (`id_nivel`);

--
-- Índices de tabela `tb_nota_aluno`
--
ALTER TABLE `tb_nota_aluno`
  ADD PRIMARY KEY (`id_nota_aluno`);

--
-- Índices de tabela `tb_nucleo`
--
ALTER TABLE `tb_nucleo`
  ADD PRIMARY KEY (`id_nucleo`);

--
-- Índices de tabela `tb_plano_contas`
--
ALTER TABLE `tb_plano_contas`
  ADD PRIMARY KEY (`id_plano_contas`);

--
-- Índices de tabela `tb_presenca`
--
ALTER TABLE `tb_presenca`
  ADD PRIMARY KEY (`id_presenca`);

--
-- Índices de tabela `tb_presenca_aula_aluno`
--
ALTER TABLE `tb_presenca_aula_aluno`
  ADD PRIMARY KEY (`id_presenca_aula_aluno`);

--
-- Índices de tabela `tb_provas`
--
ALTER TABLE `tb_provas`
  ADD PRIMARY KEY (`id_provas`);

--
-- Índices de tabela `tb_tipo_pagamento`
--
ALTER TABLE `tb_tipo_pagamento`
  ADD PRIMARY KEY (`id_tipo_pagamento`);

--
-- Índices de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `tb_usuario_tb_nivel_FK` (`id_nivel`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_acessos`
--
ALTER TABLE `tb_acessos`
  MODIFY `id_acessos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  MODIFY `id_aluno` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT de tabela `tb_aulas`
--
ALTER TABLE `tb_aulas`
  MODIFY `id_aulas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de tabela `tb_aulas_diaconos`
--
ALTER TABLE `tb_aulas_diaconos`
  MODIFY `id_aulas_diaconos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_aulas_novas`
--
ALTER TABLE `tb_aulas_novas`
  MODIFY `id_aulas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_contas`
--
ALTER TABLE `tb_contas`
  MODIFY `id_contas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_contas_pagar`
--
ALTER TABLE `tb_contas_pagar`
  MODIFY `id_contas_pagar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_contas_receber`
--
ALTER TABLE `tb_contas_receber`
  MODIFY `id_contas_receber` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  MODIFY `id_fornecedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_log_acessos`
--
ALTER TABLE `tb_log_acessos`
  MODIFY `id_log_acessos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT de tabela `tb_materia`
--
ALTER TABLE `tb_materia`
  MODIFY `id_materia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `tb_materia_diaconos`
--
ALTER TABLE `tb_materia_diaconos`
  MODIFY `id_materia_diaconos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_modalidade`
--
ALTER TABLE `tb_modalidade`
  MODIFY `id_modalidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `tb_modulo`
--
ALTER TABLE `tb_modulo`
  MODIFY `id_modulo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_nivel`
--
ALTER TABLE `tb_nivel`
  MODIFY `id_nivel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_nota_aluno`
--
ALTER TABLE `tb_nota_aluno`
  MODIFY `id_nota_aluno` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_nucleo`
--
ALTER TABLE `tb_nucleo`
  MODIFY `id_nucleo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `tb_plano_contas`
--
ALTER TABLE `tb_plano_contas`
  MODIFY `id_plano_contas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_presenca`
--
ALTER TABLE `tb_presenca`
  MODIFY `id_presenca` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_presenca_aula_aluno`
--
ALTER TABLE `tb_presenca_aula_aluno`
  MODIFY `id_presenca_aula_aluno` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `tb_provas`
--
ALTER TABLE `tb_provas`
  MODIFY `id_provas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tb_tipo_pagamento`
--
ALTER TABLE `tb_tipo_pagamento`
  MODIFY `id_tipo_pagamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_usuario_tb_nivel_FK` FOREIGN KEY (`id_nivel`) REFERENCES `tb_nivel` (`id_nivel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
