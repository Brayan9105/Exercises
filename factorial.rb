# frozen_string_literal: true

def factorial(num)
  return 1 if num <= 1

  num * factorial(n - 1)
end

puts factorial(0)
puts factorial(1)
puts factorial(2)
puts factorial(3)
puts factorial(4)
puts factorial(5)
