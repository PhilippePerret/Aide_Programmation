#!/usr/bin/env ruby
=begin
Ce module permet de jouer un code dans le terminal en le lançant depuis TextMate
=end
root_path = ENV['TM_PROJECT_DIRECTORY']

# Définir le code ici
code = <<-CODE
tell application "Terminal"
activate
do script "cd #{root_path}" in window 1
do script "rspec spec" in window 1
end
CODE

# Run it in Terminal
code = code.gsub(/"/, "\\\"")
cmd = "osascript -e \"#{code}\""
system(cmd)