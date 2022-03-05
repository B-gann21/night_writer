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
      file.write("#{first_row}\n#{second_row}\n#{third_row}")
    end
  end

  def get_characters
    lines.map {|line| line.chomp.split('')}.flatten
  end

  def braille_arrays
    get_characters.map {|char| translate_english(char)}.flatten(1)
  end

  def first_row
    first_dots = []
    braille_arrays.each { |translation| first_dots << translation[0]}
    first_dots.join
  end

  def second_row
    second_dots = []
    braille_arrays.each { |translation| second_dots << translation[1]}
    second_dots.join
  end

  def third_row
    third_dots = []
    braille_arrays.each { |translation| third_dots << translation[2]}
    third_dots.join
  end
end
