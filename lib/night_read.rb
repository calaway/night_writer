class NightReader
  attr_reader :braille_string

  def initialize(input_string)
    @braille_string = input_string
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
end
