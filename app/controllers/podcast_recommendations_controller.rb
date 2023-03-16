class PodcastRecommendationsController < ApplicationController
  before_action :set_podcast, only: [:new, :create]

  def new
    @podcastreco = PodcastRecommendation.new
    @friends = current_user.following.map { |follow| follow.username if follow.is_following?(current_user) }.compact
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

  def read
    podcastrec = PodcastRecommendation.find(params[:podcast_recommendation_id])
    podcastrec.read = true
    if podcastrec.save
      redirect_to recommendations_user_path(podcastrec.receiver)
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
