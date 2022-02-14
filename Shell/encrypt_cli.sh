#!/bin/bash

echo "Mot de passe:";
read -s firstpassword;

echo "Confirmation du mot de passe:";
read -s secondpassword;

if [ $firstpassword == $secondpassword ]; then \
	gpg --symmetric --cipher-algo AES256 --quiet --batch --passphrase $firstpassword $@ && shred -zu "$@" && echo "Le fichier a été chiffré et supprimé avec succès !" || \
	echo "Une erreur c'est produite !"

unset firstpassword
unset secondpassword
else
	unset firstpassword
	unset secondpassword
	echo "Les mots de passes ne correspondent pas !"
fi
