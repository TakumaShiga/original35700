class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :prohibit_user, only: [:destroy]

  def create
    comment = Comment.new(comment_params)
    redirect_to tweet_path(comment.tweet_id) if comment.save
  end

  def destroy
    Comment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

  def prohibit_user 
    @comment = Comment.find_by(id: params[:id])
    redirect_to root_path, notice: '権限がありません' unless current_user.id == @comment.user_id
  end
end
