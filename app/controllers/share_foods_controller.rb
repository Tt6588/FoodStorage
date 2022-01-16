class ShareFoodsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_share_food,only: [:edit, :show, :new, :index]
  
  before_action :share_food_find, only: [:show, :edit, :update, :destroy]
  before_action :group_find, only: [:new, :create, :index, :show, :edit, :update]

  def new
    @share_food = ShareFood.new
  end

  def create
    @share_food = ShareFood.new(share_food_params)
    @share_food.group_id = @group.id
    if @share_food.save
      redirect_to new_group_share_food_path, notice: '食材を追加しました'
      #"/groups/#{@group.id}/share_foods/#{@share_food.id}" 詳細画面遷移から変更
    else
      redirect_to new_group_share_food_path, alert: '食材を登録出来ませんでした'
    end
  end

  def index
    @share_food_addition = ShareFood.where(group_id: @group.id)
    @share_foods_none = "食材を追加してください"

    #ソート機能
    if params[:sort_update1]
      @share_foods = ShareFood.latest1
      @sort_neme = "期限-古い順"
    elsif params[:sort_update2]
      @share_foods = ShareFood.latest2
      @sort_neme = "期限-新しい順"
    elsif params[:sort_update3]
      @share_foods = ShareFood.latest3
      @sort_neme = "作成-古い順"
    elsif params[:sort_update4]
      @share_foods = ShareFood.latest4
      @sort_neme = "作成-新しい順"
    else
      @share_foods = ShareFood.all.order(deadline_time: :asc)
      @sort_neme = "並び替え"
    end
  end

  def show
    @share_comment = ShareComment.new
  end

  def edit
  end

  def update
    if @share_food.update(share_food_params)
      redirect_to "/groups/#{@group.id}/share_foods/#{@share_food.id}", notice: '食材を更新しました'
    else
      redirect_to "/groups/#{@group.id}/share_foods/#{@share_food.id}/edit", alert: '食材を更新出来ませんでした'
    end
  end

  def destroy
    if @share_food.destroy
      redirect_to group_share_foods_path, notice: '食材を削除しました'
    else
      redirect_to "/groups/#{@group.id}/share_foods/#{@share_food.id}/edit", alert: '食材を削除出来ませんでした'
    end
  end

  def correct_share_food
    group_id = params[:group_id].to_i
    group_user = GroupUser.find_by(user_id: current_user.id,  group_id: group_id)
    unless group_user
      redirect_to groups_path
    end
  end


  private

  def share_food_params
    params.require(:share_food).permit(:food_name, :detail, :image, :genre, :quantity, :deadline_time)
  end
  
  def share_food_find
    @share_food = ShareFood.find(params[:id])
  end
  
  def group_find
    @group = Group.find(params[:group_id])
  end

end
