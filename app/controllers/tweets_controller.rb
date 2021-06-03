class TweetsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy] 

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @tweet.delete
    redirect_to root_path
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
       redirect_to root_path
    else
       render :edit
    end
  end

  def show
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @tweet.user_id
      redirect_to root_path
    end
  end

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end
end
