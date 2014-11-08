# Retour script

Par exemple lors de l'utilisation avec ruby :

err.rb
------

puts "monOut"
STDERR.puts "monErreur"

Appel du script
---------------
`./err.rb 2>&amp;1`

Retour
------
=> "monErreur\nmonOut\n"