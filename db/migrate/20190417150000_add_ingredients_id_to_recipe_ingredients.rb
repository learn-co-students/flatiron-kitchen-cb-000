class AddIngredientsIdToRecipeIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :ingredients_id, :integer
  end
end
