require 'spec_helper'

describe "converting no. of ignredients to dishes" do
  context "on the recipe show page" do

        it "should display the number of servings for one ingredient" do
            recipe = Recipe.create(name: "Gingerbread Man")
            recipe.ingredients.create(name: "Ginger")
            
            visit recipe_path(recipe)

            expect(page).to have_content("This recipe can make 1 serving.")
        end

        it "should change when the number of ingredients change" do
            recipe = Recipe.create(name: "Real Gingerbread Man")
            recipe.ingredients.create(name: "Ginger")
            recipe.ingredients.create(name: "Water")
            recipe.ingredients.create(name: "Milk")
            recipe.ingredients.create(name: "Bread")
            
            visit recipe_path(recipe)

            expect(page).to have_content("This recipe can make 2 servings.")
        end
    end
end