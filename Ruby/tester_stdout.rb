=begin

Tester la sortie STDOUT sans fermer le flux

=end

# On définit un fichier dans lequel sera enregistré
# le code de sortie
tmpoutput = 'to/the/page'

# On crée un descripteur de fichier
fd = IO.sysopen(tmpoutput, "w") # => Fixnum

# On détourne la sortie
$stdout = IO.new( fd ,"w")

# On écrit un texte à tester
puts "Ceci sera le texte à tester"

# On vide le tampon
$stdout.flush

# On peut lire ce qui a été enregistré dans le fichier
code = File.open('tmpoutput').read

# On détruit le fichier, c'est mieux
File.unlink (tmpoutput)

# On redéfinit la sortie normale
$stdout = STDOUT
