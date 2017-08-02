class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  after_action :build_ingredient, only: [:new, :edit]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe
    else
      render new_recipe_path
    end
  end

  def edit
  end

  def update
    @recipe.update_attributes(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render edit_recipe_path(@recipe)
    end
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def build_ingredient
    @recipe.ingredients.build
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], :ingredients_attributes => [:name])
  end
end
