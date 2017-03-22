class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, reject_if: :blank_name

  def ingredients_attributes=(attributes)
    attributes.values.each do |ingredient_attributes|
      if not blank_name(ingredient_attributes)
        ing = Ingredient.find_or_create_by(ingredient_attributes)
        self.ingredients << ing
      end
    end
  end

  private
  def blank_name(attributes)
    attributes[:name].blank?
  end

end
