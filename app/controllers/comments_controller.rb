class CommentsController < ApplicationController
  
  def create
    @food = Food.find(params[:food_id])
    comment = current_user.comments.new(comment_params)
    comment.food_id = @food.id
    if comment.save
      # redirect_to food_path(food), notice: 'コメントしました' #非同期化のためコメントアウト
    else
      redirect_to food_path(@food), alert: 'コメント出来ませんでした'
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id]).destroy
    @food = Food.find(params[:food_id])
    
    # redirect_to food_path(params[:food_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
