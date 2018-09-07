class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    # binding.pry
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    # binding.pry
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
