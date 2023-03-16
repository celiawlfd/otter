class PodcastReviewsController < ApplicationController
  def create
    @podcast_review = PodcastReview.new(review_params)
    @podcast_review.user = current_user
    @podcast = Podcast.find(params[:podcast_id])
    @podcast_review.podcast = @podcast
    @list = List.last
    @list_podcast = ListPodcast.new
    @reviews = @podcast.podcast_reviews
    @rating_av = rating_average(@reviews)
    @friends_reviews = []
    @others_reviews = []

    if @podcast_review.save
      redirect_to podcast_path(@podcast)
    else
      render "podcasts/show", status: :unprocessable_entity
    end
  end

  def destroy
    @podcast_review = PodcastReview.find(params[:id])
    @podcast_review.destroy
    redirect_to podcast_review_path(@podcast_review), status: :see_other
  end

  private

  def review_params
    params.require(:podcast_review).permit(:content, :rating)
  end

  def rating_average(reviews)
    ratings = []
    reviews.each do |review|
      ratings << review.rating
    end

    ratings.sum.fdiv(ratings.size).round(2)
  end
end
