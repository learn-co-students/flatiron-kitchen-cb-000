class RecipesController < ApplicationController
  
  before_filter :set_recipe, only: [:show, :edit, :update]
  
  def show
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save 
      redirect_to recipe_path(@recipe)
    else 
      render :new
    end 
  end
  
  def edit
    @recipe.ingredients.build
  end 
  
  def update 
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else 
      render :edit 
    end 
  end
  
  
  private
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  
  def recipe_params
    params.require(:recipe).permit(:recipe_name, ingredient_ids:[], ingredients_attributes: [:ingredient_name])
  end 
  
end
