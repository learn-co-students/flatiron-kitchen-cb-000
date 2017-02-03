class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(post_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :'new'
    end
  end

  def edit
  end

  def update
    if @ingredient.update(post_params)
      redirect_to @ingredient
    else
      render :'edit'
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
