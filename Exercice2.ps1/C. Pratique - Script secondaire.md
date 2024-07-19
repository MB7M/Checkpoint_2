Q.2.5 Le premier utilisateur du fichier Users.csv n'est jamais pris en compte.
Explique pourquoi et modifie le script pour que cela soit le cas.

Q.2.6 Le champs Descriptionest importé du fichier CSV mais n'est pas utilisé.
Explique pourquoi et modifie le code pour que ce champs soit utilisé dans la création des utilisateurs.

Q.2.7 Dans l'importation des utilisateurs du fichier CSV, tous les champs sont pris. Or il n'y en a qu'une partie qui est utilisé par la suite.
Corrige le script pour qu'il n'y ait que les champs utilisés pour la création des utilisateurs qui soient importés du fichier CSV.

Q.2.8 Le mot de passe crée n'est pas affiché, donc on ne le connait pas.
Modifie le script pour qu'il affiche avec une couleur verte "Le compte <Utilisateur> a été crée avec le mot de passe <MotDePasse>".

Q.2.9 Une fonction de création de log, nommée Log existe dans le fichier Functions.psm1.
Donne 2 façons d'utiliser cette fonction dans le script AddLocalUsers.ps1.
Modifie le script avec une des méthodes pour journaliser l'activité et les actions importantes avec cette fonction.

Q.2.10 Si l'utilisateur à créer existe déjà, il n'est pas crée, ce qui est normal (c'est comme ça que doit fonctionner le script). Or cette information n'est pas affichée, donc on ne le sait pas.
Modifie le script pour qu'un message affiche en rouge "Le compte <Utilisateur> existe déjà".

Q.2.11 L'ajout des utilisateurs dans le groupe des utilisateurs locaux ne fonctionne pas. Corrige le script pour que cela fonctionne.

Q.2.12 Plusieurs fois dans le code du scrip, la chaine "$Prenom.$Nom" est utilisée.
Pour simplifier la lecture du script, remplace la par une variable $Name.

Q.2.13 Les comptes utilisateurs créer ont un mot de passe qui expire.
Corrige le script pour que le mot de passe n'expire pas.

Q.2.14 Modifie le code pour que le mot de passe soit constitué de 12 caractères au lieu de 6.

Q.2.15 Le script a un temps d'attente de 10 secondes à la fin de l'exécution. Remplace ce temps par une pause gérable par un appuie sur la touche Entrée du clavier.

Q.2.16 À quoi sert la fonction ManageAccentsAndCapitalLetters ?
Donne un exemple à partir de la liste des utilisateurs.
