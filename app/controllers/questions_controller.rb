class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
    @answer = Answer.new
    @answers = @question.answers.includes(:user)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, notice: '質問の投稿が完了しました'
    else
      flash.now[:alert] = '質問の投稿できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: '質問を編集しました'
    else
      flash.now[:alert] = '質問を編集できませんでした'
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: '質問を削除しました'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @question.user_id
  end

  def question_params
    params.require(:question).permit(:title, :post).merge(user_id: current_user.id)
  end
end
