# frozen_string_literal: true

require 'minitest/autorun'

# Some documentation
class Factorial
  attr_reader :sum_factorial

  def initialize
    @sum_factorial = 1
    @last_number = 1
  end

  def calculate_factorial(limit)
    return unless limit > @last_number

    loop do
      @last_number += 1
      @sum_factorial *= @last_number
      break unless @last_number < limit
    end
  end
end

# Some doucmentation
class TestFactorial < Minitest::Test
  def setup
    @my_factorial = Factorial.new
  end

  def test_calculate_factorial
    assert_nil @my_factorial.calculate_factorial(5)
    assert_equal 120, @my_factorial.sum_factorial
  end
end
