class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def all_ingredient_ids
    self.ingredients.collect{|i| i.id}
  end

  def self.matching_recipes(recipe)
    ingredient_ids = recipe.all_ingredient_ids
    matches = self.all.select do |recipe|
      (ingredient_ids - recipe.all_ingredient_ids).empty?
    end
    matches.delete_if{|r| r.id == recipe.id}
  end

end
