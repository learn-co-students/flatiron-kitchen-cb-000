class Recipe < ActiveRecord::Base
    has_many :ingredients

    validates :name, presence: true

    def ingredients_to_dishes
        if no_of_ingredients != 1
            self.no_of_ingredients / 2
        else
            1
        end
    end

    def no_of_ingredients
        self.ingredients.length
    end
end
