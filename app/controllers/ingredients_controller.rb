class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    render :index
  end

  def show
    if @ingredient = Ingredient.find_by(:id => params[:id])
      render :show
    end
  end

  def new
    @ingredient = Ingredient.new
    render :new
  end

  def create
    #raise params.inspect
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredient_path(@ingredient.id)
    else
      render :new
    end
  end

  def edit
    if @ingredient = Ingredient.find_by(:id => params[:id])
      render :edit
    end
  end


  def update
    if @ingredient = Ingredient.find_by(:id => params[:id])
      @ingredient.update(ingredient_params)
      if @ingredient.valid?
        @ingredient.save
        redirect_to ingredient_path(@ingredient.id)
      else
        render :edit
      end
    end
  end
  def destroy
    if @ingredient.find_by(:id => params[:id])
      @ingredient.delete
      redirect_to ingredients_path
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
