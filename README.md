# Déploiement d'une VM Ansible avec Terraform et Vagrant

Ce projet utilise **Terraform** et **Vagrant** pour automatiser le déploiement d'une machine virtuelle pré-configurée pour Ansible. Grâce à cette configuration, vous pouvez facilement mettre en place un environnement de développement ou de test pour gérer et déployer des applications à l'aide d'Ansible.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé les outils suivants sur votre machine :

- [Terraform](https://www.terraform.io/downloads.html)
- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

- vérifiez l'installation de Terraform : terraform version 

## Structure du Projet

- **`main.tf`** : Fichier de configuration Terraform pour définir la machine virtuelle et les ressources associées.
- **`.gitignore`** : Fichier pour ignorer les fichiers et répertoires temporaires et sensibles, tels que les fichiers d'état de Terraform.
- **`Vagrantfile`** : Fichier de configuration Vagrant pour définir les propriétés de la machine virtuelle.

## Installation et Utilisation

Pour exécuter les configurations Terraform exécutez les commandes suivantes :

    cd terraform
    Initialiser Terraform : terraform init
    Vérifier la configuration (facultatif) : terraform validate
    Planifier les modifications : terraform plan (ajouter l'option -out pour enrgistrer le plan exemple -out=tfplan)
    Appliquer les modifications : terraform apply (ajouter le nom du plan si vosu l'avez engistrer avec plan exemple : terraform apply tfplan)
    Supprimer un plan : rm tfplan
    Vérifier l'état des ressources : terraform show
    Détruire l'infrastructure : terraform destroy

Cela va initialiser et appliquer la configuration définie dans le fichier `main.tf`

## Commandes utiles pour manipuler vagrant
----------------

*   **Lister l'état des VMs** : `vagrant status`
*   **Arrêter les VMs** : `vagrant halt`
*   **Détruire les VMs** : `vagrant destroy`
*   **Créer un snapshot** : `vagrant snapshot save`
*   **Restaurer un snapshot** : `vagrant snapshot restore`

## Contribution

Les contributions sont les bienvenues ! Veuillez forker le dépôt et soumettre une pull request avec vos modifications.

<h2>Auteur</h2>
<p>Ce projet a été développé par bhrached.</p>
<h2>Licence</h2>
<p>Ce projet est sous licence MIT.</p>