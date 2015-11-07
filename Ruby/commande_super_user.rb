# Requérir les données super-administrateur
# Elles sont enregistrées dans un fichier ~/.su.rb

path_data_su = File.join(Dir.home, '.su.rb')
require path_data_su # => SU_DATA

# Et ensuite on peut faire par exemple :

` echo "#{SU_DATA[:password]} | sudo -S <commande su>"`