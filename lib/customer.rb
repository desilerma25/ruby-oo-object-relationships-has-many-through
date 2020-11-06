class Customer

    attr_accessor :name, :age

    @@all

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip) 
        # allows us to create new meals as a cust. & 
        # associate it w/ the customer who created it
    end

    def meals
        # cust. will look at all meals, select only ones that 
        # belong to them
        Meal.all.select do |meal|
            meal.customer == self
        end
    end
  
    def waiters
        meals.map do |meal|
            meal. waiter
        end
    end

end