class NightWriter
  attr_reader :rows
  def initialize
    english_to_braille_row_0 = {"a"=>"0.", "b"=>"0.", "c"=>"00", "d"=>"00", "e"=>"0.", "f"=>"00", "g"=>"00", "h"=>"0.", "i"=>".0", "j"=>".0", "k"=>"0.", "l"=>"0.", "m"=>"00", "n"=>"00", "o"=>"0.", "p"=>"00", "q"=>"00", "r"=>"0.", "s"=>".0", "t"=>".0", "u"=>"0.", "v"=>"0.", "w"=>".0", "x"=>"00", "y"=>"00", "z"=>"0.", "!"=>"..", "'"=>"..", ","=>"..", "-"=>"..", "."=>"..", "?"=>".."}
    english_to_braille_row_1 = {"a"=>"..", "b"=>"0.", "c"=>"..", "d"=>".0", "e"=>".0", "f"=>"0.", "g"=>"00", "h"=>"00", "i"=>"0.", "j"=>"00", "k"=>"..", "l"=>"0.", "m"=>"..", "n"=>".0", "o"=>".0", "p"=>"0.", "q"=>"00", "r"=>"00", "s"=>"0.", "t"=>"00", "u"=>"..", "v"=>"0.", "w"=>"00", "x"=>"..", "y"=>".0", "z"=>".0", "!"=>"00", "'"=>"..", ","=>"0.", "-"=>"..", "."=>"00", "?"=>"0."}
    english_to_braille_row_2 = {"a"=>"..", "b"=>"..", "c"=>"..", "d"=>"..", "e"=>"..", "f"=>"..", "g"=>"..", "h"=>"..", "i"=>"..", "j"=>"..", "k"=>"0.", "l"=>"0.", "m"=>"0.", "n"=>"0.", "o"=>"0.", "p"=>"0.", "q"=>"0.", "r"=>"0.", "s"=>"0.", "t"=>"0.", "u"=>"00", "v"=>"00", "w"=>".0", "x"=>"00", "y"=>"00", "z"=>"00", "!"=>"0.", "'"=>"0.", ","=>"..", "-"=>"00", "."=>".0", "?"=>"00"}
    @braille_translation = ["", "", ""]
    @english_to_braille = [english_to_braille_row_0, english_to_braille_row_1, english_to_braille_row_2]
    @rows = [0,1,2]
  end

  def braille_string(plaintext, row)
    braille_characters = plaintext.chars.map do |letter|
      @english_to_braille[row][letter]
    end
    braille_characters.join
  end

  def three_row_translation(input)
    @rows.map do |index|
    braille_string(input, index)
    end
  end
end
