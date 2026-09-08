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

## Architecture
Projet Google Cloud (single-portal-506523-n0)
Reseau VPC personnalise (mc-vpc)
Sous-reseau europe-west1, acces prive Google actif (mc-subnet-web, 10.10.0.0/24)
mc-web-1, etiquettes web et ssh
mc-web-2, etiquettes web et ssh
mc-fw-allow-iap-ssh : port 22 depuis 35.235.240.0/20 (IAP)
mc-fw-allow-web : port 80 vers les machines etiquetees web
mc-web-sa, compte de service dedie porte par les deux machines
mc-artifacts-single-portal-506523-n0, bucket versionne et non public
mc-tfstate-single-portal-506523-n0, bucket d'etat versionne et protege

## Variables d'entree

### socle/
| Variable | Type | Defaut | Role |
|---|---|---|---|
| project_id | string | (obligatoire) | Projet Google Cloud cible |
| region | string | europe-west1 | Region de toutes les ressources |
| prefix | string | mc | Prefixe de nommage |

### infra/
| Variable | Type | Defaut | Role |
|---|---|---|---|
| project_id | string | (obligatoire) | Projet Google Cloud cible |
| region | string | europe-west1 | Region de toutes les ressources |
| prefix | string | mc | Prefixe de nommage |
| environment | string | dev | dev, test ou prod uniquement |
| machine_type | string | e2-small | Gabarit des machines web |
| machine_count | number | 2 | Nombre de machines web |

## Procedure de deploiement

```bash
cd socle && terraform init && terraform apply
cd ../infra && terraform init && terraform apply
# puis, une fois le bucket d'etat cree par le socle :
cp backend.tf.example backend.tf   # ou l'ecrire directement, voir infra/backend.tf
terraform init -migrate-state
```

## Sorties Terraform obtenues

artifacts_bucket_name = "mc-artifacts-single-portal-506523-n0"
service_account_email = "mc-web-sa@single-portal-506523-n0.iam.gserviceaccount.com"
web_public_ips = [
"34.77.91.14",
"34.156.93.182",
]

