class RecipesController < ApplicationController
  #before_action :require_user, only: [:create, :show, :edit, :update, :destroy]
  before_action :find_recipes, only: [:index]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show    
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)

      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    #binding.pry
    @recipe.destroy

    redirect_to root_path
  end

  private
  # :user_id is meant to find comments user.
  def recipe_params
    params.require(:recipe).permit(:name, :user_id, ingredient_ids: [], ingredients_attributes: [:name])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def find_recipes
    @recipe = Recipe.find_by(params[:id])
  end

end