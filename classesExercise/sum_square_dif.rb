# frozen_string_literal: true

require 'minitest/autorun'

# Some documentation
class Square
  def initialize
    @square_sum = 0
    @natural_sum = 0
    @last_index = 0
  end

  def calculate_sum(limit)
    return unless limit > @last_index

    loop do
      @last_index += 1
      sum_of_natural_nums
      sum_of_square_nums
      break if @last_index == limit
    end
  end

  def sum_of_natural_nums
    @natural_sum += @last_index
  end

  def sum_of_square_nums
    @square_sum += @last_index**2
  end

  def find_diference
    (@natural_sum**2) - @square_sum
  end
end

# Some documentation
class TestSquareDif < Minitest::Test
  def setup
    @my_square_dif = Square.new
  end

  def test_calculate_sum
    assert_nil @my_square_dif.calculate_sum(5)

    assert_equal 20, @my_square_dif.sum_of_natural_nums

    assert_equal 80, @my_square_dif.sum_of_square_nums

    assert_equal 320, @my_square_dif.find_diference
  end
end
