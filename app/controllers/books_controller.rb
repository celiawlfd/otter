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
    @friends_reviews = []
    @others_reviews = []

    @list = List.last
    @list_book = ListBook.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      redirect_to book_path(Book.find_by(title: @book.title))
      # flash[:alert] = "Sorry, this book is already in the database"
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
