require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def test_it_can_input_empty_string_output_three_empty_strings
    skip
    nightwriter1 = NightWriter.new
    assert_equal ["", "", ""], nightwriter1.braille_string("")
  end

  def test_it_can_return_same_message_in_one_row
    skip
    nightwriter1 = NightWriter.new
    # input = "a"
    # assert_equal ["a"], nightwriter1.braille_string(input, 0)

    message_2 = "helloworld"
    assert_equal "helloworld", nightwriter1.braille_string(message_2, 0)
  end

  def test_it_can_return_same_message_in_all_rows
    skip
    nightwriter1 = NightWriter.new
    input = "abc"
    assert_equal ["abc", "abc", "abc"], nightwriter1.three_row_translation(input)
  end

  def test_it_can_translate_row_0
    skip
    nightwriter1 = NightWriter.new
    plaintext_1 = "hello"
    assert_equal "0.0.0.0.0.", nightwriter1.braille_string("",plaintext_1)
  end

  def test_it_can_translate_single_rows
    nightwriter1 = NightWriter.new

    plaintext_1 = "hello"
    assert_equal "0.0.0.0.0.", nightwriter1.braille_string(plaintext_1,0)
    plaintext_1 = "hello"
    assert_equal "00.00.0..0", nightwriter1.braille_string(plaintext_1,1)
    plaintext_1 = "hello"
    assert_equal "....0.0.0.", nightwriter1.braille_string(plaintext_1,2)
    plaintext_1 = "hello "
    assert_equal "0.0.0.0.0...", nightwriter1.braille_string(plaintext_1,0)
    plaintext_1 = "hello, world!"
    assert_equal "0.0.0.0.0......00.0.0.00..", nightwriter1.braille_string(plaintext_1,0)
  end

  def test_it_can_translate_all_three_rows
    nightwriter1 = NightWriter.new
    plaintext_1 = "hello"
    assert_equal ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."], nightwriter1.three_row_translation(plaintext_1)
    plaintext_1 = "hello, world!"
    assert_equal ["0.0.0.0.0......00.0.0.00..",
                  "00.00.0..00...00.0000..000", 
                  "....0.0.0......00.0.0...0."], nightwriter1.three_row_translation(plaintext_1)
  end



end
