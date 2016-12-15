class CommentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def delete
    @show = Show.find(params[:show_id])
    @comment = Comment.find(params[:comment_id])
  end

  def create
    @comment = Comment.create(comment_params)

    @comment = Comment.new
    @my_shows = current_user.shows
    @show = Show.find(params[:show_id])
    @comments = @show.comments
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(show_params) if @comment.user == current_user

    @my_shows = current_user.shows
    @show = Show.find(params[:show_id])
    @comments = @show.comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    else
      @notice = "You can't delete someone else's comment."
    end

    @comment = Comment.new
    @my_shows = current_user.shows
    @show = Show.find(params[:show_id])
    @comments = @show.comments
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :show_id)
  end
end
