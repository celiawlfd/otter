class UsersController < ApplicationController
  before_action :set_user, only: [:show, :followers, :following, :follow, :unfollow]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @lists = List.where(user: @user).order(created_at: :desc)
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to user_path(@user.id) }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to user_path(@user.id) }
        format.js { render action: :follow }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
