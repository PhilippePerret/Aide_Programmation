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
allow(MonObjet).to receive(:sa_methode){ "Retourne ça au lieu du test"}

# `res' va contenir ce que j'ai mis entre accolades ci-dessus
# sans exécuter sa_methode
res = MonObjet::sa_methode

# Je peux tester, ça fonctionne
expect(res).to eq("Retourne ça au lieu du test") # => TRUE!
