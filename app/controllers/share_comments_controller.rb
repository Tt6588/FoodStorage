class ShareCommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @group = Group.find(params[:group_id])
    @share_food = ShareFood.find(params[:share_food_id])
    share_comment = ShareComment.new(share_comment_params)
    share_comment.user_id = current_user.id
    share_comment.group_id = @group.id
    share_comment.share_food_id = @share_food.id
    if share_comment.save
      # redirect_to "/groups/#{group.id}/share_foods/#{share_food.id}", notice: 'コメントしました'　#非同期化の為コメントアウト
    else
      redirect_to "/groups/#{@group.id}/share_foods/#{@share_food.id}", alert: 'コメント出来ませんでした'
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @share_food = ShareFood.find(params[:share_food_id])
    ShareComment.find_by(id: params[:id]).destroy
    # redirect_to "/groups/#{group.id}/share_foods/#{share_food.id}"　#非同期化の為コメントアウト
  end

  private
  def share_comment_params
    params.require(:share_comment).permit(:comment)
  end

end
