class Recipe < ActiveRecord::Base
    has_many :ingredients

    validates :name, presence: true

    def ingredients_to_dishes
        self.no_of_ingredients / 2
    end

    def no_of_ingredients
        self.ingredients.length
    end
end
