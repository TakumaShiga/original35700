class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :prohibit_user, only: [:destroy]

  def create
    Answer.create(answer_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @answer = Answer.find(params[:id])
    Answer.find_by(question_id: params[:question_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:message).merge(user_id: current_user.id, question_id: params[:question_id])
  end

  def prohibit_user 
    @answer = Answer.find_by(id: params[:id])
    redirect_to root_path, notice: '権限がありません' unless current_user.id == @answer.user_id
  end
end
