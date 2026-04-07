mkproj () {
        if [ -z "$1" ]; then #on verifie qu'un nom de projet a bien ete passer en parametre
                echo -e "\033[1;31mErreur de syntaxe : le nom ne peut pas etre vide\033[0m"
                echo "Usage : mkproj nom_du_projet [option]"
                echo "Tapper mkproj -h ou --help pour afficher l'aide"
                return 1
        fi

        #on verifie la presence de GitHub CLI (pour pouvoir push sur le repo plus tard)
        if ! command -v gh &> /dev/null; then
                echo -e "\033[1;31mErreur : GitHub CLI (gh) n'est pas installé\033[0m"
                return 1
        fi

        #affichage de l'aide
        if [[ "$1" == "--help" || "$1" == "-h" ]]; then
                echo "mkproj : creer un depot local Git et le pousse sur Github"
                echo ""
                echo "Syntaxe : mkproj nom_du_projet [options]"
                echo ""
                echo "Options :"
                echo " -python          Cree un gitignore pour un projet python"
                echo " -c               Cree des dossier src/ et header/ ainsi qu'un main.c"
                echo " --help ou -h     Affiche ce message d'aide"
                echo ""
                echo "Exemple : mkproj mon-projet -python"
                return 0
        fi

        #gestion des entree
        project_name="$1"
        shift
        options=("$@") #permet de recuperer toute les autres option dans un tableau

        #on verfie que le dossier n'existe pas déja
        if [ -d ~/Documents/Github/"$project_name" ]; then
                read -p "Le dossier existe déjà. Voulez vous l'écraser ? (o/n) : " yn
                [[ "$yn" != "o" ]] && return
        fi

        mkdir -p ~/Documents/Github/"$project_name" #creation du dossier
        echo -e "\033[1;34mCreation du dossier dans ~/Documents/Github/$project_name\033[0m"
        cd ~/Documents/Github/"$project_name" || return #on essaye de rentrer dans le dossier et si pas possible on coupe la fonction

        git init
        git branch -M main
        echo -e "\033[1;32mDepot Git local initialisé\033[0m"

        echo "# $project_name" > README.md
        echo -e "\033[1;32mREADME.md créé\033[0m"

        for opt in "${options[@]}"; do
                case "$opt" in
                        -python)
                                cat > .gitignore <<EOF
__pycache__/
*.pyc
venv/
.env
*.log
EOF
                                echo -e "\033[1;32m.gitignore python ajouté\033[0m"
                                ;;
                        -c)
                                mkdir src header
                                echo -e "\033[1;32mDossier src/ et header/ créés\033[0m"
                                touch main.c
                                echo -e "\033[1;32mFichier main.c creer\033[0m"
                                ;;
                        *)
                                echo -e "\033[1;33mOption inconnue : $opt\033[0m"
                esac
        done

        git add .
        git commit -m "Initial commit"

        gh repo create $project_name --private --source=. --push

        echo -e "\033[1;32mCreation du repo Github\033[0m"

        echo -e "\033[1;36mProjet $project_name intialisé et prêt 🚀\033[0m"
}

