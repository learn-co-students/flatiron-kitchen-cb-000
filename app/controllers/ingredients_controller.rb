class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      redirect_to ingredient
    else
      render :new
    end
  end

  def edit
    @ingredient = find_ingredient
  end

  def update
    ingredient = find_ingredient
    if ingredient.update(ingredient_params)
      redirect_to ingredient
    else
      render :edit
    end
  end

  def delete
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def find_ingredient
    Ingredient.find(params[:id])
  end
end
