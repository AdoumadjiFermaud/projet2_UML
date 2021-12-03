-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 03 déc. 2021 à 11:51
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Stock_Cuisine`
--

-- --------------------------------------------------------

--
-- Structure de la table `Gestionnaire`
--

CREATE TABLE `Gestionnaire` (
  `ID` int(12) NOT NULL,
  `nom` varchar(120) NOT NULL,
  `adresse` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Gestionnaire`
--

INSERT INTO `Gestionnaire` (`ID`, `nom`, `adresse`) VALUES
(1, 'adoumadji', 'farcha-ndjamena'),
(2, 'falmata', 'chagoua-tchad'),
(3, 'Elvice', 'atrone-Tchad'),
(4, 'cendrillon', 'walia-Tchad'),
(5, 'abakar', 'farcha-Tchad'),
(6, 'jean', 'bololo'),
(7, 'marie', 'abena');

-- --------------------------------------------------------

--
-- Structure de la table `ingrédient`
--

CREATE TABLE `ingrédient` (
  `ID` int(12) NOT NULL,
  `type_ing` varchar(70) NOT NULL,
  `nom` varchar(120) NOT NULL,
  `nbr_ing` varchar(12) NOT NULL,
  `conditionnement` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ingrédient`
--

INSERT INTO `ingrédient` (`ID`, `type_ing`, `nom`, `nbr_ing`, `conditionnement`) VALUES
(1, 'protéinique', 'feuille de manioc', '120', 'au frais (180KG)'),
(2, 'lipidique', 'huile de carité', '2', '200 littres à l\'air libre'),
(3, 'glucidique', 'sucre', '220', 'paquet de 50 kg'),
(4, 'minéral', 'sel', '100', 'sac de 50 kg'),
(5, 'proteinique', 'viande', '220 morceaux', 'morceaux de 150 kg (stockage au frai)'),
(6, 'mineral', 'lait', '200 paquet', '200 paquets au niveau 2 de l\'étagiaire '),
(7, 'amidon, céréal', 'farine', '12', 'sac de 120 Kg');

-- --------------------------------------------------------

--
-- Structure de la table `Lieu_de_Stock`
--

CREATE TABLE `Lieu_de_Stock` (
  `ID` int(12) NOT NULL,
  `nom_produit` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Lieu_de_Stock`
--

INSERT INTO `Lieu_de_Stock` (`ID`, `nom_produit`) VALUES
(1, 'Etagiaire 1'),
(2, 'Etagiaire 2'),
(3, 'Etagiaire 3'),
(4, 'Etagiaire 4'),
(5, 'Frigo'),
(6, 'frigo 2'),
(7, 'frigo 3');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `ID` int(12) NOT NULL,
  `nom_produit` varchar(120) NOT NULL,
  `lieu_de_cond` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`ID`, `nom_produit`, `lieu_de_cond`) VALUES
(1, 'sucre', 'au deuxième niveau de stagiaire'),
(2, 'viande', 'au frigo (dernier niveau en bas)'),
(3, 'légumes frais', 'au frigo (au 3em niveau)'),
(4, 'oignons', 'au frigo, 1er niveau'),
(5, 'riz', 'au 4em niveau de l\'étagiaire '),
(6, 'farine', 'etagiaire'),
(7, 'lait', 'étagiaire');

-- --------------------------------------------------------

--
-- Structure de la table `rangement`
--

CREATE TABLE `rangement` (
  `ID` int(12) NOT NULL,
  `type_produit` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rangement`
--

INSERT INTO `rangement` (`ID`, `type_produit`) VALUES
(1, 'lipidique'),
(2, 'glucidiques'),
(3, 'arome'),
(4, 'proteiniques'),
(5, 'mineral'),
(6, 'amidon'),
(7, 'organique');

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

CREATE TABLE `recette` (
  `ID` int(12) NOT NULL,
  `nom` varchar(120) NOT NULL,
  `description` varchar(150) NOT NULL,
  `durée_de_préparation` time(4) NOT NULL,
  `durée_de_cuisson` time(4) NOT NULL,
  `nbr_de_calorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`ID`, `nom`, `description`, `durée_de_préparation`, `durée_de_cuisson`, `nbr_de_calorie`) VALUES
(1, 'recette de TK du Tchad', 'sauce gluente, préparé au frais à partir d\'une écorce d\'un \"guem\"', '00:13:39.0000', '01:13:39.0000', '20 kcal'),
(2, 'recette des omelettes à œuf', 'mettre huiles sur feu, casser les œufs et les tourner avec quelques ingrédients et verser sur l\'huile puis laisser pendant 3 min.', '00:01:00.0000', '00:04:00.0000', '10kcal'),
(3, 'cuisson du riz', 'mettre de l\'eau + 20-50 dcl d\'huile + sel , les mettre au feu puis pendant 15-30min', '00:30:00.0000', '00:20:00.0000', '2kcal'),
(4, 'haricot', 'mettre de l\'eau au feu, mettre d\'haricot dessus, mettre de sel minerau', '00:27:00.0000', '00:33:00.0000', '10kcal'),
(5, 'thé', 'mettre une quantité donnée d\'eau au feu + thé en poudre, filtré, puis ajout de sucre.', '00:30:00.0000', '00:12:00.0000', '20kcal'),
(6, 'boule', 'eau+farine', '00:59:00.0000', '00:39:07.0000', ''),
(7, 'feuille de moringua', 'huile+oignon+eau+feuilles', '00:49:15.0000', '00:22:15.0000', '20kcal');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Gestionnaire`
--
ALTER TABLE `Gestionnaire`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `ingrédient`
--
ALTER TABLE `ingrédient`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `Lieu_de_Stock`
--
ALTER TABLE `Lieu_de_Stock`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `rangement`
--
ALTER TABLE `rangement`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `recette`
--
ALTER TABLE `recette`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Gestionnaire`
--
ALTER TABLE `Gestionnaire`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `ingrédient`
--
ALTER TABLE `ingrédient`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `Lieu_de_Stock`
--
ALTER TABLE `Lieu_de_Stock`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `rangement`
--
ALTER TABLE `rangement`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `recette`
--
ALTER TABLE `recette`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
