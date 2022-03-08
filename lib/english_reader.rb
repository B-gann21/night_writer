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
    "Created '#{@file2.delete_prefix("./spec/test_files/")}' containing #{character_count} characters"
  end

  def lines
    File.readlines(@file1)
  end

  def write_braille
    File.open(@file2, "w") do |file|
      index = 0
      formatted_rows[:row1].length.times do
        file.write("#{formatted_rows[:row1][index]}\n#{formatted_rows[:row2][index]}\n#{formatted_rows[:row3][index]}\n\n")
        index += 1
      end
    end
  end

  def get_characters
    lines.map {|line| line.chomp.split('')}.flatten
  end

  def braille_arrays
    get_characters.map {|char| translate_english(char)}.flatten(1)
  end

  def rows
    {
      row_1: braille_arrays.map {|translation| translation[0]}.join,
      row_2: braille_arrays.map {|translation| translation[1]}.join,
      row_3: braille_arrays.map {|translation| translation[2]}.join
    }
  end

  def formatted_rows
    new_rows = {
      row1: [],
      row2: [],
      row3: []
    }
    new_rows[:row1] << rows[:row_1].chars.each_slice(80).map {|chars| chars.join}
    new_rows[:row2] << rows[:row_2].chars.each_slice(80).map {|chars| chars.join}
    new_rows[:row3] << rows[:row_3].chars.each_slice(80).map {|chars| chars.join}
    new_rows.each {|row, chars| chars.flatten!}
    new_rows
  end
end
