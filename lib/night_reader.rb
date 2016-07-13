class NightReader
  attr_reader :braille_string

  def initialize(input_string)
    @braille_string = input_string
    @braille_letters = []
    @braille_letters_to_plaintext = {".....0"=>"$", ".0.000"=>"#", "......"=>" ", "0....."=>"a", "0.0..."=>"b", "00...."=>"c", "00.0.."=>"d", "0..0.."=>"e", "000..."=>"f", "0000.."=>"g", "0.00.."=>"h", ".00..."=>"i", ".000.."=>"j", "0...0."=>"k", "0.0.0."=>"l", "00..0."=>"m", "00.00."=>"n", "0..00."=>"o", "000.0."=>"p", "00000."=>"q", "0.000."=>"r", ".00.0."=>"s", ".0000."=>"t", "0...00"=>"u", "0.0.00"=>"v", ".000.0"=>"w", "00..00"=>"x", "00.000"=>"y", "0..000"=>"z", "..000."=>"!", "....0."=>"'", "..0..."=>",", "....00"=>"-", "..00.0"=>".", "..0.00"=>"?"}
  end

  def string_to_array
    @braille_string.split("\n")
  end

  def compress_lines
    braille_lines = ["", "", ""]
    string_to_array.each_with_index do |row, index|
      if index % 3 == 0
        braille_lines[0] << row
      elsif index % 3 == 1
        braille_lines[1] << row
      else
        braille_lines[2] << row
      end
    end
    braille_lines
  end

  def braille_line_to_letters(braille_line)
    braille_line.chars.each_with_index do |character, index|
      if @braille_letters[index / 2].nil?
        @braille_letters[index / 2] = ""
      end
      @braille_letters[index / 2] << character
    end
    @braille_letters
  end

  def braille_multi_line_to_letters
    compress_lines.each do |line|
      braille_line_to_letters(line)
    end
    @braille_letters
  end

  def translate_to_plaintext
    braille_multi_line_to_letters
    @braille_letters.map do |letter|
      @braille_letters_to_plaintext[letter]
    end.join
  end

  def translate_to_plaintext_with_caps
    translate_to_plaintext.gsub(/\$[a-z]/) { |s| s[1].upcase }
  end
end
