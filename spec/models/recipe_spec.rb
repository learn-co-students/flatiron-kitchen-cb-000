require 'spec_helper'

describe 'Recipe' do
  it 'is invalid with a blank name' do
    recipe1 =  Recipe.new(name: nil)
    recipe2 =  Recipe.new(name: '')

    expect(recipe1).to have(1).errors_on(:name)
    expect(recipe2).to have(1).errors_on(:name)
  end
end

describe '#dishes_avaliable' do
  context 'ingredients avaliable' do
    it 'returns the amount of dishes that can be made given the existing ingredients' do
      coffee = Recipe.create!(name: 'coffee')
      coffee.ingredients.create!(name: 'spoon of sugar', quantity: 3)
      coffee.ingredients.create!(name: '2 spoons of milk', quantity: 4)

      expect(coffee.dishes_avaliable).to eq(3)
    end
  end

  context 'ingredients not avaliable' do
    it 'returns 0' do
      coffee = Recipe.create!(name: 'coffee')
      coffee.ingredients.create!(name: 'spoon of sugar', quantity: 0)
      coffee.ingredients.create!(name: '2 spoons of milk', quantity: 4)

      expect(coffee.dishes_avaliable).to eq(0)
    end
  end

  context 'with no ingredients' do
    it 'returns 0' do
      coffee = Recipe.create!(name: 'coffee')

      expect(coffee.dishes_avaliable).to eq(0)
    end
  end
end
