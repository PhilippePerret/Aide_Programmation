
require 'fileutils'

FileUtils.touch 'example.txt', :mtime => Time.now - 2.hours