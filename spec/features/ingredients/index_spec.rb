require 'rails_helper'

RSpec.describe 'ingredients index page' do
    it "shows the names of all ingredients and the number of recipes each ingredient is used in " do
        spaghetti = Recipe.create!(name: "Spaghetti and Meatballs", complexity: 2, genre: "Italian American")
        pizza = Recipe.create!(name: "Pepperoni Pizza", complexity: 5, genre: "American")

        cheese = Ingredient.create(name: "Mozzarella Cheese", cost: 5)
        tomato_sauce = Ingredient.create(name: "Tomato Sauce", cost: 3 )
        pasta = Ingredient.create(name: "Pasta", cost: 2)
        meatballs = Ingredient.create(name: "Meatballs", cost: 5)
        pepperoni = Ingredient.create(name: "Pepperoni", cost: 7)

        spaghetti_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato_sauce.id)
        spaghetti_ingredient_2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
        spaghetti_ingredient_3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meatballs.id)
        spaghetti_ingredient_4 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: cheese.id)

        pizza_ingredient_1 = RecipeIngredient.create!(recipe_id: pizza.id, ingredient_id: tomato_sauce.id)
        pizza_ingredient_2 = RecipeIngredient.create!(recipe_id: pizza.id, ingredient_id: cheese.id)
        pizza_ingredient_3 = RecipeIngredient.create!(recipe_id: pizza.id, ingredient_id: pepperoni.id)

        visit '/ingredients'
        expect(page).to have_content("Tomato Sauce: 2")
        expect(page).to have_content("Mozzarella Cheese: 2")
        expect(page).to have_content("Pepperoni: 1")
        expect(page).to have_content("Meatballs: 1")
    end
end
# User Story 3 of 4
# As a visitor,
# When I visit '/ingredients'
# I see a list of ingredients and the number of recipes each ingredient is used in.
# (e.g. "Ground Beef: 2"
#      "Salt: 4")