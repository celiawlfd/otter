class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @myreview = BookReview.find_by(book: @book, user: current_user)
    @book_review = BookReview.new
    @reviews = @book.book_reviews
    @rating_av = rating_average(@reviews)

    @list = List.last
    @list_book = ListBook.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render "pages/search_api", status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :photo_url, :year, :pages_number, :author)
  end

  def rating_average(reviews)
    ratings = []
    reviews.each do |review|
      ratings << review.rating
    end

    ratings.sum.fdiv(ratings.size).round(2)
  end
end
