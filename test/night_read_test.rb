require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'

class NightReaderTest < Minitest::Test
  def test_it_can_accept_braille_string
    message = "00.0.0.0.0.00.00.0.0.00."
    braille_message_1 = NightReader.new(message)

    assert_equal message, braille_message_1.braille_string
  end

  def test_it_can_return_rows_of_braille_text
    message = "00.0.0.0.0\n.00.00.0.0\n.00.0..000"
    braille_message_1 = NightReader.new(message)

    assert_equal ["00.0.0.0.0", ".00.00.0.0", ".00.0..000"], braille_message_1.string_to_array
  end

  def test_it_can_compress_messages_split_over_multiple_lines
    message = "00.0.\n0.0.0\n.00.0\n0.0.0\n.00.0\n..000"
    braille_message_1 = NightReader.new(message)

    assert_equal ["00.0.0.0.0", "0.0.0.00.0", ".00.0..000"], braille_message_1.compress_lines
  end

  def test_it_can_parse_single_braille_line_to_letters
    message_line_1 = "0.0.0.0.0....00.0.0.00"
    braille_message_1 = NightReader.new(message)

    assert_equal ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"], braille_message_1.braille_line_to_letters(message_line_1)
  end

  def test_it_can_parse_all_braille_lines_to_letters
    message = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
    # message = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    braille_message_1 = NightReader.new(message)

    assert_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00."], braille_message_1.braille_multi_line_to_letters
  end
end
