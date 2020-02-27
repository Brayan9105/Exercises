# frozen_string_literal: true

def square(num)
  square_sum = 0
  natural_sum = 0
  (1..num).each do |i|
    square_sum += i**2
    natural_sum += i
  end
  (natural_sum**2) - square_sum
end

puts square(10)
