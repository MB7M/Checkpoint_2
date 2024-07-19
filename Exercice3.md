## B. Découverte du réseau

#### Q.3.1 Quel est le matériel réseau A ?

C'est un switch

#### Quel est son rôle sur ce schéma vis-à-vis des ordinateurs ?

Il permet de connecter les ordinateurs entre eux et les faire communiquer en LAN 

#### Q.3.2 Quel est le matériel réseau B ?

C'est un routeur  

#### Quel est son rôle pour le réseau 10.10.0.0/16 ?

Il permet de faire communiquer le réseau LAN 10.10.0.0/16 avec les réseaux externes

#### Q.3.3 Que signifie f0/0 et g1/0 sur l’élément B ?

* f0/0 c'est l'interface qui sert de passerelle par défaut pour les ordinateurs du 10.10.0.0/16, elle permet la communication vers les autres réseaux 
* g1/0 c'est une interface qui permet au routeur de se connecter au sous réseau 10.12.2.0/24 et donc permet de router les paquets entre le réseau 10.10.0.0/16 et le réseau 172.16.5.0/24 via le R2
  
#### Q.3.4 Pour l'ordinateur PC2, que représente /16 dans son adresse IP ?

C'est son masque de sous réseau qui peut se traduire par : l'ensemble des adresses ip entre 10.10.0.0 à 10.10.255.255 appartiennt au réseau 10.10.0.0/16
#### Q.3.5 Pour ce même ordinateur, que représente l'adresse 10.10.255.254 ?  

C'est sa gateway, sa passerelle par défaut utilisée pour accéder aux réseaux externes au sien.

## C. Etude théorique

### Q.3.6 

#### PC1 

- Adresse de réseau : 10.10.0.0
- Première adresse disponible : 10.10.0.1
- Dernière adresse disponible : 10.10.255.254
- Adresse de diffusion : 10.10.255.255

#### PC2 

- Adresse de réseau : 10.11.0.0
- Première adresse disponible : 10.11.0.1
- Dernière adresse disponible : 10.11.255.254
- Adresse de diffusion : 10.11.255.255

#### PC5 

- Adresse de réseau : 10.10.0.0
- Première adresse disponible : 10.10.0.1
- Dernière adresse disponible : 10.11.255.254
- Adresse de diffusion : 10.11.255.255

### Q.3.7

- PC1 (10.10.4.1/16) et PC3 (10.10.80.3/16) peuvent communiquer entre eux car ils sont sur le même sous-réseau 10.10.0.0/16.
- PC5 (10.10.4.7/15) peut communiquer avec PC1 (10.10.4.1/16) et PC3 (10.10.80.3/16) car ils sont tous sur le sous-réseau 10.10.0.0/15.

### Q.3.8 

L'ensembe des pc connectés via le switch au routeur B, qui fait le routage vers le R2, peuvent communiquer avec le réseau 172.16.5.0/24

### Q.3.9

Aucune incidence puisqu'ils sont sur un switch qui, par défaut ne prend pas les adresses IP mais mac pour acheminer les données entre les ports

### Q.3.10

On peut rajouter un serveur DHCP à ce schéma, lui attribuer une IP statique, configurer les scopes pour chaque sous réseau, configurer les routeurs pour permettrent la communicatuib des machines vers le serveur et configurer les pc clients pour utiliser le DHCP

## D. Etude théorique  

### Fichier 1
#### Q.3.11 


- Adresse MAC source : 00:50:79:66:68:00
- Nom du matériel : PC1 avec l'adresse IP 10.10.4.1 (schéma réseau dernier exo), il initie la requête ICMP vers l'adresse IP 10.10.4.2.

#### Q.3.12 

La communication a réussi entre PC1 (10.10.4.1) et PC4 (10.10.4.2), les paquets de requête ICMP envoyés par 10.10.4.1 ont reçu des réponses de 10.10.4.2.

#### Q.3.13 


Request =  Nom : PC1  
Adresse IP : 10.10.4.1
Adresse MAC : 00:50:79:66:68:00  

Reply =    Nom : PC4  

Adresse IP : 10.10.4.2
Adresse MAC : 00:50:79:66:68:03

#### Q.3.14 

Protocol ARP qui sert à mapper une adresse IP à une adresse MAC

#### Q.3.15 Quels ont été les rôles des matériels A et B dans cette communication ?

Selon le schéma réseau précédent :   
Matériel A = Switch, il a permet à PC1 d'envoyer des paquets au PC4 via leurs adresses MAC
Matériel B = routeur, il s'agit ici d'une communication en LAN pas besoin de routeur  

### Fichier 2 :

### Q.3.16

Adresse IP source : 10.10.80.3  
Nom du matériel : PC3

### Q.3.17 

Protocol ICMP utilisé pour vérifier la connectivité réseau en envoyant des ping

### Q.3.18   

La communication n'a pas réussi car, Les paquets "Destination Unreachable" sont envoyés par l'adresse 10.10.255.254 (le routeur B), indiquant que l'hôte 10.11.80.2 n'a pas répondu.

### Q.3.19   

Le paquet n° 2 signifie que le routeur B (10.10.255.254) informe le PC3, (10.10.80.3) que l'hôte PC2 (10.11.80.2) n'est pas accessible.

### Q.3.20   

Matériel A = Switch, il a permet à PC3 d'envoyer des paquets au routeur B sa passerelle par défaut  

Matériel B = routeur, a tenté de transmettre les paquets ICMP du PC3 vers PC2

### Fichier 3 :

### Q.3.21  

- Source :  

Nom du matériel : PC4
Adresse IP : 10.10.4.2  

- Destination :

Nom du matériel : Routeur R2 (interface g2/0)
Adresse IP : 172.16.5.253

### Q.3.22   

- Adresse MAC source : ca:01:da:d2:00:1c
- Adresse MAC destination : ca:03:9e:ef:00:38
- **Déduction** : La trame a été capturée à un point où elle est transmise du PC4 vers le routeur R2

### Q.3.23

- La communication a été enregistrée sur le réseau local (LAN) entre PC4 (10.10.4.2) et le routeur R2 (interface g2/0 avec l'adresse IP 172.16.5.253).



