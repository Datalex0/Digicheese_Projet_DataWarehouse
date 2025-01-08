# Digicheese - Projet DataWarehouse


## Projet :
Ce projet concerne la mise en oeuvre d'un DataWarehouse pour la fromagerie Digicheese.

##  Collaborateurs :mortar_board: :
- Anne-Laure LEMAITRE
- David MEAUX
- Alexis MURAIL

## Listes des fichiers:
- [README](README.md)
- [Script_SQL](Script_SQL.sql)
- [Script_ETL](Script_ETL)
- [Etape de création du DWH et connexion à PBI](Etape de création du DWH et connexion à PBI.pdf)
- [Organisation des tables](Organisation des tables dans Power Query.pdf)
- [Modèle de données](Modèle de données.png)
- [Dashboard](Dashboard.pdf)
- [Calcul_DAX](Calcul_DAX)
- [RAPPORT](RAPPORT)

## Résumé du déroulement du projet
Dans le cadre de ce projet, j'ai utilisé phpMyAdmin afin de créer la base de données MySQL à l'aide du dump qui a été fourni.
J'ai tout d'abord importé l'ensemble des tables contenues dans la base à l'aide des scripts fournis dans le dump (les étapes sont détaillées dans le document [Étapes de création du DWH et connexion à PBI](Étape de création du DWH et connexion à PBI.pdf)).
Une fois les tables chargées, j'ai créé la table de faits, qui correspond à une union de la table des commandes et de la table des détails de commande. J'ai choisi de n'inclure que ces deux tables (sans ajouter la table des clients, des objets et des communes dans la table de faits) afin de séparer les caractéristiques des données de la table de faits dans les tables de dimension. En procédant ainsi, je pouvais concevoir un modèle en étoile ou en flocon de neige dans mon data warehouse et dans Power Query.

Dans le cas présent, nous avons les caractéristiques des données qui sont très détaillés et segmentées. Par exemple, la table de dimension des objets est associée à la table portant sur le conditionnement. Compte tenu de ces éléments, j’ai ainsi opté pour un modèle en flocon de neige.
Ce type de modèle a été choisi pour les raisons suivantes : 
-	Organisation des données
-	Normalisation des données (pour éviter de la redondance)
-	Si besoin, je peux réaliser une mise à jour des données de façon plus centralisée sans avoir à modifier plusieurs copies de la même donnée. 


Une fois le DWH créé, j’ai connecté Power BI à MySQL Server. Les données de l’ensemble des tables se sont ainsi chargées au sein de l’interface Power Query. J’ai choisi de charger toutes les tables, puis de passer en inactives celles qui ne seront pas utiles à la réalisation des lots demandés. De cette façon, ces données restent disponibles dans Power Query en cas de besoin pour les évolutions futures, mais ne sont pas chargées dans le modèle.
Concernant l’ETL, celui-ci m’a permis de vérifier la qualité des données (en excluant, par exemple, des colonnes contenant de nombreuses cellules vides), de les nettoyer (en supprimant, par exemple, des erreurs) et de réaliser des jointures si nécessaire (par exemple, entre la table commune et la table des départements, ce qui me permettait d’inclure la colonne relative aux départements sans avoir besoin d’ajouter une table dans le modèle et donc de l’alourdir). Enfin, j’ai procédé à des modifications dans les noms des colonnes afin de faciliter les étapes de calculs et les futures visualisations demandées.

