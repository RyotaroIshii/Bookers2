class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = 'You have created book successfully.'
    else
      @books = Book.all
      render :index
    end
    
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user == @book.user
  end

end
