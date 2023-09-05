class BooksController < ApplicationController
  before_action :correct_user, only: %i[edit update]

  def index
    @book_new = Book.new
    @user = current_user
    @slide_users = User.all
    if Book.ransack(params[:q]).present?
      @q = Book.ransack(params[:q])
      @books = @q.result(distinct: true)
    else
      @books = Book.all
    end

    # to = Time.current.at_end_of_day
    # from = (to - 6.day).at_beginning_of_day
    # @books = @books.includes(:favorites).
    # sort {|a,b| 
    #   b.favorites.includes(:favorites).where(created_at: from...to).size <=> 
    #   a.favorites.includes(:favorites).where(created_at: from...to).size
    # }
    
    # @books = Book.includes(:favorites).sort_by {|x| x.favorites.where(created_at: from...to).size}.reverse

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


  def search
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
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
