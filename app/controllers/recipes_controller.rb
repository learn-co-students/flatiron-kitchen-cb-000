class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    if @recipe = Recipe.find_by(:id => params[:id])
      render :show
    end
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(:name => nil)
    render :new
  end

  def create
    #raise params.inspect 
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe.id)
      else
      render :new
    end
  end

  def edit
    if @recipe = Recipe.find_by(:id => params[:id])
      render :edit
    end
  end


  def update
    if @recipe = Recipe.find_by(:id => params[:id])
      @recipe.update(recipe_params)
      if @recipe.valid?
        redirect_to recipe_path(@recipe.id)
      else
        render :edit
      end
    end
  end

  def destroy
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], :ingredients_attributes => [:name] )
  end

end
