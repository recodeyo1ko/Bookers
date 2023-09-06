class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]

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
      render :edit
    end
  end

  def search
    @user = User.find(params[:id])
    @books = @user.books
    #render :show
    if params[:created_at]
      @search_book = @books.where(created_at: params[:created_at].to_date.all_day)
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction, :postalcode,
      :prefecture_code, :address_city, :address_street, :address_building)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
  end
end
