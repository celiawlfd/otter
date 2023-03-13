class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @list.update(list_params)
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.text { render partial: "movie_info", locals: { list: @list}, formats: :html }
    end
  end

  def destroy
    @list.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
