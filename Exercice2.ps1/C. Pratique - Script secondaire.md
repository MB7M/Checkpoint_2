#### Q.2.5 Le premier utilisateur du fichier Users.csv n'est jamais pris en compte.

C'est à cause de la ligne 27 partie Select-Object -Skip 2, qui saute les deux premiéres lignes du fichier CSV  

Correction : 
```powershell
$Users = Import-Csv -Path $CsvFile -Delimiter ";" | Select-Object -Skip 1
```

#### Q.2.6 Le champs Description est importé du fichier CSV mais n'est pas utilisé.

Il n'est pas utilisé car n'a pas été ajouté dans la définition de $UserInfo ligne 39  

Correction   

```powershell
$Description = "$($User.description) - $($User.fonction)"
$UserInfo = @{
    Name              = "$Prenom.$Nom"
    FullName          = "$Prenom $Nom"
    Password          = $Password
    Description       = $Description
    PasswordNeverExpires = $false
}
```



#### Q.2.7 Dans l'importation des utilisateurs du fichier CSV, tous les champs sont pris. Or il n'y en a qu'une partie qui est utilisé par la suite.

Modification de la ligne 27 d'importation CSV pour ne garder que les champs utilisés (Prenom, nom, fonction, description).  

Correction

```powershell
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom", "nom", "fonction", "description" -Encoding UTF8 | Select-Object -Skip 1
```

#### Q.2.8 Le mot de passe crée n'est pas affiché, donc on ne le connait pas.
Modifie le script pour qu'il affiche avec une couleur verte "Le compte <Utilisateur> a été crée avec le mot de passe <MotDePasse>".  

modification de la ligne 48 à 50 partie création d'utilisateur et ajout dans un groupe  

```powershell
New-LocalUser @UserInfo
Add-LocalGroupMember -Group "Utilisateur" -Member $Name

# Afficher le mot de passe en vert
Write-Host "L'utilisateur $Name a été créé avec le mot de passe : $Password" -ForegroundColor Green
```

Q.2.9 Une fonction de création de log, nommée Log existe dans le fichier Functions.psm1.
Donne 2 façons d'utiliser cette fonction dans le script AddLocalUsers.ps1.

Méthode 1 : Importer le module Functions.psm1  
En Ajoutant la ligne suivante au début du script

```powershell
Import-Module -Name C:\Scripts\Functions.psm1
```
Ensuite  

Utiliser la fonction Log pour journaliser les actions importantes

```powershell
Log -FilePath "C:\Scripts\AddLocalUsers.log" -Content "L'utilisateur $Name a été créé avec le mot de passe : $Password"
Log -FilePath "C:\Scripts\AddLocalUsers.log" -Content "Le compte $Name existe déjà"
```
Méthode 2 : Définir directement la fonction Log dans le script  
Copier la définition de la fonction Log directement dans le script

```powershell
Function Log {
    param([string]$FilePath, [string]$Content)
    
    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath)) {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }
    
    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date; $User; $Content"
    
    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}

```

Q.2.10 Si l'utilisateur à créer existe déjà, il n'est pas crée, ce qui est normal (c'est comme ça que doit fonctionner le script). Or cette information n'est pas affichée, donc on ne le sait pas.

Correction du script dans la partie création d'utilisateur:
```powershell
    Write-Host "Le compte $Name existe déjà" -ForegroundColor Red
```
Q.2.11 L'ajout des utilisateurs dans le groupe des utilisateurs locaux ne fonctionne pas. Corrige le script pour que cela fonctionne.

correction de -Group "utilisateurs" en "Users"

```powershell
Add-LocalGroupMember -Group "Users" -Member $Name
```

Q.2.12 Plusieurs fois dans le code du scrip, la chaine "$Prenom.$Nom" est utilisée.
Pour simplifier la lecture du script, remplace la par une variable $Name.

ajout de la variable $Name dans le script

```powershell
$Name = "$Prenom.$Nom"
```

Q.2.13 Les comptes utilisateurs créer ont un mot de passe qui expire.
Corrige le script pour que le mot de passe n'expire pas.

Correction de la partie $Userinfo, PasswordNeverExpires de false à true

```powershell
$UserInfo = @{
    Name                 = $Name
    FullName             = "$Prenom $Nom"
    Password             = $SecurePassword
    AccountNeverExpires  = $true
    Description          = $Description
    PasswordNeverExpires = $true
}
```
Q.2.14 Modifie le code pour que le mot de passe soit constitué de 12 caractères au lieu de 6.

Correction de la function Random-Password ($Length) de 6 à 12

```powershell
Function Random-Password ($length = 12) {
   ...
}

```

Q.2.15 Le script a un temps d'attente de 10 secondes à la fin de l'exécution. Remplace ce temps par une pause gérable par un appuie sur la touche Entrée du clavier.

Correction avec l'ajout de la commande Read-Host
```powershell
Read-Host "Appuyez sur Entrée pour continuer..."
```


Q.2.16 À quoi sert la fonction ManageAccentsAndCapitalLetters ?
Donne un exemple à partir de la liste des utilisateurs.

la fonction :

```powershell
Function ManageAccentsAndCapitalLetters {
    param ([String]$String)

    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    Return $StringWithoutAccentAndCapitalLetters
}
```

Elle remplace les accents :  
La fonction utilise des expressions régulières pour remplacer les lettres accentuées par leurs équivalents sans accents  

Elle convertit en minuscules : Après avoir remplacé les accents, la fonction convertit toute la chaîne en minuscules pour assurer une uniformité

par exemple pour l'utilisateur : Styrbjörn Colin 

Prénom : "Styrbjörn" -> "styrbjorn"
Nom : "Colin" (pas de changement)

