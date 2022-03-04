class EnglishReader
  attr_reader :file1, :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
    write
    puts info_msg
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

  def write
    f2 = File.open(@file2, "w")
    f2.write(lines[0].chomp)
    f2.close
  end

  def get_characters
    lines.map {|line| line.chomp.split('')}.flatten
  end

end
