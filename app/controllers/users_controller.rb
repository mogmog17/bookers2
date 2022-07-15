class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end


  private

  def user_params
    params.require(:user).permit(:title, :body, :image)
  end
end
