=begin

Pour Exécuter un code ruby sur serveur distant.

Notes les "\\" avant les guillemets.

=end

res = `ssh serveur_icare "ruby -e \\"STDOUT.write File.stat('#{path_distant}').mtime.to_i\\""`
