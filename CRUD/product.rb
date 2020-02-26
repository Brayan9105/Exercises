class Product
    def initialize
        @@products = []
        @@id = 0
    end

    def create(name: nil, value: nil, brand: nil, description: nil, quantity: nil)
        if has_value?(name, value, brand)
            @@id += 1
            product = {}
            product[:id] = @@id
            product[:name] = name
            product[:value] = value
            product[:brand] = brand
            product[:description] = description
            product[:quantity] = quantity
            @@products << product
        end
    end
    
    def count
        @@products.size
    end

    def all
        @@products
    end

    def find(id: 0)
        where(id: id).first
    end

    def where(*criteria)
        parsed_criteria = Hash(*criteria)
    
        @@products.select {|product|
            within_criteria(product, parsed_criteria)
        }
    end

    def update(id=nil, fields)
        return unless id
        @@products.each do |product|
            if product[:id] == id
                product[:name] = fields[:name] if fields[:name]
                product[:value] = fields[:name] if fields[:name]
                product[:brand] = fields[:name] if fields[:name]
                product[:description] = fields[:name] if fields[:name]
                product[:quantity] = fields[:name] if fields[:name]
                break
            end
        end

    end

    def destroy(id: nil)
        return unless id
        @@products.each_with_index do |product, index|
            if product[:id] == id
                @@products.delete_at(index)
                break
            end
        end
    end

    private
    def has_value?(*fields)
        fields.each do |field|
            return false if field.nil? || field == ""
        end
        true
    end

    def within_criteria(user, criteria)
        user_valid = true
        criteria.each_pair do |field, value|
          next unless user_valid
          user_valid &&= value == user[field]
        end
        user_valid
      end
    end

    
end

p = Product.new
p p.all
p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
p p.all
# p.update(1, {name: "sazz", last: "otro"})

# p.destroy(id: 1)
#  p p.all
# describe "" do
# end