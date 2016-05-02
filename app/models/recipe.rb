class Recipe < ActiveRecord::Base
  ratyrate_rateable "recipe_ratings"
  
  belongs_to :user
  has_many :ingredients
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, :presence => true
  #accepts_nested_attributes_for :ingredients_attributes
  #def ingredients_attributes=(ingredients_attributes)
  #  ingredients_attributes.values.each do |ingredients|
  #    ingredient = Ingredient.find_or_create_by(name: ingredient)
  #    self.recipe_ingredients.build(:ingredient => ingredient)
  #    end
  #  end
  #end
  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient|

      if !(ingredient["name"] == "")
        ingredient = Ingredient.find_or_create_by(name: ingredient)
        self.recipe_ingredients.build(:ingredient => ingredient)
      end
    end
  end
end