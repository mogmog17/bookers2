class UsersController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @users = User.all #Userの一覧表示
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id]) #ユーザーの取得
    if @user.update(user_params) #ユーザーのアップデート
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id) #ユーザーの詳細ページへのパス
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
