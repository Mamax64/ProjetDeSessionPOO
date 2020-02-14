# Projet De Session POO Avancée : Etude du langage Dart
Code source de mon projet de principes avancés de programmation orientée object dans le cadre de mon échange Académique à l'UQAM

Instructions d'installation de Dart :

Exécuter :
sudo apt-get install apt-transport-https

Si Curl pas installé : 
sudo apt-get install curl

Puis :
sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'

Puis 
sudo apt-get update && sudo apt-get install dart -y


Instructions d'éxécution :

Une fois dans le répertoire contenant le fichier que vous voulez compiler ->
dart *nomdufichier.dart* 
(exemple : dart tp2.dart)
