class BooksController < ApplicationController
  before_action :correct_user, only: %i[edit update]

  def index
    @book_new = Book.new
    #@books = Book.all
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    @books = Book.includes(:favorites).
    sort {|a,b| 
      b.favorites.includes(:favorites).where(created_at: from...to).size <=> 
      a.favorites.includes(:favorites).where(created_at: from...to).size
    }
    
    # @books = Book.includes(:favorites).sort_by {|x| x.favorites.where(created_at: from...to).size}.reverse

    @user = current_user
    @slides = Book.all
    if params[:sort] == "star"
      @books = @books.sort_by { |book| book.star }.reverse
    else
      @books.sort { |book| book.created_at }
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
    
    params[:book][:tag_name].split.each do |tag_name|
      if Tag.find_by(name: tag_name).nil?
        @tag = Tag.new(name: tag_name)
        @tag.save!
        @book_new.tags << @tag
      else
        @tag = Tag.find_by(name: tag_name)
        @book_new.tags << @tag
      end
    end

    if @book_new.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book_new.id)
    else
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

  private

  def book_params
    params.require(:book).permit(:title, :body, :star)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
