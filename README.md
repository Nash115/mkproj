# mkproj

![Bash](https://img.shields.io/badge/Shell-Bash-green)
![Platform](https://img.shields.io/badge/Platform-Linux-blue)
![GitHub](https://img.shields.io/badge/GitHub-CLI%20required-black)

`mkproj` est un petit utilitaire Bash pour créer rapidement un projet avec un dossier, initialiser un dépôt Git, et préparer l’environnement de travail sur Linux.

> [!WARNING]
> Pour que ce script fonctionne il vous faudra avoir installé et configuré GitHub CLI (gh)

## 📦 Installation

1) Clonez le repo :

```bash
git clone https://github.com/Dymbor/mkproj.git
```

2) Ajouter la fonction au shell

Ouvrez le fichier `~/.bashrc` avec un éditeur de texte : 

```bash
nano ~/.bashrc
```
Puis copiez-collez le contenu du fichier `mkproj.sh` à la fin du fichier.

3) Rechargez votre configuration : 

```bash
source ~/.bashrc
```

## 🚀 Utilisation

```bash
mkproj nom_du_projet [option]
```

**Exemple :**

```bash
mkproj demo -python
```

## 📁 Comportement

Si aucune option n'est donnée, la commande : 

- Crée le répertoire `~/Documents/Github/nom_du_projet`
- Initialise un dépôt Git
- Crée un `README.md`
- Effectue le commit initial
- Crée un dépôt privé sur GitHub et push le projet


## ⚙️ Options 

- `-python` : ajoute un `.gitignore`pour Python
- `-c` : crée une arboresence adapté à un projet en C (`src/`,`header/`,`main.c`)
- `-h`,`--help` : affiche la documentation


## 💡 Améliorations possibles

- Ajouter d'autres templates (Node.js, React…)
- Rendre le projet installable automatiquement
- Ajouter des options pour configurer le repo (public/privé)

## 🤝 Contribution

Les contributions sont les bienvenues !
N'hésitez pas à ouvrir une issue ou une pull request.


## 📄 Licence

Ce projet est distribué sous licence MIT.  
Vous êtes libre de l'utiliser, le modifier et le distribuer.  
Voir le fichier `LICENSE` pour plus d'informations.
