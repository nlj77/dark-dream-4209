require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'model methods' do
    it "#ingredient count" do
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

      expect(tomato_sauce.recipe_count).to eq(2)
      expect(cheese.recipe_count).to eq(2)
      expect(meatballs.recipe_count).to eq(1)
    end
  end
end
