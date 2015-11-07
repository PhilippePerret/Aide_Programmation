# Exemple de Stub

# Soit  un objet MonObjet
#       qui possède une méthode complexe `sa_methode'
#
# Je voudrais savoir si elle est appelée au cours du test,
# mais sans que son code soit vraiment exécuté.
#
# Je peux alors la stubber de cette façon :
#

# STUB
# Doit être placé dans un it, pas dans un before/describe/contexte etc.
# Redéfinit une MÉTHODE DE CLASSE
allow(MonObjet).to receive(:sa_methode){ "Retourne ça au lieu du test"}
# Redéfinit une MÉTHODE D'INSTANCE
allow_any_instance_of(MonObjet).to receive(:sa_method){ @in = "in ça" }

# `res' va contenir ce que j'ai mis entre accolades ci-dessus
# sans exécuter sa_methode
res = MonObjet::sa_methode

# Je peux tester, ça fonctionne
expect(res).to eq("Retourne ça au lieu du test") # => TRUE!

# Si par exemple ça n'est pas un retour de méthode qu'on peut tester, on 
# peut utiliser la tournure suivante :
it "test sans retour de méthode" do
  allow(MonObjet).to receive(:sa_methode){ @resultat = "La valeur est mises à ça"}
  # ... ici une méthode qui va appeler :sa_methode mais sans
  # ... en retourner le résultat
  expect(@resultat).to eq("La valeur est mises à ça")
end
