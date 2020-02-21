require "minitest/autorun"

class Multiple
    def initialize
        @sumMultiples = []
    end

    def calcule_multiple(number) 
        sum=0
        (1...number).each {|i|
            next unless i%3 ==0 || i%5==0        
            sum+=i
        }    
        @sumMultiples[number] = sum
        sum
    end

    def find_multiple(number)        
        return @sumMultiples[number] if @sumMultiples[number]
        calcule_multiple(number) 
    end

end


class TestMultiple < Minitest::Test
    def setup
        @myMultiples = Multiple.new
    end

    def test_calcule_multiple
        assert_equal 3, @myMultiples.calcule_multiple(5)
        assert_equal 23, @myMultiples.calcule_multiple(10)
    end

    def test_find_multiple
        assert_equal 3, @myMultiples.find_multiple(5)
        assert_equal 23, @myMultiples.find_multiple(10)
    end
end

