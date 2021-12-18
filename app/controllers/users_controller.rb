class UsersController < ApplicationController
  
    before_action :authenticate_user!
    before_action :correct_user,only: [:edit]
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '管理者情報を更新しました。'
    else
      render :edit
    end
  end
  
  def correct_user
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(@user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end
  
end
