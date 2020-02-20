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

myFactorial = Factorial.new

myFactorial.calculate_factorial(0)
puts myFactorial.sumFactorial
myFactorial.calculate_factorial(1)
puts myFactorial.sumFactorial
myFactorial.calculate_factorial(2)
puts myFactorial.sumFactorial
myFactorial.calculate_factorial(3)
puts myFactorial.sumFactorial
myFactorial.calculate_factorial(4)
puts myFactorial.sumFactorial
myFactorial.calculate_factorial(5)
puts myFactorial.sumFactorial