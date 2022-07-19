class Recipe < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :complexity
    validates_presence_of :genre

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def total_cost
        ingredients.map {|ingredient| ingredient.cost}.sum
    end
end