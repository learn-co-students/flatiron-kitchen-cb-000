class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
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
    @recipe.update_attributes(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end


  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
  # params.require(:post).permit(:name, :content, :tag_ids => [], :tags_attributes => [:name])


end
