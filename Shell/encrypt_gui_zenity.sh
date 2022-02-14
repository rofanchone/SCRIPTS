#!/bin/bash

firstpassword="$(zenity --password --title="Mot de passe")"
secondpassword="$(zenity --password --title="Confirmation du mot de passe")"

if [ $firstpassword == $secondpassword ]; then \
	gpg --symmetric --cipher-algo AES256 --quiet --batch --passphrase $firstpassword $@ && shred -zu "$@" && zenity --info --text "Le fichier a été chiffré et supprimé avec succès !" || \
	zenity --error --text "Une erreur c'est produite !" \
	--title "Erreur"
unset firstpassword
unset secondpassword
else
	unset firstpassword
	unset secondpassword
	zenity --error --text"Les mots de passes ne correspondent pas !" \
		--title "Erreur"
fi
