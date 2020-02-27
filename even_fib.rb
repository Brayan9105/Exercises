# frozen_string_literal: true

def fib(num)
  return num if num <= 1

  arr = [0, 1]
  i = 1
  even_sum = 0
  loop do
    arr[i] = arr[i - 2] + arr[i - 1]
    even_sum += arr[i] if (arr[i] % 2).zero?

    i >= num + 1 ? break : i += 1
  end
  even_sum
end

def recursive_fib(num)
  return num if num <= 2

  recursive_fib(num - 2) + recursive_fib(num - 1)
end

puts fib(11)
# puts recursive_fib(10)
