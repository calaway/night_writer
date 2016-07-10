class Plaintext
  attr_reader :plaintext_message

  def initialize(plaintext_message)
    @plaintext_message = plaintext_message
    @english_to_braille_row_0 = {"a"=>"0.", "b"=>"0.", "c"=>"00", "d"=>"00", "e"=>"0.", "f"=>"00", "g"=>"00", "h"=>"0.", "i"=>".0", "j"=>".0", "k"=>"0.", "l"=>"0.", "m"=>"00", "n"=>"00", "o"=>"0.", "p"=>"00", "q"=>"00", "r"=>"0.", "s"=>".0", "t"=>".0", "u"=>"0.", "v"=>"0.", "w"=>".0", "x"=>"00", "y"=>"00", "z"=>"0.", "!"=>"..", "'"=>"..", ","=>"..", "-"=>"..", "."=>"..", "?"=>".."}
    @english_to_braille_row_1 = {"a"=>"..", "b"=>"0.", "c"=>"..", "d"=>".0", "e"=>".0", "f"=>"0.", "g"=>"00", "h"=>"00", "i"=>"0.", "j"=>"00", "k"=>"..", "l"=>"0.", "m"=>"..", "n"=>".0", "o"=>".0", "p"=>"0.", "q"=>"00", "r"=>"00", "s"=>"0.", "t"=>"00", "u"=>"..", "v"=>"0.", "w"=>"00", "x"=>"..", "y"=>".0", "z"=>".0", "!"=>"00", "'"=>"..", ","=>"0.", "-"=>"..", "."=>"00", "?"=>"0."}
    @english_to_braille_row_2 = {"a"=>"..", "b"=>"..", "c"=>"..", "d"=>"..", "e"=>"..", "f"=>"..", "g"=>"..", "h"=>"..", "i"=>"..", "j"=>"..", "k"=>"0.", "l"=>"0.", "m"=>"0.", "n"=>"0.", "o"=>"0.", "p"=>"0.", "q"=>"0.", "r"=>"0.", "s"=>"0.", "t"=>"0.", "u"=>"00", "v"=>"00", "w"=>".0", "x"=>"00", "y"=>"00", "z"=>"00", "!"=>"0.", "'"=>"0.", ","=>"..", "-"=>"00", "."=>".0", "?"=>"00"}
  end


  # string => array of three strings
  def translate_plaintext_to_braille
    braille_translation = ["", "", ""]
    @plaintext_message_chars = @plaintext_message.chars
    @plaintext_message_chars.each do |character|
      braille_translation[0] << @english_to_braille_row_0[character]
      braille_translation[1] << @english_to_braille_row_1[character]
      braille_translation[2] << @english_to_braille_row_2[character]
    end
    braille_translation
  end
end
