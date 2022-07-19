require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'model methods' do 
    it "can return the sum of the cost of the ingredients used in the recipe" do
      spaghetti = Recipe.create!(name: "Spaghetti and Meatballs", complexity: 2, genre: "Italian American")

        tomato_sauce = Ingredient.create(name: "Tomato Sauce", cost: 3 )
        pasta = Ingredient.create(name: "Pasta", cost: 2)
        meatballs = Ingredient.create(name: "Meatballs", cost: 5)

        spaghetti_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato_sauce.id)
        spaghetti_ingredient_2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
        spaghetti_ingredient_3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meatballs.id)

        expect(spaghetti.total_cost).to eq(10)

    end
  end
end
