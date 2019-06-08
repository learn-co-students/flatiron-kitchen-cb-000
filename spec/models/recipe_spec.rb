require 'spec_helper'

describe 'Recipe' do
  it 'is invalid with a blank name' do
    recipe1 =  Recipe.new(recipe_name: nil)
    recipe2 =  Recipe.new(recipe_name: '')

    expect(recipe1).to have(1).errors_on(:recipe_name)
    expect(recipe2).to have(1).errors_on(:recipe_name)
  end
end
