class MovieRecommendationsController < ApplicationController
  before_action :set_movie, only: [:new, :create]

  def new
    @moviereco = MovieRecommendation.new
    @friends = current_user.following.map { |follow| follow.username if follow.is_following?(current_user) }.compact
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

  def read
    movierec = MovieRecommendation.find(params[:movie_recommendation_id])
    movierec.read = true
    if movierec.save
      redirect_to recommendations_user_path(movierec.receiver)
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
