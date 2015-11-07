# Pour ne jouer qu'un ou plusieurs tests

Dans la configuration :

    config.filter_run :focus => true

Dans les feuilles de test&nbsp;:

    describe "mon test focussé" do
      it "ne joue que celui-là", focus: true do
        ...
      end
    end
    
    feature "Un test d'intégration" do
      scenario "Ce scénario seulement", focus: true do
        ...
      end
    end