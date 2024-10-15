### Énoncé de Projet : Application Mobile de Gestion de Points

#### Contexte
Ce projet vise à développer une application mobile locale pour les enseignants, afin de gérer les points des étudiants dans leurs cours. L'application n'utilisera ni API, ni JSON, ni accès distant. Tout sera stocké localement dans une base de données SQLite.

#### Objectif
L'application doit permettre à un professeur de créer des cours, d'y associer des étudiants et des évaluations, ainsi que de gérer les notes de manière flexible et intuitive. Le calcul des moyennes et l'encodage des notes seront arrondis au 0,5 près.

#### Fonctionnalités Principales

##### 1. **Gestion des Cours**
- **Création de cours** : L'utilisateur peut créer plusieurs cours dans l'application.
- **Étudiants associés** : Chaque cours appartient à un bloc. Chaque étudiant est inscrit dans un seul bloc (ex BA1, BA2, ...). Tous les étudiants d'un bloc sont inscrits à tous les cours du bloc dans lequel il est inscrit. Chaque étudiant est identifié par un matricule, un nom et un prénom.
- **Évaluations** : Chaque cours inclut des évaluations, définies sur 20 points par défaut. Les évaluations peuvent comporter des sous-évaluations. Chaque évaluation (ou sous-évaluation) a un **nom** et un **nombre de points maximum**. Les évaluations sont pondérées par leur maximum pour calculer la moyenne (ex. : une évaluation sur 20 points compte deux fois plus qu'une évaluation sur 10 points dans la même évaluation parente).

##### 2. **Gestion des Notes**
- **Encodage des notes** : Les notes peuvent être encodées avec des décimales à 0,5 près.
- **Arrondi automatique** : Toutes les notes calculées sont arrondies automatiquement et visuellement à 0,5 près, mais elles sont sauvegardées au centième (0,01) près (pour avantager les étudiants).
- **Calcul des moyennes** : La moyenne générale des étudiants est calculée en tenant compte des pondérations, avec arrondi à 0,5 près.
- **Forcer la moyenne** : L'utilisateur peut forcer la moyenne d'un étudiant dans une évaluation E à une valeur précise (ex. : pour compenser une erreur de calcul). Les notes des sous-évaluations de l'évaluation E ne sont touchées mais le calcul de la moyenne de l'évaluation parente de l'évaluation E prend en compte la note forcée. 

##### 3. **Interface Utilisateur**
- L'interface utilisateur doit être simple et intuitive, avec des vues claires et des interactions fluides.

##### 4. **Base de Données Locale**
- **Stockage local** : Toutes les données sont stockées dans une base de données locale SQLite. Aucune connexion à une API ou à des services distants n'est nécessaire.
- **Base de données récursive** : Les cours, étudiants, évaluations et sous-évaluations sont organisés de manière à faciliter les requêtes et le traitement des données.

#### Contraintes Techniques
- **Android** : L'application doit être développée pour Android en Java ou en Kotlin.
- **Pas de modification après la création d'une évaluation** : Pour simplifier le projet, une fois une évaluation créée, on ne peut plus la modifier (ni son nom, ni son maximum de points, ni ses sous-évaluations). On peut cependant ajouter des notes, les modifier ou les supprimer.
- **Fragments** : L'interface sera gérée via des activités, des fragments, des morceaux de layouts XML, ... Choisissez la meilleure approche pour réduire le code et augmenter la réutilisation (beaucoup d'écrans se ressemblent : on peut refactoriser). Pensez à bien gérer la navigation entre les écrans (gérez donc correctement le back button).
- **Architecture** : Utilisez une architecture MVC (ou MVVM) pour structurer le code et faciliter la maintenance et l'évolution de l'application. Séparez bien les responsabilités entre les classes et les composants.
- **Polymorphisme** : Utilisez le polymorphisme pour gérer les différentes évaluations et sous-évaluations de manière générique. Si vous mettez en place une bonne hiérarchie de classes, vous allez gagner énormément de temps pour la gestion des points.
- **Bibliothèques** : N'hésitez pas à utiliser des bibliothèques tierces pour faciliter le développement. 
