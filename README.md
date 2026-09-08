# Socle d'hebergement web Nordis

Projet Terraform sur Google Cloud Platform : mise en place du socle
d'hebergement d'une application web interne pour la societe Nordis,
entierement decrite en Terraform et versionnee dans Git.

## Convention de nommage

Toutes les ressources de la seance sont prefixees par `mc` (initiales de
Mael Crestin), afin d'eviter toute collision avec les ressources des
autres binomes sur le projet de formation partage.

Regle : `<prefixe>-<type-de-ressource>[-<numero>]`, toujours en
minuscules, sans accent, sans caractere souligne (tirets uniquement).

## Regle de pare-feu web
Le port 80 est ouvert a 0.0.0.0/0 car le service doit pouvoir etre
verifie depuis l'exterieur du reseau de formation (poste du formateur,
tests hors site).
