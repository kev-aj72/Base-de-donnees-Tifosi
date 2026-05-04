-- -----------------------------------------------------------------------------
-- PROJET TIFOSI - SCRIPT DE REQUETE
-- -----------------------------------------------------------------------------

-- 
-- Sélection base de données
--

USE tifosi;

-- -----------------------------------------------------------------------------
-- REQUETE N°1  : Afficher la liste des noms des focaccias 
--                par ordre alphabétique croissant 
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--        Américaine
--        Emmentalaccia
--        Gorgonzollaccia
--        Hawaienne
--        Mozaccia
--        Paysanne
--        Raclaccia
--        Tradizione
-- -----------------------------------------------------------------------------

    SELECT nom AS name_foccacia 
    FROM foccacia ORDER BY nom ASC;

-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--        Américaine
--        Emmentalaccia
--        Gorgonzollaccia
--        Hawaienne
--        Mozaccia
--        Paysanne
--        Raclaccia
--        Tradizione
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- REQUETE N°2  : Afficher le nombre total d'ingrédients, 
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--      25
-- -----------------------------------------------------------------------------

    SELECT COUNT(*) AS TotalIngredients 
    FROM ingredient;

-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--      25
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- REQUETE N°3  : Afficher le prix moyen des focaccias,
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--      10.375000
--      10.38
-- -----------------------------------------------------------------------------

    SELECT AVG(prix) AS AveragePrice 
    FROM foccacia;
    
   -- pour un resultat arrondie 

    SELECT ROUND(AVG(prix), 2) AS ApproxAvgPrice 
    FROM foccacia;
-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU

--      10.375000
--      10.38 
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- REQUETE N°4  : Afficher la liste des boissons 
--                avec leur marque, triée par nom de boisson
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--      Capri-sun                   Coca-cola
--      Coca-cola original          Coca-cola
--      Coca-cola zéro              Coca-cola
--      Eau de source               Cristalline
--      Fanta citron                Coca-cola
--      Fanta orange                Coca-cola
--      Lipton Peach                Pepsico
--      Lipton zéro citron          Pepsico
--      Monster energy ultra blue   Monster
--      Monster energy ultra gold   Monster
--      Pepsi                       Pepsico
--      Pepsi Max Zéro              Pepsico
--
-- -----------------------------------------------------------------------------

    SELECT b.nom, m.nom FROM boisson b 
    INNER JOIN marque m ON b.id_marque = m.id_marque 
    ORDER BY b.nom ASC;

-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--      Capri-sun                   Coca-cola
--      Coca-cola original          Coca-cola
--      Coca-cola zéro              Coca-cola
--      Eau de source               Cristalline
--      Fanta citron                Coca-cola
--      Fanta orange                Coca-cola
--      Lipton Peach                Pepsico
--      Lipton zéro citron          Pepsico
--      Monster energy ultra blue   Monster
--      Monster energy ultra gold   Monster
--      Pepsi                       Pepsico
--      Pepsi Max Zéro              Pepsico
--
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- REQUETE N°5  : Afficher la liste des ingrédients pour une Raclaccia
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--      Ail
--      Base Tomate
--      Champignon
--      Cresson
--      Parmesan
--      Poivre
--      Raclette
--
-- -----------------------------------------------------------------------------

    SELECT i.nom AS raclaccia FROM foccacia f 
    INNER JOIN comprend c ON f.id_foccacia = c.id_foccacia 
    INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient 
    WHERE f.nom = 'Raclaccia';


-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--      Ail
--      Base Tomate
--      Champignon
--      Cresson
--      Parmesan
--      Poivre
--      Raclette
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- REQUETE N°6  : Afficher le nom et le nombre d'ingrédients pour 
--                chaque foccacia
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--       Américaine       8
--       Emmentalaccia    7
--       Gorgonzollaccia  8
--       Hawaienne        9
--       Mozaccia         10
--       Paysanne         12
--       Raclaccia        7
--       Tradizione       9
--
-- -----------------------------------------------------------------------------

    SELECT f.nom , COUNT(c.id_ingredient) AS Nombres_Ingredients 
    FROM foccacia f 
    INNER JOIN comprend c ON f.id_foccacia = c.id_foccacia 
    GROUP BY f.id_foccacia, f.nom;


-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--        Américaine       8
--        Emmentalaccia    7
--        Gorgonzollaccia  8
--        Hawaienne        9
--        Mozaccia         10
--        Paysanne         12
--        Raclaccia        7
--        Tradizione       9
-- ----------------------------------------------------------------------------- 

-- -----------------------------------------------------------------------------
-- REQUETE N°7  : Afficher le nom de la focaccia qui a le plus d'ingrédients
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--     Paysanne     12   
--
-- -----------------------------------------------------------------------------

    SELECT f.nom , COUNT(c.id_ingredient) AS foccacia_ingredient
    FROM foccacia f
    INNER JOIN comprend c
    ON f.id_foccacia = c.id_foccacia
    GROUP BY f.id_foccacia, f.nom
    ORDER BY foccacia_ingredient DESC
    LIMIT 1;


-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--     Paysanne     12   
-- ----------------------------------------------------------------------------- 

-- -----------------------------------------------------------------------------
-- REQUETE N°8  : Afficher la liste des focaccia qui contiennent de l'ail
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--      Mozaccia
--      Gorgonzollaccia
--      Raclaccia
--      Paysanne  
-- -----------------------------------------------------------------------------

    SELECT f.nom AS Foccacia_avec_ail FROM foccacia f 
    INNER JOIN comprend c 
    ON f.id_foccacia = c.id_foccacia
    INNER JOIN ingredient i
    ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Ail';


-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--      Mozaccia
--      Gorgonzollaccia
--      Raclaccia
--      Paysanne  
-- ----------------------------------------------------------------------------- 

-- -----------------------------------------------------------------------------
-- REQUETE N°9  : Afficher la liste des ingrédients inutilisés
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--      Salami
--      Tomate cerise  
-- -----------------------------------------------------------------------------

    SELECT i.nom AS ingredient_non_utilise
    FROM ingredient i
    LEFT JOIN comprend c 
    ON i.id_ingredient = c.id_ingredient
    WHERE c.id_ingredient IS NULL;

-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--      Salami
--      Tomate cerise  
-- ----------------------------------------------------------------------------- 

-- -----------------------------------------------------------------------------
-- REQUETE N°10  : Afficher la liste des focaccia qui n'ont pas de champignons
-- -----------------------------------------------------------------------------
--   RESULTAT ATTENDU
--   
--      Américaine
--      Hawaienne 
-- -----------------------------------------------------------------------------

    SELECT f.nom AS foccacia_sans_champignons
    FROM foccacia f
    WHERE f.id_foccacia NOT IN (
    SELECT c.id_foccacia
    FROM comprend c
    INNER JOIN ingredient i
        ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
    );


-- -----------------------------------------------------------------------------
--   RESULTAT OBTENU
--   
--      Américaine
--      Hawaienne
-- ----------------------------------------------------------------------------- 
   