class ListPodcastsController < ApplicationController
  def create
    @list_podcast = ListPodcast.new(list_podcast_params)
    @podcast = Podcast.find(params[:list_podcast][:podcast_id])
    @list_podcast.podcast = @podcast
    if @list_podcast.save
      redirect_to podcast_path(@podcast), notice: "Added to #{@list_podcast.list.name}"
    elsif @list_podcast.list.nil?
      redirect_to podcast_path(@podcast), alert: "You need to select a list"
    elsif @list_podcast.list.podcasts.include?(@podcast)
      redirect_to podcast_path(@podcast), alert: "This podcast is already in this list"
    else
    end
  end

  def destroy
    @list_podcast = ListPodcast.find(params[:id])
    @list_podcast.destroy
    redirect_to list_path(@list_podcast.list), status: :see_other
  end

  private

  def list_podcast_params
    params.require(:list_podcast).permit(:comment, :list_id)
  end
end
