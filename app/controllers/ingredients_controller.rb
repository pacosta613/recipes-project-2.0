class IngredientsController < ApplicationController
  before_action :find_recipe, except: [:index]

  def index
    if params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @ingredients = @recipe.ingredients
    else
      @ingredients = Ingredient.all
    end
  end

  def new
    @ingredient = @recipe.ingredients.build
  end

  def create
    @ingredient = @recipe.ingredients.create(ingredient_params) 
    if @ingredient.save

      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = @ingredient.errors.full_messages
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_id)
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end
