class ShareCommentsController < ApplicationController
  
  def create
    group = Group.find(params[:group_id])
    share_food = ShareFood.find(params[:share_food_id])
    share_comment = ShareComment.new(share_comment_params)
    share_comment.user_id = current_user.id
    share_comment.group_id = group.id
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
