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

largest = LargestPrime.new

puts largest.find_primes(13195)
puts largest.find_primes(13195)
puts largest.find_primes(13195)
puts largest.find_primes(13195)
