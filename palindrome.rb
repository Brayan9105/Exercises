def palindrome(str)
    newStr = str.downcase
    newStr == newStr.reverse ? true : false
end

puts palindrome("Mom")
puts palindrome("Noon")
puts palindrome("Pokemon")
