class FoodsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :food_find, only: [:show, :edit, :update, :destroy, :correct_food]
  before_action :correct_food,only: [:edit, :show]
  

  def new
    @user = current_user
    @food = Food.new
    @foods = Food.all
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to new_food_path, notice: '食材を登録しました'#food_path(@food.id)詳細画面遷移から変更
    else
      redirect_to new_food_path, alert: '食材を登録出来ませんでした'
    end
  end

  def index 
    @user = current_user
    
    #ソート機能
    if params[:sort_update1]
      @foods = Food.latest1
      @sort_neme = "期限-古い順"
    elsif params[:sort_update2]
      @foods = Food.latest2
      @sort_neme = "期限-新しい順"
    elsif params[:sort_update3]
      @foods = Food.latest3
      @sort_neme = "作成-古い順"
    elsif params[:sort_update4]
      @foods = Food.latest4
      @sort_neme = "作成-新しい順"
    else
      @foods = Food.all.order(deadline_time: :asc)
      @sort_neme = "並び替え"
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to food_path(@food.id), notice: '食材を更新しました'
    else
      redirect_to edit_food_path(@food), alert: '食材を更新出来ませんでした'
    end
  end

  def destroy
    if@food.destroy
      redirect_to foods_path, notice: '食材を削除しました'
    else
      redirect_to edit_food_path(@food), alert: '食材を削除出来ませんでした'
    end
  end
  
  def correct_food
    unless @food.user.id == current_user.id
      redirect_to foods_path
    end
  end


  private

  def food_params
    params.require(:food).permit(:food_name, :detail, :image, :genre, :quantity, :deadline_time)
  end
  
  def food_find
    @food = Food.find(params[:id])
  end

end
