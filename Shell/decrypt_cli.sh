#!/bin/bash

echo "Mot de passe:";
read -s password;

gpg --batch --passphrase $password $@ && rm $@ && echo "Le fichier a été déchiffré avec succès !" || echo "Une erreur c'est produite durant le déchiffrement. Merci de vérifier votre mot de passe."
unset password
