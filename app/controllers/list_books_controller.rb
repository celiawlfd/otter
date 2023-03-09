class ListBooksController < ApplicationController
  def create
    @list_book = ListBook.new(list_book_params)
    @book = Book.find(params[:list_book][:book_id])
    @list_book.book = @book
    if @list_book.save
      redirect_to book_path(@book), notice: "Added to #{@list_book.list.name}"
    elsif @list_book.list.nil?
      redirect_to book_path(@book), alert: "You need to select a list"
    elsif @list_book.list.books.include?(@book)
      redirect_to book_path(@book), alert: "This book is already in this list"
    else
      # render "movies/show", status: :unprocessable_entity
    end
  end

  def destroy
    @list_book = ListBook.find(params[:id])
    @list_book.destroy
    redirect_to list_path(@list_book.list), status: :see_other
  end

  private

  def list_book_params
    params.require(:list_book).permit(:comment, :list_id)
  end
end
