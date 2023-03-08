class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])

    @movie_review = MovieReview.new
    @reviews = @movie.movie_reviews
    @rating_av = rating_average(@reviews)

    @list = List.last
    @list_movie = ListMovie.new

  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :photo_url, :year, :director, :duration)
  end

  def rating_average(reviews)
    ratings = []
    reviews.each do |review|
      ratings << review.rating
    end

    ratings.sum.fdiv(ratings.size).round(2)
  end

end
