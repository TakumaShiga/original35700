class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def show
    @likes = Like.where(tweet_id: params[:tweet_id]).order('created_at DESC')
  end

  def create
    @like = Like.create(user_id: current_user.id, tweet_id: @tweet.id)
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: @tweet.id)
    @like.destroy
  end

  private

  def set_post
    @tweet = Tweet.find(params[:tweet_id])
  end
end
