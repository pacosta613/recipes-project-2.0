class Recipe < ActiveRecord::Base
  ratyrate_rateable "recipe_ratings"

  belongs_to :user
  has_many :comments
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, :presence => true
  validates :name, :uniqueness => true

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient_attributes|

      #if !(ingredient["name"] == "")
      ingredient = Ingredient.find_or_create_by(name: ingredient_attributes)
      self.recipe_ingredients.build(:ingredient => ingredient)
      #end
    end
  end
end

