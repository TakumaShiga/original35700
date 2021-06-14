class UsersController < ApplicationController

  before_action :authenticate_user!, only: :show
  

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname 
    @tweets = @user.tweets
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '編集しました'
    else
      flash.now[:alert] = '編集できませんでした。'
      render :edit
    end
    
  end
  private

  def user_params
    params.require(:user).permit(:nickname, :email, :introduce, :image)
  end
  

end
