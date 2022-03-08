require_relative 'braille_reader'

b_reader = BrailleReader.new(ARGV[0], ARGV[1])

b_reader.write_english
puts b_reader.info_msg
