class IngredientsController < ApplicationController
  before_action :get_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :'new'
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render :'edit'
    end
  end

  def edit
  end

  def show
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

    def get_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
end
