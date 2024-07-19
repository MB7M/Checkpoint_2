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
