# frozen_string_literal: true

#https://projecteuler.net/problem=7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

# https://www.smartickmethod.com/blog/math/operations-and-algebraic-thinking/divisibility/prime-numbers-sieve-eratosthenes/
# 2 is the only even, (number number % 2).zero? is not prime
# 3 is the only number divisible by 3
# 5 is only number divisible by 5
# 7 is only number divisible by 7
# stop if the square root of the factor is greater that the number
def prime10001(number)
  return false if number <= 1

  (2..number).each do |factor|
    next if (factor % 2).zero? && factor != 2
    next if (factor % 3).zero? && factor != 3
    next if (factor % 5).zero? && factor != 5
    next if (factor % 7).zero? && factor != 7
    p "factor #{factor} square #{factor**2}"
    break if factor**2 > number
  end
  
end

puts prime10001(10)

