class EnglishReader
  attr_reader :file1, :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
    puts info_msg
    translate(@file1, @file2)
  end

  def character_count
    lines = File.readlines(@file1)
    text = lines.join
    text.delete("\n").length
  end

  def info_msg
    "Created '#{@file2}' containing #{character_count} characters"
  end

  def translate(file1, file2)
    lines = File.readlines(file1)
    writer = File.open(file2, "w")
    writer.write(lines[0].delete("\n"))
    writer.close
  end

end
