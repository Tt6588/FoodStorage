class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    # @food.genre = 1
     @food.save
    # binding.pry
      redirect_to foods_path
  end

  def index
    @foods = Food.all.order(deadline_time: :asc)
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
  end

  def destroy
  end


  private

  def food_params
    params.require(:food).permit(:food_name, :detail, :image, :genre, :quantity, :deadline_time)
  end

end
