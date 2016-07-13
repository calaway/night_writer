class NightReader
  attr_reader :braille_string

  def initialize(input_string)
    @braille_string = input_string
    @braille_letters = []
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
end
