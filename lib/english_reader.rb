class EnglishReader
  attr_reader :file1, :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
    puts info_msg
  end

  def character_count
    reader = File.readlines(@file1)
    text = reader.join
    text.delete('\n').length
  end

  def info_msg
    "Created '#{@file2}' containing #{character_count} characters"
  end
end
