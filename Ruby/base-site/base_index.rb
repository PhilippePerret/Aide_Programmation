#!/usr/bin/env ruby
# encoding: UTF-8
=begin
La base d'un fichier index.rb, sans aucun gem ni require.
Il suffit de rendre ce script exécutable pour qu'il fonctionne n'importe où

Placer aussi le fichier `htaccess' de ce dossier en le renommant `.htaccess'

=end
begin
  
  content = "Définir dans cette variable le contenu à afficher"
  
  STDOUT.write "Content-type: text/html; charset:utf-8;\n\n"
  STDOUT.write content
rescue Exception => e
  STDOUT.write "Content-type: text/html; charset:utf-8;\n\n"
  STDOUT.write '<div class="color:red;padding:2em">'
  STDOUT.write "<div>#{e.message}</div>"
  STDOUT.write e.backtrace.collect{|e| "<div>#{e}</div>"}.join('')
  STDOUT.write "</div>"
end

