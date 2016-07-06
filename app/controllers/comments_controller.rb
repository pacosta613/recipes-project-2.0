class CommentsController < ApplicationController

  def index
    if params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @comments = @recipe.comments 
    else
      @comments = Comment.all 
    end
  end
  
  def create
    @comment = Comment.create(comment_params)
    
    redirect_to recipe_path(@comment.recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:recipe_id, :content, :user_id)
  end

end