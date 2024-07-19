Write-Host "--- Début du script ---"

# Fonction pour générer un mot de passe aléatoire et modification de $lenght pour un mdp de 12 caractéres
Function Random-Password ($length = 12) {
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122
    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

# Fonction pour gérer les accents et les lettres majuscules
Function ManageAccentsAndCapitalLetters {
    param ([String]$String)
    
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

# Fonction pour journaliser les activités
Function Log { 
    param([string]$FilePath, [string]$Content)

    # Vérifie si le fichier existe sinon le crée
    If (-not (Test-Path -Path $FilePath)) {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine ="$Date; $User; $Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

# Importer uniquement les champs nécessaires et correction -Skip pour la prise en compte du 1er utilisateur
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","fonction","description" -Encoding UTF8 | Select-Object -Skip 1

foreach ($User in $Users) {
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.nom
    $Name = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Name" -ErrorAction SilentlyContinue)) {
        $Pass = Random-Password
        $Password = (ConvertTo-SecureString $Pass -AsPlainText -Force)
        $Description = "$($User.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Name"
            FullName             = "$Prenom $Nom"
            Password             = $Password
            AccountNeverExpires  = $true
            # Ajout du champ Description
            Description          = $Description
            # s'assurer que le mdp n'expire pas
            PasswordNeverExpires = $true
        }

        New-LocalUser @UserInfo
        # Correction du groupe local à "Utilisateurs"
        Add-LocalGroupMember -Group "Utilisateurs" -Member "$Name"
        # Affiche mdp en vert
        Write-Host "Le compte $Name a été créé avec le mot de passe $Pass" -ForegroundColor Green
        
        # Journaliser la création de l'utilisateur
        $logContent = "Utilisateur $Name créé avec le mot de passe $Pass"
        Log -FilePath $LogFile -Content $logContent
    } else {
        # Affiche un message en rouge si l'utilisateur existe déjà
        Write-Host "Le compte $Name existe déjà" -ForegroundColor Red
        
        # Journaliser l'existence de l'utilisateur
        $logContent = "Utilisateur $Name existe déjà"
        Log -FilePath $LogFile -Content $logContent
    }
}

Write-Host "--- Fin du script ---"
# Remplacement du délai de 10 secondes par un choix utilisateur
Read-Host -Prompt "Appuyez sur Entrée pour continuer"
