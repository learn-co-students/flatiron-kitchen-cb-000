class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :ingredients_recipes
  has_many :ingredients_recipes
  validates :name, presence: true

  def ingredient_ids=(ids)
    self.ingredients.clear
    ids.each do |id|
      if id.present?
        ingredient = Ingredient.find(id)
        self.ingredients_recipes.build(ingredient: ingredient)
      end
    end
  end
end
