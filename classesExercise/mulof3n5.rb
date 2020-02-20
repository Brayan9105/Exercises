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
        sum = calcule_multiple(number) 
    end

end

myMultiples = Multiple.new

puts myMultiples.find_multiple(10000000)
puts myMultiples.find_multiple(10000000)
