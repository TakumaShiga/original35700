class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]
  before_action :prohibit_access, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: '投稿が完了しました'
    else
      flash.now[:alert] = '投稿ができませんでした'
      render :new
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path, notice: '投稿を削除しました'
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path, notice: '投稿を編集しました'
    else
      flash.now[:alert] = '投稿の編集ができませんでした'
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
    redirect_to root_path unless current_user.id == @tweet.user_id
  end

  def tweet_params
    params.require(:tweet).permit(:text, images: []).merge(user_id: current_user.id)
  end
end
