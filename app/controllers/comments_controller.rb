class CommentsController < ApplicationController
  
  def create
    food = Food.find(params[:food_id])
    comment = current_user.comments.new(comment_params)
    comment.food_id = food.id
    comment.save
    redirect_to food_path(food)
  end
  
  def destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
