require_relative 'english_reader'

e_reader = EnglishReader.new(ARGV[0], ARGV[1])
puts e_reader.info_msg
