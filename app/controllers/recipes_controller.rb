class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(rec_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(rec_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  private
  def rec_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
