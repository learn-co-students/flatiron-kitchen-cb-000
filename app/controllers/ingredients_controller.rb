class IngredientsController < ApplicationController
  before_action :find_by_id, only: [:edit, :update, :show]

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.new(awesome_params)
    ingredient.save ? (redirect_to ingredient) : (render 'new')
  end

  def edit; end

  def update
    @ingredient.update(awesome_params) ? (redirect_to @ingredient) : (render 'edit')
  end

  def show; end

  private

    def awesome_params
      params.require(:ingredient).permit(:name)
    end

    def find_by_id
      @ingredient = Ingredient.find(params[:id])
    end
end
