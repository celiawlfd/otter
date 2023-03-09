class MovieReviewsController < ApplicationController
  def create
    @movie_review = MovieReview.new(review_params)
    @movie_review.user = current_user
    @movie = Movie.find(params[:movie_id])
    @movie_review.movie = @movie

    #### quick fix
    @list = List.last
    @list_movie = ListMovie.new
    @reviews = @movie.movie_reviews
    @rating_av = rating_average(@reviews)

    respond_to do |format|
      if @movie_review.save
        format.html { redirect_to movie_path(@movie)}
        format.json
      else
        format.html { render "movies/show", status: :unprocessable_entity }
        # @movie = Movie.find(params[:movie_id])
        format.json
      end
    end
  end

  def destroy
    @movie_review = MovieReview.find(params[:id])
    @movie_review.destroy
    redirect_to movie_review_path(@movie_review), status: :see_other
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
