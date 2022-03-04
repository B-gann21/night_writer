reader = File.readlines(ARGV[0])
text = reader.join
character_count = text.delete("\n").length
puts "Created '#{ARGV[1]}' containing #{character_count} characters"
