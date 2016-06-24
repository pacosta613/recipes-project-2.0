class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)

    redirect_to recipe_path(@comment.recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:recipe_id, :content, :user_id)
  end

end