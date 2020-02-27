# frozen_string_literal: true

require 'minitest/autorun'

# Some documentation
class Prime
  def initialize
    @prime_array = [0]
    @last_index = 0
  end

  def find_prime_index(number)
    return @prime_array[number] if @prime_array[number]

    find_new_prime_index(number)
  end

  def find_new_prime_index(number)
    i = @prime_array[@last_index] + 1
    loop do
      find_index(i)

      break if @last_index == number

      i += 1
    end

    @prime_array[@last_index]
  end

  def find_index(number)
    count = 0
    j = 1

    loop do
      count += 1 if (number % j).zero?
      j += 1
      break if count > 2 || j > number
    end

    assign_results(number) if count == 2
  end

  def assign_results(number)
    @last_index += 1
    @prime_array[@last_index] = number
  end
end

# Some documentation
class Test10001Prime < Minitest::Test
  def setup
    @index_prime = Prime.new
  end

  def test_find_prime_index
    assert_equal 2, @index_prime.find_new_prime_index(1)
    assert_equal 11, @index_prime.find_new_prime_index(5)
    assert_equal 13, @index_prime.find_new_prime_index(6)
  end
end
