require "minitest/autorun"

class LargestPalindrome
    def initialize(digits)
        @startFrom = "9" * digits
        @startFrom = @startFrom.to_i
    end

    def find_largest
        @startFrom.downto(1) do |i|
            @startFrom.downto(1) do |j|
                product = i*j
                return product if product == product.to_s.reverse.to_i
            end
        end
    end


end

class TestLargestPalindrome < Minitest::Test
    def setup
        @palindrome3dig = LargestPalindrome.new(3)
    end

    def test_find_largest
        assert_equal 90909, @palindrome3dig.find_largest
    end
end