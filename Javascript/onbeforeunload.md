Permet de demander une confirmation de la fermeture de la page, avant sa fermeture.

Exemple :

    function confirmExit(evt)
    {
      if(Collection.modified)
      {
        F.error("Des données n'ont pas été enregistrées, veux-tu vraiment quitter la page ?")
    
        # Pour le moment, un bug dans Firefox empêche d'utiliser
        # ce message
        evt.returnValue = "Veux-tu vraiment quitter ?"
        return "Veux-tu vraiment quitter ?"
      }  
    }
    window.onbeforeunload = confirmExit
