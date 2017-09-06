class Recipe < ActiveRecord::Base
  validates_presence_of [:name]
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, :reject_if => Proc.new{|attributes| attributes[:name].blank? }

  def ingredients_to_dishes
      self.ingredients.collect { |ingredient| ingredient.quantity }.min if !self.ingredients.empty?
  end


end
