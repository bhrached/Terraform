  Projet Terraform avec Vagrant, Ansible, Jenkins, GitLab et WordPress

Projet Terraform avec Vagrant, Ansible, Jenkins, GitLab et WordPress
====================================================================

Description
-----------

Ce projet met en place une architecture composée de quatre machines virtuelles (VM) à l'aide de Vagrant, Ansible et Terraform. Les VM sont utilisées pour les services suivants :

*   **WordPress** - Serveur web avec CMS WordPress
*   **GitLab** - Serveur de gestion de versions Git
*   **Jenkins** - Serveur d'intégration continue (CI/CD)
*   **Ansible** - Serveur d'orchestration pour l'approvisionnement automatique
*   **Terraform** - VM dédiée pour exécuter les commandes Terraform

Prérequis
---------

*   [Vagrant](https://www.vagrantup.com/) (version 2.2+)
*   [VirtualBox](https://www.virtualbox.org/) (ou un autre fournisseur compatible)
*   [Terraform](https://www.terraform.io/) (version 1.5+)
*   [Ansible](https://www.ansible.com/)

Installation
------------

Suivez les étapes ci-dessous pour configurer et démarrer l'architecture :

### 1\. Cloner le projet

    git clone https://github.com/bhrached/Terraform.git

### 2\. Configurer les VM avec Vagrant

Le projet inclut un `Vagrantfile` pour chaque machine virtuelle, y compris une VM dédiée à Terraform.

Pour démarrer les machines WordPress, GitLab, Jenkins et Ansible, utilisez le Vagrantfile dans le répertoire `vagrant` :

    cd terraform/vagrant_terraform
    vagrant up

Cette commande créera et démarrera les machines virtuelles définies dans le `Vagrantfile`.

### 3\. Configurer et démarrer la VM dédiée à Terraform

Le projet inclut un `Vagrantfile` séparé pour la machine virtuelle dédiée à Terraform. Pour démarrer cette VM, suivez ces étapes :

    cd terraform/vagrant_terraform
    vagrant up

Cela va créer et provisionner une VM où Terraform sera installé automatiquement.

### 4\. Vérifier l'installation de Terraform

Une fois la VM démarrée, connectez-vous à la VM et vérifiez l'installation de Terraform :

    vagrant ssh terraform
    terraform version

Vous devriez voir la version de Terraform installée sur cette VM.

### 5\. Initialiser et appliquer les configurations Terraform

Pour exécuter les configurations Terraform, connectez-vous à la VM Terraform et exécutez les commandes suivantes :

    vagrant ssh terraform
    cd /vagrant/terraform
    Initialiser Terraform : terraform init
    Vérifier la configuration (facultatif) : terraform validate
    Planifier les modifications : terraform plan (ajouter l'option -out pour enrgistrer le plan exemple -out=tfplan)
    Appliquer les modifications : terraform apply (ajouter le nom du plan si vosu l'avez engistrer avec plan exemple : terraform apply tfplan)
    Vérifier l'état des ressources : terraform show
    Détruire l'infrastructure : terraform destroy

Cela va initialiser et appliquer la configuration définie dans le fichier `main.tf` situé dans le répertoire partagé `/vagrant/terraform` sur la VM Terraform.

Utilisation
-----------

Une fois l'infrastructure configurée et les services provisionnés :

*   Accédez à **WordPress** via l'URL : `http://wordpress.local`
*   Accédez à **GitLab** via l'URL : `http://gitlab.local`
*   Accédez à **Jenkins** via l'URL : `http://jenkins.local`

Commandes utiles
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