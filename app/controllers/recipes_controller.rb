class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		redirect_to recipe_path(@recipe)
	end

	def show
		find_recipe
	end

	def edit
		find_recipe
	end

	def update
		find_recipe
		@recipe.update(recipe_params)

		redirect_to recipe_path(@recipe)
	end


	private

	def recipe_params
		params.require(:recipe).permit(:name, ingredient_ids: [])
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end
end
