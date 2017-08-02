class ChangeQuantityTypeInIngredients < ActiveRecord::Migration
  def change
    change_column :ingredients, :quantity, :double
  end
end
