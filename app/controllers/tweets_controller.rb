class TweetsController < ApplicationController
  
  
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
      flash[:notice] = "投稿が完了しました"
    else
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.delete
    redirect_to root_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
       flash[:notice] = "編集が完了しました"
       redirect_to root_path
    else
       render :edit
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)

end
