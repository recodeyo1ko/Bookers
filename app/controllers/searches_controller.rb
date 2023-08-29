class SearchesController < ApplicationController
  def tag_search
    @tag = Tag.find_by(name: params[:tag_name])
    @books = @tag.books
    @user = current_user
    @book_new = Book.new
    render "result"
  end

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
    render "search_result"


  end

  def search_result
  end

end
