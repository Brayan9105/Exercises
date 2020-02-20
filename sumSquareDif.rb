def square(n)
    squareSum=0
    naturalSum=0
    for i in 1..n do
        squareSum+= i**2
        naturalSum += i
    end
    (naturalSum**2) - squareSum
end

puts square(10)