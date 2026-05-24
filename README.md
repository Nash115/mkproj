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

2) Configuration minimale

Ouvrez le fichier `~/.bashrc` avec un éditeur de texte : 

```bash
nano ~/.bashrc
```

Ajoutez mkproj à votre fichier `~/.bashrc` (ou `~/.zshrc`) :

```bash
source "/chemin/vers/mkproj/mkproj.sh"
```

3) Rechargez votre configuration : 

```bash
source ~/.bashrc
```

## ⚙️ Configuration

Le répertoire dans lequel les projets sont créés est contrôlé par la variable d'environnement `MKPROJ_DIR` (par défaut, si elle n'est pas définie, les projets seront créés dans `~/Documents/Github/`).

Pour le modifier :

```bash
# Dans ~/.zshrc ou ~/.bashrc avant de sourcer mkproj.sh
export MKPROJ_DIR="$HOME/mes-projets"
```

## 🚀 Utilisation

```bash
mkproj nom_du_projet [options]
```

**Exemples :**

```bash
mkproj demo
mkproj demo --gitignore=Python
mkproj demo --gitignore=C -c
```

## 📁 Comportement

Si aucune option n'est donnée, la commande :

- Crée le répertoire `$MKPROJ_DIR/nom_du_projet`
- Initialise un dépôt Git
- Crée un `README.md`
- Effectue le commit initial
- Crée un dépôt privé sur GitHub et push le projet

## ⚙️ Options

| Option | Description |
|--------|-------------|
| `--gitignore=<lang>` | Récupère un `.gitignore` depuis GitHub pour le langage donné (ex: `Python`, `C`,...) |
| `-c` | Crée une arborescence pour un projet C (`src/`, `header/`, `main.c`) |
| `-h`, `--help` | Affiche la documentation |

> Templates gitignore disponibles : `gh api /gitignore/templates`

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
