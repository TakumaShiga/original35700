class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]
  before_action :prohibit_access, only: [:edit, :update, :destroy] 

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
    
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
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end
  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def prohibit_access
    unless current_user.id == @tweet.user_id
      redirect_to root_path
    end
  end

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end
end
