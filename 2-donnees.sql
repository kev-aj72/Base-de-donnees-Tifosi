-- -----------------------------------------------------------------------------
-- PROJET TIFOSI - SCRIPT DE DONNEES
-- -----------------------------------------------------------------------------

-- 
-- Sélection base de données
--

USE tifosi;

--
-- Insertion des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id_ingredient`, `nom`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base Crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

-- -----------------------------------------------------------------------------

--
-- Insertion des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom`) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- -----------------------------------------------------------------------------

--
-- Insertion des données de la table `foccacia`
--

INSERT INTO `foccacia` (`id_foccacia`, `nom`, `prix`) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- -----------------------------------------------------------------------------

--
-- Insertion des données de la table `boisson`
--

INSERT INTO `boisson` (`id_boisson`, `id_marque`, `nom`) VALUES
(1, 1, 'Coca-cola zéro'),
(2, 1, 'Coca-cola original'),
(3, 1, 'Fanta citron'),
(4, 1, 'Fanta orange'),
(5, 1, 'Capri-sun'),
(6, 4, 'Pepsi'),
(7, 4, 'Pepsi Max Zéro'),
(8, 4, 'Lipton zéro citron'),
(9, 4, 'Lipton Peach'),
(10, 3, 'Monster energy ultra gold'),
(11, 3, 'Monster energy ultra blue'),
(12, 2, 'Eau de source');

-- -----------------------------------------------------------------------------


--
-- Insertion des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `email`, `code_postal`) VALUES
(1, 'John Doe', 'johndoe@gmail.com', 93000),
(2, 'Jane Doe', 'janedoe@gmail.com', 93000);

-- -----------------------------------------------------------------------------

--
-- Insertion des données de la table `comprend`
--
-- Quantités en grammes.
-- Valeurs par défaut :
--   Ail:2, Ananas:40, Artichaut:20, Bacon:80, Base Tomate:200,
--   Base crème:200, Champignon:40, Chevre:50, Cresson:20,
--   Emmental:50, Gorgonzola:50, Jambon cuit:80, Jambon fumé:80,
--   Oeuf:50, Oignon:20, Olive noire:20, Olive verte:20,
--   Parmesan:50, Piment:2, Poivre:1, Pomme de terre:80,
--   Raclette:50, Mozarella:50


INSERT INTO `comprend` (`id_foccacia`, `id_ingredient`, `quantite`) VALUES

    -- Mozaccia : Base Tomate, Mozarella, Cresson, Jambon fumé, Ail,
    --            Artichaut, Champignon, Parmesan, Poivre, Olive noire
        (1,  5, 200), (1, 25, 50), (1,  9, 20), (1, 13, 80), (1,  1,  2),
        (1,  3,  20), (1,  7, 40), (1, 18, 50), (1, 20,  1), (1, 16, 20),

    -- Gorgonzollaccia : Base Tomate, Gorgonzola, Cresson, Ail,
    --                   Champignon, Parmesan, Poivre, Olive noire
        (2, 5, 200), (2, 11, 50), (2, 9, 20), (2, 1, 2),
        (2, 7, 40), (2, 18, 50), (2, 20, 1), (2, 16, 20),

    -- Raclaccia : Base Tomate, Raclette, Cresson, Ail,
    --             Champignon, Parmesan, Poivre
        (3, 5, 200), (3, 22, 50), (3, 9, 20), (3, 1, 2),
        (3, 7, 40), (3, 18, 50), (3, 20, 1),
    -- Emmentalaccia : Base crème, Emmental, Cresson, Champignon,
    --                 Parmesan, Poivre, Oignon
        (4, 6, 200), (4, 10, 50), (4, 9, 20), (4, 7, 40),
        (4, 18, 50), (4, 20, 1), (4, 15, 20),
    -- Tradizione : Base Tomate, Mozarella, Cresson, Jambon cuit,
    --              Champignon(80), Parmesan, Poivre, Olive noire(10), Olive verte(10)
        (5, 5, 200), (5, 25, 50), (5, 9, 20), (5, 12, 80), (5, 7, 80),
        (5, 18, 50), (5, 20, 1), (5, 16, 10), (5, 17, 10),
    -- Hawaienne : Base Tomate, Mozarella, Cresson, Bacon,
    --             Ananas, Piment, Parmesan, Poivre, Olive noire
        (6, 5, 200), (6, 25, 50), (6, 9, 20), (6, 4, 80), (6, 2, 40),
        (6, 19, 2), (6, 18, 50), (6, 20, 1), (6, 16, 20),
    -- Américaine : Base Tomate, Mozarella, Cresson, Bacon,
    --              Pomme de terre(40), Parmesan, Poivre, Olive noire
        (7, 5, 200), (7, 25, 50), (7, 9, 20), (7, 4, 80),
        (7, 21, 40), (7, 18, 50), (7, 20, 1), (7, 16, 20),
    -- Paysanne : Base crème, Chevre, Cresson, Pomme de terre,Jambon fumé,Ail,
    --              Artichaut, Champignon, Parmesan, Poivre, Olive noire, Oeuf
        (8, 6, 200), (8, 8, 50), (8, 9, 20), (8, 21, 80), (8, 13, 80), (8, 1, 2),
        (8, 3, 20), (8, 7, 40), (8, 18, 50), (8, 20, 1), (8, 16, 20), (8, 14, 50);

