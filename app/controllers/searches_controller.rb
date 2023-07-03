class SearchesController < ApplicationController
  def tag_search
    @tag = Tag.find_by(name: params[:tag_name])
    @books = @tag.books
    @user = current_user
    @book_new = Book.new
    render "result"
  end
end
