=begin

Dans le Terminal, il suffit de faire :

  $ mate path/to/the/file

… pour ouvrir un fichier dans TextMate.

Si la commande doit être utilisée dans un fichier ruby qui ne 
charge pas les profile et autres fichiers de définition, il
faut utiliser le code :
=end

`/usr/local/bin/mate "#{path_to_file}"`
