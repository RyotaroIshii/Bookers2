class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def show
  end

  def index
    @book = Book.new
    @books = Book.all
  end

end