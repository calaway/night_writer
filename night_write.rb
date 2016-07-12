require './lib/night_writer'

reader = File.open(ARGV[0], "r")
plaintext = reader.read
reader.close

nightwriter1 = NightWriter.new



braille_output = nightwriter1.three_row_translation(plaintext)


writer = File.open(ARGV[1], "w")
writer.write(braille_output.join("\n"))
writer.close
puts "Created #{ARGV[1]} containing #{braille_output.join.length} characters"
