class UsersController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @users = User.all #Userの一覧表示
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user #ユーザーの取得
    @user.update(user_params) #ユーザーのアップデート
    redirect_to user_path(@user.id) #ユーザーの詳細ページへのパス
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
