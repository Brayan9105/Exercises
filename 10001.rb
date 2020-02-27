# frozen_string_literal: true

# Some documentation
def prime10001(number)
  primes = []
  i = 2
  loop do
    i += 1
    break if primes.length == number
  end
  primes.last
end

def prime?(number)
  count = 0
  (1..number).each do |j|
    count += 1 if (number % j).zero?
  end

  primes << number if count == 2
end

puts prime10001(6)
# puts prime10001(10001) #Need using memeoization
