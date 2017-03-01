class RecipesController < ApplicationController
  before_action :find_by_id, only: [:edit, :update, :show]
  
  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(awesome_params)
    recipe.save ? (redirect_to recipe) : (render 'new')
  end

  def edit; end

  def update
    @recipe.update(awesome_params) ? (redirect_to @recipe) : (render 'edit')
  end

  def show; end

  private

    def awesome_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def find_by_id
      @recipe = Recipe.find(params[:id])
    end


end
