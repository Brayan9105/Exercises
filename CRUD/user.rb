require "minitest/autorun"

class User
  attr_accessor :users
 
  def initialize
    @@users = []
    @@id = 0
  end
  
  def is_unique?(email: nil)
    @@users.each do |user|
      return false if user[:email] == email
    end
    true
  end

  def has_value?(*fields)
    fields.each do |field|
      return false unless field
    end
    true
  end

  def create(first_name: nil, last_name: nil, email: nil, age: nil, address: nil)
    if has_value?(first_name, last_name, email) && is_unique?(email: email)
      user = {
        id: @@id += 1,
        first_name: first_name,
        last_name: last_name,
        email: email,
        age: age,
        address: address
      }
      @@users << user
    end
  end

  def count
    @@users.size
  end

  def all
    @@users
  end

  def find(id: 0)
    where(id: id).first
    #@@users[0]
  end

  def where(*criteria)
    parsed_criteria = Hash(*criteria)
    
    @@users.select {|user|
      within_criteria(user, parsed_criteria)
    }
  end


  def update(*attributes)
    parsed_attributes = Hash(*attributes)
    return unless parsed_attributes[:id]
    @@users.each do |user|
        if user[:id] == parsed_attributes[:id]
            user[:first_name] = parsed_attributes[:first_name] if parsed_attributes[:first_name]
            user[:last_name] = parsed_attributes[:last_name] if parsed_attributes[:last_name]
            user[:email] = parsed_attributes[:email] if parsed_attributes[:email]
            user[:age] = parsed_attributes[:age] if parsed_attributes[:age]
            user[:address] = parsed_attributes[:address] if parsed_attributes[:address]
            break
        end
    end

    # user = where(id: parsed_attributes[:id]).first
    # return unless user

    # updated_user = user.merge(Hash(*attributes))
    # TODO: Call destroy and create
    
  end

  def destroy(id: 0)
    @@users.each_with_index {|user, index|
      if user[:id] == id
        @@users.delete_at(index)
        break
      end
    }
  end

  private

  def within_criteria(user, criteria)
    user_valid = true
    criteria.each_pair do |field, value|
      next unless user_valid
      user_valid &&= value == user[field]
    end
    user_valid
  end
end

u = User.new

u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")
u.create(first_name: "DOS", last_name: "TWO", email: "asd2@hotmail.com")
u.create(first_name: "UNO", last_name: "Three", email: "asd3@hotmail.com")

#u.destroy(id:2)
#p u.count
#p u.all
#p u.find(id:4)
#u.update(id: 1, first_name: "NUEVOS", last_name: "DATOS")
#u.update(one: "one", two: "two", three: "three")
#u.update(id: 2, first_name: "JAM", last_name: "SOLO")
#p u.all
#u.where(email: "asd@hotmail.com")


describe User do
    before do
      @u = User.new
    end
    
    describe "When create a new user" do
        it "Must respond positively" do
            _(@u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")).must_equal [{:id=>1, :first_name=>"UNO", :last_name=>"ONE", :email=>"asd@hotmail.com", :age=>nil, :address=>nil}]
        end
    end

    describe "When query all users" do
      it "Must respond with a array with all users" do
          @u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")
          _(@u.all()).must_equal [{:id=>1, :first_name=>"UNO", :last_name=>"ONE", :email=>"asd@hotmail.com", :age=>nil, :address=>nil}]
      end
    end

  describe "When query specific user" do
    it "Must respond with a user hash" do
        @u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")
        _(@u.find(id: 4)).must_be_nil
        #_(@u.find(id: 1)).must_output {:id=>1, :first_name=>"UNO", :last_name=>"ONE", :email=>"asd@hotmail.com", :age=>nil, :address=>nil}
        #_(@u.find(id: 1)).must_be {:id=>1, :first_name=>"UNO", :last_name=>"ONE", :email=>"asd@hotmail.com", :age=>nil, :address=>nil}
    end
  end


  describe "When query a users with criteria" do
    it "Must respond with a empty array" do
        @u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")
        @u.create(first_name: "DOS", last_name: "TWO", email: "asd2@hotmail.com")
        _(@u.where(email: "1234@hotmail.com")).must_equal []
    end

    it "Must respond with a array of user with the criteria" do
        @u.create(first_name: "DOS", last_name: "TWO", email: "asd2@hotmail.com")
        @u.create(first_name: "DOS", last_name: "OTRO", email: "123@hotmail.com")
        _(@u.where(first_name: "DOS")).must_equal [{:id=>1, :first_name=>"DOS", :last_name=>"TWO", :email=>"asd2@hotmail.com", :age=>nil, :address=>nil}, {:id=>2, :first_name=>"DOS", :last_name=>"OTRO", :email=>"123@hotmail.com", :age=>nil, :address=>nil}]
    end
  end

  describe "When query the number of users" do
    it "Must respond 2" do
        @u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")
        @u.create(first_name: "DOS", last_name: "TWO", email: "asd2@hotmail.com")
        _(@u.count).must_equal 2
    end

    it "Must respond 3" do
        @u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")
        @u.create(first_name: "DOS", last_name: "TWO", email: "asd2@hotmail.com")
        @u.create(first_name: "TRES", last_name: "THREE", email: "asd3@hotmail.com")
        _(@u.count).must_equal 3
    end
  end

  describe "When update a user"do
    it "Must respond nil" do
        @u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")
        @u.create(first_name: "DOS", last_name: "TWO", email: "asd2@hotmail.com")
        _(@u.update(id: 1, first_name: "Karla", last_name: "Pedraza")).must_be_nil
    end
  end

  describe "When query destroy a user" do
    it "" do
        @u.create( first_name: "UNO",last_name: "ONE", email: "asd@hotmail.com")
        @u.create(first_name: "DOS", last_name: "TWO", email: "asd2@hotmail.com")
        @u.create(first_name: "TRES", last_name: "Three", email: "asd3@hotmail.com")
        _(@u.destroy(id: 2)).must_be_nil
    end
  end

end
