class Waiter

    attr_accessor :name, :yrs_experience 
    # don't have add. attr bc they don't need to keep track of 
    # the info. **SINGLE SOURCE OF TRUTH**

    @@all = []
    
    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip) 
        # allows us to create new meals as a waiter & 
        # associate it w/ the waiter who created it
    end

    def meals 
        # waiter will look at all meals, select only ones that 
        # belong to them
        Meal.all.select do |meal|
            meal.waiter == self 
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end

        best_tipped_meal.customer
    end


end