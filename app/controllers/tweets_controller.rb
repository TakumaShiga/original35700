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

  private

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)

end
