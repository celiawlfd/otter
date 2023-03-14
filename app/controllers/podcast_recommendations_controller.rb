class PodcastRecommendationsController < ApplicationController
  before_action :set_podcast, only: [:new, :create]

  def new
    @podcastreco = PodcastRecommendation.new
  end

  def create
    @podcastreco = PodcastRecommendation.new(set_params)
    @podcastreco.podcast = @podcast
    @podcastreco.giver = current_user
    @podcastreco.receiver = User.find_by(username: set_params[:receiver_id])
    if @podcastreco.save
      redirect_to podcast_path(@podcast), notice: "Recommendation send to #{@podcastreco.receiver.username}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:podcast_recommendation).permit(:receiver_id, :message)
  end

  def set_podcast
    @podcast = Podcast.find(params[:podcast_id])
  end
end
