class GroupsController < ApplicationController

  def new
    @group = Group.new
  end
  
  def index
    @groups = Group.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = current_user
    @book = Book.new
    @group = Group.find(params[:id])
    @user_belongs_to_group = User.find(@group.owner_id)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.save!
    redirect_to groups_path
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group.id)

  end

  def join
    group = Group.find(params[:id])
    group.users << current_user
    group.save!
    redirect_to group_path(group.id)
  end

  def leave
    group = Group.find(params[:id])
    group.users.delete(current_user)
    redirect_to groups_path
  end
  

  private

  def group_params
    params.require(:group).permit(:name , :introduction , :image, :owner_id)
  end

end
