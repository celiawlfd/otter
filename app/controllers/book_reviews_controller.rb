class BookReviewsController < ApplicationController
  def create
    @book_review = BookReview.new(review_params)
    book_review.user = current_user
    @book = Book.find(params[:book_id])
    @book_review.book = @book
    @list = List.last
    @list_book = ListBook.new
    @reviews = @book.book_reviews
    @rating_av = rating_average(@reviews)

    respond_to do |format|
      if @book_review.save
        format.html { redirect_to book_path(@book) }
        format.json
      else
        format.html { render "books/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  def destroy
    @book_review = BookReview.find(params[:id])
    @book_review.destroy
    redirect_to book_review_path(@book_review), status: :see_other
  end

  private

  def review_params
    params.require(:movie_review).permit(:content, :rating)
  end

  def rating_average(reviews)
    ratings = []
    reviews.each do |review|
      ratings << review.rating
    end

    ratings.sum.fdiv(ratings.size).round(2)
  end
end
