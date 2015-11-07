# Pour lire le contenu d'un fichier

```coffee

    fs = require('fs')
    path = require('path')
    
    properties: null

    # Une méthode qui va lire un fichier `properties.json` se trouvant au-dessus
    # du dossier courant, qui va parser son contenu en JSON et le mettre dans
    # la propriété global @properties

    loadProperties: ->
      fs.readFile path.resolve(__dirname, '..', 'properties.json'), (error, content) =>
        return if error
      
      @properties = JSON.parse(content)
      

```