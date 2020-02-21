require "minitest/autorun"

class Fibonnaci
    attr_reader :fibsNumbers
    attr_reader :evenSum
    
    def initialize
        @fibsNumbers = [0, 1]
        @i=2
        @evenSum=0
    end
    

    def find_sequence(lastElement)
        if lastElement > @i
            loop do
                @fibsNumbers[@i] = @fibsNumbers[@i-2] + @fibsNumbers[@i-1]
                @i+=1
                break if @i >= lastElement + 2
            end
            sum_even_numbers
        end

        true
    end

    def sum_even_numbers
        @evenSum=0
        @fibsNumbers.each do |number|
            @evenSum += number if number % 2 == 0
        end
    end
end


class TestEvenFib < Minitest::Test
    def setup
        @myFib = Fibonnaci.new
    end

    def test_find_sequence
        assert_equal true, @myFib.find_sequence(10)
    end

    def test_evenSum
        assert_equal 0, @myFib.evenSum
    end

    
end