# frozen_string_literal: true

require 'minitest/autorun'

# Some documentation
class Palindrome
  def validate_word(str)
    new_str = str.downcase
    new_str.reverse == new_str
  end
end

# Some documentation
class TestPalindrome < Minitest::Test
  def setup
    @my_palindrome = Palindrome.new
  end

  def test_validate_word
    assert_equal true, @my_palindrome.validate_word('Mom')
    assert_equal true, @my_palindrome.validate_word('Noon')
    assert_equal false, @my_palindrome.validate_word('Pokemon')
  end
end
