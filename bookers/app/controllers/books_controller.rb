class BooksController < ApplicationController
  before_action :correct_user, only: %i[edit update]

  def index
    @book_new = Book.new
    @user = current_user
    @q = Book.ransack(params[:q])
    if params[:q]&.fetch(:tag_list, nil).nil?
      @books = Book.all
    elsif params[:q][:tag_list].present?
      @books = @q.result(distinct: true).tagged_with(params[:q][:tag_list])
    else
      @books = @q.result(distinct: true)
    end

    if params[:sort] == "created_at"
      @books = @books.sort { |book| book.created_at }
    elsif params[:sort] == "star"
      @books = @books.sort_by { |book| book.star }.reverse
    elsif params[:sort] == "view_count"
      @books = @books.sort_by { |book| book.view_count }.reverse
    elsif params[:sort] == "favorite_count"
      @books = @books.sort_by { |book| book.favorites.count }.reverse
    elsif params[:sort] == "comment_count"
      @books = @books.sort_by { |book| book.book_comments.count }.reverse
    else
      @books = @books
    end

  end

  def show
    @book = Book.find(params[:id])
    @book.update!(view_count: @book.view_count + 1)
    @book_new = Book.new
    @user = @book.user
    @comment_new = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.star = 0 if @book_new.star.nil?
    @book_new.user_id = current_user.id

    if @book_new.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book_new.id)
    else
      @q = Book.ransack(params[:q])
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  def search
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :star, :tag_list)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
