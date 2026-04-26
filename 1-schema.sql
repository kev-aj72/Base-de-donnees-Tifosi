-- -----------------------------------------------------------------------------
-- PROJET TIFOSI - SCRIPT DE CREATION
-- -----------------------------------------------------------------------------


--
-- Suppression + création base de données : `tifosi`
--

DROP DATABASE IF EXISTS tifosi;

CREATE DATABASE IF NOT EXISTS tifosi
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_bin;



-- -----------------------------------------------------------------------------

--
-- Création de l'utilisateur et attribution des droits
--

DROP USER IF EXISTS 'tifosi'@'localhost';

CREATE USER 'tifosi'@'localhost' 
IDENTIFIED BY 'TifosiBaseDeDonnee?';

GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';

FLUSH PRIVILEGES;

-- -----------------------------------------------------------------------------
--
-- Sélection base de données
--

 USE tifosi;

-- -----------------------------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR (50) NOT NULL,

  PRIMARY KEY (`id_ingredient`),
  UNIQUE KEY ingredient_nom (nom)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table des ingredients';

-- -----------------------------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE IF NOT EXISTS `marque` (
  `id_marque` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,

  PRIMARY KEY (`id_marque`),
  UNIQUE KEY marque_nom (nom)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table des marques';

-- -----------------------------------------------------------------------------

--
-- Structure de la table `foccacia`
--

CREATE TABLE IF NOT EXISTS `foccacia` (
  `id_foccacia` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  `prix` DECIMAL(5,2) NOT NULL,

  PRIMARY KEY (`id_foccacia`),
  UNIQUE KEY foccacia_nom (nom),
  CONSTRAINT foccacia_prix CHECK (prix > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table des foccacia';

-- -----------------------------------------------------------------------------

--
-- Structure de la table `boisson`
--

CREATE TABLE IF NOT EXISTS `boisson` (
  `id_boisson` INT NOT NULL AUTO_INCREMENT,
  `id_marque` INT NOT NULL,
  `nom` VARCHAR(50) NOT NULL,

  PRIMARY KEY (`id_boisson`),
  UNIQUE KEY boisson_nom (nom),
  
  CONSTRAINT fk_boisson_marque
        FOREIGN KEY (id_marque) REFERENCES marque (id_marque)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table des boissons';

-- -----------------------------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `code_postal` INT NOT NULL,

  PRIMARY KEY (`id_client`),
  UNIQUE KEY `email_unique` (`email`),
  CONSTRAINT ck_client_cp CHECK (code_postal BETWEEN 1000 AND 99999)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table des clients';

-- -----------------------------------------------------------------------------


--
-- Structure de la table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` INT NOT NULL AUTO_INCREMENT,
  `id_foccacia` INT NOT NULL,
  `nom` VARCHAR(50) NOT NULL,
  `prix` DECIMAL(5,2) NOT NULL,

  PRIMARY KEY (`id_menu`),
  CONSTRAINT ck_menu_prix CHECK (prix > 0),

  CONSTRAINT fk_menu_foccacia
      FOREIGN KEY (id_foccacia) REFERENCES foccacia (id_foccacia)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table des menus';


-- -----------------------------------------------------------------------------



-- -----------------------------------------------------------------------------
-- Tables pivots pour relation n-m
-- -----------------------------------------------------------------------------

--
-- Structure de la table `comprend`
--

CREATE TABLE IF NOT EXISTS `comprend` (
  `id_foccacia` INT NOT NULL,
  `id_ingredient` INT NOT NULL,
  `quantite` INT NOT NULL,

  PRIMARY KEY (`id_foccacia`, `id_ingredient`),
  CONSTRAINT ck_quantite CHECK (quantite > 0),

  CONSTRAINT fk_fi_foccacia
      FOREIGN KEY (id_foccacia) REFERENCES foccacia (id_foccacia)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,

  CONSTRAINT fk_fi_ingredient
      FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table des comprend (relation entre ingredient et foccacia)';

-- -----------------------------------------------------------------------------

--
-- Structure de la table `contient`
--

CREATE TABLE IF NOT EXISTS `contient` (
  `id_menu` INT NOT NULL,
  `id_boisson` INT NOT NULL,

  PRIMARY KEY (`id_menu`,`id_boisson`),

  CONSTRAINT fk_mb_menu
      FOREIGN KEY (id_menu) REFERENCES menu (id_menu)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,

  CONSTRAINT fk_mb_boisson
      FOREIGN KEY (id_boisson) REFERENCES boisson (id_boisson)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table contient (lien entre table menu et table boisson)';

-- -----------------------------------------------------------------------------

-- 
-- Structure de la table `achete`
--

CREATE TABLE IF NOT EXISTS `achete` (
  `id_achete` INT NOT NULL AUTO_INCREMENT,
  `id_client` INT NOT NULL,
  `id_menu` INT NOT NULL,
  `date_achat` DATE NOT NULL DEFAULT CURRENT_DATE,

  PRIMARY KEY (`id_achete`),

  CONSTRAINT fk_achat_client
      FOREIGN KEY (id_client) REFERENCES client (id_client)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,

    CONSTRAINT fk_achat_menu
      FOREIGN KEY (id_menu) REFERENCES menu (id_menu)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table des achete (relation entre client et menu)';

-- -----------------------------------------------------------------------------
