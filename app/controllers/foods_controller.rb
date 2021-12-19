class FoodsController < ApplicationController
  
  before_action :authenticate_user!
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
                                          # binding.pry
      redirect_to food_path(@food.id), notice: '食材を登録しました'
    else
      redirect_to new_food_path, alert: '食材を登録出来ませんでした'
    end
  end

  def index #ソート機能
    @user = current_user
    if params[:sort_update1]
      @foods = Food.latest1
    elsif params[:sort_update2]
      @foods = Food.latest2
    elsif params[:sort_update3]
      @foods = Food.latest3
    elsif params[:sort_update4]
      @foods = Food.latest4
    else
      @foods = Food.all.order(deadline_time: :asc)
    end
  end

  def show
    @food = Food.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to food_path(@food.id), notice: '食材を更新しました'
    else
      redirect_to edit_food_path(@food), alert: '食材を更新出来ませんでした'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if@food.destroy
      redirect_to foods_path, notice: '食材を削除しました'
    else
      redirect_to edit_food_path(@food), alert: '食材を削除出来ませんでした'
    end
  end
  
  def correct_food
        @food = Food.find(params[:id])
    unless @food.user.id == current_user.id
      redirect_to foods_path
    end
  end


  private

  def food_params
    params.require(:food).permit(:food_name, :detail, :image, :genre, :quantity, :deadline_time)
  end

end
