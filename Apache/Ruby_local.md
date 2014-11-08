Pour permettre à un script ruby de tourner en local, il faut&nbsp;:

Qu'il se trouve au moins dans un sous-dossier de `~/Sites/`

S'il se trouve dans `~/Sites/ruby/...` ou dans `~/Sites/AlwaysData/…` il n'y a rien à faire, il doit être lancé.

Si un nouveau dossier doit supporter ruby, il faut l'ajouter au fichier `/etc/apache2/httpd.conf` en ajoutant le code (à l'emplacement où on trouve déjà des définitions similaires)&nbsp;:

*(C'est PATH/TO/NEW/FOLDER ci-dessous qui doit être renseigné)*

<Directory "/Users/philippeperret/Sites/PATH/TO/NEW/FOLDER">
	Options +ExecCGI
	AddHandler cgi-script .rb
</Directory>

Noter qu'il faut rendre le premier script exécutable (+ permissions 0775 ? ou 0755 ?)
