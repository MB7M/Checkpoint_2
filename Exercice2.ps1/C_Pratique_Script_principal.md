### Q.2.2 

A l'éxécution le script le script essaye de lancer un autre script powershell "AddLocalUsers.ps1" en ouvrant un autre terminal mais ça ne fonctionne pas

Correction du script pour qu'il lance correctement le script AddLocalUsers.ps1 : 

Le chemin du fichier passé en -ArgumentList était incorrect "C:\Temp\AddLocalUsers.ps1"  

J'ai donc modifié le script pour qu'il aille chercher le script dans le bon dossier

Script Corrigé :
```powershell
Start-Process -FilePath "powershell. exe" -ArgumentList "C:\Scripts\AddLocalUsers. ps1" -Verb RunAs -WindowStyle Maximized
```
### Q.2.3 

Elle est liée à la commande start-process pour lancer le process avec les priviléges administratifs

### Q.2.4 

Elle est liée à la commande start-process pour lancer le process avec la fenêtre maximisée
