# Tester une sortie dans les tests

it "produit le texte en sortie" do
  expect{ puts "du texte" }.to output("du texte\n").to_stdout_from_any_process
end

# Pour faire une recherche par match :

it "produit le texte en sortie" do
  expect{ puts "du texte" }.to output(/tex/).to_stdout_from_any_process
end

# On peut faire aussi une méthode plus pratique :

def output_contains expected, &block
  expect{ yield }.to output(/#{expected}/).to_stdout_from_any_process
end

# Une méthode qui retourne le code généré par le code `&blk`
# dans $stdout
# @usage:     code_output = capture_output{ <le code> }
# @exemple:   mon_message = capture_output{ print "Bonjour le monde !" }
def capture_output(&blk)
  old_stdout = $stdout
  $stdout = fake_stdout = StringIO.new
  blk.call
  fake_stdout.string
ensure
  $stdout = old_stdout
end


# Parfois (par exemple avec STDOUT.write/puts) la sortie se fait dans
# STDOUT et non pas $stdout. Malheureusement, on ne peut pas mettre le
# même genre de code que pour $stdout puisqu'on ne peut pas définir une
# constante dans une méthode. Donc il faut utiliser :
before :all do
  old_stdout = STDOUT
  STDOUT  = fake_STDOUT = StringIO::new
  @ht.output
  @code = fake.string
  STDOUT = old_stdout
end