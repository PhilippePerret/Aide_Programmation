#Path de ruby courant

Pour éviter le `env: ruby: Not a directory` ou autre charmant message.

* `$ which ruby` en console pour récupérer la version courante
* Éditer les préférences (CMD+,)
* Mettre `TM_RUBY` à la valeur which ruby
* Ajouter le DOSSIER du which ruby dans PATH
* Redémarrer TextMate.

##Exemple

    $ which ruby
    # => /Users/philippeperret/.rvm/rubies/ruby-2.0.0-p353/bin/ruby
    
Dans préférences de TextMate :

    PATH    : ...:/Users/philippeperret/.rvm/rubies/ruby-2.0.0-p353/bin
    ...
    TM_RUBY : /Users/philippeperret/.rvm/rubies/ruby-2.0.0-p353/bin/ruby