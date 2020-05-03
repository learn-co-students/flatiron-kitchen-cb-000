class Recipe < ApplicationRecord
  has_many :recipe_ingredients 
  has_many :ingredients, thorugh: :recipe_ingredients
  
  validates :name, presence: true, uniqueness: true
  
end
