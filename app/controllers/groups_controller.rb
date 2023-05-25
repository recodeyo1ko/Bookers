class GroupsController < ApplicationController

  def new
    @group = Group.new
  end
  
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(:id)
  end

  def edit
    @group = Group.find(:id)
  end

  def create
    @group = Group.new(group_params)
    @group.save!
    redirect_to groups_path
  end

  def update
    @group = Group.find(:id)
  end

  private

  def group_params
    params.require(:group).permit(:name , :introduction , :image)
  end

end
