def prime10001(number)
    primes = []
    i=2
    loop do
        count = 0
        for j in 1..i do
            count+=1 if i%j==0    
        end

        primes << i if count == 2
        i+=1
        break if primes.length == number
    end
    primes.last
end

puts prime10001(6)
# puts prime10001(10001) #Need using memeoization