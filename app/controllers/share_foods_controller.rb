class ShareFoodsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @share_food = ShareFood.new
    @share_foods = ShareFood.all
  end

  def create
    @group = Group.find(params[:group_id])
    @share_food = ShareFood.new(share_food_params)
    @share_food.group_id = @group.id
    if @share_food.save
                                          # binding.pry
      redirect_to "/groups/#{@group.id}/share_foods/#{@share_food.id}", notice: '食材を追加しました。'
    else
      render :new
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @share_food_addition = ShareFood.where(group_id: @group.id)
    @share_foods_none = "食材を追加してください。"
    @share_foods = ShareFood.all.order(deadline_time: :asc)
  end

  def show
    @group = Group.find(params[:group_id])
    @share_food = ShareFood.find(params[:id])
    @share_comment = ShareComment.new
  end

  def edit
    @group = Group.find(params[:group_id])
    @share_food = ShareFood.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @share_food = ShareFood.find(params[:id])
    if @share_food.update(share_food_params)
      redirect_to "/groups/#{@group.id}/share_foods/#{@share_food.id}", notice: '食材を更新しました。'
    else
      render :show
    end
  end

  def destroy
    @share_food = ShareFood.find(params[:id])
    if @share_food.destroy
      redirect_to group_share_foods_path, notice: '食材を削除しました。'
    else
      render :new
    end
  end


  private

  def share_food_params
    params.require(:share_food).permit(:food_name, :detail, :image, :genre, :quantity, :deadline_time)
  end

end
