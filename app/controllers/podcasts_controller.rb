class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
  end

  def show
    @podcast = Podcast.find(params[:id])

    # @myreview = PodcastReview.find_by(podcast: @podcast, user: current_user)
    # @podcast_review = PodcastReview.new
    # @reviews = @podcast.podcast_reviews
    # @rating_av = rating_average(@reviews)

    @list = List.last
    @list_podcast = ListPodcast.new
  end

  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :photo_url, :publisher, :episodes_number)
  end

  # def rating_average(reviews)
  #   ratings = []
  #   reviews.each do |review|
  #     ratings << review.rating
  #   end

  #   ratings.sum.fdiv(ratings.size).round(2)
  # end
end
