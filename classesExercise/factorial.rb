require "minitest/autorun"

class Factorial
    attr_reader :sumFactorial
    def initialize
        @sumFactorial = 1
        @lastNumber = 1
    end

    def calculate_factorial(limit)
        if limit > @lastNumber
            loop do
                @lastNumber += 1
                @sumFactorial *=  @lastNumber
                break unless @lastNumber < limit
            end
        end
    end
end

class TestFactorial < Minitest::Test
    def setup
        @myFactorial = Factorial.new
    end

    def test_calculate_factorial
        assert_nil  @myFactorial.calculate_factorial(5)
        assert_equal 120, @myFactorial.sumFactorial
    end
end
