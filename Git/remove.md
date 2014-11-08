#Suppression de files du dépôt

###Pour un fichier
Supprimer un fichier du repository, mais sans le supprimer en local :

    git rm --cached fichier

*Note&nbsp;: C'est l'option `--cached` ci-dessus qui fera que le fichier sera conservé en local.*

###Pour un dossier (et son contenu) :

    git rm --cached -r dossier

*Note&nbsp;: C'est l'option `-r` ci-dessus qui fera que tout le dossier `dossier` et son contenu sera retiré du dépôt.*