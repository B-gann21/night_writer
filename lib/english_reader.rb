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
      get_characters.map do |char|
        file.write(translate_english(char).join)
      end
    end
  end

  def get_characters
    lines.map {|line| line.chomp.split('')}.flatten
  end

end
