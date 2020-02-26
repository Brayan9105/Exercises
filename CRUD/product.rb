require "minitest/autorun"

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
                return product
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



describe Product do

    before do
        @p = Product.new
    end

    describe "When create a product" do
        it "Must respond false" do
            _(@p.create(name: "Sugar", brand: "Manuelita", description: "Some description", quantity: 5)).must_be_nil
        end

        it "Must respond with an array" do
            _(@p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)).must_equal [{:id=>1, :name=>"Sugar", :value=>200, :brand=>"Manuelita", :description=>"Some description", :quantity=>5}]
        end
    end

    describe "When query the number of products" do 
        it "Must respond 1" do
            @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
            _(@p.count).must_equal 1
        end

        it "Must respond 2" do
            @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
            @p.create(name: "Butter", value: 300, brand: "Margarina", description: "Some description", quantity: 8)
            _(@p.count).must_equal 2
        end
    end

    describe "When query all the products" do
        it "Must respond a with a empty array" do
            _(@p.all).must_equal []
        end

        it "Must respond with an array of all products" do
            @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
            @p.create(name: "Butter", value: 300, brand: "Margarina", description: "Some description", quantity: 8)
            _(@p.all).must_equal [{:id=>1, :name=>"Sugar", :value=>200, :brand=>"Manuelita", :description=>"Some description", :quantity=>5}, {:id=>2, :name=>"Butter", :value=>300, :brand=>"Margarina", :description=>"Some description", :quantity=>8}]
        end
    end

    # describe "When query for a specific product" do
    #     it "Must respond ···" do
    #         @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
    #         _(@p.find(id: 2)).must be {}
    #     end
    # end

    describe "When query products with a criteria" do
        it "Must respond with a empty list" do
            @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
            _(@p.where(value: 300)).must_equal []
        end

        it "Must respond with a list of product with the criteria" do
            @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
            @p.create(name: "Butter", value: 200, brand: "Margarina", description: "Some description", quantity: 8)
            _(@p.where(value: 200)).must_equal [{:id=>1, :name=>"Sugar", :value=>200, :brand=>"Manuelita", :description=>"Some description", :quantity=>5}, {:id=>2, :name=>"Butter", :value=>200, :brand=>"Margarina", :description=>"Some description", :quantity=>8}]
        end
    end

    describe "When update a product" do
        # it "Must respond nil" do
        #     @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
        #     @p.create(name: "Butter", value: 200, brand: "Margarina", description: "Some description", quantity: 8)
        #     _(@p.update(1, {name: "New product", value: 500})).must_equal {:id=>1, :name=>"New product", :value=>"New product", :brand=>"New product", :description=>"New product", :quantity=>"New product"}
        # end

        # it "Must respond nil" do
        #     @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
        #     @p.create(name: "Butter", value: 200, brand: "Margarina", description: "Some description", quantity: 8)
        #     _(@p.update(1, {name: "New product", value: 500, brand: "Some brand"})).must_equal {:id=>1, :name=>"New product", :value=>"New product", :brand=>"New product", :description=>"New product", :quantity=>"New product"}
        # end
    end

    describe "When delete a product" do
        it "Must respond " do
            @p.create(name: "Sugar", value: 200, brand: "Manuelita", description: "Some description", quantity: 5)
            @p.create(name: "Butter", value: 200, brand: "Margarina", description: "Some description", quantity: 8)
            _(@p.destroy(id: 1)).must_be_nil
        end
    end

end