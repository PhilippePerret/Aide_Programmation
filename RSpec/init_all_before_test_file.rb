=begin
Ce bout de code permet d'initialiser toutes les variables de classe avant de
jouer chaque fiche de test (fichier).
Pour éviter les problèmes qui surviennent souvent lorsqu'un fichier définit une variable de classe et que l'autre fichier en a besoin, mais initialisé ou différente.

Cas typique :

  class << self
    def data
      @data ||= begin
        File.read(DATA_FILE)
      end
    end
    ...
  end

Le premier fichier appelle `data'. Donc la variable de classe (pseudo-instance) `@data' est définie.
Le deuxième fichier, avant de commencer, doit modifier le fichier DATA_FILE. Il le modifie et fait appel à `data'. Mais comme `@data' a été instancié par le fichier de test précédent, ce sont les données précédentes qui sont renvoyées.

Il faut donc, avant chaque fichier de test, initialiser `@data' (le remettre à nil) pour forcer le programme à relire le fichier DATA_FILE.

C'est l'objet de ce bout de code.

=end


  config.before :all do |x|

    ##
    #
    # Réinitialiser toutes les variables de classe des objets
    #
    #
    #
    
    ## Ici, toutes mes constantes correspondent à des dossier contenus
    ## dans `./ruby/_objets/'. Je passe donc en revue ces dossiers pour
    ## connaitre le nom des constantes
    ##
    Dir['./ruby/_objets/**'].each do |path|
      
      ## Si ce n'est pas un dossier, ça ne peut pas être une
      ## constante-class dans le programme.
      ##
      next unless File.directory? path
      
      ## Le nom du dossier correspond exactement au nom de
      ## la classe.
      ## On transforme le nom en symbole, car la liste des
      ## constantes contient des symboles.
      ##
      objet_name = File.basename(path).to_sym
      
      ## On passe les constantes qui ne sont pas définies
      ##
      next unless Object.constants.include? objet_name
      
      ## On récupère la constante dans le programme
      ##
      objet = Object.const_get(objet_name)
      
      ## On passe en revue toutes ses variables pour les
      ## remettre à nil
      ##
      objet.instance_variables.each do |var|
        objet.instance_variable_set("#{var}", nil)
      end
    end
    
  end

  ##
  #
  # Exemple avec une liste de constantes définies en dur
  #
  
  config.before :all do |x|
  
    [MaConstante, MonAutreConstante. EtUneAutre].each do |con|
      con.instance_variables.each do |ivar| con.instance_variable_set("#{ivar}", nil) end
    end
    
  end
