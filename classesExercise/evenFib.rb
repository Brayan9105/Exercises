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
    end

    def sum_even_numbers
        @evenSum=0
        @fibsNumbers.each do |number|
            @evenSum += number if number % 2 == 0
        end
    end
end

myFib = Fibonnaci.new
puts myFib.evenSum
myFib.find_sequence(10)
myFib.find_sequence(13)
puts myFib.evenSum
