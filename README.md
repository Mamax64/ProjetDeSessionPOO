# ProjetDeSessionPOO
Codes sources de mon projet de POO dans le cadre de mon échange Académique à l'UQAM

Instructions d'Exécution :

Exécuter :
sudo apt-get install apt-transport-https

Si Curl pas installé : 
sudo apt-get install curl

Puis :
sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'

Puis 
sudo apt-get update
sudo apt-get install dart