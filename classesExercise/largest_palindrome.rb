# frozen_string_literal: true

require 'minitest/autorun'

# Some documentation
class LargestPalindrome
  def initialize(digits)
    @start_from = '9' * digits
    @start_from = @start_from.to_i
  end

  def find_largest
    @start_from.downto(1) do |i|
      @start_from.downto(1) do |j|
        product = i * j
        return product if product == product.to_s.reverse.to_i
      end
    end
  end
end

# Some documentation
class TestLargestPalindrome < Minitest::Test
  def setup
    @palindrome3dig = LargestPalindrome.new(3)
  end

  def test_find_largest
    assert_equal 90_909, @palindrome3dig.find_largest
  end
end
