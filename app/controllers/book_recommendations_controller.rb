class BookRecommendationsController < ApplicationController
  before_action :set_book, only: [:new, :create]

  def new
    @bookreco = BookRecommendation.new
    @friends = current_user.following.map { |follow| follow.username if follow.is_following?(current_user) }.compact
  end

  def create
    @bookreco = BookRecommendation.new(set_params)
    @bookreco.book = @book
    @bookreco.giver = current_user
    @bookreco.receiver = User.find_by(username: set_params[:receiver_id])
    if @bookreco.save
      redirect_to book_path(@book), notice: "Recommendation send to #{@bookreco.receiver.username}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:book_recommendation).permit(:receiver_id, :message)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
