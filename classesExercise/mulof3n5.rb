# frozen_string_literal: true

require 'minitest/autorun'

# Some documentation
class Multiple
  def initialize
    @sum_multiples = []
  end

  def calcule_multiple(number)
    sum = 0
    (1...number).each do |i|
      next unless (i % 3).zero? || (i % 5).zero?

      sum += i
    end
    @sum_multiples[number] = sum
    sum
  end

  def find_multiple(number)
    return @sum_multiples[number] if @sum_multiples[number]

    calcule_multiple(number)
  end
end

# Some documentation
class TestMultiple < Minitest::Test
  def setup
    @my_multiples = Multiple.new
  end

  def test_calcule_multiple
    assert_equal 3, @my_multiples.calcule_multiple(5)
    assert_equal 23, @my_multiples.calcule_multiple(10)
  end

  def test_find_multiple
    assert_equal 3, @my_multiples.find_multiple(5)
    assert_equal 23, @my_multiples.find_multiple(10)
  end
end
