class FoodsController < ApplicationController
  
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = currnt_user.id
    @food.seve
    redirect_to new_food_path
  end

  def index
    @foods = Food.all
  end

  def show
  end
  
  def edit
  end
  
  def update
  end

  def destroy
  end
  
  
  private
  
  def food_params
    parame.require(:food).permit(:food_name, :detail, :image, :quantity, :deadline_time)
  end
  
end
