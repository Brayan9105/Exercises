# frozen_string_literal: true

require 'minitest/autorun'

# Some documentation
class Fibonnaci
  attr_reader :fibs_numbers
  attr_reader :even_sum

  def initialize
    @fibs_numbers = [0, 1]
    @i = 2
    @even_sum = 0
  end

  def find_sequence(last_element)
    if last_element > @i
      loop do
        @fibs_numbers[@i] = @fibs_numbers[@i - 2] + @fibs_numbers[@i - 1]
        @i += 1
        break if @i >= last_element + 2
      end
      sum_even_numbers
    end
    true
  end

  def sum_even_numbers
    @even_sum = 0
    @fibs_numbers.each do |number|
      @even_sum += number if (number % 2).zero?
    end
  end
end

# Some documentation
class TestEvenFib < Minitest::Test
  def setup
    @my_fib = Fibonnaci.new
  end

  def test_find_sequence
    assert_equal true, @my_fib.find_sequence(10)
  end

  def test_even_sum
    assert_equal 0, @my_fib.even_sum
  end
end
