def multiof3n5(n)
    sum=0
    (1...n).each {|i|
        next unless i%3 ==0 || i%5==0        
        sum+=i
    }    
    sum
end

puts multiof3n5(10)