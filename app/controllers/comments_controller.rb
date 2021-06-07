class CommentsController < ApplicationController

  def create
   comment = Comment.create(comment_params)
   redirect_to tweet_path(comment.tweet_id) 
  end

  def destroy
    Comment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
