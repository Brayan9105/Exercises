# frozen_string_literal: true

def palindrome(str)
  new_str = str.downcase
  new_str == new_str.reverse
end

puts palindrome('Mom')
puts palindrome('Noon')
puts palindrome('Pokemon')
