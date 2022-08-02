class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    #@books = @user.books.page(params[:page])
  end
  
  def index
    @book = Book.new
    @user = current_user
  	@users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
