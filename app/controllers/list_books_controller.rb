class ListBooksController < ApplicationController
  def create
    @list_book = ListBook.new(list_book_params)
    @book = Book.find(params[:list_book][:book_id])
    @list_book.book = @book
    if @list_book.save
      redirect_to book_path(@book)
    else
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
