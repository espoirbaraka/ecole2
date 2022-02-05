-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 20 août 2021 à 13:12
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `jspecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_affectation_enseignant`
--

CREATE TABLE `t_affectation_enseignant` (
  `CodeAffectation` int(11) NOT NULL,
  `CodeClasse` int(11) NOT NULL,
  `CodeEnseignant` int(11) NOT NULL,
  `DateDebut` date NOT NULL,
  `DateFin` date NOT NULL,
  `DateAffectation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_annee`
--

CREATE TABLE `t_annee` (
  `CodeAnnee` int(11) NOT NULL,
  `Annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_classe`
--

CREATE TABLE `t_classe` (
  `CodeClasse` int(11) NOT NULL,
  `Classe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_classe`
--

INSERT INTO `t_classe` (`CodeClasse`, `Classe`) VALUES
(1, '1 A'),
(2, '1 B'),
(3, '2 A'),
(4, '2 B'),
(5, '3 A'),
(6, '3 B'),
(7, '4 A'),
(8, '4 B'),
(9, '5 A'),
(10, '5 B'),
(11, '6 A'),
(12, '6 B');

-- --------------------------------------------------------

--
-- Structure de la table `t_compte`
--

CREATE TABLE `t_compte` (
  `CodeCompte` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `CodeEnseignant` int(11) NOT NULL,
  `CodePrivilege` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_compte`
--

INSERT INTO `t_compte` (`CodeCompte`, `Username`, `Password`, `CodeEnseignant`, `CodePrivilege`) VALUES
(1, 'esb', 'admin', 0, 5),
(2, 'sifa', 'admin', 2, 4),
(3, 'carin', 'admin', 3, 4),
(4, 'siska', 'admin', 1, 4),
(5, 'gaetan', 'admin', 4, 3),
(6, 'baraka', 'admin', 5, 1),
(7, 'aketi', 'admin', 8, 1),
(8, 'provi', 'admin', 9, 2),
(9, 'akili', 'admin', 10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `t_cotation`
--

CREATE TABLE `t_cotation` (
  `CodeCotation` int(11) NOT NULL,
  `CodeEleve` int(11) NOT NULL,
  `CodeCours` int(11) NOT NULL,
  `CodeClasse` int(11) NOT NULL,
  `Cote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_cours`
--

CREATE TABLE `t_cours` (
  `CodeCours` int(11) NOT NULL,
  `Cours` varchar(100) NOT NULL,
  `Ponderation` int(11) NOT NULL,
  `CodeClasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_cours`
--

INSERT INTO `t_cours` (`CodeCours`, `Cours`, `Ponderation`, `CodeClasse`) VALUES
(3, 'MATH OPERATION', 120, 1),
(4, 'MATH NUMERATION', 100, 1),
(5, 'ETUDE DU MILIEU', 100, 1),
(6, 'MATH OPERATION', 120, 9);

-- --------------------------------------------------------

--
-- Structure de la table `t_eleve`
--

CREATE TABLE `t_eleve` (
  `CodeEleve` int(11) NOT NULL,
  `NomEleve` varchar(30) NOT NULL,
  `PostnomEleve` varchar(30) NOT NULL,
  `PrenomEleve` varchar(30) NOT NULL,
  `DateNaissance` date NOT NULL,
  `LieuNaissance` varchar(50) NOT NULL,
  `NomPere` varchar(100) NOT NULL,
  `NomMere` varchar(100) NOT NULL,
  `ProfessionPere` varchar(50) NOT NULL,
  `TelephoneTutelle` varchar(11) NOT NULL,
  `CodeClasse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_eleve`
--

INSERT INTO `t_eleve` (`CodeEleve`, `NomEleve`, `PostnomEleve`, `PrenomEleve`, `DateNaissance`, `LieuNaissance`, `NomPere`, `NomMere`, `ProfessionPere`, `TelephoneTutelle`, `CodeClasse`) VALUES
(11, 'RIPHIN', 'BARAKA', 'MODESTE', '2005-08-20', 'GOMA', 'BARAKA', 'ZAWADI', 'AGENT DE L\'ETAT', '09776655844', 1),
(13, 'RIPHIN', 'BARAKA', 'MODESTE', '2005-08-20', 'GOMA', 'BARAKA', 'ZAWADI', 'AGENT DE L\'ETAT', '09776655844', 1),
(14, 'FADHILI', 'BIGEGA', 'JEREMIE', '2021-08-13', 'GOMA', 'BARAKA', 'ZAWADI', 'AGENT DE L\'ETAT', '09776655844', 9),
(15, 'DANIEL', 'USENI', 'DANY', '2003-08-20', 'GOMA', 'BARAKA', 'MERE', 'AGENT DE L\'ETAT', '09776655844', 7),
(16, 'FEZA', 'FATAKI', 'SARAH', '2000-08-12', 'GOMA', 'BARAKA', 'ZAWADI', 'AGENT DE L\'ETAT', '09776655844', 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_enseignant`
--

CREATE TABLE `t_enseignant` (
  `CodeEnseignant` int(11) NOT NULL,
  `NomEnseignant` varchar(30) NOT NULL,
  `PostnomEnseignant` varchar(30) NOT NULL,
  `PrenomEnseignant` varchar(30) NOT NULL,
  `TelephoneEnseignant` int(11) NOT NULL,
  `AdresseEnseignant` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_inscription`
--

CREATE TABLE `t_inscription` (
  `CodeInscription` int(11) NOT NULL,
  `CodeEleve` int(11) NOT NULL,
  `CodeClasse` int(11) NOT NULL,
  `CodeAnnee` int(11) NOT NULL,
  `DateInscription` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_paiement`
--

CREATE TABLE `t_paiement` (
  `CodePaiement` int(11) NOT NULL,
  `CodeEleve` int(11) NOT NULL,
  `Montant` double NOT NULL,
  `DatePaiement` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_paiement`
--

INSERT INTO `t_paiement` (`CodePaiement`, `CodeEleve`, `Montant`, `DatePaiement`) VALUES
(1, 15, 20, '2021-08-11 13:51:49'),
(2, 15, 15, '2021-08-11 14:00:55'),
(3, 16, 15, '2021-08-11 15:09:22'),
(4, 13, 10, '2021-08-12 14:41:23'),
(5, 11, 12, '2021-08-13 12:15:30');

-- --------------------------------------------------------

--
-- Structure de la table `t_personnel`
--

CREATE TABLE `t_personnel` (
  `CodePersonnel` int(11) NOT NULL,
  `NomPersonnel` varchar(30) NOT NULL,
  `PostnomPersonnel` varchar(30) NOT NULL,
  `PrenomPersonnel` varchar(30) NOT NULL,
  `AdressePersonnel` varchar(255) NOT NULL,
  `Fonction` int(11) NOT NULL,
  `DateNaissance` date NOT NULL,
  `LieuNaissance` varchar(50) NOT NULL,
  `CodeClasse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_personnel`
--

INSERT INTO `t_personnel` (`CodePersonnel`, `NomPersonnel`, `PostnomPersonnel`, `PrenomPersonnel`, `AdressePersonnel`, `Fonction`, `DateNaissance`, `LieuNaissance`, `CodeClasse`) VALUES
(1, 'SIFA', 'SAIDI', 'SISKA', 'GOMA/KARISIMBI/NDOSHO', 4, '2000-08-19', 'GOMA', 9),
(2, 'SIFA', 'SAIDI', 'PRISCA', 'GOMA/KARISIMBI/VIRUNGA', 4, '2000-08-19', 'GOMA', 1),
(3, 'CARIN', 'SIWA', 'MUMBERE', 'GOMA/BIRERE', 4, '1998-08-06', 'GOMA', 4),
(4, 'GAETAN', 'BARAKA', 'CHARLES', 'GOMA/LES VOLCANS', 3, '2000-08-20', 'GOMA', NULL),
(5, 'BARAKA', 'MUTABAZI', 'CHARLES', 'GOMA/KYESHERO', 1, '2000-08-08', 'GOMA', NULL),
(8, 'AKETI', 'KOMPANYI', 'GABRIEL', 'GOMA/NDOSHO', 1, '2000-08-12', 'GOMA', NULL),
(9, 'PROVIDENCE', 'BARAKA', 'PROVI', 'GOMA/NDOSHO', 2, '2021-08-20', 'GOMA', NULL),
(10, 'AKILIMALI', 'BARAKA', 'MICHAEL', 'GOMA/NDOSHO', 4, '2000-08-06', 'GOMA', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_privilege`
--

CREATE TABLE `t_privilege` (
  `CodePrivilege` int(11) NOT NULL,
  `Privilege` varchar(30) NOT NULL,
  `Abbrev` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_privilege`
--

INSERT INTO `t_privilege` (`CodePrivilege`, `Privilege`, `Abbrev`) VALUES
(1, 'Directeur des etudes', 'D.E.P'),
(2, 'Directeur de discipline', 'D.D'),
(3, 'Comptable', 'COMPT'),
(4, 'Enseignant', 'ENSEIGNANT'),
(5, 'Administrateur', 'ADMIN');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_affectation_enseignant`
--
ALTER TABLE `t_affectation_enseignant`
  ADD PRIMARY KEY (`CodeAffectation`);

--
-- Index pour la table `t_annee`
--
ALTER TABLE `t_annee`
  ADD PRIMARY KEY (`CodeAnnee`);

--
-- Index pour la table `t_classe`
--
ALTER TABLE `t_classe`
  ADD PRIMARY KEY (`CodeClasse`);

--
-- Index pour la table `t_compte`
--
ALTER TABLE `t_compte`
  ADD PRIMARY KEY (`CodeCompte`);

--
-- Index pour la table `t_cotation`
--
ALTER TABLE `t_cotation`
  ADD PRIMARY KEY (`CodeCotation`);

--
-- Index pour la table `t_cours`
--
ALTER TABLE `t_cours`
  ADD PRIMARY KEY (`CodeCours`);

--
-- Index pour la table `t_eleve`
--
ALTER TABLE `t_eleve`
  ADD PRIMARY KEY (`CodeEleve`);

--
-- Index pour la table `t_enseignant`
--
ALTER TABLE `t_enseignant`
  ADD PRIMARY KEY (`CodeEnseignant`);

--
-- Index pour la table `t_paiement`
--
ALTER TABLE `t_paiement`
  ADD PRIMARY KEY (`CodePaiement`);

--
-- Index pour la table `t_personnel`
--
ALTER TABLE `t_personnel`
  ADD PRIMARY KEY (`CodePersonnel`);

--
-- Index pour la table `t_privilege`
--
ALTER TABLE `t_privilege`
  ADD PRIMARY KEY (`CodePrivilege`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `t_affectation_enseignant`
--
ALTER TABLE `t_affectation_enseignant`
  MODIFY `CodeAffectation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `t_annee`
--
ALTER TABLE `t_annee`
  MODIFY `CodeAnnee` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `t_classe`
--
ALTER TABLE `t_classe`
  MODIFY `CodeClasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `t_compte`
--
ALTER TABLE `t_compte`
  MODIFY `CodeCompte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `t_cotation`
--
ALTER TABLE `t_cotation`
  MODIFY `CodeCotation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `t_cours`
--
ALTER TABLE `t_cours`
  MODIFY `CodeCours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `t_eleve`
--
ALTER TABLE `t_eleve`
  MODIFY `CodeEleve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `t_enseignant`
--
ALTER TABLE `t_enseignant`
  MODIFY `CodeEnseignant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `t_paiement`
--
ALTER TABLE `t_paiement`
  MODIFY `CodePaiement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `t_personnel`
--
ALTER TABLE `t_personnel`
  MODIFY `CodePersonnel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `t_privilege`
--
ALTER TABLE `t_privilege`
  MODIFY `CodePrivilege` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
