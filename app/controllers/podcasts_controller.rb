class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :photo_url, :publisher, :episodes_number)
  end
end
