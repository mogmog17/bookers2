class BooksController < ApplicationController

  def index
    @book = Book.new #新規投稿はbookのindexページで行うからここに記述
    @books = Book.all #bookの一覧表示
    @user = current_user #現在ログインしているユーザーの編集
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id) #新規投稿したらbookのshowページに遷移
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    book = Book.find(params[:id]) #データ（レコード）を1件取得
    book.destroy #データ（レコード）を削除
    redirect_to user_path(book.user.id) #ユーザーの詳細画面へリダイレクト
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