-- -----------------------------------------------------------------------------

--
-- Déchargement des données de la table `menu`
-- Boisson au choix pour les menus a 2.70
--

INSERT INTO `menu` (`id_menu`, `id_foccacia`, `nom`, `prix`) VALUES
(1, 1, 'Foccacia Mozaccia Seul', 9.80),
(2, 1, 'Foccacia Mozaccia + Boisson au choix', 12.50),
(3, 2, 'Foccacia Gorgonzollaccia Seul', 10.80),
(4, 2, 'Foccacia Gorgonzollaccia + Boisson au choix', 13.50),
(5, 3, 'Foccacia Raclaccia Seul', 8.90),
(6, 3, 'Foccacia Raclaccia + Boisson au choix', 11.60),
(7, 4, 'Foccacia Emmentalaccia Seul', 9.80),
(8, 4, 'Foccacia Emmentalaccia + Boisson au choix', 12.50),
(9, 5, 'Foccacia Tradizione Seul', 8.90),
(10, 5, 'Foccacia Tradizione + Boisson au choix', 11.60),
(11, 6, 'Foccacia Hawaienne Seul', 11.20),
(12, 6, 'Foccacia Hawaienne + Boisson au choix', 13.90),
(13, 7, 'Foccacia Américaine Seul', 10.80),
(14, 7, 'Foccacia Américaine + Boisson au choix', 13.50),
(15, 8, 'Foccacia Paysanne Seul', 12.80),
(16, 8, 'Foccacia Paysanne + Boisson au choix', 15.50);

-- -----------------------------------------------------------------------------

--
-- Déchargement des données de la table `contient`
-- Lien entre les menus + boisson 
-- Pour que toute les boisson soit lier avec tous les menus
--

INSERT INTO `contient` (`id_menu`, `id_boisson`) VALUES

-- Foccacia Mozaccia + Boisson au choix
    (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6),
    (2, 7), (2, 8), (2, 9), (2, 10), (2, 11), (2, 12),

-- Foccacia Gorgonzollaccia + Boisson au choix
    (4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6),
    (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12),

-- Foccacia Raclaccia + Boisson au choix
    (6, 1), (6, 2), (6, 3), (6, 4), (6, 5), (6, 6),
    (6, 7), (6, 8), (6, 9), (6, 10), (6, 11), (6, 12),

-- Foccacia Emmentalaccia + Boisson au choix
    (8, 1), (8, 2), (8, 3), (8, 4), (8, 5), (8, 6),
    (8, 7), (8, 8), (8, 9), (8, 10), (8, 11), (8, 12),

-- Foccacia Tradizione + Boisson au choix
    (10, 1), (10, 2), (10, 3), (10, 4), (10, 5), (10, 6),
    (10, 7), (10, 8), (10, 9), (10, 10), (10, 11), (10, 12),

-- Foccacia Hawaienne + Boisson au choix
    (12, 1), (12, 2), (12, 3), (12, 4), (12, 5), (12, 6),
    (12, 7), (12, 8), (12, 9), (12, 10), (12, 11), (12, 12),

-- Foccacia Américaine + Boisson au choix
    (14, 1), (14, 2), (14, 3), (14, 4), (14, 5), (14, 6),
    (14, 7), (14, 8), (14, 9), (14, 10), (14, 11), (14, 12),

-- Foccacia Paysanne + Boisson au choix
    (16, 1), (16, 2), (16, 3), (16, 4), (16, 5), (16, 6),
    (16, 7), (16, 8), (16, 9), (16, 10), (16, 11), (16, 12);