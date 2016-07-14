require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_it_can_translate_row_0
    nightwriter1 = NightWriter.new
    input = "a"
    assert_equal "0.", nightwriter1.translate_plaintext_to_single_braille_row(input, 0)

    message_2 = "helloworld"
    assert_equal "0.0.0.0.0..00.0.0.00", nightwriter1.translate_plaintext_to_single_braille_row(message_2, 0)
  end

  def test_it_can_return_same_message_in_all_rows
    nightwriter1 = NightWriter.new
  end

  def test_it_can_translate_single_rows
    nightwriter1 = NightWriter.new

    plaintext_1 = "hello"
    assert_equal "0.0.0.0.0.", nightwriter1.translate_plaintext_to_single_braille_row(plaintext_1,0)
    plaintext_2 = "hello"
    assert_equal "00.00.0..0", nightwriter1.translate_plaintext_to_single_braille_row(plaintext_2,1)
    plaintext_3 = "hello"
    assert_equal "....0.0.0.", nightwriter1.translate_plaintext_to_single_braille_row(plaintext_3,2)
    plaintext_4 = "hello "
    assert_equal "0.0.0.0.0...", nightwriter1.translate_plaintext_to_single_braille_row(plaintext_4,0)
    plaintext_5 = "hello, world!"
    assert_equal "0.0.0.0.0......00.0.0.00..", nightwriter1.translate_plaintext_to_single_braille_row(plaintext_5,0)
    plaintext_6 = " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    assert_equal '..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..00..00..0.',
                 nightwriter1.translate_plaintext_to_single_braille_row(plaintext_6,0)
  end

  def test_it_can_translate_all_three_rows
    nightwriter1 = NightWriter.new
    plaintext_0 = "abc"
    assert_equal ["0.0.00", "..0...", "......"], nightwriter1.initialize_three_rows_and_feed_braille_translation_into_each(plaintext_0)
    plaintext_1 = "hello"
    assert_equal ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."], nightwriter1.initialize_three_rows_and_feed_braille_translation_into_each(plaintext_1)
    plaintext_2 = "hello, world!"
    assert_equal ["0.0.0.0.0......00.0.0.00..",
                  "00.00.0..00...00.0000..000",
                  "....0.0.0......00.0.0...0."], nightwriter1.initialize_three_rows_and_feed_braille_translation_into_each(plaintext_2)
    plaintext_3 = " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    assert_equal ['..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..00..00..0.',
                  '..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0........0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00.......0...0',
                  '..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.000.000.000'],
                  nightwriter1.initialize_three_rows_and_feed_braille_translation_into_each(plaintext_3)
  end

  def test_it_can_line_break_after_80_chars
    nightwriter1 = NightWriter.new
    braille_message_1 = ['..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..00..00..0.',
                         '..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0........0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00.......0...0',
                         '..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.000.000.000']
    assert_equal ['..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..',
                  '..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......',
                  '..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0',
                  '00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..',
                  '.0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..',
                  '...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0',
                  '00..00..0.',
                  '.....0...0',
                  '00.000.000'],
                  nightwriter1.add_line_breaks(braille_message_1)
  end

  def test_it_can_output_with_line_breaks
    nightwriter1 = NightWriter.new
    plaintext_message =  " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    assert_equal ['..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..',
                  '..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......',
                  '..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0',
                  '00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..',
                  '.0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..',
                  '...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0',
                  '00..00..0.',
                  '.....0...0',
                  '00.000.000'],
                  nightwriter1.braille_translate_with_line_breaks(plaintext_message)
  end

  def test_parse_plaintext_to_add_number_symbol
    nightwriter1 = NightWriter.new
    plaintext_1 = "a1"
    assert_equal "a#1" , nightwriter1.parse_plaintext_for_numbers(plaintext_1)
    plaintext_2 = "1a"
    assert_equal "#1 a" , nightwriter1.parse_plaintext_for_numbers(plaintext_2)
    plaintext_3 = " 1234567890!',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHI2345JKLMNOP3456QRSTUVWX1YZ"
    assert_equal " #1234567890 !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHI#2345 JKLMNOP#3456 QRSTUVWX#1 YZ" , nightwriter1.parse_plaintext_for_numbers(plaintext_3)
  end

end
