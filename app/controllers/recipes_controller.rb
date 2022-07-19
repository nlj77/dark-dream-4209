class RecipesController < ApplicationController 
    def index
        @recipes = Recipe.all.order(name: :asc)
    end
    def show 
        @recipe = Recipe.find(params[:id])
    end
end