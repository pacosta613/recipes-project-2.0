class IngredientsController < ApplicationController
  before_action :find_recipe
  def new
    @ingredient = @recipe.ingredients.build
  end

  def create
    @ingredient = @recipe.ingredients.create(ingredient_params)
    
    redirect_to recipe_path(@recipe)
  end

  def edit
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_id)
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end
