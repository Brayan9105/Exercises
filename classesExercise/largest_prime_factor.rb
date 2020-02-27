# frozen_string_literal: true

require 'minitest/autorun'

# Some documentation
class LargestPrime
  def initialize
    @largest_primes = []
  end

  def find_primes(number)
    return @largest_primes[number] if @largest_primes[number]

    largest_prime_of(number)
  end

  def largest_prime_of(number)
    i = 2
    greater_prime = 0
    loop do
      if prime?(i) && ((number / i) * i) == number
        greater_prime = i if i > greater_prime
      end

      i >= number ? break : i += 1
    end

    @largest_primes[number] = greater_prime
    greater_prime
  end

  def prime?(number)
    count = 0
    (1..number).each do |j|
      count += 1 if (number % j).zero?
    end

    count == 2
  end
end

# Some documentation
class TestLargestPrimeFactor < Minitest::Test
  def setup
    @largest = LargestPrime.new
  end

  def test_prime?
    assert_equal true, @largest.prime?(2)
    assert_equal false, @largest.prime?(4)
  end

  def test_largest_prime_of
    assert_equal 5, @largest.largest_prime_of(100)
    assert_equal 2, @largest.largest_prime_of(4)
  end

  def test_find_primes
    assert_equal 5, @largest.find_primes(100)
    assert_equal 2, @largest.find_primes(4)
  end
end
