require_relative 'braille_reader'

b_reader = BrailleReader.new(ARGV[0], ARGV[1])

puts b_reader.info_msg
