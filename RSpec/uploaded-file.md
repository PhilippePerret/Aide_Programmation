#Simuler l'upload d'un fichier dans RSpec

    file = Rack::Test::UploadedFile.new('path/to/file.ext'[, 'doc/type'])
  
Le fichier `path/to/file.ext` doit exister.