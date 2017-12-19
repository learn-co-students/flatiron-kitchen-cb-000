class RecipesController < ApplicationController
    
    def new
        @recipe = Recipe.new
    end
    
    def create
       if Recipe.create(recipe_params) 
           redirect_to recipes_path
        else
           render :new 
        end
    end
    
    def edit
       @recipe = Recipe.find(params[:id])
    end
    
     def update
       @recipe = Recipe.find(params[:id])
       if@recipe.update(recipe_params) 
           redirect_to recipes_path
        else
           render :edit 
        end
    end
    
    private
        
        def recipe_params
            params.require(:recipe).permit(:name, ingredient_ids: [])
        end
end
