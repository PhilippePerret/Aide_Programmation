=begin
Implicite conversion
--------------------

@method:        to_str
=end

class Path
  
  def initialize path
    @path = path
  end
  
  def to_str
    @path
  end
  
end

# Permet de faire :

mon_path = Path::new 'to/the/file.rb'

puts mon_path # => 'to/the/file.rb' (ok aussi avec to_s mais…)

filename = File.join("mon_dossier", mon_path)
# -> 'mon_dossier/to/the/file.rb'
# Alors que si seulement `to_s' était définie comme méthode d'instance
# ça produirait une erreur
