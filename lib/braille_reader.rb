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

end
