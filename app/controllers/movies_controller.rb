class MoviesController < ApplicationController
  before_action :set_list, only: %i[new create]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = List.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :photo_url, :year, :director, :duration)
  end
end
