-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Jeu 23 Janvier 2014 à 11:51
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gclients`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(3) NOT NULL,
  `designation` varchar(80) NOT NULL,
  `prix_unite` float NOT NULL,
  `qte_stock` int(2) NOT NULL,
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id_article`, `designation`, `prix_unite`, `qte_stock`) VALUES
(200, 'Tapis', 100, 30),
(201, 'Lecteur Disk', 1025.7, 2),
(202, 'Imprimante matricielle', 3210.25, 15),
(203, 'Imprimante laser', 7000, 2),
(204, 'Souris', 700, 10),
(205, 'Disque dur', 1200, 9),
(207, 'Imprimante jet d''encre', 5524.5, 6),
(208, 'Clavier', 3000, 27),
(209, 'Carte vidéo', 220.5, 3),
(210, 'Modem', 3420.5, 12),
(212, 'CD.ROM', 310, 10),
(213, 'Carte mère', 725.6, 7),
(214, 'Scanner', 12000, 4),
(217, 'Kit multimédia', 325, 15),
(222, 'Mise à jour office 97 standard', 3020, 5),
(301, 'Serveur HP', 14720, 5),
(444, 'Ordinateur HP', 15000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` int(6) NOT NULL,
  `nom` varchar(15) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `ville` varchar(15) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `adresse`, `ville`, `telephone`) VALUES
(21489, 'SAHEL', '6,bd hassany', 'rabat', '(07)95.25.14'),
(23156, 'MIKOU', '15,bd 2mars', 'casablanca', '(02)94.22.36'),
(57423, 'ADAMI', '27,bd zerktouni', 'casablanca', '(02)30.34.55'),
(80877, 'CHENAOUI', '28, bd md V', 'casablanca', '(02)43.02.57'),
(105874, 'ALAOUI', '73,avenue lalla yacout', 'casablanca', '(02)29.65.14'),
(110175, 'BENYAHYA', '23,rue la fayette', 'casablanca', '(02)30.28.51'),
(210279, 'CHAKIR', '354,bd d''anfa', 'casablanca', '(02)90.31.07'),
(326598, 'BENMOUSA', '13,bd my ismail', 'casablanca', '(02)32.12.55'),
(336941, 'BENAZOUZ', '13, bd My youssef', 'rabat', '(07)82.15.33'),
(365722, 'OUMARI', '55, rue faidi khalifa', 'marrakech', '(04)24.13.90'),
(657251, 'RIAD', '84, bd 11 janvier', 'rabat', '(07)30.38.55'),
(698725, 'MANSOUR', '12,avenue des FAR', 'fes', '(05)27.69.87'),
(987265, 'IDRISSI', '99,rue colbert', 'oujda', '(06)61.25.33'),
(987542, 'BORJA', '62, hay el hana', 'fes', '(05)80.37.08'),
(998750, 'FARABI', '53,maarif', 'kenitra', '(07)98.25.47');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `num_com` int(3) NOT NULL,
  `id_client` int(6) NOT NULL,
  `date_com` date NOT NULL,
  PRIMARY KEY (`num_com`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`num_com`, `id_client`, `date_com`) VALUES
(125, 110175, '1995-03-08'),
(159, 105874, '1995-11-10'),
(208, 105874, '1995-08-02'),
(349, 80877, '1995-06-23'),
(789, 336941, '1996-02-07'),
(854, 210279, '1995-05-15'),
(937, 21489, '1995-08-13'),
(971, 110175, '1995-06-28');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_cmd`
--

CREATE TABLE IF NOT EXISTS `ligne_cmd` (
  `num_ligne` int(4) NOT NULL,
  `num_com` int(3) NOT NULL,
  `id_article` int(3) NOT NULL,
  `qte_com` int(2) NOT NULL,
  PRIMARY KEY (`num_ligne`),
  KEY `num_com` (`num_com`,`id_article`),
  KEY `id_article` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ligne_cmd`
--

INSERT INTO `ligne_cmd` (`num_ligne`, `num_com`, `id_article`, `qte_com`) VALUES
(1236, 208, 217, 1),
(1729, 789, 222, 5),
(2547, 159, 444, 9),
(4549, 937, 301, 7),
(5852, 971, 214, 12),
(9482, 349, 210, 14);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ligne_cmd`
--
ALTER TABLE `ligne_cmd`
  ADD CONSTRAINT `ligne_cmd_ibfk_2` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ligne_cmd_ibfk_1` FOREIGN KEY (`num_com`) REFERENCES `commandes` (`num_com`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
