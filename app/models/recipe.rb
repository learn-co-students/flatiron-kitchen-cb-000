class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  validates :name, presence: true

  def ingredients_attributes=(attributes)
    self.ingredients.clear
    ing_ids = attributes[:ids]
    ing_ids.each do |ing_id|
      if !ing_id.empty? && ingredient = Ingredient.find_by(id: ing_id)
        self.ingredients << ingredient
      end
    end
  end
end
