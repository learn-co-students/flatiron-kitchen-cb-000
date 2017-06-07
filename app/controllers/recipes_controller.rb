class RecipesController < ApplicationController
 before_action :set_recipe, only: [:show, :edit, :update]

def index
  @recipes = Recipe.all
end


def new
  @recipe = Recipe.new
  @ingredients = Ingredient.all
end

def create
  Recipe.create(recipe_params)
  redirect_to recipes_path
end

def edit
  # @recipe = Recipe.find(params[:id])
  @all_ingredients = Ingredient.all
  @recipe_ingredients = @recipe.ingredients
end

def show
  # @recipe = Recipe.find(params[:id])
end

def update
# @recipe = Recipe.find(params[:id])
@recipe.update(recipe_params)
redirect_to recipes_path
end

def set_recipe
  @recipe = Recipe.find(params[:id])
end

private

def recipe_params
   params.require(:recipe).permit(:name, ingredient_ids: [])
end

end
