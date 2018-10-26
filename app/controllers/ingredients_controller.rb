class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      redirect_to new_ingredient_path
    end
  end

  def update
    @ingredient = Ingredient.find_by(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredient = Ingredient.new
    @ingredients = Ingredient.all
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
