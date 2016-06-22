class RecipesController < ApplicationController
  #before_action :require_user, only: [:create, :show, :edit, :update, :destroy]
  before_action :find_recipes, only: [:index]
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      
      redirect_to recipes_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    find_recipe    
  end

  def edit
    find_recipe
  end

  def update
    find_recipe
    if @recipe.update(recipe_params)

      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    #binding.pry
    find_recipe
    @recipe.destroy

    redirect_to root_path
  end

  private
  # :user_id is meant to find comments user.
  def recipe_params
    params.require(:recipe).permit(:name, :user_id, ingredients_attributes: [:name])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def find_recipes
    @recipe = Recipe.find_by(params[:id])
  end

end