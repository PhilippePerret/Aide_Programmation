# Pour simuler un objet de méthode

obj = double()
allow(obj).to receive(:message){"Le retour de la méthode propre :message"}

# On pourra alors utiliser obj.message