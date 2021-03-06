class NightWriter
  def initialize
  end

  def parse_plaintext_for_numbers(plaintext)
    plaintext_with_number_sign = plaintext.gsub(/[^0-9][0-9]/) do |match|
      match[0] + '#' + match[1]
    end
    plaintext_with_number_sign = plaintext_with_number_sign.gsub(/[0-9][^0-9]/) do |match|
      match[0] + ' ' + match[1]
    end
    if plaintext_with_number_sign.index(/[0-9]/) == 0
        plaintext_with_number_sign = '#' + plaintext_with_number_sign
    end
    plaintext_with_number_sign
  end

  def translate_plaintext_to_single_braille_row(plaintext, row)
    plaintext_to_braille_translator_row_0 = {"$"=>"..", "#"=>".0", " "=>"..", "a"=>"0.", "b"=>"0.", "c"=>"00", "d"=>"00", "e"=>"0.", "f"=>"00", "g"=>"00", "h"=>"0.", "i"=>".0", "j"=>".0", "k"=>"0.", "l"=>"0.", "m"=>"00", "n"=>"00", "o"=>"0.", "p"=>"00", "q"=>"00", "r"=>"0.", "s"=>".0", "t"=>".0", "u"=>"0.", "v"=>"0.", "w"=>".0", "x"=>"00", "y"=>"00", "z"=>"0.", "!"=>"..", "'"=>"..", ","=>"..", "-"=>"..", "."=>"..", "?"=>"..", "A"=>"..0.", "B"=>"..0.", "C"=>"..00", "D"=>"..00", "E"=>"..0.", "F"=>"..00", "G"=>"..00", "H"=>"..0.", "I"=>"...0", "J"=>"...0", "K"=>"..0.", "L"=>"..0.", "M"=>"..00", "N"=>"..00", "O"=>"..0.", "P"=>"..00", "Q"=>"..00", "R"=>"..0.", "S"=>"...0", "T"=>"...0", "U"=>"..0.", "V"=>"..0.", "W"=>"...0", "X"=>"..00", "Y"=>"..00", "Z"=>"..0.", "1"=>"0.", "2"=>"0.", "3"=>"00", "4"=>"00", "5"=>"0.", "6"=>"00", "7"=>"00", "8"=>"0.", "9"=>".0", "0"=>".0"}
    plaintext_to_braille_translator_row_1 = {"$"=>"..", "#"=>".0", " "=>"..", "a"=>"..", "b"=>"0.", "c"=>"..", "d"=>".0", "e"=>".0", "f"=>"0.", "g"=>"00", "h"=>"00", "i"=>"0.", "j"=>"00", "k"=>"..", "l"=>"0.", "m"=>"..", "n"=>".0", "o"=>".0", "p"=>"0.", "q"=>"00", "r"=>"00", "s"=>"0.", "t"=>"00", "u"=>"..", "v"=>"0.", "w"=>"00", "x"=>"..", "y"=>".0", "z"=>".0", "!"=>"00", "'"=>"..", ","=>"0.", "-"=>"..", "."=>"00", "?"=>"0.", "A"=>"....", "B"=>"..0.", "C"=>"....", "D"=>"...0", "E"=>"...0", "F"=>"..0.", "G"=>"..00", "H"=>"..00", "I"=>"..0.", "J"=>"..00", "K"=>"....", "L"=>"..0.", "M"=>"....", "N"=>"...0", "O"=>"...0", "P"=>"..0.", "Q"=>"..00", "R"=>"..00", "S"=>"..0.", "T"=>"..00", "U"=>"....", "V"=>"..0.", "W"=>"..00", "X"=>"....", "Y"=>"...0", "Z"=>"...0", "1"=>"..", "2"=>"0.", "3"=>"..", "4"=>".0", "5"=>".0", "6"=>"0.", "7"=>"00", "8"=>"00", "9"=>"0.", "0"=>"00"}
    plaintext_to_braille_translator_row_2 = {"$"=>".0", "#"=>"00", " "=>"..", "a"=>"..", "b"=>"..", "c"=>"..", "d"=>"..", "e"=>"..", "f"=>"..", "g"=>"..", "h"=>"..", "i"=>"..", "j"=>"..", "k"=>"0.", "l"=>"0.", "m"=>"0.", "n"=>"0.", "o"=>"0.", "p"=>"0.", "q"=>"0.", "r"=>"0.", "s"=>"0.", "t"=>"0.", "u"=>"00", "v"=>"00", "w"=>".0", "x"=>"00", "y"=>"00", "z"=>"00", "!"=>"0.", "'"=>"0.", ","=>"..", "-"=>"00", "."=>".0", "?"=>"00", "A"=>".0..", "B"=>".0..", "C"=>".0..", "D"=>".0..", "E"=>".0..", "F"=>".0..", "G"=>".0..", "H"=>".0..", "I"=>".0..", "J"=>".0..", "K"=>".00.", "L"=>".00.", "M"=>".00.", "N"=>".00.", "O"=>".00.", "P"=>".00.", "Q"=>".00.", "R"=>".00.", "S"=>".00.", "T"=>".00.", "U"=>".000", "V"=>".000", "W"=>".0.0", "X"=>".000", "Y"=>".000", "Z"=>".000", "1"=>"..", "2"=>"..", "3"=>"..", "4"=>"..", "5"=>"..", "6"=>"..", "7"=>"..", "8"=>"..", "9"=>"..", "0"=>".."}
    plaintext_to_braille_translator = [plaintext_to_braille_translator_row_0, plaintext_to_braille_translator_row_1, plaintext_to_braille_translator_row_2]
    parse_plaintext_for_numbers(plaintext).chars.map do |letter|
      plaintext_to_braille_translator[row][letter]
    end.join
  end

  def initialize_three_rows_and_feed_braille_translation_into_each(plaintext)
    # braille_translation = ["", "", ""]
    (0..2).map do |index|
      translate_plaintext_to_single_braille_row(plaintext, index)
    end
  end

  def add_line_breaks(braille_translation)
    index = 0
    while index < braille_translation.length
      if  braille_translation[index].length > 80
        braille_translation[index + 3] = braille_translation[index][80..-1]
        braille_translation[index] = braille_translation[index][0..79]
      end
      index += 1
    end
    braille_translation
  end

  def braille_translate_with_line_breaks(input)
    add_line_breaks(initialize_three_rows_and_feed_braille_translation_into_each(input))
  end

end
