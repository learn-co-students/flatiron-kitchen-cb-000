class IngredientsController < ApplicationController
  
  before_filter :set_ingredient, only: [:show, :edit, :update]
  
  def show 
  end 
  
  def new
    @ingredient = Ingredient.new
  end 
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save 
      redirect_to ingredient_path(@ingredient)
    else 
      render :new 
    end 
  end
  
  def edit
  end 
  
  def update 
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else 
      render :new 
    end 
  end
  
  private 
  
  def ingredient_params 
    params.require(:ingredient).permit(:ingredient_name)
  end
  
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
  
  
end
