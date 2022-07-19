require 'rails_helper'

RSpec.describe 'recipes index page' do
    it 'has the name/complexity/genre of every recipe' do
        spaghetti = Recipe.create!(name: "Spaghetti and Meatballs", complexity: 2, genre: "Italian American")
        pizza = Recipe.create!(name: "Pepperoni Pizza", complexity: 5, genre: "American")
        pho = Recipe.create!(name: "Pho", complexity: 9, genre: "Vietnamese")

        visit '/recipes'

        within "#recipes-#{spaghetti.id}" do
            expect(page).to have_content("Name: Spaghetti and Meatballs")
            expect(page).to have_content("Complexity: 2")
            expect(page).to have_content("Genre: Italian American")
        end
        within "#recipes-#{pizza.id}" do
            expect(page).to have_content("Name: Pepperoni Pizza")
            expect(page).to have_content("Complexity: 5")
            expect(page).to have_content("Genre: American")
        end
        within "#recipes-#{pho.id}" do
            expect(page).to have_content("Name: Pho")
            expect(page).to have_content("Complexity: 9")
            expect(page).to have_content("Genre: Vietnamese")
        end
    end

end

# User Story 1 of 4
# As a visitor,
# When I visit '/recipes',
# I see a list of recipes with the following information:
# -Name
# -Complexity
# -Genre
# (e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")