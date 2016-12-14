class ShowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  def show
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows

    @show = Show.find(params[:id])
  end

  def new
    @show = Show.new
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  def edit
    @show = Show.find(params[:id])
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  def create
    @show = Show.create(show_params)
    @show.users << current_user
    @show_notice = "TV show created successfully."
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  def update
    @show = Show.find(params[:id])
    @show.update_attributes(show_params)
    @show_notice = "TV show updated successfully."
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  def delete
    @show = Show.find(params[:show_id])
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  def destroy
    @show = Show.find(params[:id])
    @show.users.delete(current_user)
    @show_notice = "TV show deleted successfully."
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  def add
    @show = Show.find(params[:show_id])
    @show.users << current_user
    @show_notice = "TV show added successfully."
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  private
  def show_params
    params.require(:show).permit(:title, :plot)
  end

end
