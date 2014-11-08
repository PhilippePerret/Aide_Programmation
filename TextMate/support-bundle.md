# Utilisation du dossier “Support” d'un bundle

Résumé&nbsp;: pour pouvoir utiliser les mêmes éléments sur plusieurs commandes/snippet, le mieux est de les mettre dans le bundle lui-même. Cela consiste à créer un dossier `Support` dans le bundle.

    # * Terminal
    open ./Library
    
    # * Finder
    # Rejoindre ./Library/Application Support/Avian/Bundles
    
    # -> Ouvrir le paquet
    # Menu contextuel : Afficher le contenu du paquet
    
    # -> Créer un dossier de nom `Support`
    
    # -> Y placer les fichiers "librairie"
    
###Utilisation de ces fichiers

Ensuite, dans les commandes et autres snippets, il suffit de faire quelque chose comme&nbsp;:

    require "#{ENV['TM_BUNDLE_SUPPORT']}/<path/in/support/folder>"

… pour utiliser les fichiers.
