require './lib/plaintext'


plaintext_message_1 = Plaintext.new("helloworld")
puts plaintext_message_1.translate_plaintext_to_braille.inspect
