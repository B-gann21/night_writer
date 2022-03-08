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

  def braille_lines
    File.readlines(@file1)
  end

  def get_characters
    lines.map {|line| line.chomp.split('')}.flatten
  end

  def get_braille_chars
    chomped = braille_lines.map {|line| line.chomp}
    chomped.delete('')
    chomped.map {|line| line.chars}
  end

  def character_count
    get_characters.length
  end

  def write_english
    File.open(@file2, "w") do |file|
      if get_braille_chars[0].length > 2
        formatted_braille.each do |braille_array|
          file.write(translate_braille(braille_array))
        end
      else
        file.write(translate_braille(formatted_braille[0]))
      end
    end
  end

  def formatted_braille
    to_be_translated = []
    chars = get_braille_chars
    if chars[0].length > 2
      until chars.all?([]) do
        section_holder = []
        chars.each do |row|
          section_holder << row[0..1].join
          2.times do
            row.delete_at(0)
          end
        end
        to_be_translated << section_holder
      end
    else
      section_holder = []
      chars.each do |section|
        section_holder << section.join
      end
      to_be_translated << section_holder
    end
    to_be_translated
  end

end
