#!/usr/bin/env ruby -wU
=begin

  Pour afficher toute sorte de boite de dialogue avec les commandes de bundles

Les types (premier argument)
    fileselect, 
    filesave, 
    msgbox, 
    yesno-msgbox, 
    ok-msgbox,
    textbox, 
    progressbar, 
    inputbox, 
    standard-inputbox,
    secure-inputbox, 
    secure-standard-inputbox
    dropdown, 
    standard-dropdown, 
    bubble

Code type du code ruby de la commande (sauf barre de progression) :

    #!/usr/bin/env ruby -wU
    CMD = (ENV['TM_SUPPORT_PATH'] +
          '/bin/CocoaDialog.app/Contents/MacOS/CocoaDialog').gsub(/ /, "\\ ")
    args = [
            <définition des arguments de la boite cf. ci-dessous>
            ]
    cmd = "#{CMD} #{args.join(' ')}"
    u_reponse = %x{#{cmd}}
    u_reponse = u_reponse.split("\n")
    # u_reponse contient la liste des retours cf. ci-dessous suivant la boite

=end
# Documentation : http://cocoadialog.sourceforge.net/documentation.html
CMD = (ENV['TM_SUPPORT_PATH'] +
'/bin/CocoaDialog.app/Contents/MacOS/CocoaDialog').gsub(/ /, "\\ ")

# # Pour une boite avec bouton OK
# args = [
#   'ok-msgbox',
#   # '--no-cancel', # Pas de bouton Cancel
#   '--title "Titre de la boite"',
#   '--text "Texte affiché dans la boite."',
#   '2>/dev/null'
# ]
# cmd = "#{CMD} #{args.join(' ')}"
# u_reponse = %x{#{cmd}}
#
# # === Pour une boite avec 3 boutons customisés ===
# styles = [:warning, :informational, :critical]
# args = [
#   'msgbox',
#   '--alertStyle warning', # un des "styles" ci-dessus
#   '--title "Titre de la boite"',
#   '--text "Texte dans la boite"',
#   '--informative-text "Texte affiché dans la boite."',
#   '--button1 "Bonjour" --button2 "Au revoir" --button3 "Adieu"',
#   '--string-output', # retourne le nom du bouton au lieu du numéro 0-start
#   '2>/dev/null'
# ]
# cmd = "#{CMD} #{args.join(' ')}"
# u_reponse = %x{#{cmd}}

#
# # === Pour une boite BUBBLE (Message sans interaction) ===
# args = [
#   'bubble',
#   '--timeout 4', # Nombre secondes avant fermeture
#   # '--no-timeout', # Pas de timeout
#   '--alpha 0.5', # transparence
#   '--x-placement left', # ou right / center
#   '--y-placement top', # ou bottom / center
#   '--title "Titre de la boite bubble"',
#   '--text "Texte dans la boite bubble"',
#   '--icon cocoadialog',
#   # ou voir : http://mstratman.github.io/cocoadialog/#icons
#   # '--icon-file /path/to/icns', # incompatible avec --icon
#   '--text-color "FFFFFF"',
#   '--background-top "000000"',
#   '--background-bottom "555555"',
#   '--border-color "CCCCCC"',
#   '--informative-text "Texte affiché dans la boite."',
#   '--string-output', # retourne le nom du bouton au lieu du numéro 0-start
#   '2>/dev/null'
# ]
# cmd = "#{CMD} #{args.join(' ')}"
# u_reponse = %x{#{cmd}}


# === Pour une barre de progression ===
# require 'rubygems'
# require 'open4' # pourtant, je l'ai, mais ne marche pas
require 'open3'
args = [
  'progressbar',
  '--percent 0', # pourcentage initial
  # '‑‑indeterminate', # une barre qui "tourne" sur elle-même
  '--float', # flottante au-dessus de tout
  '--stoppable', # un bouton stop 
  '--title "Une barre de progression"',
  '--text "Texte initial de la progress bar"',
  '2>/dev/null'
]
cmd = "#{CMD} #{args.join(' ')}"
u_reponse = `#{cmd}`
stdin, wait_threads = Open3.pipeline_w(cmd)
stdin.puts "stop enable" # pour faire apparaitre le bouton stop NE FONCTIONNE PAS
sleep 1
stdin.puts '10 update 1'
sleep 1
stdin.puts '20 update 2'
sleep 1
# don't wanna write all that!
(3..10).each {|i| stdin.puts "#{i}0 update #{i}"; sleep 1; i+1}
stdin.close

# # === Pour demander un texte à l'utilisateur ===
# args = [
#   'standard-inputbox',
#   '--title "Get Snippet from Snipplr"',
#   '--informative-text "Enter tags to search for"',
#   '--string-output', # retourne le nom du bouton au lieu du numéro 0-start
#   '2>/dev/null'
# ]
#
# cmd = "#{CMD} #{args.join(' ')}"
# u_reponse = %x{#{cmd}}
# btn_name, user_txt  = u_reponse.split("\n")
# exit if btn_name == 'Cancel'
#

# = Pour proposer une liste à l'utilisateur =
items = ["un", "deux", "trois", "quatre avec \"guils\""]
item_string = items.collect{|e| e.gsub!(/\"/,"\\\""); "\"#{e}\""}.join(' ')
args = [
  'standard-dropdown',
  '--title "Titre de la boite"',
  '--text "Texte sur le menu"',
  '--exit-onchange', # -> se ferme après le choix
  '--string-output', # -> nom du bouton cliqué
  '--items ' + item_string,
  '2>/dev/null'
]
cmd = "#{CMD} #{args.join(' ')}"
u_reponse = %x{#{cmd}}
btn_name, user_txt = u_reponse.split("\n")
exit if btn_name == 'Cancel'

# # === Présente une boite pour choisir un ou des fichiers/dossiers ===
# args = [
#   'fileselect',
#   '--title "Titre de la boite"',
#   '--text "Texte sur le menu"',
#   '--informative-text "Le texte informatif"',
#   # '--select-only-directories', # Seulement des dossiers
#   '--with-directory', # on peut choisir un dossier
#   # '--select-multiple', # Pour choisir plusieurs items
#   '2>/dev/null'
# ]
# cmd = "#{CMD} #{args.join(' ')}"
# u_reponse = %x{#{cmd}}
# the_files = u_reponse.split("\n")
# # the_files est un Array des fichiers/dossiers choisis
# exit if the_files.empty?
# puts the_files.inspect

puts u_reponse.inspect
