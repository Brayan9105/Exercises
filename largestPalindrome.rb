def largestPalindrome(digits)
    start = "9"*digits
    start = start.to_i
    
    maxProduct = 0
    start.downto(1) do |i|
        start.downto(1) do |j|
            product = i*j
            return product if product == product.to_s.reverse.to_i
        end
    end
end

puts largestPalindrome(1)
puts largestPalindrome(2)
puts largestPalindrome(3)