class Palindrome
    def validate_word(str)
        newStr = str.downcase
        return newStr.reverse == newStr ? true : false
    end

end

myPalindrome = Palindrome.new

puts myPalindrome.validate_word("Mom")
puts myPalindrome.validate_word("Noon")
puts myPalindrome.validate_word("Pokemon")
