#domaine de l'environnement test: beg14.priv#
Import-Module ActiveDirectory
Import-Module 'Microsoft.PowerShell.Security'
$users = Import-Csv -Path C:\SCRIPT_DATA\COMPTE\liste_salaries_beg_avec_chemin.csv -Delimiter ";"

#Au cas où les OU ne sont pas créer#
#New-ADOrganizationalUnit -Name "Direction" -Path "dc=beg14,dc=priv"
#New-ADOrganizationalUnit -Name "Architecte" -Path "dc=beg14,dc=priv"
#New-ADOrganizationalUnit -Name "Commercial" -Path "dc=beg14,dc=priv"
#New-ADOrganizationalUnit -Name "Service Informatique" -Path "dc=beg14,dc=priv"

$lettrelecteur = "U:"
$totalcompte = 119
$comptecree = 0

foreach ($user in $users) {
    try {
    $pwd = $user.mdp
    $login = $user.login
    $ou = $user.service
    $nom = $user.nom
    $prenom = $user.prenom
    $mail = $user.mail
    $tel = $user.tel
    $chemindossier = $user.chemin
    $profil = $user.profil

    New-ADUser -name "$prenom $nom" -GivenName "$prenom" -UserPrincipalName "$login" -SamAccountName $login -EmailAddress $mail -OfficePhone $tel -path "OU=$ou,DC=beg14,DC=priv" -HomeDrive $lettrelecteur -HomeDirectory $chemindossier -ProfilePath $profil -AccountPassword(ConvertTo-SecureString "$pwd" -AsPlainText -Force) -Enabled $true
    $comptecree = $comptecree + 1
    Write-Output "le compte $nom $prenom a été crée"
    } catch {
    Write-Output "Compte $nom $prenom non crée"
    }
}
Write-Output "----------------------------------------"
Write-Output "il y a $comptecree comptes qui ont été créer sur $totalcompte"