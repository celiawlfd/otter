class MovieReviewsController < ApplicationController
  def create
    @movie_review = MovieReview.new(review_params)
    @movie_review.user = current_user
    @movie = Movie.find(params[:movie_id])
    @movie_review.movie = @movie
    if @movie_review.save
      redirect_to movie_path(@movie)
    else
       @movie = Movie.find(params[:movie_id])
       render "movies/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:movie_review).permit(:content, :rating)
  end
end
