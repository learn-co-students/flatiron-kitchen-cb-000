class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :new, :edit, :update, :destory]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render "new"
    end
  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render "edit"
    end
  end

  private
  def set_ingredient
    if params.key?("id")
      @ingredient = Ingredient.find(params[:id])
    else
      @ingredient = Ingredient.new
    end
  end
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
