class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "User was successfully updated."
    else
      render:edit
    end
  end



  # ストロングパラメータ


  private

  def user_params
      params.require(:user).permit(:profile_image,:name,:introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
  end

end
