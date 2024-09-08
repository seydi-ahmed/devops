#!/bin/bash

# Vérifier si result.txt existe et ajouter un retour à la ligne s'il n'est pas vide et ne se termine pas par une nouvelle ligne
if [ -s result.txt ] && [ "$(tail -c 1 result.txt)" != "" ]; then
  echo "" >> result.txt
fi

# Lire le fichier songs.txt et extraire les chansons des artistes commençant par J
grep -E '"[^"]*" - J' songs.txt >> result.txt
