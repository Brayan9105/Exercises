require "minitest/autorun"

class Square
    def initialize
        @squareSum = 0
        @naturalSum = 0
        @lastIndex = 0
    end

    def calculate_Sum(limit)        
        if limit > @lastIndex
            loop do
                @lastIndex += 1
                sum_of_natural_nums
                sum_of_square_nums
                break if @lastIndex == limit
                
            end
        end
    end

    def sum_of_natural_nums
        @naturalSum += @lastIndex
    end

    def sum_of_square_nums
        @squareSum += (@lastIndex ** 2)
    end

    def find_diference
        (@naturalSum ** 2) - @squareSum
    end
end



class TestSquareDif < Minitest::Test
    def setup
        @mySquareDif = Square.new
    end

    def test_calculate_Sum
        assert_nil @mySquareDif.calculate_Sum(5)

        assert_equal 20, @mySquareDif.sum_of_natural_nums

        assert_equal 80, @mySquareDif.sum_of_square_nums

        assert_equal 320, @mySquareDif.find_diference
    end
   

end



