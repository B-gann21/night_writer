require_relative 'translator'

class EnglishReader
  include Translator
  attr_reader :file1, :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
  end

  def character_count
    get_characters.length
  end

  def info_msg
    "Created '#{@file2}' containing #{character_count} characters"
  end

  def lines
    File.readlines(@file1)
  end

  def write_braille
    File.open(@file2, "w") do |file|
      index = 0
      wrap_rows[:row1].length.times do
        file.write("#{wrap_rows[:row1][index]}\n#{wrap_rows[:row2][index]}\n#{wrap_rows[:row3][index]}\n\n")
        index += 1
      end
    end
  end

  def get_characters
    lines.map {|line| line.chomp.chars}.flatten
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

  def wrap_rows
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
