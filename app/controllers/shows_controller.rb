class ShowsController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def index
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
  end

  def show
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
    @comment = Comment.new

    @show = Show.find(params[:id])
    @comments = @show.comments.order("created_at ASC")
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
    @comments = @show.comments.order("created_at ASC")
    @comment = Comment.new
  end

  def create
    @show = Show.create(show_params)
    @show.users << current_user
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
    @comments = @show.comments.order("created_at ASC")
    @comment = Comment.new
  end

  def update
    @show = Show.find(params[:id])
    @show.update_attributes(show_params)
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
    @comments = @show.comments.order("created_at ASC")
    @comment = Comment.new
  end

  def delete
    @show = Show.find(params[:show_id])
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
    @comments = @show.comments.order("created_at ASC")
    @comment = Comment.new
  end

  def destroy
    @show = Show.find(params[:id])
    @show.users.delete(current_user)
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
    @comments = @show.comments.order("created_at ASC")
    @comment = Comment.new
  end

  def add
    @show = Show.find(params[:show_id])
    @show.users << current_user
    @my_shows = current_user.shows.order("title ASC")
    @other_shows = Show.all.order("title ASC") - current_user.shows
    @comments = @show.comments.order("created_at ASC")
    @comment = Comment.new
  end

  private
  def show_params
    params.require(:show).permit(:title, :plot, :poster)
  end

end
