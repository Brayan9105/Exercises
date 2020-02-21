require "minitest/autorun"

class LargestPrime
    def initialize
        @largestPrimes = []
    end

    def find_primes(number)
        return @largestPrimes[number] if @largestPrimes[number]
        largest_prime_of(number)
    end

    def is_prime?(number)
        count = 0
        for j in 1..number do
            count += 1 if number % j == 0    
        end
        count == 2        
    end

    def largest_prime_of(number)
        i = 2
        greaterPrime = 0
        loop do
            if is_prime?(i) && ((number / i) * i) == number
                greaterPrime = i if i > greaterPrime
            end

            break if i >= number
            i += 1
            
        end

        @largestPrimes[number] = greaterPrime        
        greaterPrime
    end


end


class TestLargestPrimeFactor < Minitest::Test
    def setup
        @largest = LargestPrime.new
    end

    def test_is_prime?
        assert_equal true, @largest.is_prime?(2)
        assert_equal false, @largest.is_prime?(4)
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

