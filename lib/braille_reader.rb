require_relative 'translator'

class BrailleReader
  include Translator
  attr_reader :file1, :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
  end

  def info_msg
    "Created #{@file2.delete_prefix("./spec/")} containing #{character_count} characters"
  end

  def lines
    File.readlines(@file2)
  end

  def get_characters
    lines.map {|line| line.chomp.split('')}.flatten
  end

  def character_count
    get_characters.length
  end

  def write_english
    File.open(@file2, "w") do |file|
      file.write(translate_braille(format_braille))
    end
  end

  def format_braille
    braille_lines = File.readlines(@file1)
    chomped_lines = braille_lines.map {|line| line.chomp}
    chomped_lines.delete('')
    chomped_lines
  end
end
