class CommentsController < ApplicationController

  def new 
    @comment = Comment.new
  end
  
  def create
    @recipe = Recipe.find_by(params[:recipe_id])
    @user = User.find_by(params[:user_id])
    @comment = @recipe.comments.create(comment_params)

    redirect_to recipe_path(@recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:recipe_id, :content, :user_id, user_attributes: [:email])
  end

end