class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :new, :edit, :update, :destory]
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render "new"
    end
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  private
  def set_recipe
    if params.key?("id")
      @recipe = Recipe.find(params[:id])
    else
      @recipe = Recipe.new
    end
  end
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
