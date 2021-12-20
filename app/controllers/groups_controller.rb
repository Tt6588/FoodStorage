class GroupsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_group,only: [:edit]

  before_action :group_find, only: [:show, :edit, :update]

  def index
    index_view
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      GroupUser.create(user_id: current_user.id,  group_id: @group.id)
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      redirect_to groups_path, alert: 'グループを作成出来ませんでした'
    end
  end

  def show; end

  def edit; end

  def update
    # @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'グループを更新しました'
    else
      redirect_to groups_path, alert: 'グループを更新出来ませんでした'
    end
  end

  def destroy
    delete_group = Group.find(params[:id])
    if delete_group.destroy
      redirect_to groups_path, notice: 'グループを削除しました'
    else
      redirect_to groups_path, alert: 'グループを削除出来ませんでした'
    end
  end

  def search
    keyword = params[:keyword]
    @results = Group.where('name LIKE ?', "%#{keyword}%")

    index_view

    render :index
  end

  def join
    group_id = params[:group_id].to_i
    group_user = GroupUser.find_by(user_id: current_user.id,  group_id: group_id)

    if group_user
      GroupUser.destroy(group_user.id)
      redirect_to groups_path , notice: 'グループを退室しました'
    else
      GroupUser.create(user_id: current_user.id,  group_id: group_id)
      redirect_to groups_path , info: 'グループに参加しました'
    end
  end

  def correct_group
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end


  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :owner_id,  user_ids: [])
  end

  def index_view
    @group = Group.new
    @group.users << current_user

    @group_lists = Group.all
    @group_joining = GroupUser.where(user_id: current_user.id)
    @group_lists_none = "グループに参加していません"
  end

  def group_find
    @group = Group.find(params[:id])
  end

end
