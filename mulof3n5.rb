# frozen_string_literal: true

def multiof3n5(num)
  sum = 0
  (1...n).each do |i|
    next unless (num % 3).zero? || (num % 5).zero?

    sum += i
  end
  sum
end

puts multiof3n5(10)
