# frozen_string_literal: true

def largest_palindrome(digits)
  start = '9' * digits

  start = start.to_i

  start.downto(1) do |i|
    start.downto(1) do |j|
      product = i * j
      return product if product == product.to_s.reverse.to_i
    end
  end
end

puts largest_palindrome(1)
puts largest_palindrome(2)
puts largest_palindrome(3)
