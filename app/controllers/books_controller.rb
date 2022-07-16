class BooksController < ApplicationController

  def index
    @book = Book.new #新規投稿はbookのindexページで行うからここに記述
    @books = Book.all #bookの一覧表示
    @user = current_user #現在ログインしているユーザーの編集
    @users = User.all #Userの一覧表示
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to '/books' #新規投稿したらbookのindexページに遷移
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path(book.id)
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
