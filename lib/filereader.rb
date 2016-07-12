class IO

def read
  reader = File.open(ARGV[0], "r")
  plaintext = reader.read
  reader.close
end

puts plaintext.inspect

def write
braille_output = plaintext
writer = File.open(ARGV[1], "w")
writer.write(braille_output)
end

end
