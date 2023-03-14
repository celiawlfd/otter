class MovieRecommendationsController < ApplicationController
  before_action :set_movie, only: [:new, :create]

  def new
    @moviereco = MovieRecommendation.new
  end

  def create
    @moviereco = MovieRecommendation.new(set_params)
    @moviereco.movie = @movie
    @moviereco.giver = current_user
    @moviereco.receiver = User.find_by(username: set_params[:receiver_id])
    if @moviereco.save
      redirect_to movie_path(@movie), notice: "Recommendation send to #{@moviereco.receiver.username}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:movie_recommendation).permit(:receiver_id, :message)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
 