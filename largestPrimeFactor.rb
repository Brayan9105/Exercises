def largestPrime(num)
    primes = []
    i=2
    loop do
        
        count = 0
        for j in 1..i do
            count+=1 if i%j==0    
        end

        unless count != 2 
            primes << i if ((num/i)*i) == num
        end

        i+=1
        break if i >= num
    end
    primes
end

# puts largestPrime(100)
puts largestPrime(13195)
