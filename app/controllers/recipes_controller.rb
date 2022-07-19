class RecipesController < ApplicationController 
    def index
        @recipes = Recipe.all.order(name: :desc)
    end
    def show 
        @recipe = Recipe.find(params[:id])
    end
end