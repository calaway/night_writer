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

  end
end
