class Ingredient < ActiveRecord::Base
  has_many :recipe, through: :ingredients_recipes
  has_many :ingredients_recipes
  validates :name, presence: true
end
