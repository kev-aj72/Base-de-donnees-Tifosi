## README – Base de données Tifosi

--Description du projet
Ce projet contient une base de données MySQL nommée tifosi destinée à gérer une pizzeria spécialisée dans les focaccias.


## Le projet est composé de 3 scripts SQL :

--01_structure.sql:
Création de la base de données, de l'utilisateur et des tables.

--02_donnees.sql:
Insertion des données (ingrédients, focaccias, boissons, menus, clients).

--03_requetes.sql:
Requêtes SQL permettant d'interroger la base de données.

## Informations de connexion
Hôte        : localhost

Base        : tifosi

Utilisateur : tifosi

Mot de passe: TifosiPassword!

Port        : 3306 (par défaut)

## Contenu de la base de données
--La base tifosi contient les tables suivantes :

ingredient   -> Liste des ingrédients

marque       -> Marques des boissons

foccacia     -> Liste des focaccias

boisson      -> Liste des boissons

client       -> Clients

menu         -> Menus disponibles

comprend     -> Relation entre focaccia et ingrédients

contient     -> Relation entre menu et boissons

achete       -> Relation entre client et menu

## Relations principales :
foccacia  ---< comprend >--- ingredient

menu      ---< contient >--- boisson

client    ---< achete >--- menu

boisson   ---> marque

menu      ---> foccacia

## Importation avec phpMyAdmin

Ouvrir phpMyAdmin

Cliquer sur Importer

## Importer les fichiers dans cet ordre :
--01_structure.sql

--02_donnees.sql

--03_requetes.sql (optionnel)

Vérifier que la base tifosi apparaît dans la liste.



## Importation avec MySQL (ligne de commande)

Ouvrir un terminal puis se connecter à MySQL :

mysql -u root -p

Entrer le mot de passe root.

Exécuter les scripts dans cet ordre :

SOURCE 01_structure.sql;

SOURCE 02_donnees.sql;

SOURCE 03_requetes.sql;

## Utilisation après import

Se connecter avec l'utilisateur du projet :

mysql -u tifosi -p

Mot de passe :

TifosiBaseDeDonnee?

Sélectionner la base :

USE tifosi;

## Ordre des scripts

Toujours exécuter dans cet ordre :

01_structure.sql  

02_donnees.sql  

03_requetes.sql (optionnel)