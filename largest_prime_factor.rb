# frozen_string_literal: true

def largest_prime(num)
  primes = []
  i = 2
  loop do
    prime?(i, num)
    i += 1
    break if i >= num
  end
  primes
end

def prime?(limit, num)
  count = 0
  (1..limit).each do |j|
    count += 1 if (limit % j).zero?
  end

  return unless count == 2

  primes << limit if ((num / limit) * limit) == num
end

# puts largest_prime(100)
puts largest_prime(13_195)
