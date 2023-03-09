class ListMoviesController < ApplicationController
  def create
    @list_movie = ListMovie.new(list_movie_params)
    @movie = Movie.find(params[:list_movie][:movie_id])
    @list_movie.movie = @movie
    if @list_movie.save
      redirect_to movie_path(@movie), notice: "Added to #{@list_movie.list.name}"
    elsif @list_movie.list.nil?
      redirect_to movie_path(@movie), alert: "You need to select a list"
    elsif @list_movie.list.movies.include?(@movie)
      redirect_to movie_path(@movie), alert: "This movie is already in this list"
    else
      # render "movies/show", status: :unprocessable_entity
    end
  end

  def destroy
    @list_movie = ListMovie.find(params[:id])
    @list_movie.destroy
    redirect_to list_path(@list_movie.list), status: :see_other
  end

  private

  def list_movie_params
    params.require(:list_movie).permit(:comment, :list_id)
  end
end
