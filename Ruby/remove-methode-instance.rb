# Détruire une méthode d'instance

MaClasse.instance_eval { undef :ma_methode } 

# Ajouter `rescue nil' au bout dans le cas où on n'est pas certain
# que la méthode existe vraiment.