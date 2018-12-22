class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  validates :name, presence: true

  def ingredients_attributes=(ingredients)
    ingredients.each do |i, ingr_attributes|
      self.ingredients.build(ingr_attributes)
    end
  end
end
