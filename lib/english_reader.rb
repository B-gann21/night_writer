require_relative 'translator'

class EnglishReader
  include Translator
  attr_reader :file1, :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
    write_braille
  end

  def character_count
    get_characters.length
  end

  def info_msg
    "Created '#{@file2.delete_prefix("./spec/")}' containing #{character_count} characters"
  end

  def lines
    File.readlines(@file1)
  end

  def write_braille
    File.open(@file2, "w") do |file|
      file.write(create_rows)
    end
  end

  def get_characters
    lines.map {|line| line.chomp.split('')}.flatten
  end

  def braille_arrays
    get_characters.map {|char| translate_english(char)}.flatten(1)
  end

  def create_rows
    first_row = braille_arrays.map {|translation| translation[0]}.join
    second_row = braille_arrays.map {|translation| translation[1]}.join
    third_row = braille_arrays.map {|translation| translation[2]}.join
    "#{first_row}\n#{second_row}\n#{third_row}"
  end
end
