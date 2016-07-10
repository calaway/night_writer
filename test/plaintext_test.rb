require 'minitest/autorun'
require 'minitest/pride'
require './lib/plaintext'

class PlaintextTest < Minitest::Test
  def test_can_create_plaintext_message_with_user_input
    plaintext_message_1 = Plaintext.new("message_1")

    assert_instance_of Plaintext, plaintext_message_1
  end

  def test_can_traslate_empty_message
    plaintext_message_1 = Plaintext.new("")

    assert_equal ["", "", ""], plaintext_message_1.translate_plaintext_to_braille
  end

  def test_can_get_dumb_translation_of_same_input
    plaintext_message_1 = Plaintext.new("a")

    assert_equal ["0.", "..", ".."], plaintext_message_1.translate_plaintext_to_braille
  end
end
