class ShareCommentsController < ApplicationController
  
  def create
    share_food = ShareFood.find(params[:share_food_id])
    share_comment = current_user.comments.new(share_comment_params)
    share_comment.share_food_id = share_food.id
    share_comment.save
    redirect_to share_food_path(share_food)
  end
  
  def destroy
    ShareComment.find_by(id: params[:id]).destroy
    redirect_to group_share_food_path(params[:share_food_id])
  end
  
  private
  def share_comment_params
    params.require(:share_comment).permit(:comment)
  end
  
end
