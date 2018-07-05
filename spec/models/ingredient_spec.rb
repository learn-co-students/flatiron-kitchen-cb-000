require 'spec_helper'

describe 'Ingredient' do
  it 'is invalid with a blank name' do
    ingredient1 = Ingredient.new(ingredient_name: nil)
    ingredient2 = Ingredient.new(ingredient_name: '')

    expect(ingredient1).to have(1).errors_on(:ingredient_name)
    expect(ingredient2).to have(1).errors_on(:ingredient_name)
  end
end
