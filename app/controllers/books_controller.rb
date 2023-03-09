class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])

    @list = List.last
    @list_book = ListBook.new
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :photo_url, :year, :pages_number, :author)
  end
end
