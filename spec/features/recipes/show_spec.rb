require 'rails_helper'

RSpec.describe 'recipe show page' do
    it 'lists the names of the ingredients the recipe has' do
        spaghetti = Recipe.create!(name: "Spaghetti and Meatballs", complexity: 2, genre: "Italian American")

        tomato_sauce = Ingredient.create(name: "Tomato Sauce", cost: 3 )
        pasta = Ingredient.create(name: "Pasta", cost: 2)
        meatballs = Ingredient.create(name: "Meatballs", cost: 5)

        spaghetti_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato_sauce.id)
        spaghetti_ingredient_2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
        spaghetti_ingredient_3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meatballs.id)

        visit "recipes/#{spaghetti.id}"

        expect(page).to have_content("Tomato Sauce")
        expect(page).to have_content("Pasta")
        expect(page).to have_content("Meatballs")
    end

    it "shows the total cost of all ingredients used in the recipe " do
        spaghetti = Recipe.create!(name: "Spaghetti and Meatballs", complexity: 2, genre: "Italian American")

        tomato_sauce = Ingredient.create(name: "Tomato Sauce", cost: 3 )
        pasta = Ingredient.create(name: "Pasta", cost: 2)
        meatballs = Ingredient.create(name: "Meatballs", cost: 5)

        spaghetti_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato_sauce.id)
        spaghetti_ingredient_2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
        spaghetti_ingredient_3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meatballs.id)

        visit "recipes/#{spaghetti.id}"

        expect(page).to have_content("Total Cost: 10")
    end
end

# User Story 4 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")
