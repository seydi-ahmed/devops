#!/bin/bash

# 1. Créer le répertoire ~/myBins s'il n'existe pas
if [ ! -d "$HOME/myBins" ]; then
    mkdir -p "$HOME/myBins"
    echo "Directory $HOME/myBins created."
fi

# 2. Ajouter ~/myBins au PATH si ce n'est pas déjà fait
if [[ ":$PATH:" != *":$HOME/myBins:"* ]]; then
    echo "Adding $HOME/myBins to PATH."
    export PATH="$HOME/myBins:$PATH"
    
    # Ajouter au fichier .bashrc pour rendre permanent (ou .bash_profile si sur Mac)
    if [ -f "$HOME/.bashrc" ]; then
        echo 'export PATH="$HOME/myBins:$PATH"' >> "$HOME/.bashrc"
    elif [ -f "$HOME/.bash_profile" ]; then
        echo 'export PATH="$HOME/myBins:$PATH"' >> "$HOME/.bash_profile"
    fi
fi

# 3. Vérifier si le fichier 01exec est déjà dans ~/myBins
if [ -f "$HOME/myBins/01exec" ]; then
    echo "Binary 01exec already exists in $HOME/myBins."
else
    # Copier un exemple de binaire dans ~/myBins (optionnel : remplacer cette étape par votre propre binaire)
    echo '#!/bin/bash' > "$HOME/myBins/01exec"
    echo 'echo "Hello 01 Scripting Pool"' >> "$HOME/myBins/01exec"
    chmod +x "$HOME/myBins/01exec"
    echo "Binary 01exec created and made executable."
fi

echo "You can now run 01exec from any directory."
