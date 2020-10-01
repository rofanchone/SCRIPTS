$users = Import-Csv -Path C:\Users\Administrateur\Documents\liste.csv -Delimiter ";"

foreach ($user in $users) {
$login = $user.login
New-Item C:\PRIVATE\$login -ItemType Directory
New-SmbShare -Name $login -Path C:\PRIVATE\$login -FullAccess $login
}