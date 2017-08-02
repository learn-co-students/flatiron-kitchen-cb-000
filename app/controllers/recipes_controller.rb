class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(post_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(post_params)
      redirect_to @recipe
    else
      render :'edit'
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end

