-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 24/06/2024 às 00:02
-- Versão do servidor: 8.3.0
-- Versão do PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `apimagic`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cartasmagic`
--

DROP TABLE IF EXISTS `cartasmagic`;
CREATE TABLE IF NOT EXISTS `cartasmagic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `custo_mana` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_general_ci,
  `raridade` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `colecao` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagens` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cartasmagic`
--

INSERT INTO `cartasmagic` (`id`, `nome`, `tipo`, `custo_mana`, `descricao`, `raridade`, `colecao`, `imagens`) VALUES
(1, 'Black Lotus', 'Artefato', '0', 'Adicione três manas de qualquer cor.', 'Rara', 'Alpha', 'http://localhost/ApiMagic/media/imagens/1.jpg'),
(2, 'Lightning Bolt', 'Instantâneo', 'R', 'Lightning Bolt causa 3 de dano a qualquer alvo.', 'Comum', 'Alpha', 'http://localhost/ApiMagic/media/imagens/2.jpeg'),
(3, 'Jace, the Mind Sculptor', 'Planeswalker', '2UU', 'As habilidades de Jace, o Escultor de Mentes, não podem ser ativadas durante o turno do oponente.', 'Mítica Rara', 'Worldwake', 'http://localhost/ApiMagic/media/imagens/3.jpg'),
(4, 'Tarmogoyf', 'Criatura - Lhurgoyf', '1G', 'O Tarmogoyf recebe +1/+1 para cada tipo de card em todos os cemitérios além do Tarmogoyf.', 'Rara', 'Future Sight', 'http://localhost/ApiMagic/media/imagens/4.jpg'),
(5, 'Ancestral Recall', 'Instantâneo', 'U', 'Compre três cards.', 'Rara', 'Alpha', 'http://localhost/ApiMagic/media/imagens/5.jpg'),
(6, 'Force of Will', 'Instantâneo', '3UU', 'Você pode exilar um card azul de sua mão ao invés de pagar o custo de mana de Força de Vontade. Contraste a mágica alvo que tenha como alvo uma mágica que você controla.', 'Rara', 'Alliances', 'http://localhost/ApiMagic/media/imagens/6.jpg'),
(7, 'Tolarian Academy', 'Terra', '', 'Adicione U para o seu mana pool para cada artefato que você controle.', 'Rara', 'Urzas Saga', 'http://localhost/ApiMagic/media/imagens/7.jpg'),
(8, 'Savannah Lions', 'Criatura - Leão', 'W', 'Savannah Lions não pode ser bloqueado exceto por criaturas que tenham atacado ou bloqueado neste turno.', 'Comum', 'Alpha', 'http://localhost/ApiMagic/media/imagens/8.jpg'),
(9, 'Swords to Plowshares', 'Instantâneo', 'W', 'A criatura-alvo é removida de jogo com o controle de seu controlador. Seu controlador ganha vida igual ao poder dessa criatura.', 'Incomum', 'Alpha', 'http://localhost/ApiMagic/media/imagens/9.jpg'),
(10, 'Serra Angel', 'Criatura - Anjo', '3WW', 'Voar, vínculo com a vida', 'Incomum', 'Alpha', NULL),
(11, 'Sol Ring', 'Artefato', '1', 'Adicione dois manas de qualquer cor para o seu mana pool.', 'Incomum', 'Alpha', NULL),
(12, 'Wrath of God', 'Mágica Instantânea', '2WW', 'Destrua todas as criaturas. Elas não podem ser regeneradas.', 'Rara', 'Alpha', NULL),
(13, 'Counterspell', 'Instantâneo', 'UU', 'Contraste a mágica alvo.', 'Comum', 'Alpha', NULL),
(14, 'Birds of Paradise', 'Criatura - Pássaro', 'G', 'Voar. Adicione um mana de qualquer cor para o seu mana pool.', 'Rara', 'Alpha', NULL),
(15, 'Shivan Dragon', 'Criatura - Dragão', '4RR', 'Voar. R: Shivan Dragon recebe +1/+0 até o final do turno.', 'Rara', 'Alpha', NULL),
(16, 'Mahamoti Djinn', 'Criatura - Djinn', '4UU', 'Voar', 'Incomum', 'Alpha', NULL),
(17, 'Sengir Vampire', 'Criatura - Vampiro', '3BB', 'Voar. Sempre que Sengir Vampire causa dano a um jogador, coloque um marcador +1/+1 sobre Sengir Vampire.', 'Incomum', 'Alpha', NULL),
(18, 'Lord of Atlantis', 'Criatura - Senhor', 'UUU', 'Todas as outras criaturas místicas recebem +1/+1. Místicas são criaturas submarinas.', 'Rara', 'Alpha', NULL),
(19, 'Royal Assassin', 'Criatura - Assassino', '1BB', 'Toca: Destrua a criatura alvo que não está tapada. É necessário tocar para usar essa habilidade.', 'Rara', 'Alpha', NULL),
(20, 'Regrowth', 'Sorcery', '1G', 'Devolve o card de sua escolha de seu cemitério para sua mão.', 'Incomum', 'Alpha', NULL),
(21, 'Black Vise', 'Artefato', '1', 'No começo do turno do jogador ativo, Black Vise causa X de dano ao jogador ativo, onde X é a quantidade de cards na mão desse jogador em excesso de quatro.', 'Incomum', 'Alpha', NULL),
(22, 'Kird Ape', 'Criatura - Macaco', 'R', 'Kird Ape recebe +1/+2 enquanto você controlar qualquer montanha.', 'Comum', 'Alpha', NULL),
(23, 'Control Magic', 'Mágica Enchant', '3UU', 'Toca em uma criatura alvo. Você controla a criatura encantada.', 'Rara', 'Alpha', NULL),
(24, 'Stasis', 'Encantamento', '1U', 'Os jogadores não podem desvirar suas pernas durante o desvirar.', 'Rara', 'Alpha', NULL),
(25, 'Fastbond', 'Encantamento', 'G', 'Todas as vezes que você joga uma terra, você pode jogar uma terra adicional.', 'Rara', 'Alpha', NULL),
(26, 'Sylvan Library', 'Encantamento', '1G', 'Na sua fase de manutenção, você pode pagar 4 de vida para desenhar dois cards. Se você não fizer isso, desenhe um card.', 'Rara', 'Legends', NULL),
(27, 'Time Walk', 'Mágica', '1U', 'Tome um turno adicional após este. No início do seu próximo turno, tome outro.', 'Rara', 'Alpha', NULL),
(28, 'Clone', 'Criatura - Shapeshifter', '3U', 'Toca: Clone se torna uma criatura alvo até o final do turno.', 'Rara', 'Alpha', NULL),
(29, 'Mox Sapphire', 'Artefato', '0', 'Adicione U para o seu mana pool.', 'Rara', 'Alpha', NULL),
(30, 'Mox Jet', 'Artefato', '0', 'Adicione B para o seu mana pool.', 'Rara', 'Alpha', NULL),
(31, 'Mox Ruby', 'Artefato', '0', 'Adicione R para o seu mana pool.', 'Rara', 'Alpha', NULL),
(32, 'Mox Pearl', 'Artefato', '0', 'Adicione W para o seu mana pool.', 'Rara', 'Alpha', NULL),
(33, 'Mox Emerald', 'Artefato', '0', 'Adicione G para o seu mana pool.', 'Rara', 'Alpha', NULL),
(34, 'Wheel of Fortune', 'Mágica', '2R', 'Cada jogador descarta a mão, então compra sete cards.', 'Rara', 'Alpha', NULL),
(35, 'Serra Angel', 'Criatura - Anjo', '3WW', 'Voar, vínculo com a vida', 'Incomum', 'Alpha', NULL),
(36, 'Sol Ring', 'Artefato', '1', 'Adicione dois manas de qualquer cor para o seu mana pool.', 'Incomum', 'Alpha', NULL),
(37, 'Wrath of God', 'Mágica Instantânea', '2WW', 'Destrua todas as criaturas. Elas não podem ser regeneradas.', 'Rara', 'Alpha', NULL),
(38, 'Counterspell', 'Instantâneo', 'UU', 'Contraste a mágica alvo.', 'Comum', 'Alpha', NULL),
(39, 'Birds of Paradise', 'Criatura - Pássaro', 'G', 'Voar. Adicione um mana de qualquer cor para o seu mana pool.', 'Rara', 'Alpha', NULL),
(40, 'Shivan Dragon', 'Criatura - Dragão', '4RR', 'Voar. R: Shivan Dragon recebe +1/+0 até o final do turno.', 'Rara', 'Alpha', NULL),
(41, 'Mahamoti Djinn', 'Criatura - Djinn', '4UU', 'Voar', 'Incomum', 'Alpha', NULL),
(42, 'Sengir Vampire', 'Criatura - Vampiro', '3BB', 'Voar. Sempre que Sengir Vampire causa dano a um jogador, coloque um marcador +1/+1 sobre Sengir Vampire.', 'Incomum', 'Alpha', NULL),
(43, 'Lord of Atlantis', 'Criatura - Senhor', 'UUU', 'Todas as outras criaturas místicas recebem +1/+1. Místicas são criaturas submarinas.', 'Rara', 'Alpha', NULL),
(44, 'Royal Assassin', 'Criatura - Assassino', '1BB', 'Toca: Destrua a criatura alvo que não está tapada. É necessário tocar para usar essa habilidade.', 'Rara', 'Alpha', NULL),
(45, 'Regrowth', 'Sorcery', '1G', 'Devolve o card de sua escolha de seu cemitério para sua mão.', 'Incomum', 'Alpha', NULL),
(46, 'Black Vise', 'Artefato', '1', 'No começo do turno do jogador ativo, Black Vise causa X de dano ao jogador ativo, onde X é a quantidade de cards na mão desse jogador em excesso de quatro.', 'Incomum', 'Alpha', NULL),
(47, 'Kird Ape', 'Criatura - Macaco', 'R', 'Kird Ape recebe +1/+2 enquanto você controlar qualquer montanha.', 'Comum', 'Alpha', NULL),
(48, 'Control Magic', 'Mágica Enchant', '3UU', 'Toca em uma criatura alvo. Você controla a criatura encantada.', 'Rara', 'Alpha', NULL),
(49, 'Stasis', 'Encantamento', '1U', 'Os jogadores não podem desvirar suas pernas durante o desvirar.', 'Rara', 'Alpha', NULL),
(50, 'Fastbond', 'Encantamento', 'G', 'Todas as vezes que você joga uma terra, você pode jogar uma terra adicional.', 'Rara', 'Alpha', NULL),
(51, 'Sylvan Library', 'Encantamento', '1G', 'Na sua fase de manutenção, você pode pagar 4 de vida para desenhar dois cards. Se você não fizer isso, desenhe um card.', 'Rara', 'Legends', NULL),
(52, 'Time Walk', 'Mágica', '1U', 'Tome um turno adicional após este. No início do seu próximo turno, tome outro.', 'Rara', 'Alpha', NULL),
(53, 'Clone', 'Criatura - Shapeshifter', '3U', 'Toca: Clone se torna uma criatura alvo até o final do turno.', 'Rara', 'Alpha', NULL),
(54, 'Mox Sapphire', 'Artefato', '0', 'Adicione U para o seu mana pool.', 'Rara', 'Alpha', NULL),
(55, 'Mox Jet', 'Artefato', '0', 'Adicione B para o seu mana pool.', 'Rara', 'Alpha', NULL),
(56, 'Mox Ruby', 'Artefato', '0', 'Adicione R para o seu mana pool.', 'Rara', 'Alpha', NULL),
(57, 'Mox Pearl', 'Artefato', '0', 'Adicione W para o seu mana pool.', 'Rara', 'Alpha', NULL),
(58, 'Mox Emerald', 'Artefato', '0', 'Adicione G para o seu mana pool.', 'Rara', 'Alpha', NULL),
(59, 'Wheel of Fortune', 'Mágica', '2R', 'Cada jogador descarta a mão, então compra sete cards.', 'Rara', 'Alpha', NULL),
(60, 'Time Vault', 'Artefato', '2', 'No início do seu turno, você pode pagar 1. Se fizer isso, tome um turno adicional depois deste. O Time Vault não desvira durante a fase de desvirar, então faça mais algo para desvirá-lo ou movê-lo de jogo.', 'Rara', 'Alpha', NULL),
(61, 'Fork', 'Instantâneo', 'RR', 'Copie qualquer mágica instantânea ou feitiço de feitiço, exceto qualquer mágica instantânea ou feitiço de feitiço que não selecione alvos.', 'Incomum', 'Alpha', NULL),
(62, 'Demonic Tutor', 'Mágica', '1B', 'Procure um card no seu baralho e coloque esse card em sua mão. Embaralhe seu baralho depois.', 'Incomum', 'Alpha', NULL),
(63, 'Balance', 'Sorcery', '1WW', 'Cada jogador escolhe um número de permanents que controla igual ao número de permanents controlados pelo jogador que controla menos permanents. Em seguida, cada jogador sacrifica todos os permanents que escolheu.', 'Rara', 'Alpha', NULL),
(64, 'Maze of Ith', 'Terra', '', 'T: Maze of Ith remove a criatura alvo da combate e bloqueia. (A criatura não causa mais dano de combate nem está bloqueando.)', 'Incomum', 'The Dark', NULL),
(65, 'Sword of Fire and Ice', 'Artefato - Equipamento', '3', 'Equipar 2. Equipamento de lâmina dupla. Equipa uma criatura. Equipada à criatura recebe +2/+2 e tem proteção contra vermelho e azul.', 'Rara', 'Darksteel', NULL),
(66, 'Sword of Feast and Famine', 'Artefato - Equipamento', '3', 'Equipar 2. Equipamento de lâmina dupla. Equipa uma criatura. Equipada à criatura recebe +2/+2 e tem proteção contra preto e verde.', 'Mítica Rara', 'Mirrodin Besieged', NULL),
(67, 'Sword of Light and Shadow', 'Artefato - Equipamento', '3', 'Equipar 2. Equipamento de lâmina dupla. Equipa uma criatura. Equipada à criatura recebe +2/+2 e tem proteção contra branco e preto.', 'Mítica Rara', 'Darksteel', NULL),
(68, 'Sword of War and Peace', 'Artefato - Equipamento', '3', 'Equipar 2. Equipamento de lâmina dupla. Equipa uma criatura. Equipada à criatura recebe +2/+2 e tem proteção contra vermelho e branco.', 'Mítica Rara', 'Mirrodin Besieged', NULL),
(69, 'Umezawas Jitte', 'Artefato - Equipamento', '2', 'Equipar 2. Equipamento. Se uma criatura equipada com Umezawas Jitte fizer dano de combate a um jogador, você pode remover um marcador de carga de Umezawas Jitte. Se o fizer, escolha um deles - Coloque dois marcadores de +1/+1 sobre a criatura equipada; ou destrua uma criatura alvo; ou você ganha 2 pontos de vida.', 'Rara', 'Betrayers of Kamigawa', NULL),
(70, 'Mana Drain', 'Instantâneo', '1UU', 'Contraste a mágica alvo. No início de sua próxima fase principal, adicione uma quantidade de C igual ao custo de mana convertido dessa mágica.', 'Rara', 'Legends', NULL),
(71, 'Juzam Djinn', 'Criatura - Djinn', '2BB', 'No início de sua fase de manutenção, Juzam Djinn causa 1 de dano a você.', 'Rara', 'Arabian Nights', NULL),
(72, 'The Abyss', 'Encantamento', '2BB', 'No início de cada jogador, destrua a criatura não-voadora que esse jogador controla com o menor poder. Ela não pode ser regenerada.', 'Rara', 'Legends', NULL),
(73, 'Eureka', 'Sorcery', 'GGGGG', 'Começando com você, cada jogador pode colocar uma criatura de sua mão em jogo.', 'Rara', 'Legends', NULL),
(74, 'The Tabernacle at Pendrell Vale', 'Terra', '', 'Todos os animais são pagos 1 durante a fase de manutenção de seu controlador.', 'Rara', 'Legends', NULL),
(75, 'Time Walk', 'Mágica', '1U', 'Tome um turno adicional após este. No início do seu próximo turno, tome outro.', 'Rara', 'Alpha', NULL),
(76, 'Clone', 'Criatura - Shapeshifter', '3U', 'Toca: Clone se torna uma criatura alvo até o final do turno.', 'Rara', 'Alpha', NULL),
(77, 'Mox Sapphire', 'Artefato', '0', 'Adicione U para o seu mana pool.', 'Rara', 'Alpha', NULL),
(78, 'Mox Jet', 'Artefato', '0', 'Adicione B para o seu mana pool.', 'Rara', 'Alpha', NULL),
(79, 'Mox Ruby', 'Artefato', '0', 'Adicione R para o seu mana pool.', 'Rara', 'Alpha', NULL),
(80, 'Mox Pearl', 'Artefato', '0', 'Adicione W para o seu mana pool.', 'Rara', 'Alpha', NULL),
(81, 'Mox Emerald', 'Artefato', '0', 'Adicione G para o seu mana pool.', 'Rara', 'Alpha', NULL),
(82, 'Wheel of Fortune', 'Mágica', '2R', 'Cada jogador descarta a mão, então compra sete cards.', 'Rara', 'Alpha', NULL),
(83, 'Time Vault', 'Artefato', '2', 'No início do seu turno, você pode pagar 1. Se fizer isso, tome um turno adicional depois deste. O Time Vault não desvira durante a fase de desvirar, então faça mais algo para desvirá-lo ou movê-lo de jogo.', 'Rara', 'Alpha', NULL),
(84, 'Fork', 'Instantâneo', 'RR', 'Copie qualquer mágica instantânea ou feitiço de feitiço, exceto qualquer mágica instantânea ou feitiço de feitiço que não selecione alvos.', 'Incomum', 'Alpha', NULL),
(85, 'Demonic Tutor', 'Mágica', '1B', 'Procure um card no seu baralho e coloque esse card em sua mão. Embaralhe seu baralho depois.', 'Incomum', 'Alpha', NULL),
(86, 'Balance', 'Sorcery', '1WW', 'Cada jogador escolhe um número de permanents que controla igual ao número de permanents controlados pelo jogador que controla menos permanents. Em seguida, cada jogador sacrifica todos os permanents que escolheu.', 'Rara', 'Alpha', NULL),
(87, 'Maze of Ith', 'Terra', '', 'T: Maze of Ith remove a criatura alvo da combate e bloqueia. (A criatura não causa mais dano de combate nem está bloqueando.)', 'Incomum', 'Alpha', NULL),
(88, 'Sword of Fire and Ice', 'Artefato - Equipamento', '3', 'Equipar 2. Equipamento de lâmina dupla. Equipa uma criatura. Equipada à criatura recebe +2/+2 e tem proteção contra vermelho e azul.', 'Rara', 'Alpha', NULL),
(89, 'Sword of Feast and Famine', 'Artefato - Equipamento', '3', 'Equipar 2. Equipamento de lâmina dupla. Equipa uma criatura. Equipada à criatura recebe +2/+2 e tem proteção contra preto e verde.', 'Mítica Rara', 'Alpha', NULL),
(90, 'Sword of Light and Shadow', 'Artefato - Equipamento', '3', 'Equipar 2. Equipamento de lâmina dupla. Equipa uma criatura. Equipada à criatura recebe +2/+2 e tem proteção contra branco e preto.', 'Mítica Rara', 'Alpha', NULL),
(91, 'Sword of War and Peace', 'Artefato - Equipamento', '3', 'Equipar 2. Equipamento de lâmina dupla. Equipa uma criatura. Equipada à criatura recebe +2/+2 e tem proteção contra vermelho e branco.', 'Mítica Rara', 'Alpha', NULL),
(92, 'Umezawas Jitte', 'Artefato - Equipamento', '2', 'Equipar 2. Equipamento. Se uma criatura equipada com Umezawas Jitte fizer dano de combate a um jogador, você pode remover um marcador de carga de Umezawas Jitte. Se o fizer, escolha um deles - Coloque dois marcadores de +1/+1 sobre a criatura equipada; ou destrua uma criatura alvo; ou você ganha 2 pontos de vida.', 'Rara', 'Alpha', NULL),
(93, 'Mana Drain', 'Instantâneo', '1UU', 'Contraste a mágica alvo. No início de sua próxima fase principal, adicione uma quantidade de C igual ao custo de mana convertido dessa mágica.', 'Rara', 'Alpha', NULL),
(94, 'Juzam Djinn', 'Criatura - Djinn', '2BB', 'No início de sua fase de manutenção, Juzam Djinn causa 1 de dano a você.', 'Rara', 'Alpha', NULL),
(95, 'The Abyss', 'Encantamento', '2BB', 'No início de cada jogador, destrua a criatura não-voadora que esse jogador controla com o menor poder. Ela não pode ser regenerada.', 'Rara', 'Alpha', NULL),
(96, 'Eureka', 'Sorcery', 'GGGGG', 'Começando com você, cada jogador pode colocar uma criatura de sua mão em jogo.', 'Rara', 'Alpha', NULL),
(97, 'The Tabernacle at Pendrell Vale', 'Terra', '', 'Todos os animais são pagos 1 durante a fase de manutenção de seu controlador.', 'Rara', 'Alpha', NULL),
(98, 'Luis Pelarin', 'fasdf', '3', 'fsdfas', 'Rara', 'fsdaf', NULL),
(99, 'Luis Pelarin', 'fasdf', '3', 'fsdfas', 'Rara', 'fsdaf', NULL),
(103, 'Pelarin', 'Encantamento', '3', 'QUANDO ELE ENTRAR EM CAMPO, ACENE.', 'Comum', 'pelados', 'http://localhost/ApiMagic/media/imagens/10.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `deck`
--

DROP TABLE IF EXISTS `deck`;
CREATE TABLE IF NOT EXISTS `deck` (
  `cartas` int NOT NULL,
  KEY `FK_Cartas` (`cartas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `deck`
--

INSERT INTO `deck` (`cartas`) VALUES
(1),
(3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `USUARIO` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SENHA` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
