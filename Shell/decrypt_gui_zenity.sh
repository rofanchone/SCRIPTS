#!/bin/bash

password="$(zenity --password --title="Mot de passe")"
gpg --batch --passphrase $password $@ && rm $@ && zenity --info --text "Le fichier à été déchiffé avec succès !" || \
zenity --error \
--text "Une erreur c'est produite durant le déchiffrement. Merci de vérifier votre mot de passe." \
--title "Erreur"
unset password
