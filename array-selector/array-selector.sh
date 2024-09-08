#!/bin/bash

# Déclarer le tableau
colors=("red" "blue" "green" "white" "black")

# Vérifier qu'il y a exactement un argument
if [ $# -ne 1 ]; then
    echo "Error"
    exit 1
fi

# Vérifier que l'argument est un nombre
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error"
    exit 1
fi

# Vérifier que le nombre est dans la plage des indices du tableau
index=$(($1 - 1))  # Le premier argument (1) correspond à l'index 0

if [ $index -lt 0 ] || [ $index -ge ${#colors[@]} ]; then
    echo "Error"
    exit 1
fi

# Afficher l'élément correspondant dans le tableau
echo ${colors[$index]}
