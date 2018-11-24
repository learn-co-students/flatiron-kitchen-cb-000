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
    if @recipe = Recipe.find_or_create_by(recipe_params)
      @recipe.ingredients_attributes = ingredients_params
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    @recipe.ingredients_attributes = ingredients_params
    redirect_to recipe_path(@recipe)
  end

  def recipe_params
    params.require(:recipe).permit(:name)
  end

  def ingredients_params
    params.has_key?(:ingredients) ? params.require(:ingredients).permit(:ids => []) : { ids: [] }
  end
end
