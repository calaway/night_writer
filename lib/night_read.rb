require './lib/night_reader'

reader = File.open(ARGV[0], "r")
braille_message = reader.read
reader.close

nightreader1 = NightReader.new(braille_message)



plaintext_output = nightreader1.translate_to_plaintext_with_caps


writer = File.open(ARGV[1], "w")
writer.write(plaintext_output)
writer.close
puts "Created #{ARGV[1]} containing #{plaintext_output.length} characters"
