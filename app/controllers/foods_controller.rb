class FoodsController < ApplicationController

  def new
    @food = Food.new
    @foods = Food.all
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
                                          # binding.pry
      redirect_to food_path(@food.id), notice: '食材を登録しました。'
    else
      redirect_to new_food_path, alert: '食材を登録出来ませんでした。'
    end
  end

  def index
    @foods = Food.all.order(deadline_time: :asc)
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
      redirect_to food_path(@food.id), notice: '食材を更新しました。'
    else
      redirect_to edit_food_path(@food), alert: '食材を更新出来ませんでした。'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if@food.destroy
      redirect_to foods_path, notice: '食材を削除しました。'
    else
      redirect_to edit_food_path(@food), alert: '食材を削除出来ませんでした。'
    end
  end


  private

  def food_params
    params.require(:food).permit(:food_name, :detail, :image, :genre, :quantity, :deadline_time)
  end

end
