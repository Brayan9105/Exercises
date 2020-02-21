require "minitest/autorun"

class Palindrome
    def validate_word(str)
        newStr = str.downcase
        return newStr.reverse == newStr ? true : false
    end

end


class TestPalindrome < Minitest::Test
    def setup
        @myPalindrome = Palindrome.new
    end

    def test_validate_word
        assert_equal true, @myPalindrome.validate_word("Mom")
        assert_equal true, @myPalindrome.validate_word("Noon")
        assert_equal false, @myPalindrome.validate_word("Pokemon")
    end

end
