class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def ingredient_ids=(ids)
    ingredients = Ingredient.where(id: ids)

    self.ingredients = ingredients
  end

  def dishes_avaliable
    ingredients.minimum(:quantity) || 0
  end
end
