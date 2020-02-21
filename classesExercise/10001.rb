class Prime
    def initialize
        @primeArray = [0]
        @lastIndex = 0
    end

    def find_prime_index(number)
        return @primeArray[number] if @primeArray[number]
        find_new_prime_index(number)
    end

    def find_new_prime_index(number)
        i = @primeArray[@lastIndex] + 1
        loop do
            count = 0; j=1
          
            loop do
                count += 1 if i % j == 0
                j += 1
                break if count > 2 || j > i
            end
            
            if count == 2
                @lastIndex += 1
                @primeArray[@lastIndex] = i
            end

            break if @lastIndex == number
            i += 1
        end

        @primeArray[@lastIndex]
    end
end

indexPrime = Prime.new
puts indexPrime.find_prime_index(1)
puts indexPrime.find_prime_index(2)
puts indexPrime.find_prime_index(5)
puts indexPrime.find_prime_index(6)
