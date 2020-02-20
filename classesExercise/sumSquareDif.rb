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

mySquareDif = Square.new

mySquareDif.calculate_Sum(5)
puts mySquareDif.find_diference
mySquareDif.calculate_Sum(10)
puts mySquareDif.find_diference

